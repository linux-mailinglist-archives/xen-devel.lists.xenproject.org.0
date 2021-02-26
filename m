Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A45325B23
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 02:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90022.170194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFRay-0005Mh-9z; Fri, 26 Feb 2021 01:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90022.170194; Fri, 26 Feb 2021 01:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFRay-0005MI-6c; Fri, 26 Feb 2021 01:07:04 +0000
Received: by outflank-mailman (input) for mailman id 90022;
 Fri, 26 Feb 2021 01:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFRaw-0005MD-RU
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 01:07:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae0193f-e224-4c71-9a87-56f6d90fdb51;
 Fri, 26 Feb 2021 01:07:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9883564F21;
 Fri, 26 Feb 2021 01:06:52 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4ae0193f-e224-4c71-9a87-56f6d90fdb51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614301621;
	bh=zzkxH24CelpzugfovTPDIYBkRrfvBrnxQg0c0MkDvsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bWut5ylG3bUFR1HXFQuXHQMhhCtxvjSWkqe90Osqv9k41HmF092UTJkAsVq5UwXlf
	 ZHNafQNGQXI7pNzBs5BPDYF2RC15CdS5nDpGWYNwSZ5XRjtxMUoNXiPdoVeSA7lda9
	 Io/M1ZxJso0BCFCeC3QspIG+TCWQPxviVdnIYYa+c/RRcYMhZWvH8xulxO5XIh4IPL
	 ZfeG6E05/AUIxEviWUlEoYYfg4isj/lfyNdEqBxMt9TPZxuQ7gu+85vrQeQnyQDAIV
	 lL8ING1aQ++e8fjdUU6+v69epEpfVFd2VryHWteDMUlSUcV9URRAy0E9xJx7p58JaE
	 qLXYfgUGYrFRw==
Date: Thu, 25 Feb 2021 17:06:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org, 
    Bobby Eshleman <bobbyeshleman@gmail.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
In-Reply-To: <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
Message-ID: <alpine.DEB.2.21.2102251631220.3234@sstabellini-ThinkPad-T480s>
References: <cover.1614265718.git.connojdavis@gmail.com> <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com> <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1727495200-1614299806=:3234"
Content-ID: <alpine.DEB.2.21.2102251638240.3234@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1727495200-1614299806=:3234
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102251638241.3234@sstabellini-ThinkPad-T480s>

On Thu, 25 Feb 2021, Andrew Cooper wrote:
> On 25/02/2021 15:24, Connor Davis wrote:
> > Add the minimum code required to get xen to build with
> > XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
> > function added is required for a successful build, given the .config
> > generated from riscv64_defconfig. The function implementations are just
> > stubs; actual implmentations will need to be added later.
> >
> > Signed-off-by: Connor Davis <connojdavis@gmail.com>

This is awesome, Connor! I am glad you are continuing this work and
I am really looking forward to have it in the tree.


