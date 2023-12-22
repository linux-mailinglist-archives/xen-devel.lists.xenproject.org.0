Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BC81C8FC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 12:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659306.1028850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdXy-0007Lc-3G; Fri, 22 Dec 2023 11:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659306.1028850; Fri, 22 Dec 2023 11:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdXy-0007JY-00; Fri, 22 Dec 2023 11:18:30 +0000
Received: by outflank-mailman (input) for mailman id 659306;
 Fri, 22 Dec 2023 11:18:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGdXv-0007JO-Tz; Fri, 22 Dec 2023 11:18:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGdXv-0000Qp-Iq; Fri, 22 Dec 2023 11:18:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGdXv-0001x9-1S; Fri, 22 Dec 2023 11:18:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rGdXv-0002Aq-12; Fri, 22 Dec 2023 11:18:27 +0000
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
	bh=8NAcs8LCoFPbuNrmrc/b7u9NSYiEFqqZNGMO6stiLh8=; b=aaQfZMdToNwuJBLPVqugW2KcJS
	oT6fVYrI2NY4EornWymTmq3JZjTCkKSJc0EGID7M1RV3oMMZ8Fh+g2AH0PW1kTFELH7+rIEdW8oWY
	rFy830E+wVDyW4nBkZaCwclWgsF64ZKY5qkIhKKxZludqf3fU1VPKRxtUEUTuhsvfJVY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184210-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184210: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d01defe06b35eb3fe9c94e7b2e08a8762873f924
X-Osstest-Versions-That:
    ovmf=5d533bbc27732a421e3bf35c5af77782b8a85e6f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Dec 2023 11:18:27 +0000

flight 184210 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184210/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d01defe06b35eb3fe9c94e7b2e08a8762873f924
baseline version:
 ovmf                 5d533bbc27732a421e3bf35c5af77782b8a85e6f

Last test of basis   184202  2023-12-21 10:12:56 Z    1 days
Testing same since   184210  2023-12-22 09:12:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   5d533bbc27..d01defe06b  d01defe06b35eb3fe9c94e7b2e08a8762873f924 -> xen-tested-master

