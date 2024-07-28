Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D193E2F2
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2024 03:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766048.1176620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXsaF-0008I7-BG; Sun, 28 Jul 2024 01:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766048.1176620; Sun, 28 Jul 2024 01:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXsaF-0008Gc-8V; Sun, 28 Jul 2024 01:20:23 +0000
Received: by outflank-mailman (input) for mailman id 766048;
 Sun, 28 Jul 2024 01:20:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXsaD-0008GQ-AG; Sun, 28 Jul 2024 01:20:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXsaC-00030v-Ty; Sun, 28 Jul 2024 01:20:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXsaC-0005hm-KL; Sun, 28 Jul 2024 01:20:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXsaC-0004G1-Jr; Sun, 28 Jul 2024 01:20:20 +0000
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
	bh=EdVfNIMrTMf8bCAg14f+Quur1JjUrhUHoIUm7YzuUHs=; b=mlQokv4lUdFyx0SpmIsSp5Jq5r
	gex4CIfNP929pFCQezQ98fwhwGe97bGicJ9WlaT59c4Xmu4V664Q8jnvo80AT28OHI4aQ5IqFaLYc
	dX4qWJ9U1FtTWEUqGOyls4m0s3/Wyb23ZKHVhTw7hcxAHghZnHhoYjCggml1StwU4OWM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187030-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187030: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b7f963d570ec5e27bc04d546372c6fc47e4f3b17
X-Osstest-Versions-That:
    ovmf=52eb643d0785a19c7f1c107d390c7bb52a79789e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jul 2024 01:20:20 +0000

flight 187030 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187030/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b7f963d570ec5e27bc04d546372c6fc47e4f3b17
baseline version:
 ovmf                 52eb643d0785a19c7f1c107d390c7bb52a79789e

Last test of basis   187029  2024-07-27 16:13:52 Z    0 days
Testing same since   187030  2024-07-27 23:44:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <brbarkel@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   52eb643d07..b7f963d570  b7f963d570ec5e27bc04d546372c6fc47e4f3b17 -> xen-tested-master

