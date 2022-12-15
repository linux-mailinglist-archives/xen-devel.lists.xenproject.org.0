Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C60864D850
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 10:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463220.721370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5kH0-00029x-KT; Thu, 15 Dec 2022 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463220.721370; Thu, 15 Dec 2022 09:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5kH0-00027F-HY; Thu, 15 Dec 2022 09:11:26 +0000
Received: by outflank-mailman (input) for mailman id 463220;
 Thu, 15 Dec 2022 09:11:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5kGz-000271-8N; Thu, 15 Dec 2022 09:11:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5kGz-0005YD-5i; Thu, 15 Dec 2022 09:11:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5kGy-0000oj-VX; Thu, 15 Dec 2022 09:11:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5kGy-0006vq-V8; Thu, 15 Dec 2022 09:11:24 +0000
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
	bh=ZK7/kOQkjZZjhIxOlHQJ9Q+lxnTLX4eOirnYQRzBoeY=; b=ftJVMkWxbkFM8iK8RmudRQZwHZ
	dBw7CIvYKQjq98N08IUlX6WbZOejMea7Ia2kO74ZfjpuERQNXiOXyKR1tQ7P7ms4gqrudyxywBn+w
	nlzlvE87AkoippZioLzaMQ4pAZZa0SCfodmhu/hVhHzSuCff7ynCQQa0MyRKk1zRPQMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175257-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175257: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 09:11:24 +0000

flight 175257 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175257/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202

version targeted for testing:
 ovmf                 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    0 days
Failing since        175214  2022-12-14 18:42:16 Z    0 days    6 attempts
Testing same since   175244  2022-12-15 04:18:39 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  devel@edk2.groups.io <devel@edk2.groups.io>
  Gerd Hoffmann <kraxel@redhat.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Jeshua Smith <jeshuas@nvidia.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
commit 01c0d3c0d508b8c1b41fd58e2ec565b40ea000ca
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Dec 14 15:14:19 2022 +0800

    OvmfPkg/SecTpmMeasurementLib: Fix the mapping error of PCR and RTMR index
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4179
    
    TDVF has the feature to do RTMR measurement in SEC phase. In the same time
    it builds a GUID hob which carries the hash value of the measurement so
    that in DXE phase a td event can be created based on this GUID Hob. There
    is a mapping error between TPM PCR index and RTMR index according to UEFI
    2.10. That PCR6 is missing in the mapping. This patch fixes this issue.
    
    Cc: Erdem Aktas <erdemaktas@google.com> [ruleof2]
    Cc: James Bottomley <jejb@linux.ibm.com> [jejb]
    Cc: Jiewen Yao <jiewen.yao@intel.com> [jyao1]
    Cc: Tom Lendacky <thomas.lendacky@amd.com> [tlendacky]
    Cc: Arti Gupta <ARGU@microsoft.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit fb91d6cbd0cff704586c4cadbef870acef9c52ef
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Dec 14 15:14:18 2022 +0800

    OvmfPkg/TdTcg2Dxe: Fix the mapping error between PCR index and MR index
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4179
    
    According to UEFI Spec 2.10 it is supposed to return the mapping from PCR
    index to CC MR index:
    //
    // In the current version, we use the below mapping for TDX:
    //
    // TPM PCR Index | CC Measurement Register Index | TDX-measurement register
    // -----------------------------------------------------------------------
    // 0             |   0                           |   MRTD
    // 1, 7          |   1                           |   RTMR[0]
    // 2~6           |   2                           |   RTMR[1]
    // 8~15          |   3                           |   RTMR[2]
    
    In the current implementation TdMapPcrToMrIndex returns the index of RTMR,
    not the MR index.
    
    After fix the spec unconsistent, other related codes are updated
    accordingly.
    1) The index of event log uses the input MrIndex.
    2) MrIndex is decreated by 1 before it is sent for RTMR extending.
    
    Cc: Erdem Aktas <erdemaktas@google.com> [ruleof2]
    Cc: James Bottomley <jejb@linux.ibm.com> [jejb]
    Cc: Jiewen Yao <jiewen.yao@intel.com> [jyao1]
    Cc: Tom Lendacky <thomas.lendacky@amd.com> [tlendacky]
    Cc: Arti Gupta <ARGU@microsoft.com>
    Reported-by: Arti Gupta <ARGU@microsoft.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 19f7c63ea978c5a4ef9345b9bf4995dcd48fa328
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Dec 14 15:14:17 2022 +0800

    OvmfPkg/TdTcg2Dxe: Fix incorrect protocol and structure version
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4184
    
    According to the Uefi spec 2.10 Section 38.2.2.
    EFI_CC_MEASUREMENT_PROTOCOL.GetCapability, the minor version of
    StructureVersion and ProtocolVersion should be 0.
    
    Cc: Erdem Aktas <erdemaktas@google.com> [ruleof2]
    Cc: James Bottomley <jejb@linux.ibm.com> [jejb]
    Cc: Jiewen Yao <jiewen.yao@intel.com> [jyao1]
    Cc: Tom Lendacky <thomas.lendacky@amd.com> [tlendacky]
    Cc: Arti Gupta <ARGU@microsoft.com>
    Reported-by: Arti Gupta <ARGU@microsoft.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 44fc90eb0ea7299abc79577db55aa6257b46b7ae
