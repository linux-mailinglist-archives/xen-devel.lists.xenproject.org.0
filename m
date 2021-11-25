Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B295D45DB61
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231206.399935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzG-0007QF-Fh; Thu, 25 Nov 2021 13:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231206.399935; Thu, 25 Nov 2021 13:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzG-0007O1-BR; Thu, 25 Nov 2021 13:40:30 +0000
Received: by outflank-mailman (input) for mailman id 231206;
 Thu, 25 Nov 2021 13:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzF-0007NX-3n
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4c2276-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:21 +0100 (CET)
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
X-Inumbo-ID: 3b4c2276-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847621;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wmNH3A9qJXFRS/eyXa08ZeTcOVu9s+jKh3RpHKzVty8=;
  b=TyyJh4jPz7UbD5ElO4P/FzHUSt97Sqpdj9GYLWHbk4fHHFPD/eNKrNm6
   DXVgtwqgfFQ21e7jFPRdlzgdQy5wg84UX2+7Jof/vCHWB/6pmHHh7u055
   RLTFN3VgOhfT6vMs4LIuMkL5+jOOGw+D60H7st1gbKuDSl8Ohvs9AKK1O
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1I17/kwsjJOPsFeVViodtsxi29tNvWQ05cz3lVfF5Q2yO2PelGZVbzQsNrXovBycRRqfV8HuWg
 VEptMIemiXBw9llmlfPJIfv5zIUkcXM+1PzUoVueR466zAgXxOWE/PCSZXYoo3b0GszX6nmupc
 Avo9F0zehVI/ZkElIXBZUDgjp6ii80SbTGATRB/Xcrow5vgQwaWXHlH0wbug0iyyODgMu196kA
 ma5yectAadv0qpUqNyrlPk7egtBW7dRyC3OSgmjiBMJMq+L1/tnwypRLl7oMf3Qth134+LHBI8
 Rrr/AjT/l+53y2SD1wjbrfsS
X-SBRS: 5.1
X-MesageID: 59005956
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 bmAvbYbBq8eUGrah4wBp6S8Kg==
IronPort-HdrOrdr: A9a23:d8RPqagOpnmIJjwZs2Jidhj/BXBQXtAji2hC6mlwRA09TySZ//
 rAoB19726QtN9xYgBGpTnuAsi9qB/nmKKdgrNhX4tKPjOHhILAFugLhuHfKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59005956"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
	<jbeulich@suse.com>, Connor Davis <connojdavis@gmail.com>, Doug Goldstein
	<cardoe@cardoe.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Ian Jackson
	<iwj@xenproject.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Paul
 Durrant" <paul@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Lukasz Hawrylko
	<lukasz.hawrylko@linux.intel.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [XEN PATCH v8 00/47] xen: Build system improvements, now with out-of-tree build!
Date: Thu, 25 Nov 2021 13:39:19 +0000
Message-ID: <20211125134006.1076646-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v8

v8:
    Mostly rework of v7. With many patch already applied.
    Some detail changes that are spread through many patches:
    - `make cloc` recipe should now work throughout the series, update of it is
      done in 3 patches.
    - new patch "build: fix enforce unique symbols for recent clang version"
      to fix an issue with clang.
    - introducing $(srctree) and $(objtree) earlier
    - introducing $(srcdir) as shortcut for $(srctree)/$(src)
    - introduce usage of -iquote instead of -I in some cases
    More detail change log can be found in patches notes.

    Also this v8 present a work-in-progress of the ability to do out-of-tree
    build without setting VPATH. This is presented as an alternative to force
    use of out-of-tree build. As the last patch show, it allows to build the
    xen-shim without the linkfarm and we don't need to make any other changes
    to any thing that build xen (osstest, distribution packages, xen.git, ...,
    and developers finger macros). The patches are only there as WIP / RFC as
    they were some concern about the usefulness and extra changes needed.
    We can decide whether those changes are good or if this is too much and we
    should force out-of-tree build for the hypervisor.

v7:
    Out-of-tree build!

    This mean many more patches. Everything after patch 27 is new.

    There's a few new patch before that, but otherwise are rework of v6.

Hi,

I have work toward building Xen (the hypervisor) with Linux's build system,
Kbuild.

The main reason for that is to be able to have out-of-tree build. It's annoying
when a build fail because of the pvshim. Other benefit is a much faster
rebuild, and `make clean` doesn't take ages, and better dependencies to figure
out what needs to be rebuild.

Cheers,

