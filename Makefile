NVCC    := nvcc
LDFLAGS := -lcuda

TARGETS := test

MAIN        := test.cpp
CUSTOM_FUNC := matSumKernel.cu
PTX         := matSumKernel.ptx

.PHONY: all ptx clean

all: $(TARGETS) $(PTX)
ptx: $(PTX)
clean:
	rm -f $(TARGETS) $(PTX)

$(PTX): $(CUSTOM_FUNC)
	$(NVCC) --ptx $^

$(TARGETS): % : $(MAIN)
	$(NVCC) -o $@ $^ $(LDFLAGS)
