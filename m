Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A92EFC3E
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 01:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63943.113348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky2E9-0003R3-RL; Sat, 09 Jan 2021 00:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63943.113348; Sat, 09 Jan 2021 00:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky2E9-0003QU-NE; Sat, 09 Jan 2021 00:35:33 +0000
Received: by outflank-mailman (input) for mailman id 63943;
 Sat, 09 Jan 2021 00:35:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ky2E8-0003QM-K9; Sat, 09 Jan 2021 00:35:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ky2E8-0004wd-Cv; Sat, 09 Jan 2021 00:35:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ky2E8-0007zs-5z; Sat, 09 Jan 2021 00:35:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ky2E8-0006Nh-5T; Sat, 09 Jan 2021 00:35:32 +0000
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
	bh=8xZGJHX/yg95GAKaaxW1fwGgdkAvfSOxqCIeRPcOOjU=; b=GeYcoHxjpGQXrn8VPtylrnBlCO
	Mth+W+Lm84HO6YaC06VKFVit9/CWaMb2IHtFZyjYIBlHAHKS/AZcsLJYbPWxHrj0xayo5RN3vsXA2
	lIhxtMwt7I+dtacgYkMbL/347GYg3awRhvVVxV7pX7MYS43BkG7p2aVg4fRyO9DtH1uA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158286: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9783767fcfc253c74fe3ad87abf74d17e1fe6399
X-Osstest-Versions-That:
    ovmf=fabeffb09e3bbf38748c4c073fb7fc6b7e64c20c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Jan 2021 00:35:32 +0000

flight 158286 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158286/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9783767fcfc253c74fe3ad87abf74d17e1fe6399
baseline version:
 ovmf                 fabeffb09e3bbf38748c4c073fb7fc6b7e64c20c

Last test of basis   158280  2021-01-08 14:39:45 Z    0 days
Testing same since   158286  2021-01-08 21:09:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>

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
   fabeffb09e..9783767fcf  9783767fcfc253c74fe3ad87abf74d17e1fe6399 -> xen-tested-master

