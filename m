Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECB5E7CC7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410788.653941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objYb-0002Nz-3m; Fri, 23 Sep 2022 14:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410788.653941; Fri, 23 Sep 2022 14:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objYb-0002L3-14; Fri, 23 Sep 2022 14:21:33 +0000
Received: by outflank-mailman (input) for mailman id 410788;
 Fri, 23 Sep 2022 14:21:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1objYa-0002Kt-6t; Fri, 23 Sep 2022 14:21:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1objYa-0003oB-3X; Fri, 23 Sep 2022 14:21:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1objYZ-0006rb-M5; Fri, 23 Sep 2022 14:21:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1objYZ-0003kj-Ld; Fri, 23 Sep 2022 14:21:31 +0000
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
	bh=DJMf4QnlggaMcIr2aCwfGXtt4tiXUsljlbHjoiNoBHY=; b=bzXA2zHy4qz9gpPX0fi63SHb1J
	VwDQ33JZi7xSArW6k7Yc8AQNEaViYdqXv9XrVAo8yq4eWeo9cB4Rx/zjASZQRlkxdybaEqjlNXbmf
	JPFig/dcIygM2VbWx18fuDNq6P9RR9mR4CWAdsZh48WkQjfZt/TooTV9/yFJTYkJiJJQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173290-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173290: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
X-Osstest-Versions-This:
    ovmf=a8e8c43a0ef25af133dc5ef1021befd897f71b12
X-Osstest-Versions-That:
    ovmf=5f403cdc6a367d8aad70f25e4286cb3785f2a1a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 14:21:31 +0000

flight 173290 ovmf real [real]
flight 173291 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173290/
http://logs.test-lab.xenproject.org/osstest/logs/173291/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 173289

version targeted for testing:
 ovmf                 a8e8c43a0ef25af133dc5ef1021befd897f71b12
baseline version:
 ovmf                 5f403cdc6a367d8aad70f25e4286cb3785f2a1a2

Last test of basis   173289  2022-09-23 09:41:41 Z    0 days
Testing same since   173290  2022-09-23 12:13:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christopher Zurcher <christopher.zurcher@microsoft.com>
  Christopher Zurcher <zurcher@gmail.com>
  Yi Li <yi1.li@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
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
commit a8e8c43a0ef25af133dc5ef1021befd897f71b12
Author: Christopher Zurcher <zurcher@gmail.com>
Date:   Thu Sep 22 04:25:41 2022 +0800

    CryptoPkg/OpensslLib: Update generated files for native X64
    
    Cc: Yi Li <yi1.li@intel.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    Signed-off-by: Christopher Zurcher <christopher.zurcher@microsoft.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 4102950a21dc726239505b8f7b8e017b6e9175ec
Author: Christopher Zurcher <zurcher@gmail.com>
Date:   Thu Sep 22 04:25:40 2022 +0800

    CryptoPkg/OpensslLib: Commit the auto-generated assembly files for IA32
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3654
    
    Adding the auto-generated assembly files for IA32 architectures.
    
    Cc: Yi Li <yi1.li@intel.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    Signed-off-by: Christopher Zurcher <christopher.zurcher@microsoft.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 03f708090b9da25909935e556c351a4d9445fd3f
Author: Christopher Zurcher <zurcher@gmail.com>
Date:   Thu Sep 22 04:25:39 2022 +0800

    CryptoPkg/OpensslLib: Add native instruction support for IA32
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3654
    
    Adding native instruction support for accelerated OpenSSL features for
    IA32 architecture, following the pattern set by the previous commits for
    X64 native support.
    
    Cc: Yi Li <yi1.li@intel.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    Signed-off-by: Christopher Zurcher <christopher.zurcher@microsoft.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 0c9d4ad788e90b96b0dbe2bf7e2f8ee38c6ab4b5
Author: Yi Li <yi1.li@intel.com>
Date:   Thu May 12 17:10:16 2022 +0800

    CryptoPkg/Test: Add unit test for CryptoBn
    
    Add unit test for CryptoBn.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    Signed-off-by: Yi Li <yi1.li@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 42951543ddc56e98d413a73ecb57618f01ef20ec
Author: Yi Li <yi1.li@intel.com>
Date:   Wed Sep 7 16:14:35 2022 +0800

    CryptoPkg: Add BigNum API to DXE and protocol
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3828
    
    The implementation provides CryptBn library functions
    for EFI Driver and EFI BaseCrypt Protocol.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    
    Signed-off-by: Yi Li <yi1.li@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit fd0ad0c3469fbc6faca2d1c6ddb13dd5f10acd28
Author: Yi Li <yi1.li@intel.com>
Date:   Wed Sep 7 16:12:00 2022 +0800

    CryptoPkg: Add BigNum support
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3828
    
    This patch is used to add CryptBn library, which is wrapped
    over OpenSSL.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Xiaoyu Lu <xiaoyu1.lu@intel.com>
    Cc: Guomin Jiang <guomin.jiang@intel.com>
    Signed-off-by: Yi Li <yi1.li@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

