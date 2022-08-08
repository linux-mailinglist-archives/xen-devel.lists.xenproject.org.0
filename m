Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A158C20D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 05:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382228.617128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKtSz-0003VD-PI; Mon, 08 Aug 2022 03:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382228.617128; Mon, 08 Aug 2022 03:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKtSz-0003Sv-MN; Mon, 08 Aug 2022 03:30:09 +0000
Received: by outflank-mailman (input) for mailman id 382228;
 Mon, 08 Aug 2022 03:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKtSy-0003Sl-KO; Mon, 08 Aug 2022 03:30:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKtSy-0006F7-Go; Mon, 08 Aug 2022 03:30:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oKtSy-0003cP-4J; Mon, 08 Aug 2022 03:30:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oKtSy-0008L8-3o; Mon, 08 Aug 2022 03:30:08 +0000
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
	bh=JbOlVDb+lsqs8r1wdVMTHfya7zMD76kOdKfxgn+pj4s=; b=B2gRHqB0vQLARR7q76NXn03ntH
	ADYDxYLzdF3F/TQGYw9y3rCmjv4yFUiCBYuCDadh3qWMW7ihUXcuwGTD2eWGPO68m/NAgViAi2I+h
	DZHqkn2mzHPWB9TQuCoupsKVY1JaduHufI2qw4hBlS0cQqHidolsy7JP/3rcGVfklRf0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172286: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=cf02322c984a16fc2af252124df96564e574f3a7
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Aug 2022 03:30:08 +0000

flight 172286 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172286/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 cf02322c984a16fc2af252124df96564e574f3a7
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z    3 days
Failing since        172151  2022-08-05 02:40:28 Z    3 days   28 attempts
Testing same since   172247  2022-08-06 15:41:48 Z    1 days   14 attempts

------------------------------------------------------------
People who touched revisions under test:
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-i386-libvirt                                           fail    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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
commit cf02322c984a16fc2af252124df96564e574f3a7
Author: Konstantin Aladyshev <aladyshev22@gmail.com>
Date:   Wed Jul 20 22:08:12 2022 +0800

    BaseTools/GenSec: Support EFI_SECTION_FREEFORM_SUBTYPE_GUID sections
    
    Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>

commit d241a09afbe4f472a5d7da5090dfc85046f2250f
Author: Konstantin Aladyshev <aladyshev22@gmail.com>
Date:   Wed Jul 20 20:00:39 2022 +0800

    BaseTools/VolInfo: Parse EFI_SECTION_FREEFORM_SUBTYPE_GUID header
    
    Print 'SubtypeGuid' field from the EFI_FREEFORM_SUBTYPE_GUID_SECTION
    structure.
    This value describes the raw data inside the section.
    
    Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
    Reviewed-by: Bob Feng<bob.c.feng@intel.com>

commit f5f8c08db92d15c7a359a5eb3b0cc2545c945942
Author: Konstantin Aladyshev <aladyshev22@gmail.com>
Date:   Tue Jul 19 23:45:52 2022 +0800

    BaseTools/VolInfo: Show FV section boundaries
    
    Currently there is no labels for start and end of the
    EFI_SECTION_FIRMWARE_VOLUME_IMAGE type section. Therefore it is not
    possible to see where the FV section ends and another section starts.
    Add labels for start and end of the FV sections to fix the issue.
    
    Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>

commit a0a03b51548e6fc7524b5aa9f8042cbabce6da1c
Author: Konstantin Aladyshev <aladyshev22@gmail.com>
Date:   Tue Jul 19 22:27:10 2022 +0800

    BaseTools/GenSec: Fix typo
    
    Fix typo in the help message.
    
    Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>

commit 3e599bbc105ff089b21b6024100d585a8c781328
Author: Edward Pickup <edward.pickup@arm.com>
Date:   Thu Aug 4 10:20:50 2022 +0100

    DynamicTablesPkg: Fix using RmrNodeCount unitlitialised
    
    Fix using RmrNodeCount uninitliased by initliasing it to zero. Also, add
    an additional check for ACPI version. This fixes a crash running on
    kvmtool.
    
    Signed-off-by: Edward Pickup <edward.pickup@arm.com>
    Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>

commit a8f59e2eb44199040d2e1f747a6d950a25ed0984
Author: Czajkowski, Maciej <maciej.czajkowski@intel.com>
Date:   Tue Aug 2 01:00:09 2022 +0800

    MdeModulePkg/AhciPei: Use PCI_DEVICE_PPI to manage AHCI device
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3907
    
    This change modifies AhciPei library to allow usage both EDKII_PCI_DEVICE_PPI
    and EDKII_PEI_ATA_AHCI_HOST_CONTROLLER_PPI to manage ATA HDD working under
    AHCI mode.
    
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Signed-off-by: Maciej Czajkowski <maciej.czajkowski@intel.com>
    Reviewed-by: Hao A Wu <hao.a.wu@intel.com>

commit 86757f0b4750f672f346d955f89e5b76430ba6b4
Author: Czajkowski, Maciej <maciej.czajkowski@intel.com>
Date:   Tue Aug 2 01:00:08 2022 +0800

    MdeModulePkg: Add EDKII_PCI_DEVICE_PPI definition
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3907
    
    This commit introduces EDKII_PCI_DEVICE_PPI. The purpose of this PPI is
    to provide a way of accessing PCI devices to drvice drivers such as
    NvmExpressPei or AhciPei.
    
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Signed-off-by: Maciej Czajkowski <maciej.czajkowski@intel.com>
    Reviewed-by: Hao A Wu <hao.a.wu@intel.com>

