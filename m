Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B564148BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192687.343251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1H3-0006OM-NU; Wed, 22 Sep 2021 12:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192687.343251; Wed, 22 Sep 2021 12:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1H3-0006MR-Jp; Wed, 22 Sep 2021 12:22:53 +0000
Received: by outflank-mailman (input) for mailman id 192687;
 Wed, 22 Sep 2021 12:22:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT1H2-0006MH-B6; Wed, 22 Sep 2021 12:22:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT1H2-0006pe-3X; Wed, 22 Sep 2021 12:22:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT1H1-0005gI-S3; Wed, 22 Sep 2021 12:22:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mT1H1-0003Wu-RZ; Wed, 22 Sep 2021 12:22:51 +0000
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
	bh=jPq7BjzryaG9KaDKcyyzs6mSdE1f7vnoLGAtMPZffWE=; b=m4qK8U0xSoz4A+0qZPIf/k3RYz
	vqfkXcS8AYq5eO7Im6HKcrTquZb96biwgj2qG2rCP0nJ5rwNGlid/XmYjRkwMRdQ2O2QQi16x5JRy
	JPslxff7lHUZgyWfmh4oTDpZFctJTlIgEmk8h/OD3IBL/ivHkvf/RgRhsPlhB5WLlMd8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165151-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165151: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f334c5a41dc4702b1c767c6614025aa2f802f9a4
X-Osstest-Versions-That:
    ovmf=542cba73d21b7bcc1e3852a9d9843d5fffc2d173
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Sep 2021 12:22:51 +0000

flight 165151 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165151/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f334c5a41dc4702b1c767c6614025aa2f802f9a4
baseline version:
 ovmf                 542cba73d21b7bcc1e3852a9d9843d5fffc2d173

Last test of basis   165113  2021-09-18 16:11:19 Z    3 days
Testing same since   165151  2021-09-22 09:30:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhang Xiaoqiang <xiaoqiang.zhang@intel.com>

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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   542cba73d2..f334c5a41d  f334c5a41dc4702b1c767c6614025aa2f802f9a4 -> xen-tested-master

