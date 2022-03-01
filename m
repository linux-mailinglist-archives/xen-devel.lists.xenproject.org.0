Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539BA4C8F75
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 16:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281657.480089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP4ow-0000Ca-DM; Tue, 01 Mar 2022 15:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281657.480089; Tue, 01 Mar 2022 15:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP4ow-00009p-96; Tue, 01 Mar 2022 15:53:50 +0000
Received: by outflank-mailman (input) for mailman id 281657;
 Tue, 01 Mar 2022 15:53:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nP4ou-00009e-Gc; Tue, 01 Mar 2022 15:53:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nP4ou-00027t-F5; Tue, 01 Mar 2022 15:53:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nP4ou-00022E-58; Tue, 01 Mar 2022 15:53:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nP4ou-0001UU-4i; Tue, 01 Mar 2022 15:53:48 +0000
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
	bh=6EwxkTfBkuPZ2/ybwh9V2xGYugdwgp2od9n/oIelTuk=; b=znWI2ZHvWK8DjRjMp5IWCm2BES
	jAS0lJyrLRRcauCwTAn3Ht1a2CKDcTcSpf01WpE+PdRctTc3IiS+X35aao8OwnL1QuRHapwW4oTxt
	tK8qnkoCiJv9jpC+yYiEObBFetrMvg7Ml7SgJRHkm8E2ejyZ+nZ+1SDnMMW4tMttaTO4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168295-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168295: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=497ac7b6d7f9750f48f137db244931a5728b1968
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 01 Mar 2022 15:53:48 +0000

flight 168295 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168295/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
 build-amd64                   6 xen-build                fail REGR. vs. 168254
 build-i386                    6 xen-build                fail REGR. vs. 168254
 build-i386-xsm                6 xen-build                fail REGR. vs. 168254

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 497ac7b6d7f9750f48f137db244931a5728b1968
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z    1 days
Failing since        168258  2022-03-01 01:55:31 Z    0 days    7 attempts
Testing same since   168262  2022-03-01 04:10:26 Z    0 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>

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
commit 497ac7b6d7f9750f48f137db244931a5728b1968
Author: Guomin Jiang <guomin.jiang@intel.com>
Date:   Sat Jan 29 16:28:02 2022 +0800

    UefiPayloadPkg/PayloadLoaderPeim: Use INT64 as input parameter
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3818
    
    It will have some potential issue when memory larger than 2G because
    the high memory address will be fill with 0xFFFFFFFF when do the
    operation of INTN + INT64 but it is 32 bit normal data in fact.
    
    Should use same data type INT64 + INT64.
    
    V3:
    1. Use INT64 as input parameter because all date type is 64 bit
    V2:
    1. Force the data type to UINTN to avoid high dword be filled with
    0xFFFFFFFF
    2. Keep INTN because the offset may postive or negative.
    
    Reviewed-by: Guo Dong <guo.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Signed-off-by: Guomin Jiang <guomin.jiang@intel.com>

commit 6a890db161cd6d378bec3499a1e774db3f5a27a7
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 22:30:29 2022 +0800

    BaseTools: Upgrade the version of NASM tool
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Upgrade the version of NASM tool to avoid compilation errors when
    compiling NASM code change.
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Cc: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Reviewed-by: Yuwei Chen <yuwei.chen@intel.com>

commit bbaa00dd01ed0df30e43a5a89fd2b0433d858b73
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 22:05:47 2022 +0800

    MdePkg: Remove the macro definitions regarding Opcode.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Remove the macro definitions regarding Opcode because new version of
    NASM tool(e.g. v2.15.05) supports the corresponding instructions.
    Note: This patch need to be merged after other NASM code change to avoid
    compilation errors.
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>

commit 2aa107c0aa2e1375651867c8df1b81ff64b67fce
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 22:01:18 2022 +0800

    UefiCpuPkg: Replace Opcode with the corresponding instructions.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Replace Opcode with the corresponding instructions.
    The code changes have been verified with CompareBuild.py tool, which
    can be used to compare the results of two different EDK II builds to
    determine if they generate the same binaries.
    (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Eric Dong <eric.dong@intel.com>
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>

commit 7bc8b1d9f412507d579f21ea9af56fced81e7827
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 21:52:52 2022 +0800

    SourceLevelDebugPkg: Replace Opcode with the corresponding instructions.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Replace Opcode with the corresponding instructions.
    The code changes have been verified with CompareBuild.py tool, which
    can be used to compare the results of two different EDK II builds to
    determine if they generate the same binaries.
    (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Reviewed-by: Hao A Wu <hao.a.wu@intel.com>

commit d3febfd9ade35dc552df6b3607c2b15d26b82867
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 21:46:27 2022 +0800

    MdePkg: Replace Opcode with the corresponding instructions.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Replace Opcode with the corresponding instructions.
    The code changes have been verified with CompareBuild.py tool, which
    can be used to compare the results of two different EDK II builds to
    determine if they generate the same binaries.
    (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>

commit 84338c0d498555f860a480693ee8647a1795fba3
Author: Jason <yun.lou@intel.com>
Date:   Mon Jan 10 21:04:09 2022 +0800

    MdeModulePkg: Replace Opcode with the corresponding instructions.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
    
    Replace Opcode with the corresponding instructions.
    The code changes have been verified with CompareBuild.py tool, which
    can be used to compare the results of two different EDK II builds to
    determine if they generate the same binaries.
    (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
    
    Signed-off-by: Jason Lou <yun.lou@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

