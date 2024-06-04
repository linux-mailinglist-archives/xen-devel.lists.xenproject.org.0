Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8C8FBDAA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 23:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735479.1141628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEbFg-0002yi-AT; Tue, 04 Jun 2024 20:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735479.1141628; Tue, 04 Jun 2024 20:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEbFg-0002wK-6q; Tue, 04 Jun 2024 20:59:28 +0000
Received: by outflank-mailman (input) for mailman id 735479;
 Tue, 04 Jun 2024 20:59:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbFe-0002ul-30; Tue, 04 Jun 2024 20:59:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbFd-0004sz-QZ; Tue, 04 Jun 2024 20:59:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbFd-0007AE-FK; Tue, 04 Jun 2024 20:59:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbFd-0004Zd-Eo; Tue, 04 Jun 2024 20:59:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=xBCfEEcRgWBxOIKplCOgooAoaGOMW/HRoLS0FVVgcI0=; b=KRfP+viOe67QH5RbuUtLDF3IvW
	oBFDKVendxz4nQJckB+5/1wmabssl7tbeUSyl0qEC4KpmemeQaiDK+vPhUa7kBbd0a8wuKj2+Sxqt
	xzNPI7/+0kcSEnvQ+Ry80k5KpIO7ZB3MLgVc8E2N/81osR3dan9dKy04Z/sxD3TEkx+g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186248-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186248: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-armhf:xen-build:fail:regression
    linux-linus:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2ab79514109578fc4b6df90633d500cf281eb689
X-Osstest-Versions-That:
    linux=c3f38fa61af77b49866b006939479069cd451173
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jun 2024 20:59:25 +0000

flight 186248 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186248/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 186238

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186238
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186238
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186238
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186238
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186238
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                2ab79514109578fc4b6df90633d500cf281eb689
baseline version:
 linux                c3f38fa61af77b49866b006939479069cd451173

Last test of basis   186238  2024-06-03 13:41:54 Z    1 days
Failing since        186239  2024-06-03 20:43:26 Z    1 days    3 attempts
Testing same since   186244  2024-06-04 04:58:12 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dave Jiang <dave.jiang@intel.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Tiezhu Yang <yangtiezhu@loongson.cn>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit 2ab79514109578fc4b6df90633d500cf281eb689
Merge: f06ce441457d 49ba7b515c4c
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jun 3 14:42:41 2024 -0700

    Merge tag 'cxl-fixes-6.10-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
    
    Pull cxl fixes from Dave Jiang:
    
     - Compile fix for cxl-test from missing linux/vmalloc.h
    
     - Fix for memregion leaks in devm_cxl_add_region()
    
    * tag 'cxl-fixes-6.10-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl:
      cxl/region: Fix memregion leaks in devm_cxl_add_region()
      cxl/test: Add missing vmalloc.h for tools/testing/cxl/test/mem.c

commit f06ce441457d4abc4d76be7acba26868a2d02b1c
Merge: c3f38fa61af7 eb36e520f4f1
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jun 3 09:27:45 2024 -0700

    Merge tag 'loongarch-fixes-6.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
    
    Pull LoongArch fixes from Huacai Chen:
     "Some bootloader interface fixes, a dts fix, and a trivial cleanup"
    
    * tag 'loongarch-fixes-6.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson:
      LoongArch: Fix GMAC's phy-mode definitions in dts
      LoongArch: Override higher address bits in JUMP_VIRT_ADDR
      LoongArch: Fix entry point in kernel image header
      LoongArch: Add all CPUs enabled by fdt to NUMA node 0
      LoongArch: Fix built-in DTB detection
      LoongArch: Remove CONFIG_ACPI_TABLE_UPGRADE in platform_init()

commit eb36e520f4f1b690fd776f15cbac452f82ff7bfa
Author: Huacai Chen <chenhuacai@loongson.cn>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Fix GMAC's phy-mode definitions in dts
    
    The GMAC of Loongson chips cannot insert the correct 1.5-2ns delay. So
    we need the PHY to insert internal delays for both transmit and receive
    data lines from/to the PHY device. Fix this by changing the "phy-mode"
    from "rgmii" to "rgmii-id" in dts.
    
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit 1098efd299ffe9c8af818425338c7f6c4f930a98
Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Override higher address bits in JUMP_VIRT_ADDR
    
    In JUMP_VIRT_ADDR we are performing an or calculation on address value
    directly from pcaddi.
    
    This will only work if we are currently running from direct 1:1 mapping
    addresses or firmware's DMW is configured exactly same as kernel. Still,
    we should not rely on such assumption.
    
    Fix by overriding higher bits in address comes from pcaddi, so we can
    get rid of or operator.
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit beb2800074c15362cf9f6c7301120910046d6556
Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Fix entry point in kernel image header
    
    Currently kernel entry in head.S is in DMW address range, firmware is
    instructed to jump to this address after loading the kernel image.
    
    However kernel should not make any assumption on firmware's DMW
    setting, thus the entry point should be a physical address falls into
    direct translation region.
    
    Fix by converting entry address to physical and amend entry calculation
    logic in libstub accordingly.
    
    BTW, use ABSOLUTE() to calculate variables to make Clang/LLVM happy.
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit 3de9c42d02a79a5e09bbee7a4421ddc00cfd5c6d
Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Add all CPUs enabled by fdt to NUMA node 0
    
    NUMA enabled kernel on FDT based machine fails to boot because CPUs
    are all in NUMA_NO_NODE and mm subsystem won't accept that.
    
    Fix by adding them to default NUMA node at FDT parsing phase and move
    numa_add_cpu(0) to a later point.
    
    Cc: stable@vger.kernel.org
    Fixes: 88d4d957edc7 ("LoongArch: Add FDT booting support from efi system table")
    Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit b56f67a6c748bb009f313f91651c8020d2338d63
Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Fix built-in DTB detection
    
    fdt_check_header(__dtb_start) will always success because kernel
    provides a dummy dtb, and by coincidence __dtb_start clashed with
    entry of this dummy dtb. The consequence is fdt passed from firmware
    will never be taken.
    
    Fix by trying to utilise __dtb_start only when CONFIG_BUILTIN_DTB is
    enabled.
    
    Cc: stable@vger.kernel.org
    Fixes: 7b937cc243e5 ("of: Create of_root if no dtb provided by firmware")
    Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit 6c3ca6654a74dd396bc477839ba8d9792eced441
