Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EB58D51B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 10:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382812.617851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKF2-0003py-AQ; Tue, 09 Aug 2022 08:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382812.617851; Tue, 09 Aug 2022 08:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKF2-0003mX-7H; Tue, 09 Aug 2022 08:05:32 +0000
Received: by outflank-mailman (input) for mailman id 382812;
 Tue, 09 Aug 2022 08:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLKF1-0003mN-6g; Tue, 09 Aug 2022 08:05:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLKF1-0001mX-1T; Tue, 09 Aug 2022 08:05:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLKF0-00015m-NY; Tue, 09 Aug 2022 08:05:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oLKF0-0003uH-N6; Tue, 09 Aug 2022 08:05:30 +0000
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
	bh=ds+xXx2ko5Wbq8ELx9fOwGPaW/dURJ40nG59Wkw+s30=; b=ladq7dhH344Iht7U2IzGVB5xAx
	BxA6Jf9B0i1FShXVOupAT9zt/zxW1522K+Qh3m7rJtuasKwnW+XOj70Br4dAnWsfs96H27tc3FxQp
	B0hyD9KWV4qgRJw/CksGmWseN6OWRtuS3kB8+hmgV3PyAnWcP7wNoIepeUkArs+CmMdc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172320: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=f1688ec9dab680ad8a56ec0a3d0b1346933d7e07
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Aug 2022 08:05:30 +0000

flight 172320 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172320/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 f1688ec9dab680ad8a56ec0a3d0b1346933d7e07
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z    5 days
Failing since        172151  2022-08-05 02:40:28 Z    4 days   41 attempts
Testing same since   172320  2022-08-09 06:10:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Jose Marinho <jose.marinho@arm.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
commit f1688ec9dab680ad8a56ec0a3d0b1346933d7e07
Author: Liu, Zhiguang <Zhiguang.Liu@intel.com>
Date:   Tue Aug 9 09:25:37 2022 +0800

    UefiCpuPkg: Simplify the struct definition of CPU_EXCEPTION_INIT_DATA
    
    CPU_EXCEPTION_INIT_DATA is now an internal implementation of
    CpuExceptionHandlerLib. Union can be removed since Ia32 and X64 have the
    same definition. Also, two fields (Revision and InitDefaultHandlers)are
    useless, can be removed.
    
    Cc: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Signed-off-by: Zhiguang Liu <zhiguang.liu@intel.com>

commit 9a24c3546ebeb58ae72a21e0ad353980ce906931
Author: Liu, Zhiguang <Zhiguang.Liu@intel.com>
Date:   Tue Aug 9 09:25:36 2022 +0800

    MdeModulePkg: Move CPU_EXCEPTION_INIT_DATA to UefiCpuPkg
    
    Since the API InitializeSeparateExceptionStacks is simplified and does't
    use the struct CPU_EXCEPTION_INIT_DATA, CPU_EXCEPTION_INIT_DATA become
    a inner implementation of CpuExcetionHandlerLib.
    
    Cc: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Leif Lindholm <quic_llindhol@quicinc.com>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Signed-off-by: Zhiguang Liu <zhiguang.liu@intel.com>

commit 0f7bccf584d93b2642c0a413a47fc821d1f5dbfd
Author: Liu, Zhiguang <Zhiguang.Liu@intel.com>
Date:   Tue Aug 9 09:25:35 2022 +0800

    UefiCpuPkg: Simplify InitializeSeparateExceptionStacks
    
    Hide the Exception implementation details in CpuExcetionHandlerLib and
    caller only need to provide buffer
    
    Cc: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Leif Lindholm <quic_llindhol@quicinc.com>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
    Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>
    Signed-off-by: Zhiguang Liu <zhiguang.liu@intel.com>

commit 1da2012d938f141821740324e2dceee1b4cfa76d
Author: Jose Marinho <jose.marinho@arm.com>
Date:   Tue Jul 26 17:54:42 2022 +0100

    PrmPkg: Add details on AArch64 build to the Readme.
    
    Specify how to build the PrmPkg for the AArch64 architecture.
    Make the 2 following notes:
     - the PrmPkg has only been tested on AArch64 using the GCC5
    toolchain.
     - All symbols to be listed in the PRMT as well as the
    PrmModuleExportDescriptor must be explicitly preserved by resorting to
    the --require-defined linker flag.
    
    Signed-off-by: Jose Marinho <jose.marinho@arm.com>
    Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

commit 57faeb782a505935363936ab2edce282d3afc4d5
Author: Jose Marinho <jose.marinho@arm.com>
Date:   Fri Dec 18 14:01:55 2020 +0000

    PrmPkg: Support AArch64 builds using GCC
    
    Add support to build PrmPkg for AArch64 using the GCC compiler.
    
    Add AARCH64 architecture to the list of supported architectures.
    Add BaseStackCheck library to allow for Prm module builds on AARCH64.
    
    Also update the CI to add dependency on ArmPkg.
    
    Signed-off-by: Jose Marinho <jose.marinho@arm.com>
    Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

commit 21200d9fe6d5b8078b93dbddfbcdf536308b67e4
Author: Jose Marinho <jose.marinho@arm.com>
Date:   Tue Apr 5 18:57:23 2022 +0100

    PrmPkg: Build Prm Samples with GCC for AARCH64
    
    - Add the --prm flag to the GENFW_FLAGS
    - Add the --no-gc-section to the linker flags so that apparently
    unreferenced symbols are not prematurely removed from the .dll which
    is used to generate the Prm module .efi.
    - Force the linker to maintain the PrmModuleExportDescriptor symbol.
    - Force the linker to maintain the PRM handler funtion's symbol.
    
    Signed-off-by: Jose Marinho <jose.marinho@arm.com>
    Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

commit 9f197e44b102a8d7d457d2cb4f54967681c858a9
Author: Jose Marinho <jose.marinho@arm.com>
Date:   Tue Apr 5 18:53:25 2022 +0100

    PrmPkg: Enable external visibility on PRM symbols
    
    Enable GCC compilations to keep external symbols when generating a PRM
    module.
    
    Signed-off-by: Jose Marinho <jose.marinho@arm.com>
    Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

commit 1ee162281710650d444c554f9fdbbd404abd9677
Author: Jose Marinho <jose.marinho@arm.com>
Date:   Fri Oct 29 17:48:26 2021 +0100

    Basetools/GenFw: Allow AARCH64 builds to use the --prm flag
    
    The GenFw invocation with the --prm flag was previously reserved for
    X64.
    AArch64 platforms, built with GCC5, can also deploy PRM modules, hence
    the --prm flag is also applicable in builds targeting the AARCH64
    architecture.
    
    This commit enables the --prm flag to be used for EDK2 builds targeting
    AARCH64.
    
    Signed-off-by: Jose Marinho <jose.marinho@arm.com>
    Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
    Reviewed-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

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

