Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF004695CB0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 09:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495018.765268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRqSo-0008RQ-3S; Tue, 14 Feb 2023 08:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495018.765268; Tue, 14 Feb 2023 08:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRqSo-0008PL-0d; Tue, 14 Feb 2023 08:14:58 +0000
Received: by outflank-mailman (input) for mailman id 495018;
 Tue, 14 Feb 2023 08:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRqSm-0008PB-Oq; Tue, 14 Feb 2023 08:14:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRqSm-0000zq-Mi; Tue, 14 Feb 2023 08:14:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRqSm-0004lE-Hn; Tue, 14 Feb 2023 08:14:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pRqSm-0008NT-HJ; Tue, 14 Feb 2023 08:14:56 +0000
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
	bh=HfVuaVqEORzvXePh8gl6cUNjc0od1jnEJFUOqnFHrAs=; b=gfnOaYnLJIXaYYeY8xTudIKJH1
	l8HFzjGk0uyMWcHb3En/FpRbYz5s9AMl3z2bKTlgkhhbEv3TbE+F5MckV+eoxCCwL7T7GVI+B8Dsl
	6q0GpVuOcOfk3Gyr6owmSAUQ+lAWTU4Ah6kD154aVrOZmisJiPvIJxIQtymoZMBfNCxI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177239: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=540522fec06b87bf11ad5624abe23b515f282d60
X-Osstest-Versions-That:
    ovmf=b3f321f2d7871868951cf73edb8fa4d5a88854a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Feb 2023 08:14:56 +0000

flight 177239 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 540522fec06b87bf11ad5624abe23b515f282d60
baseline version:
 ovmf                 b3f321f2d7871868951cf73edb8fa4d5a88854a5

Last test of basis   177223  2023-02-14 00:11:46 Z    0 days
Testing same since   177239  2023-02-14 03:48:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   b3f321f2d7..540522fec0  540522fec06b87bf11ad5624abe23b515f282d60 -> xen-tested-master

