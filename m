Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F144C388
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 16:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224333.387599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkp54-0007PL-Ku; Wed, 10 Nov 2021 15:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224333.387599; Wed, 10 Nov 2021 15:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkp54-0007MP-GQ; Wed, 10 Nov 2021 15:00:06 +0000
Received: by outflank-mailman (input) for mailman id 224333;
 Wed, 10 Nov 2021 15:00:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkp53-0007Eg-42; Wed, 10 Nov 2021 15:00:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkp52-0004EC-RH; Wed, 10 Nov 2021 15:00:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkp52-0005uO-IF; Wed, 10 Nov 2021 15:00:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkp52-0006Yy-Hj; Wed, 10 Nov 2021 15:00:04 +0000
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
	bh=B62FKnzdDZpX7VFHy48qUh58Gs65f3i9/XW6d9A8OPc=; b=hYQnkWj0kOyeCKUNVa2h6ok5Zj
	rdguA/UAIKd3BlMZlYqHTNiXaSrA5jNirkJ6gExRwceKCvHaStT+U3/UG7I7keNpWuVT9fvuORX6w
	iFNy86Ao+xbA9Ek3QUY0ReN/fOp/cHZ3q3e87srNKpZcdpeqM/e+ZOF8BEmLtzOCTR9E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166108: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c8867c5da8e059ab98a6108f8182700f298c6f5
X-Osstest-Versions-That:
    ovmf=f826b20811ba6b0a9dbe44ff703b85c2def267df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Nov 2021 15:00:04 +0000

flight 166108 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c8867c5da8e059ab98a6108f8182700f298c6f5
baseline version:
 ovmf                 f826b20811ba6b0a9dbe44ff703b85c2def267df

Last test of basis   166105  2021-11-10 06:42:43 Z    0 days
Testing same since   166108  2021-11-10 09:41:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yang Jie <jie.yang@intel.com>

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
   f826b20811..8c8867c5da  8c8867c5da8e059ab98a6108f8182700f298c6f5 -> xen-tested-master

