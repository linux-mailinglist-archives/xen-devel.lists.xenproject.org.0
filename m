Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F13FE598
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 01:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176684.321546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLZL0-0006Jr-T4; Wed, 01 Sep 2021 23:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176684.321546; Wed, 01 Sep 2021 23:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLZL0-0006HU-Ni; Wed, 01 Sep 2021 23:08:10 +0000
Received: by outflank-mailman (input) for mailman id 176684;
 Wed, 01 Sep 2021 23:08:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLZKy-0006HK-Jm; Wed, 01 Sep 2021 23:08:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLZKy-0005Bt-DU; Wed, 01 Sep 2021 23:08:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLZKy-0002ZE-4t; Wed, 01 Sep 2021 23:08:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLZKy-0007au-4L; Wed, 01 Sep 2021 23:08:08 +0000
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
	bh=I753QPrczn9QkuyxqPxdWPBn6WhmIc/0JnZFdYDjdVo=; b=UTIX8gcZwPEBKG/eZbxXSYQQVa
	G1EEcSal6ZpqQJ3o5rYst7JJqSwlE3GMmF8NT/5h8/N2hkKrYbqLDnVR8rnhWDRqLW28ihK53VQ/I
	inFjYf5LQALUUjV2UmA3m7ufCq9hYRAD4AcDMTW5srAXAJ5qX5JFraDhA4AJnB3F6/Ek=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164718: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=12e33dca4c0612a0975265e5ba641c6261a26455
X-Osstest-Versions-That:
    ovmf=cae735f61328d64e2e8991036707b9e78c0f5f63
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 23:08:08 +0000

flight 164718 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164718/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 164674
 build-amd64-xsm               6 xen-build                fail REGR. vs. 164674
 build-i386-xsm                6 xen-build                fail REGR. vs. 164674
 build-i386                    6 xen-build                fail REGR. vs. 164674

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 12e33dca4c0612a0975265e5ba641c6261a26455
baseline version:
 ovmf                 cae735f61328d64e2e8991036707b9e78c0f5f63

Last test of basis   164674  2021-08-31 02:56:52 Z    1 days
Failing since        164686  2021-09-01 03:03:43 Z    0 days    4 attempts
Testing same since   164718  2021-09-01 16:40:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  DunTan <dun.tan@intel.com>
  Gary Lin <gary.lin@hpe.com>
  Jim Fehlig <jfehlig@suse.com>
  Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Mark Wilson <Mark.Wilson@amd.com>
  Marvin H?user <mhaeuser@posteo.de>
  Wenxing Hou <wenxing.hou@intel.com>

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
commit 12e33dca4c0612a0975265e5ba641c6261a26455
Author: Loo, Tung Lun <tung.lun.loo@intel.com>
Date:   Tue Aug 17 15:43:12 2021 +0800

    IntelFsp2Pkg: Support Config File and Binary delta comparison
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3567
    
    This patch is to enable config editor to have a new feature that
    can spell out the delta between the default configuration files'
    data, such as YAML and BSF, against the data stored in the binary.
    This can help users understand and track the difference when
    modifications are made.
    
    Cc: Maurice Ma <maurice.ma@intel.com>
    Cc: Nate DeSimone <nathaniel.l.desimone@intel.com>
    Cc: Star Zeng <star.zeng@intel.com>
    Cc: Chasel Chiu <chasel.chiu@intel.com>
    Signed-off-by: Loo Tung Lun <tung.lun.loo@intel.com>
    Reviewed-by: Chasel Chiu <chasel.chiu@intel.com>

commit b170806518c1e414939c8b085866544814e1ce8e
Author: Mark Wilson <Mark.Wilson@amd.com>
Date:   Fri Nov 13 08:05:18 2020 +0800

    UefiCpuPkg: Clean up save state boundary checks and comments.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2956
    
    In functions ReadSaveStateRegisterByIndex and WriteSaveStateRegister:
    * check width > 4 instead of >= 4 when writing upper 32 bytes.
      - This improves the code but will not affect functionality.
    
    Cc: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Signed-off-by: Mark Wilson <Mark.Wilson@amd.com>

commit 3b3f88228812e2c642eea8746858a4dad928ebf7
Author: Marvin H?user <mhaeuser@posteo.de>
Date:   Mon Aug 9 14:09:25 2021 +0800

    MdeModulePkg/PiSmmCore: Drop deprecated image profiling commands
    
    The legacy codebase allowed SMM images to be registered for profiling
    from DXE. Support for this has been dropped entirely, so remove the
    remaining handlers.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Vitaly Cheptsov <vit9696@protonmail.com>
    Signed-off-by: Marvin H?user <mhaeuser@posteo.de>

commit cdda3f74a1327663a5d48cca13507085ba403af7
Author: Marvin H?user <mhaeuser@posteo.de>
Date:   Mon Aug 9 03:39:53 2021 +0800

    UefiPayloadPkg/UefiPayloadEntry: Fix memory corruption
    
    UefiPayloadEntry's AllocatePool() applies the "sizeof" operator to
    HOB index rather than the HOB header structure. This yields 4 Bytes
    compared to the 8 Bytes the structure header requires. Fix the call
    to allocate the required space instead.
    
    Reviewed-by: Guo Dong <guo.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Maurice Ma <maurice.ma@intel.com>
    Cc: Benjamin You <benjamin.you@intel.com>
    Cc: Vitaly Cheptsov <vit9696@protonmail.com>
    Signed-off-by: Marvin H?user <mhaeuser@posteo.de>

