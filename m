Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17966B0D0
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477928.740871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1TL-0003i4-HT; Sun, 15 Jan 2023 11:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477928.740871; Sun, 15 Jan 2023 11:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1TL-0003gB-Eb; Sun, 15 Jan 2023 11:46:47 +0000
Received: by outflank-mailman (input) for mailman id 477928;
 Sun, 15 Jan 2023 11:46:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pH1TK-0003g1-86; Sun, 15 Jan 2023 11:46:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pH1TK-0003M0-58; Sun, 15 Jan 2023 11:46:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pH1TJ-0004Rb-TB; Sun, 15 Jan 2023 11:46:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pH1TJ-0003lh-Si; Sun, 15 Jan 2023 11:46:45 +0000
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
	bh=OqEIzWYU0lDHvvDqwWjKBBSaX5ZUh+PkDv3qcPI7kcs=; b=NVrwGJUK5PRZWEKeV/zZiPY7Vg
	e+PbwDbnfV42DoGGqaXV/M3rpzG1Kn6PAWhKBLltkQsHGs0rsABNcjmBTQliEu8LT7gFrjXeztf1w
	72ANrsZobNPzRET4BwcpuNt9FCXOcqg+25fEiq/21zTA4UunXIu6FJxcmz2NeGlBOrBI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175872-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175872: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=7cd55f300915af8759bdf1687af7e3a7f4d4f13c
X-Osstest-Versions-That:
    ovmf=9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Jan 2023 11:46:45 +0000

flight 175872 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175872/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 175747
 build-i386                    6 xen-build                fail REGR. vs. 175747
 build-amd64                   6 xen-build                fail REGR. vs. 175747
 build-i386-xsm                6 xen-build                fail REGR. vs. 175747

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 7cd55f300915af8759bdf1687af7e3a7f4d4f13c
baseline version:
 ovmf                 9d70d8f20d0feee1d232cbf86fc87147ce92c2cb

Last test of basis   175747  2023-01-12 16:10:44 Z    2 days
Failing since        175860  2023-01-15 07:11:07 Z    0 days    8 attempts
Testing same since   175871  2023-01-15 10:40:40 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
commit 7cd55f300915af8759bdf1687af7e3a7f4d4f13c
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:35 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Return error if installing NotifyProtocol failed
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    Installation of gQemuAcpiTableNotifyProtocol may fail. The error code
    should be returned so that the caller can handle it.
    
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-7-min.m.xu@intel.com>
    Reviewed-by: Sebastien Boeuf <sebastien.boeuf@intel.com>

commit 66f18fde49c7fe65818db0801cdaf63015e875e5
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:34 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Refactor QemuAcpiTableNotifyProtocol
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    Commit 9fdc70af6ba8 install the QemuAcpiTableNotifyProtocol at a
    wrong positioin. It should be called before TransferS3ContextToBootScript
    because TransferS3ContextToBootScript is the last operation in
    InstallQemuFwCfgTables(). Another error is that we should check the
    returned value after installing the QemuAcpiTableNotifyProtocol.
    
    This patch refactors the installation and error handling of
    QemuAcpiTableNotifyProtocol in InstallQemuFwCfgTables ().
    
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-6-min.m.xu@intel.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>

commit 2ef0ff39e53d2d2af3859b783882eea6f0beda64
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:33 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Add log to show the installed tables
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    Commit 9fdc70af6ba8 wrongly removed the log from InstallQemuFwCfgTables
    after ACPI tables are successfully installed. This patch add the log
    back after all operations succeed.
    
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-5-min.m.xu@intel.com>

commit 165f1e49361a9a5f5936f2d582641096d0d7a2a2
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:32 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Use local variable in QemuFwCfgAcpi.c
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    The handle of mQemuAcpiHandle is not needed for anything, beyond the
    scope of the InstallQemuFwCfgTables(). So a local variable will
    suffice for storing the handle.
    
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-4-min.m.xu@intel.com>

commit f81273f7fbb3defbef43313ada8397bbc202a1d0
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:31 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Use local variable in CloudHvAcpi.c
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    The handle of mChAcpiHandle is not needed for anything, beyond the
    scope of the InstallCloudHvTablesTdx (). A local variable (ChAcpiHandle)
    suffices for storing the handle.
    
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-3-min.m.xu@intel.com>
    Reviewed-by: Sebastien Boeuf <sebastien.boeuf@intel.com>

commit 43b3ca6b7f626c6dcdc1a347ad8a42d8cf9ea575
Author: Min M Xu <min.m.xu@intel.com>
Date:   Wed Jan 11 09:22:30 2023 +0800

    OvmfPkg/AcpiPlatformDxe: Remove QEMU_ACPI_TABLE_NOTIFY_PROTOCOL
    
    BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=4237
    
    The QEMU_ACPI_TABLE_NOTIFY_PROTOCOL structure is superfluous because NULL
    protocol interfaces have been used in edk2 repeatedly. A protocol instance
    can exist in the protocol database with a NULL associated interface.
    Therefore the QEMU_ACPI_TABLE_NOTIFY_PROTOCOL type, the
    "QemuAcpiTableNotify.h" header, and the "mAcpiNotifyProtocol" global
    variable can be removed.
    
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
    Reported-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Min Xu <min.m.xu@intel.com>
    Message-Id: <20230111012235.189-2-min.m.xu@intel.com>
    Reviewed-by: Sebastien Boeuf <sebastien.boeuf@intel.com>

commit ba08910df1071bf5ade987529d9becb38d14a14a
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Jan 12 23:41:02 2023 +0800

    OvmfPkg: fix OvmfTpmSecurityStub.dsc.inc include
    
    TPM support is independent from secure boot support.  Move the TPM
    include snipped out of the secure boot !if block.
    
    Fixes: b47575801e19 ("OvmfPkg: move tcg configuration to dsc and fdf include files")
    Bugzilla: https://bugzilla.tianocore.org//show_bug.cgi?id=4290
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

