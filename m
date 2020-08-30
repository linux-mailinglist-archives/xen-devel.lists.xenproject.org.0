Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0E256C61
	for <lists+xen-devel@lfdr.de>; Sun, 30 Aug 2020 08:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCGro-0001LY-1b; Sun, 30 Aug 2020 06:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ueMT=CI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kCGrm-0001LT-NB
 for xen-devel@lists.xenproject.org; Sun, 30 Aug 2020 06:31:02 +0000
X-Inumbo-ID: 081d1752-6f45-44ab-8a58-1dc28e25d52c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 081d1752-6f45-44ab-8a58-1dc28e25d52c;
 Sun, 30 Aug 2020 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=YT3s2c+CDH8g6gV5g5inUfGSVENAcyd/Wx/Rps+OvOA=; b=0JHYy16MZ/LLxeqRQEBUq1I2tW
 VaEw8o1C1yvyAwlJc6XnSBj4eqlrDqtwdWSAQyI4aB8z5ssRgwDjAcwGQ7jExAcLMtxZeDKbVoGEF
 smMdtI35lUiD6Bo0LoL+nB7DjO1pkt8MinKznu/qMKiXJiXtmZKJS42e/MOfdP1M35Cw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kCGrk-0001vm-AL; Sun, 30 Aug 2020 06:31:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kCGrk-00025j-3Q; Sun, 30 Aug 2020 06:31:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kCGrk-0000Es-2x; Sun, 30 Aug 2020 06:31:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153149-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 153149: regressions - FAIL
X-Osstest-Failures: ovmf:build-i386:xen-build:fail:regression
 ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=5ffcbc46908a2037ae3260d3cfcc103e4a6a48c0
X-Osstest-Versions-That: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 30 Aug 2020 06:31:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 153149 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153149/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                    6 xen-build                fail REGR. vs. 152863
 build-i386-xsm                6 xen-build                fail REGR. vs. 152863
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152863
 build-amd64                   6 xen-build                fail REGR. vs. 152863

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 5ffcbc46908a2037ae3260d3cfcc103e4a6a48c0
baseline version:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00

Last test of basis   152863  2020-08-26 16:09:47 Z    3 days
Failing since        152915  2020-08-27 18:09:42 Z    2 days   61 attempts
Testing same since   153135  2020-08-30 02:28:59 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Paul <paul.grimes@amd.com>
  Paul G <paul.grimes@amd.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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
commit 5ffcbc46908a2037ae3260d3cfcc103e4a6a48c0
Author: Paul <paul.grimes@amd.com>
Date:   Fri Aug 28 04:40:51 2020 +0800

    MdePkg: Correcting EFI_ACPI_DMA_TRANSFER_TYPE_16_BIT definition
    
    In Acpi10.h, EFI_ACPI_DMA_TRANSFER_TYPE_16_BIT is defined as 0x10,
    but should be 0x02 per the ACPI Specification.
    
    REF:https://bugzilla.tianocore.org/show_bug.cgi?id=2937
    
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    Signed-off-by: Paul G <paul.grimes@amd.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

commit cbccf995920a28071f5403b847f29ebf8b732fa9
Author: Laszlo Ersek <lersek@redhat.com>
Date:   Thu Aug 27 00:21:29 2020 +0200

    OvmfPkg/CpuHotplugSmm: fix CPU hotplug race just after SMI broadcast
    
    The "virsh setvcpus" (plural) command may hot-plug several VCPUs in quick
    succession -- it means a series of "device_add" QEMU monitor commands,
    back-to-back.
    
    If a "device_add" occurs *just after* ACPI raises the broadcast SMI, then:
    
    - the CPU_FOREACH() loop in QEMU's ich9_apm_ctrl_changed() cannot make the
      SMI pending for the new CPU -- at that time, the new CPU doesn't even
      exist yet,
    
    - OVMF will find the new CPU however (in the CPU hotplug register block),
      in QemuCpuhpCollectApicIds().
    
    As a result, when the firmware sends an INIT-SIPI-SIPI to the new CPU in
    SmbaseRelocate(), expecting it to boot into SMM (due to the pending SMI),
    the new CPU instead boots straight into the post-RSM (normal mode) "pen",
    skipping its initial SMI handler.
    
    The CPU halts nicely in the pen, but its SMBASE is never relocated, and
    the SMRAM message exchange with the BSP falls apart -- the BSP gets stuck
    in the following loop:
    
      //
      // Wait until the hot-added CPU is just about to execute RSM.
      //
      while (Context->AboutToLeaveSmm == 0) {
        CpuPause ();
      }
    
    because the new CPU's initial SMI handler never sets the flag to nonzero.
    
    Fix this by sending a directed SMI to the new CPU just before sending it
    the INIT-SIPI-SIPI. The various scenarios are documented in the code --
    the cases affected by the patch are documented under point (2).
    
    Note that this is not considered a security patch, as for a malicious
    guest OS, the issue is not exploitable -- the symptom is a hang on the
    BSP, in the above-noted loop in SmbaseRelocate(). Instead, the patch fixes
    behavior for a benign guest OS.
    
    Cc: Ard Biesheuvel <ard.biesheuvel@arm.com>
    Cc: Igor Mammedov <imammedo@redhat.com>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
    Fixes: 51a6fb41181529e4b50ea13377425bda6bb69ba6
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2929
    Signed-off-by: Laszlo Ersek <lersek@redhat.com>
    Message-Id: <20200826222129.25798-3-lersek@redhat.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 020bb4b46d6f6708bb3358e1c738109b7908f0de
Author: Laszlo Ersek <lersek@redhat.com>
Date:   Thu Aug 27 00:21:28 2020 +0200

    OvmfPkg/CpuHotplugSmm: fix CPU hotplug race just before SMI broadcast
    
    The "virsh setvcpus" (plural) command may hot-plug several VCPUs in quick
    succession -- it means a series of "device_add" QEMU monitor commands,
    back-to-back.
    
    If a "device_add" occurs *just before* ACPI raises the broadcast SMI,
    then:
    
    - OVMF processes the hot-added CPU well.
    
    - However, QEMU's post-SMI ACPI loop -- which clears the pending events
      for the hot-added CPUs that were collected before raising the SMI -- is
      unaware of the stray CPU. Thus, the pending event is not cleared for it.
    
    As a result of the stuck event, at the next hot-plug, OVMF tries to re-add
    (relocate for the 2nd time) the already-known CPU. At that time, the AP is
    already in the normal edk2 SMM busy-wait however, so it doesn't respond to
    the exchange that the BSP intends to do in SmbaseRelocate(). Thus the VM
    gets stuck in SMM.
    
    (Because of the above symptom, this is not considered a security patch; it
    doesn't seem exploitable by a malicious guest OS.)
    
    In CpuHotplugMmi(), skip the supposedly hot-added CPU if it's already
    known. The post-SMI ACPI loop will clear the pending event for it this
    time.
    
    Cc: Ard Biesheuvel <ard.biesheuvel@arm.com>
    Cc: Igor Mammedov <imammedo@redhat.com>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
    Fixes: bc498ac4ca7590479cfd91ad1bb8a36286b0dc21
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2929
    Signed-off-by: Laszlo Ersek <lersek@redhat.com>
    Message-Id: <20200826222129.25798-2-lersek@redhat.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

