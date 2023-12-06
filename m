Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E280639B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 01:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648691.1012674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAg13-0000m0-Cu; Wed, 06 Dec 2023 00:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648691.1012674; Wed, 06 Dec 2023 00:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAg13-0000ig-9q; Wed, 06 Dec 2023 00:43:53 +0000
Received: by outflank-mailman (input) for mailman id 648691;
 Wed, 06 Dec 2023 00:43:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAg12-0000iW-Jo; Wed, 06 Dec 2023 00:43:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAg11-0003M8-TA; Wed, 06 Dec 2023 00:43:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rAg11-0006ah-Iv; Wed, 06 Dec 2023 00:43:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rAg11-0007kz-IV; Wed, 06 Dec 2023 00:43:51 +0000
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
	bh=VP3BxikR0naUmE+bbioh2l9RJhJkVZE608acJEjtdhU=; b=B3jBy6hbG1jbLmCnQ5U6GWmFzc
	epCJivaXJuCfAVBHQyzti1oJhFnU6Tk3XGJO1mVREDcSlNlMkZjGiS3M1/DBHQjOjc1enZAR9FI5n
	4NPl5H99Ago6YYZa+BS4z6ir7Kd6yxWB6xj00TBJyTF1Tn/yUYh9qHyHDBmV4b8J/Jy8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183999-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183999: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ef3fde64aa78598a4c21556629936fb228390e8c
X-Osstest-Versions-That:
    ovmf=120aa6064465496c962b6664a9365a2573e54d1f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Dec 2023 00:43:51 +0000

flight 183999 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183999/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef3fde64aa78598a4c21556629936fb228390e8c
baseline version:
 ovmf                 120aa6064465496c962b6664a9365a2573e54d1f

Last test of basis   183991  2023-12-05 03:42:59 Z    0 days
Testing same since   183999  2023-12-05 20:44:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tina Chen <tina.chen@intel.com>

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
   120aa60644..ef3fde64aa  ef3fde64aa78598a4c21556629936fb228390e8c -> xen-tested-master