Anthony PERARD (47):
  build: factorise generation of the linker scripts
  xen: move include/asm-* to arch/*/include/asm
  build: generate "include/xen/compile.h" with if_changed
  build: set XEN_BUILD_EFI earlier
  build: adjust $(TARGET).efi creation in arch/arm
  build: avoid re-executing the main Makefile by introducing build.mk
  build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
  build: prepare to always invoke $(MAKE) from xen/, use $(obj)
  build: rework test/livepatch/Makefile
  build: rework cloc recipe
  build: fix enforce unique symbols for recent clang version
  build: build everything from the root dir, use obj=$subdir
  build: introduce if_changed_deps
  build: rename __LINKER__ to LINKER_SCRIPT
  build: hook kconfig into xen build system
  xen/tools/kconfig: fix build with -Wdeclaration-after-statement
  build: remove KBUILD_ specific from Makefile.host
  build: handle always-y and hostprogs-always-y
  build: start building the tools with the main makefiles
  build: add headers path to CFLAGS once for all archs
  build: generate x86's asm-macros.h with filechk
  build: clean-up "clean" rules of duplication
  build: rework "clean" to clean from the root dir
  build: use main rune to build host binary x86's mkelf32 and mkreloc
  build: rework coverage and ubsan CFLAGS handling
  build,x86: remove the need for build32.mk
  build: grab common EFI source files in arch specific dir
  build: replace $(BASEDIR) by $(objtree)
  build: replace $(BASEDIR) and use $(srctree)
  build: rework "headers*.chk" prerequisite in include/
  build: specify source tree in include/ for prerequisite
  build: shuffle main Makefile
  build: adding out-of-tree support to the xen build
  build: add %.E targets
  RFC, no-VPATH: Kconfig: tell where Kconfig files are
  RFC, no-VPATH: Kconfig: only ready auto.conf from objtree
  RFC, no-VPATH: build: remove --include-dir option from MAKEFLAGS
  WIP, no-VPATH: rework Makefile.host
  RFC, no-VPATH: x86/boot: workaround gcc including the wrong file
  RFC, no-VPATH: prepend $(srctree) to source prerequisite
  WIP, no-VPATH: build object from generated C files
  RFC, no-VPATH: workaround includes in xsm/flask
  WIP, no-VPATH: build object from generated assembly source file
  WIP, no-VPATH: build object from S source to be in build_in.o
  WIP, no-VPATH: build xen, out-of-tree!
  RFC, no-VPATH: remove check for clean source tree for out-of-tree
    builds
  WIP: no more link farming for xen-shim

 .gitignore                                    |   6 +-
 MAINTAINERS                                   |  37 +-
 tools/firmware/xen-dir/Makefile               |  71 +--
 tools/include/Makefile                        |   2 +-
 tools/misc/xen-access.c                       |   4 +-
 tools/tests/vhpet/Makefile                    |   2 +-
 xen/Kconfig                                   |   4 +-
 xen/Makefile                                  | 367 +++++++++-------
 xen/Rules.mk                                  | 256 +++++++----
 xen/arch/arm/Makefile                         |  59 +--
 xen/arch/arm/README.LinuxPrimitives           |  10 +-
 xen/arch/arm/arch.mk                          |   4 +-
 xen/arch/arm/arm32/head.S                     |   2 +-
 xen/arch/arm/arm64/head.S                     |   2 +-
 xen/arch/arm/efi/Makefile                     |   4 +-
 .../asm-arm => arch/arm/include/asm}/acpi.h   |   0
 .../arm/include/asm}/alternative.h            |   0
 .../asm-arm => arch/arm/include/asm}/altp2m.h |   0
 .../arm/include/asm}/arm32/atomic.h           |   0
 .../arm/include/asm}/arm32/bitops.h           |   0
 .../arm/include/asm}/arm32/bug.h              |   0
 .../arm/include/asm}/arm32/cmpxchg.h          |   0
 .../arm/include/asm}/arm32/flushtlb.h         |   0
 .../arm/include/asm}/arm32/insn.h             |   0
 .../arm/include/asm}/arm32/io.h               |   0
 .../arm/include/asm}/arm32/macros.h           |   0
 .../arm/include/asm}/arm32/mm.h               |   0
 .../arm/include/asm}/arm32/page.h             |   0
 .../arm/include/asm}/arm32/processor.h        |   0
 .../arm/include/asm}/arm32/sysregs.h          |   0
 .../arm/include/asm}/arm32/system.h           |   0
 .../arm/include/asm}/arm32/traps.h            |   0
 .../arm/include/asm}/arm32/vfp.h              |   0
 .../arm/include/asm}/arm64/atomic.h           |   0
 .../arm/include/asm}/arm64/bitops.h           |   0
 .../arm/include/asm}/arm64/brk.h              |   0
 .../arm/include/asm}/arm64/bug.h              |   0
 .../arm/include/asm}/arm64/cmpxchg.h          |   0
 .../arm/include/asm}/arm64/cpufeature.h       |   0
 .../arm/include/asm}/arm64/efibind.h          |   0
 .../arm/include/asm}/arm64/flushtlb.h         |   0
 .../arm/include/asm}/arm64/hsr.h              |   0
 .../arm/include/asm}/arm64/insn.h             |   0
 .../arm/include/asm}/arm64/io.h               |   0
 .../arm/include/asm}/arm64/macros.h           |   0
 .../arm/include/asm}/arm64/mm.h               |   0
 .../arm/include/asm}/arm64/page.h             |   0
 .../arm/include/asm}/arm64/processor.h        |   0
 .../arm/include/asm}/arm64/sysregs.h          |   0
 .../arm/include/asm}/arm64/system.h           |   0
 .../arm/include/asm}/arm64/traps.h            |   0
 .../arm/include/asm}/arm64/vfp.h              |   0
 .../arm/include/asm}/asm_defns.h              |   0
 .../asm-arm => arch/arm/include/asm}/atomic.h |   0
 .../asm-arm => arch/arm/include/asm}/bitops.h |   0
 .../asm-arm => arch/arm/include/asm}/bug.h    |   0
 .../arm/include/asm}/byteorder.h              |   0
 .../asm-arm => arch/arm/include/asm}/cache.h  |   0
 .../arm/include/asm}/cadence-uart.h           |   0
 .../asm-arm => arch/arm/include/asm}/config.h |   2 +-
 .../asm-arm => arch/arm/include/asm}/cpregs.h |   0
 .../arm/include/asm}/cpuerrata.h              |   0
 .../arm/include/asm}/cpufeature.h             |   0
 .../arm/include/asm}/current.h                |   0
 .../arm/include/asm}/debugger.h               |   0
 .../asm-arm => arch/arm/include/asm}/delay.h  |   0
 .../asm-arm => arch/arm/include/asm}/desc.h   |   0
 .../asm-arm => arch/arm/include/asm}/device.h |   0
 .../asm-arm => arch/arm/include/asm}/div64.h  |   0
 .../asm-arm => arch/arm/include/asm}/domain.h |   0
 .../arm/include/asm}/domain_build.h           |   0
 .../arm/include/asm}/early_printk.h           |   0
 .../arm/include/asm}/efibind.h                |   0
 .../asm-arm => arch/arm/include/asm}/elf.h    |   0
 .../asm-arm => arch/arm/include/asm}/event.h  |   0
 .../arm/include/asm}/exynos4210-uart.h        |   0
 .../arm/include/asm}/flushtlb.h               |   0
 .../asm-arm => arch/arm/include/asm}/gic.h    |   0
 .../arm/include/asm}/gic_v3_defs.h            |   0
 .../arm/include/asm}/gic_v3_its.h             |   0
 .../arm/include/asm}/grant_table.h            |   0
 .../arm/include/asm}/guest_access.h           |   0
 .../arm/include/asm}/guest_atomics.h          |   0
 .../arm/include/asm}/guest_walk.h             |   0
 .../arm/include/asm}/hardirq.h                |   0
 .../asm-arm => arch/arm/include/asm}/hsr.h    |   0
 .../arm/include/asm}/hypercall.h              |   0
 .../asm-arm => arch/arm/include/asm}/init.h   |   0
 .../asm-arm => arch/arm/include/asm}/insn.h   |   0
 .../asm-arm => arch/arm/include/asm}/io.h     |   0
 .../asm-arm => arch/arm/include/asm}/iocap.h  |   0
 .../asm-arm => arch/arm/include/asm}/iommu.h  |   0
 .../arm/include/asm}/iommu_fwspec.h           |   0
 .../asm-arm => arch/arm/include/asm}/ioreq.h  |   0
 .../asm-arm => arch/arm/include/asm}/irq.h    |   0
 .../asm-arm => arch/arm/include/asm}/kernel.h |   0
 .../arm/include/asm}/livepatch.h              |   0
 .../asm-arm => arch/arm/include/asm}/lpae.h   |   0
 .../asm-arm => arch/arm/include/asm}/macros.h |   0
 .../arm/include/asm}/mem_access.h             |   0
 .../asm-arm => arch/arm/include/asm}/mm.h     |   0
 .../asm-arm => arch/arm/include/asm}/mmio.h   |   0
 .../arm/include/asm}/monitor.h                |   0
 .../arm/include/asm}/new_vgic.h               |   0
 .../asm-arm => arch/arm/include/asm}/nospec.h |   0
 .../asm-arm => arch/arm/include/asm}/numa.h   |   0
 .../asm-arm => arch/arm/include/asm}/p2m.h    |   0
 .../arm/include/asm}/page-bits.h              |   0
 .../asm-arm => arch/arm/include/asm}/page.h   |   0
 .../asm-arm => arch/arm/include/asm}/paging.h |   0
 .../asm-arm => arch/arm/include/asm}/pci.h    |   0
 .../asm-arm => arch/arm/include/asm}/percpu.h |   0
 .../asm-arm => arch/arm/include/asm}/perfc.h  |   0
 .../arm/include/asm}/perfc_defn.h             |   0
 .../arm/include/asm}/pl011-uart.h             |   0
 .../arm/include/asm}/platform.h               |   0
 .../arm/include/asm}/platforms/exynos5.h      |   0
 .../arm/include/asm}/platforms/midway.h       |   0
 .../arm/include/asm}/platforms/omap5.h        |   0
 .../arm/include/asm}/platforms/vexpress.h     |   0
 .../asm}/platforms/xilinx-zynqmp-eemi.h       |   0
 .../arm/include/asm}/processor.h              |   0
 .../arm/include/asm}/procinfo.h               |   0
 .../asm-arm => arch/arm/include/asm}/psci.h   |   0
 .../asm-arm => arch/arm/include/asm}/random.h |   0
 .../asm-arm => arch/arm/include/asm}/regs.h   |   0
 .../arm/include/asm}/scif-uart.h              |   0
 .../asm-arm => arch/arm/include/asm}/setup.h  |   0
 .../arm/include/asm}/short-desc.h             |   0
 .../asm-arm => arch/arm/include/asm}/smccc.h  |   0
 .../asm-arm => arch/arm/include/asm}/smp.h    |   0
 .../arm/include/asm}/softirq.h                |   0
 .../arm/include/asm}/spinlock.h               |   0
 .../asm-arm => arch/arm/include/asm}/string.h |   0
 .../arm/include/asm}/sysregs.h                |   0
 .../asm-arm => arch/arm/include/asm}/system.h |   0
 .../arm/include/asm}/tee/optee_msg.h          |   0
 .../arm/include/asm}/tee/optee_rpc_cmd.h      |   0
 .../arm/include/asm}/tee/optee_smc.h          |   0
 .../arm/include/asm}/tee/tee.h                |   0
 .../asm-arm => arch/arm/include/asm}/time.h   |   0
 .../asm-arm => arch/arm/include/asm}/trace.h  |   0
 .../asm-arm => arch/arm/include/asm}/traps.h  |   0
 .../asm-arm => arch/arm/include/asm}/types.h  |   0
 .../asm-arm => arch/arm/include/asm}/vfp.h    |   0
 .../arm/include/asm}/vgic-emul.h              |   0
 .../asm-arm => arch/arm/include/asm}/vgic.h   |   0
 .../arm/include/asm}/vm_event.h               |   0
 .../asm-arm => arch/arm/include/asm}/vpl011.h |   0
 .../asm-arm => arch/arm/include/asm}/vpsci.h  |   0
 .../asm-arm => arch/arm/include/asm}/vreg.h   |   0
 .../asm-arm => arch/arm/include/asm}/vtimer.h |   0
 .../arm/include/asm}/xenoprof.h               |   0
 xen/arch/arm/smpboot.c                        |   2 +-
 xen/arch/arm/vpsci.c                          |   2 +-
 xen/arch/riscv/arch.mk                        |   1 -
 .../riscv/include/asm}/config.h               |   0
 xen/arch/x86/Makefile                         | 204 ++++-----
 xen/arch/x86/Rules.mk                         |   4 +-
 xen/arch/x86/arch.mk                          |  54 ++-
 xen/arch/x86/boot/Makefile                    |  62 ++-
 xen/arch/x86/boot/build32.mk                  |  40 --
 xen/arch/x86/boot/head.S                      |   4 +-
 xen/arch/x86/efi/Makefile                     |  11 +-
 .../asm-x86 => arch/x86/include/asm}/acpi.h   |   0
 .../x86/include/asm}/alternative-asm.h        |   0
 .../x86/include/asm}/alternative.h            |   0
 .../asm-x86 => arch/x86/include/asm}/altp2m.h |   0
 .../asm-x86 => arch/x86/include/asm}/amd.h    |   0
 .../asm-x86 => arch/x86/include/asm}/apic.h   |   0
 .../x86/include/asm}/apicdef.h                |   0
 .../x86/include/asm}/asm-defns.h              |   0
 .../x86/include/asm}/asm_defns.h              |   0
 .../asm-x86 => arch/x86/include/asm}/atomic.h |   0
 .../asm-x86 => arch/x86/include/asm}/bitops.h |   0
 .../asm-x86 => arch/x86/include/asm}/bug.h    |   0
 .../x86/include/asm}/byteorder.h              |   0
 .../x86/include/asm}/bzimage.h                |   0
 .../asm-x86 => arch/x86/include/asm}/cache.h  |   0
 .../asm-x86 => arch/x86/include/asm}/compat.h |   0
 .../asm-x86 => arch/x86/include/asm}/config.h |   0
 .../x86/include/asm}/cpufeature.h             |   0
 .../x86/include/asm}/cpufeatures.h            |   0
 .../x86/include/asm}/cpufeatureset.h          |   0
 .../asm-x86 => arch/x86/include/asm}/cpuid.h  |   0
 .../x86/include/asm}/cpuidle.h                |   0
 .../x86/include/asm}/current.h                |   2 +-
 .../x86/include/asm}/debugger.h               |   0
 .../x86/include/asm}/debugreg.h               |   0
 .../asm-x86 => arch/x86/include/asm}/delay.h  |   0
 .../asm-x86 => arch/x86/include/asm}/desc.h   |   0
 .../asm-x86 => arch/x86/include/asm}/device.h |   0
 .../asm-x86 => arch/x86/include/asm}/div64.h  |   0
 .../x86/include/asm}/dom0_build.h             |   0
 .../asm-x86 => arch/x86/include/asm}/domain.h |   2 +-
 .../asm-x86 => arch/x86/include/asm}/e820.h   |   0
 .../asm-x86 => arch/x86/include/asm}/edd.h    |   0
 .../x86/include/asm}/efibind.h                |   0
 .../asm-x86 => arch/x86/include/asm}/elf.h    |   0
 .../asm-x86 => arch/x86/include/asm}/event.h  |   0
 .../asm-x86 => arch/x86/include/asm}/fixmap.h |   0
 .../x86/include/asm}/flushtlb.h               |   0
 .../x86/include/asm}/genapic.h                |   0
 .../x86/include/asm}/grant_table.h            |   0
 .../asm-x86 => arch/x86/include/asm}/guest.h  |   0
 .../x86/include/asm}/guest/hyperv-hcall.h     |   0
 .../x86/include/asm}/guest/hyperv-tlfs.h      |   0
 .../x86/include/asm}/guest/hyperv.h           |   0
 .../x86/include/asm}/guest/hypervisor.h       |   0
 .../x86/include/asm}/guest/pvh-boot.h         |   0
 .../x86/include/asm}/guest/xen-hcall.h        |   0
 .../x86/include/asm}/guest/xen.h              |   0
 .../x86/include/asm}/guest_access.h           |   0
 .../x86/include/asm}/guest_atomics.h          |   0
 .../x86/include/asm}/guest_pt.h               |   0
 .../asm-x86 => arch/x86/include/asm}/hap.h    |   0
 .../x86/include/asm}/hardirq.h                |   0
 .../asm-x86 => arch/x86/include/asm}/hpet.h   |   0
 .../x86/include/asm}/hvm/asid.h               |   0
 .../x86/include/asm}/hvm/cacheattr.h          |   0
 .../x86/include/asm}/hvm/domain.h             |   0
 .../x86/include/asm}/hvm/emulate.h            |   0
 .../x86/include/asm}/hvm/grant_table.h        |   0
 .../x86/include/asm}/hvm/guest_access.h       |   0
 .../x86/include/asm}/hvm/hvm.h                |   0
 .../asm-x86 => arch/x86/include/asm}/hvm/io.h |   0
 .../x86/include/asm}/hvm/ioreq.h              |   0
 .../x86/include/asm}/hvm/irq.h                |   0
 .../x86/include/asm}/hvm/monitor.h            |   0
 .../x86/include/asm}/hvm/nestedhvm.h          |   0
 .../x86/include/asm}/hvm/save.h               |   0
 .../x86/include/asm}/hvm/support.h            |   0
 .../x86/include/asm}/hvm/svm/asid.h           |   0
 .../x86/include/asm}/hvm/svm/emulate.h        |   0
 .../x86/include/asm}/hvm/svm/intr.h           |   0
 .../x86/include/asm}/hvm/svm/nestedsvm.h      |   0
 .../x86/include/asm}/hvm/svm/svm.h            |   0
 .../x86/include/asm}/hvm/svm/svmdebug.h       |   0
 .../x86/include/asm}/hvm/svm/vmcb.h           |   0
 .../x86/include/asm}/hvm/trace.h              |   0
 .../x86/include/asm}/hvm/vcpu.h               |   0
 .../x86/include/asm}/hvm/vioapic.h            |   0
 .../x86/include/asm}/hvm/viridian.h           |   0
 .../x86/include/asm}/hvm/vlapic.h             |   0
 .../x86/include/asm}/hvm/vm_event.h           |   0
 .../x86/include/asm}/hvm/vmx/vmcs.h           |   0
 .../x86/include/asm}/hvm/vmx/vmx.h            |   0
 .../x86/include/asm}/hvm/vmx/vvmx.h           |   0
 .../x86/include/asm}/hvm/vpic.h               |   0
 .../x86/include/asm}/hvm/vpt.h                |   0
 .../x86/include/asm}/hypercall.h              |   0
 .../asm-x86 => arch/x86/include/asm}/i387.h   |   0
 .../asm-x86 => arch/x86/include/asm}/init.h   |   0
 .../x86/include/asm}/invpcid.h                |   0
 .../asm-x86 => arch/x86/include/asm}/io.h     |   0
 .../x86/include/asm}/io_apic.h                |   0
 .../asm-x86 => arch/x86/include/asm}/iocap.h  |   0
 .../asm-x86 => arch/x86/include/asm}/iommu.h  |   0
 .../asm-x86 => arch/x86/include/asm}/ioreq.h  |   0
 .../asm-x86 => arch/x86/include/asm}/irq.h    |   0
 .../asm-x86 => arch/x86/include/asm}/ldt.h    |   0
 .../x86/include/asm}/livepatch.h              |   0
 .../x86/include/asm}/mach-default/bios_ebda.h |   0
 .../x86/include/asm}/mach-default/io_ports.h  |   0
 .../include/asm}/mach-default/irq_vectors.h   |   0
 .../include/asm}/mach-default/mach_mpparse.h  |   0
 .../include/asm}/mach-default/mach_mpspec.h   |   0
 .../x86/include/asm}/mach-generic/mach_apic.h |   0
 .../include/asm}/mach-generic/mach_mpparse.h  |   0
 .../x86/include/asm}/machine_kexec.h          |   0
 .../x86/include/asm}/mc146818rtc.h            |   0
 .../asm-x86 => arch/x86/include/asm}/mce.h    |   0
 .../x86/include/asm}/mem_access.h             |   0
 .../x86/include/asm}/mem_paging.h             |   0
 .../x86/include/asm}/mem_sharing.h            |   0
 .../x86/include/asm}/microcode.h              |   0
 .../asm-x86 => arch/x86/include/asm}/mm.h     |   0
 .../x86/include/asm}/monitor.h                |   0
 .../asm-x86 => arch/x86/include/asm}/mpspec.h |   0
 .../x86/include/asm}/mpspec_def.h             |   0
 .../asm-x86 => arch/x86/include/asm}/msi.h    |   0
 .../x86/include/asm}/msr-index.h              |   0
 .../asm-x86 => arch/x86/include/asm}/msr.h    |   0
 .../asm-x86 => arch/x86/include/asm}/mtrr.h   |   0
 .../x86/include/asm}/multicall.h              |   0
 .../asm-x86 => arch/x86/include/asm}/mwait.h  |   0
 .../asm-x86 => arch/x86/include/asm}/nmi.h    |   0
 .../asm-x86 => arch/x86/include/asm}/nops.h   |   0
 .../asm-x86 => arch/x86/include/asm}/nospec.h |   0
 .../asm-x86 => arch/x86/include/asm}/numa.h   |   0
 .../asm-x86 => arch/x86/include/asm}/p2m.h    |   0
 .../x86/include/asm}/page-bits.h              |   0
 .../asm-x86 => arch/x86/include/asm}/page.h   |   0
 .../asm-x86 => arch/x86/include/asm}/paging.h |   0
 .../asm-x86 => arch/x86/include/asm}/pci.h    |   0
 .../asm-x86 => arch/x86/include/asm}/percpu.h |   0
 .../asm-x86 => arch/x86/include/asm}/perfc.h  |   0
 .../x86/include/asm}/perfc_defn.h             |   0
 .../x86/include/asm}/processor.h              |   0
 .../asm-x86 => arch/x86/include/asm}/psr.h    |   0
 .../x86/include/asm}/pv/domain.h              |   0
 .../x86/include/asm}/pv/grant_table.h         |   0
 .../asm-x86 => arch/x86/include/asm}/pv/mm.h  |   0
 .../x86/include/asm}/pv/shim.h                |   0
 .../x86/include/asm}/pv/trace.h               |   0
 .../x86/include/asm}/pv/traps.h               |   0
 .../asm-x86 => arch/x86/include/asm}/random.h |   0
 .../asm-x86 => arch/x86/include/asm}/regs.h   |   0
 .../asm-x86 => arch/x86/include/asm}/setup.h  |   0
 .../asm-x86 => arch/x86/include/asm}/shadow.h |   0
 .../asm-x86 => arch/x86/include/asm}/shared.h |   0
 .../asm-x86 => arch/x86/include/asm}/smp.h    |   0
 .../x86/include/asm}/softirq.h                |   0
 .../x86/include/asm}/spec_ctrl.h              |   0
 .../x86/include/asm}/spec_ctrl_asm.h          |   0
 .../x86/include/asm}/spinlock.h               |   0
 .../asm-x86 => arch/x86/include/asm}/string.h |   0
 .../asm-x86 => arch/x86/include/asm}/system.h |   0
 .../asm-x86 => arch/x86/include/asm}/tboot.h  |   0
 .../asm-x86 => arch/x86/include/asm}/time.h   |   0
 .../asm-x86 => arch/x86/include/asm}/trace.h  |   0
 .../asm-x86 => arch/x86/include/asm}/traps.h  |   0
 .../asm-x86 => arch/x86/include/asm}/types.h  |   0
 .../x86/include/asm}/uaccess.h                |   0
 .../x86/include/asm}/unaligned.h              |   0
 .../x86/include/asm}/vm_event.h               |   0
 .../asm-x86 => arch/x86/include/asm}/vpmu.h   |   0
 .../x86/include/asm}/x86-defns.h              |   0
 .../x86/include/asm}/x86-vendors.h            |   0
 .../x86/include/asm}/x86_64/efibind.h         |   0
 .../x86/include/asm}/x86_64/elf.h             |   0
 .../x86/include/asm}/x86_64/page.h            |   0
 .../x86/include/asm}/x86_64/regs.h            |   0
 .../x86/include/asm}/x86_64/system.h          |   0
 .../x86/include/asm}/x86_64/uaccess.h         |   0
 .../x86/include/asm}/x86_emulate.h            |   2 +-
 .../x86/include/asm}/xenoprof.h               |   0
 .../asm-x86 => arch/x86/include/asm}/xstate.h |   0
 xen/build.mk                                  |  96 +++++
 xen/common/Makefile                           |  15 +-
 xen/common/efi/efi_common.mk                  |  16 +
 xen/common/efi/runtime.c                      |   2 +-
 xen/common/libelf/Makefile                    |   4 +-
 xen/common/libfdt/Makefile                    |   8 +-
 xen/common/page_alloc.c                       |   2 +-
 xen/include/Makefile                          |  74 ++--
 xen/include/xen/acpi.h                        |   5 +-
 xen/include/xen/bitmap.h                      |   2 +-
 xen/scripts/Kbuild.include                    |  69 ++-
 xen/scripts/Kconfig.include                   |   2 +-
 xen/scripts/Makefile.clean                    |  32 +-
 xen/{tools/kconfig => scripts}/Makefile.host  |  69 +--
 xen/test/Makefile                             |   7 +-
 xen/test/livepatch/Makefile                   | 213 ++++-----
 xen/tools/Makefile                            |  14 +-
 xen/tools/fixdep.c                            | 404 ++++++++++++++++++
 xen/tools/kconfig/Makefile                    |  15 +-
 xen/tools/kconfig/Makefile.kconfig            | 106 -----
 xen/tools/kconfig/confdata.c                  |  12 +-
 xen/xsm/flask/Makefile                        |  43 +-
 xen/xsm/flask/include/avc.h                   |   4 +-
 xen/xsm/flask/include/avc_ss.h                |   2 +-
 xen/xsm/flask/include/objsec.h                |   2 +-
 xen/xsm/flask/include/security.h              |   2 +-
 xen/xsm/flask/policy/mkaccess_vector.sh       |   7 +-
 xen/xsm/flask/ss/Makefile                     |   3 +-
 366 files changed, 1494 insertions(+), 958 deletions(-)
 rename xen/{include/asm-arm => arch/arm/include/asm}/acpi.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/alternative.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/altp2m.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/cmpxchg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/brk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/cmpxchg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/cpufeature.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/efibind.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/hsr.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/asm_defns.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/byteorder.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cache.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cadence-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/config.h (99%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpuerrata.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpufeature.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/current.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/debugger.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/delay.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/desc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/device.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/div64.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/domain.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/domain_build.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/early_printk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/efibind.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/elf.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/event.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/exynos4210-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_defs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_its.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/grant_table.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_access.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_atomics.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_walk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hardirq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hsr.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hypercall.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/init.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iocap.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iommu.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iommu_fwspec.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/ioreq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/irq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/kernel.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/livepatch.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/lpae.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mem_access.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mmio.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/monitor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/new_vgic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/nospec.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/numa.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/p2m.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/page-bits.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/paging.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/pci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/percpu.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/perfc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/perfc_defn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/pl011-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platform.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/exynos5.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/midway.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/omap5.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/vexpress.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/xilinx-zynqmp-eemi.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/procinfo.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/psci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/random.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/regs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/scif-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/setup.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/short-desc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/smccc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/smp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/softirq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/spinlock.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/string.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_msg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_rpc_cmd.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_smc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/tee.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/time.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/trace.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/types.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vgic-emul.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vgic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vm_event.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vpl011.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vpsci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vreg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vtimer.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/xenoprof.h (100%)
 rename xen/{include/asm-riscv => arch/riscv/include/asm}/config.h (100%)
 delete mode 100644 xen/arch/x86/boot/build32.mk
 rename xen/{include/asm-x86 => arch/x86/include/asm}/acpi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative-asm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/altp2m.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/amd.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/apicdef.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/asm-defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/asm_defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/atomic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bitops.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bug.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/byteorder.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bzimage.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cache.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/compat.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/config.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeature.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatures.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatureset.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuidle.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/current.h (99%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/debugger.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/debugreg.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/delay.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/desc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/device.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/div64.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/dom0_build.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/domain.h (99%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/e820.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/edd.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/efibind.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/elf.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/fixmap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/flushtlb.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/genapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-hcall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-tlfs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hypervisor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/pvh-boot.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen-hcall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_atomics.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_pt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hardirq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hpet.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/asid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/cacheattr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/domain.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/emulate.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/guest_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/hvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/io.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/ioreq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/irq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/monitor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/nestedhvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/save.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/support.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/asid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/emulate.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/intr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/nestedsvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svmdebug.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/vmcb.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vcpu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vioapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/viridian.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vlapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vm_event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmcs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmx.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vvmx.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hypercall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/i387.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/init.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/invpcid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/io.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/io_apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/iocap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/iommu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/ioreq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/irq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/ldt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/livepatch.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/bios_ebda.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/io_ports.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/irq_vectors.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpparse.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpspec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_mpparse.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/machine_kexec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mc146818rtc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mce.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_paging.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_sharing.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/microcode.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/monitor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec_def.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msr-index.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mtrr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/multicall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mwait.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nmi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nops.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nospec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/numa.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/p2m.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/page-bits.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/page.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/paging.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pci.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/percpu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc_defn.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/processor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/psr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/domain.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/mm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/shim.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/traps.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/random.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/regs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/setup.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/shadow.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/shared.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/smp.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/softirq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl_asm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spinlock.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/string.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/system.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/tboot.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/time.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/traps.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/types.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/uaccess.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/unaligned.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/vm_event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/vpmu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-vendors.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/efibind.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/elf.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/page.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/regs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/system.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/uaccess.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_emulate.h (89%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/xenoprof.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/xstate.h (100%)
 create mode 100644 xen/build.mk
 create mode 100644 xen/common/efi/efi_common.mk
 rename xen/{tools/kconfig => scripts}/Makefile.host (74%)
 create mode 100644 xen/tools/fixdep.c
 delete mode 100644 xen/tools/kconfig/Makefile.kconfig

-- 
Anthony PERARD