Author: devel@edk2.groups.io <devel@edk2.groups.io>
Date:   Wed Nov 30 15:02:15 2022 -0800

    UnitTestFrameworkPkg/UnitTestLib: Print expected Status on ASSERT fail
    
    Update the UnitTestAssertStatusEqual error message to print out the
    expected value in addition to the seen value.
    
    Signed-off-by: Jeshua Smith <jeshuas@nvidia.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Michael D Kinney <michael.d.kinney@intel.com>

commit cda98df16228970dcf9a4ce2af5368219711b4b0
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:09 2022 +0100

    OvmfPkg/QemuFwCfgLib: remove mQemuFwCfgSupported + mQemuFwCfgDmaSupported
    
    Remove global variables, store the state in PlatformInfoHob instead.
    Probing for fw_cfg happens on first use, at library initialization
    time the Hob might not be present yet.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 81bbc1452c972218f071cd4a8f5899df974b1dae
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:08 2022 +0100

    OvmfPkg/QemuFwCfgLib: rewrite fw_cfg probe
    
    Move the code to a new QemuFwCfgProbe() function.  Use direct Io*() calls
    instead of indirect QemuFwCfg*() calls to make sure we don't get
    recursive calls.  Also simplify CC guest detection.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit e59747bd8246135faeecc18879d62db66a6acfc2
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:07 2022 +0100

    OvmfPkg/DebugLibIoPort: use Rom version for PEI
    
    This variant does not use global variables.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit f6a196c7eb34affff0cfe1864e126953096885e1
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:06 2022 +0100

    OvmfPkg/PlatformPei: remove mFeatureControlValue
    
    Use PlatformInfoHob->FeatureControlValue instead.
    OnMpServicesAvailable() will find PlatformInfoHob using
    GetFirstGuidHob() and pass a pointer to the WriteFeatureControl
    callback.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 862614e2544997c848fab7388733774ae0ea92d8
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:05 2022 +0100

    OvmfPkg/PlatformPei: remove mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable.  Let
    BuildPlatformInfoHob() allocate and return PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 4bc2c748516e5c4a8bb86093cd5e1b80a9f35c0f
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:04 2022 +0100

    OvmfPkg/PlatformPei: Verification: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in S3Verification() and
    Q35BoardVerification() functions.  Pass a pointer to the PlatformInfoHob
    instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 7dbb8a24d1a3403f85d959bc1234b9f4a92bfbf0
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:03 2022 +0100

    OvmfPkg/PlatformPei: NoExec: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in NoexecDxeInitialization()
    function.  Pass a pointer to the PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit cc6efda7770b8cabea3ae8c6054d47c4a8e229c3
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:02 2022 +0100

    OvmfPkg/PlatformPei: MemTypeInfo: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in MemTypeInfoInitialization()
    function.  Pass a pointer to the PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 27874a382c38a95d3ab613eebd35c152ca9b3897
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:01 2022 +0100

    OvmfPkg/PlatformPei: PeiMemory: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in PublishPeiMemory()
    and GetPeiMemoryCap() functions.  Pass a pointer to the PlatformInfoHob
    instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 00743d144bc5b643e9323ad66f16cb48cf338705
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:10:00 2022 +0100

    OvmfPkg/PlatformPei Q35 SMM helpers: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in
    Q35TsegMbytesInitialization() and
    Q35SmramAtDefaultSmbaseInitialization() ) functions.
    Pass a pointer to the PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 9d9d15b42a5e13bb18729da0f608c629aa274e80
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:09:59 2022 +0100

    OvmfPkg/PlatformPei: PeiFv: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in PeiFvInitialization()
    function.  Pass a pointer to the PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 78c373f2a5273af00b23b55d3e8c41583310cfb6
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Dec 2 14:09:58 2022 +0100

    OvmfPkg/PlatformPei: AmdSev: stop using mPlatformInfoHob
    
    Stop using the mPlatformInfoHob global variable in AmdSevInitialize()
    and AmdSevEsInitialize() functions.  Pass a pointer to the
    PlatformInfoHob instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Tested-by: Tom Lendacky <thomas.lendacky@amd.com>
    Acked-by: Ard Biesheuvel <ardb@kernel.org>

commit 916825b84f23b691dcce09a57625fb8fcb0cbb48
Author: Jeff Brasen <jbrasen@nvidia.com>
Date:   Tue Nov 15 11:01:06 2022 -0700

    DynamicTablesPkg: SSDT _LPI revision is incorrect
    
    _LPI Revision should be 0 per the ACPI 6.5 specification.
    "The revision number of the _LPI object. Current revision is 0."
    
    Signed-off-by: Jeff Brasen <jbrasen@nvidia.com>
    Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
    Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>

