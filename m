Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0674AB8D3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266679.460393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Q3-000761-Ex; Mon, 07 Feb 2022 10:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266679.460393; Mon, 07 Feb 2022 10:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Q3-00073j-Bo; Mon, 07 Feb 2022 10:38:51 +0000
Received: by outflank-mailman (input) for mailman id 266679;
 Mon, 07 Feb 2022 10:38:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH1Q2-00073M-BC; Mon, 07 Feb 2022 10:38:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH1Q2-00006t-80; Mon, 07 Feb 2022 10:38:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH1Q1-0004Nb-PO; Mon, 07 Feb 2022 10:38:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nH1Q1-0005zS-Ov; Mon, 07 Feb 2022 10:38:49 +0000
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
	bh=adTuc0/5BO6tc22yIwHr1PIdFdUbzjx3CCph257Oo1A=; b=M0VI19DWYs9UXcDzcG1VWr8GYn
	/YtIDFxWPWH3qeoOlw6j3PC2YJoJ3TT3JfhTrr7YG5wOaVWsvdDx5O0QUYc9c1tNLLOqJULL37Y4u
	aIfK+h6uH1oRIaSXAIIZ1JQishgAtIZB+dtCke/8KZwN4BKWET3SzTkEwb42Gkp2pT/Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f78b937c95ddc4f7a29e41fee98e96076828a108
X-Osstest-Versions-That:
    ovmf=6fb09da89f88000a7592171a0ce08cf1feaa0646
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Feb 2022 10:38:49 +0000

flight 168042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f78b937c95ddc4f7a29e41fee98e96076828a108
baseline version:
 ovmf                 6fb09da89f88000a7592171a0ce08cf1feaa0646

Last test of basis   168038  2022-02-07 01:55:23 Z    0 days
Testing same since   168042  2022-02-07 06:41:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jake Garver <jake@nvidia.com>
  Jake Garver via groups.io <jake=nvidia.com@groups.io>
  Wei6 Xu <wei6.xu@intel.com>

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
   6fb09da89f..f78b937c95  f78b937c95ddc4f7a29e41fee98e96076828a108 -> xen-tested-master

