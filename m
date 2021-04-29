Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CD36E4FB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 08:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119741.226381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0O5-0005gO-MQ; Thu, 29 Apr 2021 06:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119741.226381; Thu, 29 Apr 2021 06:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0O5-0005fm-GL; Thu, 29 Apr 2021 06:43:01 +0000
Received: by outflank-mailman (input) for mailman id 119741;
 Thu, 29 Apr 2021 06:43:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lc0O4-0005fe-Bk; Thu, 29 Apr 2021 06:43:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lc0O4-0006E5-5a; Thu, 29 Apr 2021 06:43:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lc0O3-0006DS-Th; Thu, 29 Apr 2021 06:42:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lc0O3-00068E-TE; Thu, 29 Apr 2021 06:42:59 +0000
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
	bh=MnWnoIG3ylXDxV/XKDpItESoYEwdqMQYJ3Wh8rxJJo0=; b=5lxHgUvZmhSjwxspe+GzP3UAtM
	JjW7p/N+3L/rsViIbt4+iFcvmYDWE1bwYO0G58XFlYnhe1OQq8bG4UMXULOT2Kin7qnsd6Cw3sR5M
	9DyVmqkFO5KXEEeEiFrHBlO9rR78yJma0/r2XqpPD/zpQJe2K7HS0ci0q7yVL1MSE074=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161504: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=01c0ab90beb3d2a80f913d4a0866b4e92656a42a
X-Osstest-Versions-That:
    ovmf=5b90b8abb4049e2d98040f548ad23b6ab22d5d19
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Apr 2021 06:42:59 +0000

flight 161504 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161504/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 01c0ab90beb3d2a80f913d4a0866b4e92656a42a
baseline version:
 ovmf                 5b90b8abb4049e2d98040f548ad23b6ab22d5d19

Last test of basis   161485  2021-04-27 13:41:25 Z    1 days
Testing same since   161504  2021-04-28 12:10:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <bret.barkelew@microsoft.com>
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   5b90b8abb4..01c0ab90be  01c0ab90beb3d2a80f913d4a0866b4e92656a42a -> xen-tested-master

