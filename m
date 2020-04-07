Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8B1A1109
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLqsn-00028n-AQ; Tue, 07 Apr 2020 16:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AqR/=5X=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jLqsm-00028i-BW
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:15:24 +0000
X-Inumbo-ID: fb9dd302-78ea-11ea-9e09-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb9dd302-78ea-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 16:15:23 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jLqsk-0003Hn-25; Tue, 07 Apr 2020 17:15:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] MAINTAINERS: Remove all S: entries
Date: Tue,  7 Apr 2020 17:15:19 +0100
Message-Id: <20200407161519.16493-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Feature support status is tracked in SUPPORT.md nowadays.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 MAINTAINERS | 60 ------------------------------------------------------------
 1 file changed, 60 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a4c869704..e784169d1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -69,16 +69,6 @@ Descriptions of section entries:
 	L: Mailing list that is relevant to this area
 	W: Web-page with status/info
 	T: SCM tree type and location.  Type is one of: git, hg, quilt, stgit.
-	S: Status, one of the following:
-	   Supported:	Someone is actually paid to look after this.
-	   Maintained:	Someone actually looks after it.
-	   Odd Fixes:	It has a maintainer but they don't have time to do
-			much other than throw the odd patch in. See below..
-	   Orphan:	No current maintainer [but maybe you could take the
-			role as you write your new code].
-	   Obsolete:	Old code. Something tagged obsolete generally means
-			it has been replaced by a better system and you
-			should be using that.
 	F: Files and directories with wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net
@@ -194,7 +184,6 @@ Maintainers List (try to look for most precise areas first)
 
 ACPI
 M:	Jan Beulich <jbeulich@suse.com>
-S:	Supported
 F:	xen/arch/x86/acpi/
 F:	xen/drivers/acpi/
 F:	xen/include/acpi/
@@ -203,19 +192,16 @@ F:	tools/libacpi/
 AMD IOMMU
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Maintained
 F:	xen/drivers/passthrough/amd/
 
 AMD SVM
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Supported
 F:	xen/arch/x86/hvm/svm/
 F:	xen/arch/x86/cpu/vpmu_amd.c
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
-S:	Maintained
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
@@ -223,7 +209,6 @@ F:	xen/common/argo.c
 ARINC653 SCHEDULER
 M:	Josh Whitehead <josh.whitehead@dornerworks.com>
 M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
-S:	Supported
 L:	xen-devel@dornerworks.com
 F:	xen/common/sched/arinc653.c
 F:	tools/libxc/xc_arinc653.c
@@ -232,7 +217,6 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
 R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
-S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	docs/misc/arm/
 F:	xen/arch/arm/
@@ -252,14 +236,12 @@ F:	xen/include/public/arch-arm.h
 Change Log
 M:	Paul Durrant <paul@xen.org>
 R:	Community Manager <community.manager@xenproject.org>
-S:	Maintained
 F:	CHANGELOG.md
 
 Continuous Integration (CI)
 M:	Doug Goldstein <cardoe@cardoe.com>
 W:	https://gitlab.com/xen-project/xen
 W:	https://travis-ci.org/xen-project/xen
-S:	Supported
 F:	.gitlab-ci.yml
 F:	.travis.yml
 F:	automation/
@@ -268,13 +250,11 @@ F:	scripts/travis-build
 CPU POOLS
 M:	Juergen Gross <jgross@suse.com>
 M:	Dario Faggioli <dfaggioli@suse.com>
-S:	Supported
 F:	xen/common/sched/cpupool.c
 
 DEVICE TREE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
-S:	Supported
 F:	xen/common/libfdt/
 F:	xen/common/device_tree.c
 F:	xen/include/xen/libfdt/
@@ -283,7 +263,6 @@ F:	xen/drivers/passthrough/device_tree.c
 
 EFI
 M:	Jan Beulich <jbeulich@suse.com>
-S:	Supported
 F:	xen/arch/x86/efi/
 F:	xen/common/efi/
 F:	xen/include/efi/
@@ -292,30 +271,25 @@ F:	xen/include/asm-x86/x86_*/efi*.h
 
 GDBSX DEBUGGER
 M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