commit 5d34cc49d5d348012fe8acf9fb618826bd541a7c
Author: Wenxing Hou <wenxing.hou@intel.com>
Date:   Tue Aug 24 16:11:11 2021 +0800

    UefiCpuPkg/PiSmmCpuDxeSmm: Update mPatchCetSupported set condition
    
    REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3584
    
    Function AsmCpuid should first check the value for Basic CPUID Information.
    The fix is to update the mPatchCetSupported judgment statement.
    
    Signed-off-by: Wenxing Hou <wenxing.hou@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Eric Dong   <eric.dong@intel.com>
    Cc: Ray Ni      <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Sheng W     <w.sheng@intel.com>
    Cc: Yao Jiewen  <jiewen.yao@intel.com>

commit f0fe55bca4651734abf1752a1d7c69fb5bee00b9
Author: duntan <dun.tan@intel.com>
Date:   Fri Aug 20 13:04:29 2021 +0800

    UefiPayloadPkg: Fix the build error when enable Core ci for UefiPayloadPkg
    
    V1: Add quotes when using $(ARCH) in .dsc and .fdf file.
    The quotes are added due to the way by which Core ci parse the .dsc file.
    Add UINTN in Hob.c to fix cast from pointer to integer of different size error.
    V2: Delete lines which reference ShellBinPkg.The pkg doesn't exist in edk2.
    
    Cc: Guo Dong <guo.dong@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Maurice Ma <maurice.ma@intel.com>
    Cc: Benjamin You <benjamin.you@intel.com>
    Signed-off-by: DunTan <dun.tan@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>

commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
Date:   Tue Aug 31 09:29:48 2021 +0800

    OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
    
    Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
    the kernel, initrd, and kernel command line from QEMU's fw_cfg.
    
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
    Signed-off-by: Gary Lin <gary.lin@hpe.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Jim Fehlig <jfehlig@suse.com>

commit 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
Date:   Tue Aug 31 09:31:15 2021 +0800

    OvmfPkg/SmmControl2Dxe: use PcdAcpiS3Enable to detect S3 support
    
    To avoid the potential inconsistency between PcdAcpiS3Enable and
    QemuFwCfgS3Enabled(), this commit modifies SmmControl2Dxe to detect
    S3 support by PcdAcpiS3Enable as modules in MdeModulePkg do.
    
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3573
    Signed-off-by: Gary Lin <gary.lin@hpe.com>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>
    Tested-by: Jim Fehlig <jfehlig@suse.com>

commit 52e2dabc0f8d3af09c213072ce8ba734302f585d
Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
Date:   Tue Aug 31 09:31:14 2021 +0800

    OvmfPkg/PlatformBootManagerLib: use PcdAcpiS3Enable to detect S3 support
    
    To avoid the potential inconsistency between PcdAcpiS3Enable and
    QemuFwCfgS3Enabled(), this commit modifies PlatformBootManagerLib to
    detect S3 support by PcdAcpiS3Enable as modules in MdeModulePkg do.
    
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3573
    Signed-off-by: Gary Lin <gary.lin@hpe.com>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>
    Tested-by: Jim Fehlig <jfehlig@suse.com>

commit 28152333bccb778b62e6e97446b28bfa0e92ef82
Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
Date:   Tue Aug 31 09:31:13 2021 +0800

    OvmfPkg/LockBoxLib: use PcdAcpiS3Enable to detect S3 support
    
    To avoid the potential inconsistency between PcdAcpiS3Enable and
    QemuFwCfgS3Enabled(), this commit modifies LockBoxLib to detect
    S3 support by PcdAcpiS3Enable as modules in MdeModulePkg do.
    
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3573
    Signed-off-by: Gary Lin <gary.lin@hpe.com>
    Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>
    Tested-by: Jim Fehlig <jfehlig@suse.com>

commit cb0d24637dfdd869618b9635dfb8e3b0746393a6
Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
Date:   Tue Aug 31 09:31:12 2021 +0800

    OvmfPkg/OvmfXen: set PcdAcpiS3Enable at initialization
    
    There are several functions in OvmfPkg/Library using
    QemuFwCfgS3Enabled() to detect the S3 support status. However, in
    MdeModulePkg, PcdAcpiS3Enable is used to check S3 support. Since
    InitializeXenPlatform() didn't set PcdAcpiS3Enable as
    InitializePlatform() did, this made the inconsistency between
    drivers/functions.
    
    For example, S3SaveStateDxe checked PcdAcpiS3Enable and skipped
    S3BootScript because the default value is FALSE. On the other hand,
    PlatformBootManagerBeforeConsole() from OvmfPkg/Library called
    QemuFwCfgS3Enabled() and found it returned TRUE, so it invoked
    SaveS3BootScript(). However, S3SaveStateDxe skipped S3BootScript, so
    SaveS3BootScript() asserted due to EFI_NOT_FOUND.
    
    This issue mainly affects "HVM Direct Kernel Boot". When used,
    "fw_cfg" is enabled in QEMU and QemuFwCfgS3Enabled() returns true in
    that case.
    
    Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3573
    Signed-off-by: Gary Lin <gary.lin@hpe.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>
    Tested-by: Jim Fehlig <jfehlig@suse.com>