Author: Tiezhu Yang <yangtiezhu@loongson.cn>
Date:   Mon Jun 3 15:45:53 2024 +0800

    LoongArch: Remove CONFIG_ACPI_TABLE_UPGRADE in platform_init()
    
    Both acpi_table_upgrade() and acpi_boot_table_init() are defined as
    empty functions under !CONFIG_ACPI_TABLE_UPGRADE and !CONFIG_ACPI in
    include/linux/acpi.h, there are no implicit declaration errors with
    various configs.
    
      #ifdef CONFIG_ACPI_TABLE_UPGRADE
      void acpi_table_upgrade(void);
      #else
      static inline void acpi_table_upgrade(void) { }
      #endif
    
      #ifdef        CONFIG_ACPI
      ...
      void acpi_boot_table_init (void);
      ...
      #else /* !CONFIG_ACPI */
      ...
      static inline void acpi_boot_table_init(void)
      {
      }
      ...
      #endif        /* !CONFIG_ACPI */
    
    As Huacai suggested, CONFIG_ACPI_TABLE_UPGRADE is ugly and not necessary
    here, just remove it. At the same time, just keep CONFIG_ACPI to prevent
    potential build errors in future, and give a signal to indicate the code
    is ACPI-specific. For the same reason, we also put acpi_table_upgrade()
    under CONFIG_ACPI.
    
    Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

commit 49ba7b515c4c0719b866d16f068e62d16a8a3dd1
Author: Li Zhijian <lizhijian@fujitsu.com>
Date:   Tue May 7 13:34:21 2024 +0800

    cxl/region: Fix memregion leaks in devm_cxl_add_region()
    
    Move the mode verification to __create_region() before allocating the
    memregion to avoid the memregion leaks.
    
    Fixes: 6e099264185d ("cxl/region: Add volatile region creation support")
    Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
    Reviewed-by: Dan Williams <dan.j.williams@intel.com>
    Link: https://lore.kernel.org/r/20240507053421.456439-1-lizhijian@fujitsu.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

commit d55510527153d17a3af8cc2df69c04f95ae1350d
Author: Dave Jiang <dave.jiang@intel.com>
Date:   Tue May 28 15:55:51 2024 -0700

    cxl/test: Add missing vmalloc.h for tools/testing/cxl/test/mem.c
    
    tools/testing/cxl/test/mem.c uses vmalloc() and vfree() but does not
    include linux/vmalloc.h. Kernel v6.10 made changes that causes the
    currently included headers not depend on vmalloc.h and therefore
    mem.c can no longer compile. Add linux/vmalloc.h to fix compile
    issue.
    
      CC [M]  tools/testing/cxl/test/mem.o
    tools/testing/cxl/test/mem.c: In function ‘label_area_release’:
    tools/testing/cxl/test/mem.c:1428:9: error: implicit declaration of function ‘vfree’; did you mean ‘kvfree’? [-Werror=implicit-function-declaration]
     1428 |         vfree(lsa);
          |         ^~~~~
          |         kvfree
    tools/testing/cxl/test/mem.c: In function ‘cxl_mock_mem_probe’:
    tools/testing/cxl/test/mem.c:1466:22: error: implicit declaration of function ‘vmalloc’; did you mean ‘kmalloc’? [-Werror=implicit-function-declaration]
     1466 |         mdata->lsa = vmalloc(LSA_SIZE);
          |                      ^~~~~~~
          |                      kmalloc
    
    Fixes: 7d3eb23c4ccf ("tools/testing/cxl: Introduce a mock memory device + driver")
    Reviewed-by: Dan Williams <dan.j.williams@intel.com>
    Reviewed-by: Alison Schofield <alison.schofield@intel.com>
    Link: https://lore.kernel.org/r/20240528225551.1025977-1-dave.jiang@intel.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