-S:	Supported
 F:	xen/arch/x86/debug.c
 F:	tools/debugger/gdbsx/
 
 GOLANG BINDINGS
 M:	George Dunlap <george.dunlap@citrix.com>
-S:	Maintained
 F:	tools/golang
 
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
-S:	Odd Fixes
 F:	xen/arch/x86/tboot.c
 F:	xen/include/asm-x86/tboot.h
 
 INTEL(R) VT FOR DIRECTED I/O (VT-D)
 M:	Kevin Tian <kevin.tian@intel.com>
-S:	Supported
 F:	xen/drivers/passthrough/vtd/
 
 INTEL(R) VT FOR X86 (VT-X)
 M:	Jun Nakajima <jun.nakajima@intel.com>
 M:	Kevin Tian <kevin.tian@intel.com>
-S:	Supported
 F:	xen/arch/x86/hvm/vmx/
 F:	xen/arch/x86/mm/p2m-ept.c
 F:	xen/include/asm-x86/hvm/vmx/
@@ -324,7 +298,6 @@ F:	xen/arch/x86/cpu/vpmu_intel.c
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Paul Durrant <paul@xen.org>
-S:	Supported
 F:	xen/drivers/passthrough/
 X:	xen/drivers/passthrough/amd/
 X:	xen/drivers/passthrough/arm/
@@ -334,18 +307,15 @@ F:	xen/include/xen/iommu.h
 
 KCONFIG
 M:	Doug Goldstein <cardoe@cardoe.com>
-S:	Supported
 F:	docs/misc/kconfig{,-language}.txt
 F:	xen/tools/kconfig/
 
 KDD DEBUGGER
 M:	Tim Deegan <tim@xen.org>
-S:	Odd Fixes
 F:	tools/debugger/kdd/
 
 KEXEC
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Supported
 F:	xen/common/{kexec,kimage}.c
 F:	xen/include/{kexec,kimage}.h
 F:	xen/arch/x86/machine_kexec.c
@@ -355,14 +325,12 @@ LIBXENLIGHT
 M:	Ian Jackson <ian.jackson@eu.citrix.com>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
-S:	Supported
 F:	tools/libxl/
 F:	tools/xl/
 
 LIVEPATCH
 M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
 M:	Ross Lagerwall <ross.lagerwall@citrix.com>
