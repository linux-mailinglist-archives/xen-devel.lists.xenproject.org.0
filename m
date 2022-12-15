Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C234E64D511
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 02:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462856.721038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5dJC-0002Zw-Ln; Thu, 15 Dec 2022 01:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462856.721038; Thu, 15 Dec 2022 01:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5dJC-0002XP-Il; Thu, 15 Dec 2022 01:45:14 +0000
Received: by outflank-mailman (input) for mailman id 462856;
 Thu, 15 Dec 2022 01:45:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5dJB-0002XD-UE; Thu, 15 Dec 2022 01:45:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5dJB-0001vb-QI; Thu, 15 Dec 2022 01:45:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5dJB-00040G-I3; Thu, 15 Dec 2022 01:45:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5dJB-0003vn-Hd; Thu, 15 Dec 2022 01:45:13 +0000
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
	bh=4yrAbr/uXSVhGYKYw3SuUbYt6Itx+efipgpnJDN/K28=; b=5JdbD7lKsf8YWplNMoBcme5tyP
	pKe4zaVy+f2iwmU1qWI9JvtNL/f/yhWsfjZXosLJ7HWXlQm8GMbnnlBH8n022hYNdLYpMeJgpq7im
	SFGQXUq6UwYi1MPBo5x0FZJBbj0ZXNV2zWEuBc2OsNeaGatVvgGCYujlqypsrmwV6lvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175225-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175225: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=cda98df16228970dcf9a4ce2af5368219711b4b0
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 01:45:13 +0000

flight 175225 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175225/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202

version targeted for testing:
 ovmf                 cda98df16228970dcf9a4ce2af5368219711b4b0
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    0 days
Testing same since   175214  2022-12-14 18:42:16 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jeff Brasen <jbrasen@nvidia.com>
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