> > ---
> >  config/riscv64.mk                        |   7 +
> >  xen/Makefile                             |   8 +-
> >  xen/arch/riscv/Kconfig                   |  54 ++++
> >  xen/arch/riscv/Kconfig.debug             |   0
> >  xen/arch/riscv/Makefile                  |  57 ++++
> >  xen/arch/riscv/README.source             |  19 ++
> >  xen/arch/riscv/Rules.mk                  |  13 +
> >  xen/arch/riscv/arch.mk                   |   7 +
> >  xen/arch/riscv/configs/riscv64_defconfig |  12 +
> >  xen/arch/riscv/delay.c                   |  16 +
> >  xen/arch/riscv/domain.c                  | 144 +++++++++
> >  xen/arch/riscv/domctl.c                  |  36 +++
> >  xen/arch/riscv/guestcopy.c               |  57 ++++
> >  xen/arch/riscv/head.S                    |   6 +
> >  xen/arch/riscv/irq.c                     |  78 +++++
> >  xen/arch/riscv/lib/Makefile              |   1 +
> >  xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
> >  xen/arch/riscv/mm.c                      |  93 ++++++
> >  xen/arch/riscv/p2m.c                     | 150 +++++++++
> >  xen/arch/riscv/percpu.c                  |  17 +
> >  xen/arch/riscv/platforms/Kconfig         |  31 ++
> >  xen/arch/riscv/riscv64/asm-offsets.c     |  31 ++
> >  xen/arch/riscv/setup.c                   |  27 ++
> >  xen/arch/riscv/shutdown.c                |  28 ++
> >  xen/arch/riscv/smp.c                     |  35 +++
> >  xen/arch/riscv/smpboot.c                 |  34 ++
> >  xen/arch/riscv/sysctl.c                  |  33 ++
> >  xen/arch/riscv/time.c                    |  35 +++
> >  xen/arch/riscv/traps.c                   |  35 +++
> >  xen/arch/riscv/vm_event.c                |  39 +++
> >  xen/arch/riscv/xen.lds.S                 | 113 +++++++
> >  xen/drivers/char/serial.c                |   1 +
> >  xen/include/asm-riscv/altp2m.h           |  39 +++
> >  xen/include/asm-riscv/asm.h              |  77 +++++
> >  xen/include/asm-riscv/asm_defns.h        |  24 ++
> >  xen/include/asm-riscv/atomic.h           | 204 ++++++++++++
> >  xen/include/asm-riscv/bitops.h           | 331 ++++++++++++++++++++
> >  xen/include/asm-riscv/bug.h              |  54 ++++
> >  xen/include/asm-riscv/byteorder.h        |  16 +
> >  xen/include/asm-riscv/cache.h            |  24 ++
> >  xen/include/asm-riscv/cmpxchg.h          | 382 +++++++++++++++++++++++
> >  xen/include/asm-riscv/compiler_types.h   |  32 ++
> >  xen/include/asm-riscv/config.h           | 110 +++++++
> >  xen/include/asm-riscv/cpufeature.h       |  17 +
> >  xen/include/asm-riscv/csr.h              | 219 +++++++++++++
> >  xen/include/asm-riscv/current.h          |  47 +++
> >  xen/include/asm-riscv/debugger.h         |  15 +
> >  xen/include/asm-riscv/delay.h            |  15 +
> >  xen/include/asm-riscv/desc.h             |  12 +
> >  xen/include/asm-riscv/device.h           |  15 +
> >  xen/include/asm-riscv/div64.h            |  23 ++
> >  xen/include/asm-riscv/domain.h           |  50 +++
> >  xen/include/asm-riscv/event.h            |  42 +++
> >  xen/include/asm-riscv/fence.h            |  12 +
> >  xen/include/asm-riscv/flushtlb.h         |  34 ++
> >  xen/include/asm-riscv/grant_table.h      |  12 +
> >  xen/include/asm-riscv/guest_access.h     |  41 +++
> >  xen/include/asm-riscv/guest_atomics.h    |  60 ++++
> >  xen/include/asm-riscv/hardirq.h          |  27 ++
> >  xen/include/asm-riscv/hypercall.h        |  12 +
> >  xen/include/asm-riscv/init.h             |  42 +++
> >  xen/include/asm-riscv/io.h               | 283 +++++++++++++++++
> >  xen/include/asm-riscv/iocap.h            |  13 +
> >  xen/include/asm-riscv/iommu.h            |  46 +++
> >  xen/include/asm-riscv/irq.h              |  58 ++++
> >  xen/include/asm-riscv/mem_access.h       |   4 +
> >  xen/include/asm-riscv/mm.h               | 246 +++++++++++++++
> >  xen/include/asm-riscv/monitor.h          |  65 ++++
> >  xen/include/asm-riscv/nospec.h           |  25 ++
> >  xen/include/asm-riscv/numa.h             |  41 +++
> >  xen/include/asm-riscv/p2m.h              | 218 +++++++++++++
> >  xen/include/asm-riscv/page-bits.h        |  11 +
> >  xen/include/asm-riscv/page.h             |  73 +++++
> >  xen/include/asm-riscv/paging.h           |  15 +
> >  xen/include/asm-riscv/pci.h              |  31 ++
> >  xen/include/asm-riscv/percpu.h           |  33 ++
> >  xen/include/asm-riscv/processor.h        |  59 ++++
> >  xen/include/asm-riscv/random.h           |   9 +
> >  xen/include/asm-riscv/regs.h             |  23 ++
> >  xen/include/asm-riscv/setup.h            |  14 +
> >  xen/include/asm-riscv/smp.h              |  46 +++
> >  xen/include/asm-riscv/softirq.h          |  16 +
> >  xen/include/asm-riscv/spinlock.h         |  12 +
> >  xen/include/asm-riscv/string.h           |  28 ++
> >  xen/include/asm-riscv/sysregs.h          |  16 +
> >  xen/include/asm-riscv/system.h           |  99 ++++++
> >  xen/include/asm-riscv/time.h             |  31 ++
> >  xen/include/asm-riscv/trace.h            |  12 +
> >  xen/include/asm-riscv/types.h            |  60 ++++
> >  xen/include/asm-riscv/vm_event.h         |  55 ++++
> >  xen/include/asm-riscv/xenoprof.h         |  12 +
> >  xen/include/public/arch-riscv.h          | 183 +++++++++++
> >  xen/include/public/arch-riscv/hvm/save.h |  39 +++
> >  xen/include/public/hvm/save.h            |   2 +
> >  xen/include/public/pmu.h                 |   2 +
> >  xen/include/public/xen.h                 |   2 +
> >  xen/include/xen/domain.h                 |   1 +
> 
> Well - this is orders of magnitude more complicated than it ought to
> be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
> majority of this.
> 
> Do you know how all of this is being pulled in?  Is it from attempting
> to compile common/ by any chance?