-S:	Supported
 F:	docs/misc/livepatch.pandoc
 F:	tools/misc/xen-livepatch.c
 F:	xen/arch/*/livepatch*
@@ -374,7 +342,6 @@ F:	xen/test/livepatch/*
 
 MINI-OS
 M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
-S:	Supported
 L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
 F:	config/MiniOS.mk
@@ -382,18 +349,15 @@ F:	config/MiniOS.mk
 OCAML TOOLS
 M:	Christian Lindig <christian.lindig@citrix.com>
 M:	David Scott <dave@recoil.org>
-S:	Supported
 F:	tools/ocaml/
 
 OVMF UPSTREAM
 M:	Anthony PERARD <anthony.perard@citrix.com>
 M:	Wei Liu <wl@xen.org>
-S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/ovmf.git
 
 POWER MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
-S:	Supported
 F:	xen/arch/x86/acpi/
 X:	xen/arch/x86/acpi/boot.c
 X:	xen/arch/x86/acpi/lib.c
@@ -402,29 +366,24 @@ F:	xen/include/acpi/cpufreq/
 
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
 M:	Juergen Gross <jgross@suse.com>
-S:	Supported
 F:	xen/include/public/io/
 
 PYTHON BINDINGS
 M:	Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-S:	Supported
 F:	tools/python
 
 QEMU-DM
 M:	Ian Jackson <ian.jackson@eu.citrix.com>
-S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
 QEMU UPSTREAM
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Anthony Perard <anthony.perard@citrix.com>
-S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
 
 REMUS
 M:	Shriram Rajagopalan <rshriram@cs.ubc.ca>
 M:	Yang Hongyang <imhy.yang@gmail.com>
-S:	Maintained
 F:	docs/README.remus
 F:	tools/libxl/libxl_remus_*
 F:	tools/libxl/libxl_netbuffer.c
@@ -435,37 +394,31 @@ F:	tools/hotplug/Linux/block-drbd-probe
 RTDS SCHEDULER
 M:	Dario Faggioli <dfaggioli@suse.com>
 M:	Meng Xu <mengxu@cis.upenn.edu>
-S:	Supported
 F:	xen/common/sched/rt.c
 
 SCHEDULING
 M:	George Dunlap <george.dunlap@citrix.com>
 M:	Dario Faggioli <dfaggioli@suse.com>
-S:	Supported
 F:	xen/common/sched/
 
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
-S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/seabios.git
 
 STUB DOMAINS
 M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
-S:	Supported
 F:	config/Stubdom.mk.in
 F:	m4/stubdom.m4
 F:	stubdom/
 
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-S:	Supported
 F:	xen/arch/arm/tee/
 F:	xen/include/asm-arm/tee
 
 TOOLSTACK
 M:	Ian Jackson <ian.jackson@eu.citrix.com>
 M:	Wei Liu <wl@xen.org>
-S:	Supported
 F:	autogen.sh
 F:	config/*.in
 F:	install.sh
@@ -483,7 +436,6 @@ VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
 R:	Alexandru Isaila <aisaila@bitdefender.com>
 R:	Petre Pircalabu <ppircalabu@bitdefender.com>
-S:	Supported
 F:	tools/tests/xen-access
 F:	xen/arch/*/monitor.c
 F:	xen/arch/*/vm_event.c
@@ -502,14 +454,12 @@ F:	xen/include/asm-x86/hvm/vm_event.h
 
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>
-S:	Supported
 F:	xen/drivers/vpci/
 F:	xen/include/xen/vpci.h
 
 VTPM
 M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
 M:	Quan Xu <quan.xu0@gmail.com>
-S:	Supported
 F:	extras/mini-os/tpm*
 F:	extras/mini-os/include/tpm*
 F:	stubdom/vtpm/
@@ -521,7 +471,6 @@ M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 R:	Wei Liu <wl@xen.org>
 R:	Roger Pau Monné <roger.pau@citrix.com>
-S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
 F:	xen/include/asm-x86/
@@ -539,7 +488,6 @@ F:	tools/tests/x86_emulator/
 
 X86 I/O EMULATION
 M:	Paul Durrant <paul@xen.org>
-S:	Supported
 F:	xen/arch/x86/hvm/emulate.c
 F:	xen/arch/x86/hvm/intercept.c
 F:	xen/arch/x86/hvm/io.c
@@ -553,28 +501,23 @@ X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 R:	George Dunlap <george.dunlap@citrix.com>
-S:	Supported
 F:	xen/arch/x86/mm/
 
 X86 MEMORY PAGING
-S:	Orphaned
 F:	xen/arch/x86/mm/mem_paging.c
 
 X86 MEMORY SHARING
 M:	Tamas K Lengyel <tamas@tklengyel.com>
-S:	Odd Fixes
 F:	xen/arch/x86/mm/mem_sharing.c
 F:	tools/tests/mem-sharing/
 
 X86 SHADOW PAGETABLES
 M:	Tim Deegan <tim@xen.org>
-S:	Maintained
 F:	xen/arch/x86/mm/shadow/
 
 X86 VIRIDIAN ENLIGHTENMENTS
 M:	Paul Durrant <paul@xen.org>
 M:	Wei Liu <wl@xen.org>
-S:	Supported
 F:	xen/arch/x86/guest/hyperv/
 F:	xen/arch/x86/hvm/viridian/
 F:	xen/include/asm-x86/guest/hyperv.h
@@ -584,14 +527,12 @@ F:	xen/include/asm-x86/hvm/viridian.h
 
 XENTRACE
 M:	George Dunlap <george.dunlap@citrix.com>
-S:	Supported
 F:	tools/xentrace/
 F:	xen/common/trace.c
 F:	xen/include/xen/trace.h
 
 XSM/FLASK
 M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
-S:	Supported
 F:	tools/flask/
 F:	xen/include/xsm/
 F:	xen/xsm/
@@ -606,7 +547,6 @@ M:	Julien Grall <julien@xen.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Wei Liu <wl@xen.org>
 L:	xen-devel@lists.xenproject.org
-S:	Supported
 F:	*
 F:	*/
 V:	xen-maintainers-1
-- 
2.11.0


