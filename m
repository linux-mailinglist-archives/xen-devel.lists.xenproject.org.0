Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C18D446D
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 06:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732457.1138459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCWwO-0003FB-Ju; Thu, 30 May 2024 03:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732457.1138459; Thu, 30 May 2024 03:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCWwO-0003DF-H3; Thu, 30 May 2024 03:59:00 +0000
Received: by outflank-mailman (input) for mailman id 732457;
 Thu, 30 May 2024 03:58:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCWwN-0003D5-Gr; Thu, 30 May 2024 03:58:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCWwN-0005xp-FP; Thu, 30 May 2024 03:58:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCWwN-0001PO-6E; Thu, 30 May 2024 03:58:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCWwN-0006Oh-5d; Thu, 30 May 2024 03:58:59 +0000
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
	bh=uuzLXX9HztuseY2wql01v2MXzMHOTqG2pdABBbsIVyg=; b=63TthiBVovfFl1sBTDCujZvWN1
	OzAfAWrBq1PWPL4jzew3ACzndckaOzOBpXeS7gYbbPUPIwaSdf9muP6uewyxXeBV3MjxpVVAPRSj3
	rasAcPbRK6sRHphKWXePXRGNomtEEld9pzd/h/vF9kvF23ePDcSuAhCkZ7eirY/dr+cU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186188-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186188: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=30b6d08e27c767ba9756a244099d73c826abcc8d
X-Osstest-Versions-That:
    ovmf=79655e27686031326eda3ea290225db6aea3b53f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 03:58:59 +0000

flight 186188 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186188/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 30b6d08e27c767ba9756a244099d73c826abcc8d
baseline version:
 ovmf                 79655e27686031326eda3ea290225db6aea3b53f

Last test of basis   186187  2024-05-30 00:42:59 Z    0 days
Testing same since   186188  2024-05-30 02:30:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   79655e2768..30b6d08e27  30b6d08e27c767ba9756a244099d73c826abcc8d -> xen-tested-master

