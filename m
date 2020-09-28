Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F327B6D9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 23:11:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN0Qp-0006Yy-1R; Mon, 28 Sep 2020 21:11:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rPw=DF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kN0Qn-0006YW-Gr
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 21:11:33 +0000
X-Inumbo-ID: 91b3fed0-42b4-428b-a37a-1d6c6a8da7ca
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91b3fed0-42b4-428b-a37a-1d6c6a8da7ca;
 Mon, 28 Sep 2020 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=g4MgO2VzSsIdsXnCyVnetwR9uqu4q9zvi/uSMPyMvQs=; b=t9nKAjEz6CNg1ZgCN5IXyF6V+c
 P3GlbsYqg8VHNntaDEhtPXNX1/fPN1bfRAaV26Ffv/qb413ewKXGjs+/RsIdnFaHDvAG51pzEoyDL
 08F/W69CUgj07VvTv0AaTPd2//jFrTfRnInms4mkXwVhAJig6YZVuUQc1e3jCew7jnwI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kN0Qg-0005Ud-Fd; Mon, 28 Sep 2020 21:11:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kN0Qg-00070V-4d; Mon, 28 Sep 2020 21:11:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kN0Qg-0004kV-41; Mon, 28 Sep 2020 21:11:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155005-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155005: regressions - FAIL
X-Osstest-Failures: ovmf:build-amd64-xsm:xen-build:fail:regression
X-Osstest-Versions-This: ovmf=1d058c3e86b079a2e207bb022fd7a97814c9a04f
X-Osstest-Versions-That: ovmf=dd5c7e3c5282b084daa5bbf0ec229cec699b2c17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Sep 2020 21:11:26 +0000
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

flight 155005 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155005/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 154633

version targeted for testing:
 ovmf                 1d058c3e86b079a2e207bb022fd7a97814c9a04f
baseline version:
 ovmf                 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17

Last test of basis   154633  2020-09-23 05:49:28 Z    5 days
Failing since        154753  2020-09-25 02:39:51 Z    3 days    3 attempts
Testing same since   154899  2020-09-26 12:23:59 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Liming Gao <gaoliming@byosoft.com.cn>
  Mingyue Liang <mingyuex.liang@intel.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
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
commit 1d058c3e86b079a2e207bb022fd7a97814c9a04f
Author: gaoliming <gaoliming@byosoft.com.cn>
Date:   Wed Sep 16 17:58:14 2020 +0800

    IntelFsp2Pkg GenCfgOpt.py: Initialize IncLines as empty list
    
    IncLines as empty list for the case when InputHeaderFile is not specified.
    
    Cc: Chasel Chiu <chasel.chiu@intel.com>
    Cc: Nate DeSimone <nathaniel.l.desimone@intel.com>
    Cc: Star Zeng <star.zeng@intel.com>
    Signed-off-by: Liming Gao <gaoliming@byosoft.com.cn>
    Reviewed-by: Chasel Chiu <chasel.chiu@intel.com>
    Reviewed-by: Star Zeng <star.zeng@intel.com>

commit d8be01079b3c7b554ac8126e97e73fba8894e519
Author: Bob Feng <bob.c.feng@intel.com>
Date:   Tue Sep 22 19:27:54 2020 +0800

    BaseTools: Set section alignment as zero if its type is Auto
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2881
    
    Currently, the build tool try to read the section alignment
    from efi file if the section alignment type is Auto.
    If there is no efi generated, the section alignment will
    be set to zero. This behavior causes the Makefile to be different
    between the full build and the incremental build.
    
    Since the Genffs can auto get the section alignment from
    efi file during Genffs procedure, the build tool can just set section
    alignment as zero. This change can make the autogen makefile
    consistent for the full build and the incremental build.
    
    Signed-off-by: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
    Reviewed-by: Yuwei Chen<yuwei.chen@intel.com>

commit 3a7a6761143a4840faea0bd84daada3ac0f1bd22
Author: Bob Feng <bob.c.feng@intel.com>
Date:   Wed Sep 23 20:36:58 2020 +0800

    BaseTools: Remove CanSkip calling for incremental build
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2978
    
    If a module add a new PCD, the pcd token number will be
    reassigned. The new Pcd token number should be updated
    to all module's autogen files. CanSkip can only detect a
    single module's change but not others. CanSkip block the
    pcd token number update in incremental build, so this
    patch is going to remove this call.
    
    Signed-off-by: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Reviewed-by: Yuwei Chen<yuwei.chen@intel.com>

commit 9641a7f975ff5a18f83a8c899626342e15409c48
Author: Mingyue Liang <mingyuex.liang@intel.com>
Date:   Wed Sep 23 18:57:32 2020 +0800

    BaseTools: Normalize case of pathname when evaluating Macros.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2880
    
    Currently, When doing the Incremental build, the directory
    macros extended to absolute path in output Makefile, which
    is inconsistent with the output of Clean build.
    
    When we do macro replacement, we can't replace macro due to
    inconsistent path case, which results in inconsistent display
    of incremental build and clean build in makefile.Therefore,
    the path is converted to achieve the correct macro replacement.
    
    Signed-off-by: Mingyue Liang <mingyuex.liang@intel.com>
    Cc: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>
    Reviewed-by: Yuwei Chen <yuwei.chen@intel.com>

commit a8c77eba374cc90860172b29a191bf47c735000b
Author: Bob Feng <bob.c.feng@intel.com>
Date:   Wed Sep 23 19:21:04 2020 +0800

    BaseTools: Clean the ffs folder before generating files in it
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2965
    
    The content in Guid.xref depends on the files under the corresponding
    ffs folder.(refer to the commit 5e9256cd7f54ffd6f1fd9837df92a911fcd2d7c2)
    To make Guid.xref update in the incremental build,
    clean the files under that ffs folder before generating files in it.
    
    Signed-off-by: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Reviewed-by: Yuwei Chen<yuwei.chen@intel.com>

commit aec99d9bc3f7459e457e3346b493e534ccbdee8a
Author: Mingyue Liang <mingyuex.liang@intel.com>
Date:   Wed Sep 23 18:52:26 2020 +0800

    BaseTools: Add included files to deps_target file.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2882
    
    After changing the name of the include source file,
    when doing incremental build, the previous source file
    is not covered in the. DEPs file, and a build error occurs.
    
    The root cause is that the build tools filter out some dependency
    files, which are listed in inf source section, from the deps_target file.
    Add those files back to deps_target file to resolve the above problem.
    
    Signed-off-by: Mingyue Liang <mingyuex.liang@intel.com>
    Cc: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>
    Reviewed-by: Yuwei Chen <yuwei.chen@intel.com>

