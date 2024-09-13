Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43F97850F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798286.1208457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8QB-0006Yh-HZ; Fri, 13 Sep 2024 15:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798286.1208457; Fri, 13 Sep 2024 15:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8QB-0006Wr-Ei; Fri, 13 Sep 2024 15:41:19 +0000
Received: by outflank-mailman (input) for mailman id 798286;
 Fri, 13 Sep 2024 15:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp8Q9-0006Wh-LC; Fri, 13 Sep 2024 15:41:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp8Q9-0000y0-Jf; Fri, 13 Sep 2024 15:41:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp8Q9-0004Pa-9S; Fri, 13 Sep 2024 15:41:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sp8Q9-00036x-93; Fri, 13 Sep 2024 15:41:17 +0000
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
	bh=yMV2OHaO0Ju5Sh0/N1JhyrqpqVl5P3F87uZoyI8ddEA=; b=Rb11a2uIzQi/bdD1Tp/ZR6n2Jm
	CDPTa/Vvbi2DfbuaNhKyZSFJan5353nj6uf+gJIKq8luvqhZIqdV0iz7Wp3myPUOxQp/qEeqC/MKj
	txVjL+/4AvE0amh7m7/2VsEuMsNWVOBl+0bDcMjxUqOLXD1Ch7ZgdIJLvUtS7tcfunf8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187692-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187692: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5c8bdb190f6dd79f38ef6191754c9a26892f8d26
X-Osstest-Versions-That:
    ovmf=69139e39bc9bd7410ee71a830b812fb74d21bdb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 15:41:17 +0000

flight 187692 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187692/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5c8bdb190f6dd79f38ef6191754c9a26892f8d26
baseline version:
 ovmf                 69139e39bc9bd7410ee71a830b812fb74d21bdb4

Last test of basis   187690  2024-09-13 10:46:31 Z    0 days
Testing same since   187692  2024-09-13 13:15:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chun-Yi Lee <jlee@suse.com>

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
   69139e39bc..5c8bdb190f  5c8bdb190f6dd79f38ef6191754c9a26892f8d26 -> xen-tested-master