I'd love to see this patch split into several smaller patches. Ideally
one patch per header file or per group of headers. It is fine if it ends
up being a very large series. For patches imported from Linux, make sure
to say that they are coming from Linux commit XXX in the commit message.
It is going to make it a lot easier to ack them.

Also, I think we need a concrete build target in mind: we don't want to
add a function stub if it is not needed to build something. Make sure to
specify what you are building in patch 0.


I tried building this series. The container didn't build for me, so I
build the toolchain myself. I noticed a couple of things:

XEN_TARGET_ARCH=riscv64 works but XEN_TARGET_ARCH=riscv doesn't.
Maybe we should make XEN_TARGET_ARCH=riscv work too using the
xen/Makefile TARGET transformations.

It seems to be building quite a few things under common. However it
breaks with:

vm_event.c: In function 'vm_event_resume':
vm_event.c:428:17: error: implicit declaration of function 'vm_event_reset_vmtrace'; did you mean 'vm_event_resume'? [-Werror=implicit-function-declaration]
  428 |                 vm_event_reset_vmtrace(v);
      |                 ^~~~~~~~~~~~~~~~~~~~~~
      |                 vm_event_resume
vm_event.c:428:17: error: nested extern declaration of 'vm_event_reset_vmtrace' [-Werror=nested-externs]


I got past that with a hack, but then I got this error:

ns16550.c: In function 'ns16550_init_preirq':
ns16550.c:353:42: error: implicit declaration of function 'ioremap'; did you mean 'ioremap_wc'? [-Werror=implicit-function-declaration]
  353 |         uart->remapped_io_base = (char *)ioremap(uart->io_base, uart->io_size);
      |                                          ^~~~~~~
      |                                          ioremap_wc
ns16550.c:353:42: error: nested extern declaration of 'ioremap' [-Werror=nested-externs]
ns16550.c:353:34: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  353 |         uart->remapped_io_base = (char *)ioremap(uart->io_base, uart->io_size);
      |                                  ^
At top level:
ns16550.c:628:13: error: 'ns16550_init_common' defined but not used [-Werror=unused-function]
  628 | static void ns16550_init_common(struct ns16550 *uart)
      |             ^~~~~~~~~~~~~~~~~~~
ns16550.c:610:41: error: 'ns16550_driver' defined but not used [-Werror=unused-variable]
  610 | static struct uart_driver __read_mostly ns16550_driver = {
      |                                         ^~~~~~~~~~~~~~
ns16550.c:204:13: error: '__ns16550_poll' defined but not used [-Werror=unused-function]
  204 | static void __ns16550_poll(struct cpu_user_regs *regs)
      |             ^~~~~~~~~~~~~~
ns16550.c:76:3: error: 'ns16550_com' defined but not used [-Werror=unused-variable]
   76 | } ns16550_com[2] = { { 0 } };
      |   ^~~~~~~~~~~
cc1: all warnings being treated as errors


Which is strange given that ns16550.c shouldn't be built at all.  "QEMU
RISC-V virt machine support" is forcing CONFIG_HAS_NS16550=y on my
system. I chose "All Platforms" and CONFIG_HAS_NS16550=y went away. That
can't be right :-)


After that, I could actually finish the build:

sstabellini@sstabellini-ThinkPad-T480s:/local/repos/xen-upstream/xen$ find . -name \*.o
./common/spinlock.o
./common/irq.o
./common/sysctl.o
./common/sched/built_in.o
./common/sched/cpupool.o
./common/sched/credit2.o
./common/sched/core.o
./common/stop_machine.o
./common/gunzip.init.o
./common/multicall.o
./common/symbols.o
./common/rwlock.o
./common/event_channel.o
./common/guestcopy.o
./common/softirq.o
./common/virtual_region.o
./common/lib.o
./common/wait.o
./common/time.o
./common/notifier.o
./common/cpu.o
./common/page_alloc.o
./common/string.o
./common/vm_event.o
./common/tasklet.o
./common/version.o
./common/symbols-dummy.o
./common/memory.o
./common/warning.o
./common/xmalloc_tlsf.o
./common/kernel.o
./common/gunzip.o
./common/warning.init.o
./common/domain.o
./common/event_2l.o
./common/radix-tree.o
./common/timer.o
./common/built_in.o
./common/bitmap.o
./common/smp.o
./common/vsprintf.o
./common/keyhandler.o
./common/shutdown.o
./common/rcupdate.o
./common/rangeset.o
./common/vmap.o
./common/domctl.o
./common/preempt.o
./common/event_fifo.o
./common/monitor.o
./common/random.o
./lib/bsearch.o
./lib/rbtree.o
./lib/parse-size.o
./lib/ctype.o
./lib/ctors.o
./lib/list-sort.o
./lib/sort.o
./lib/built_in.o
./drivers/built_in.o
./drivers/char/serial.o
./drivers/char/built_in.o
./drivers/char/console.o
./arch/riscv/irq.o
./arch/riscv/sysctl.o
./arch/riscv/delay.o
./arch/riscv/lib/built_in.o
./arch/riscv/lib/find_next_bit.o
./arch/riscv/guestcopy.o
./arch/riscv/time.o
./arch/riscv/prelink.o
./arch/riscv/vm_event.o
./arch/riscv/setup.o
./arch/riscv/domain.o
./arch/riscv/traps.o
./arch/riscv/built_in.o
./arch/riscv/smp.o
./arch/riscv/mm.o
./arch/riscv/percpu.o
./arch/riscv/p2m.o
./arch/riscv/shutdown.o
./arch/riscv/head.o
./arch/riscv/domctl.o
./arch/riscv/smpboot.o

Which is absolutely astounding! Great job! I didn't imagine you already
managed to build the whole of commons!
--8323329-1727495200-1614299806=:3234--

