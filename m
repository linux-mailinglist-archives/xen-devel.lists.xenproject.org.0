Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B81977366
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 23:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797826.1207890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sor7m-0006OA-3o; Thu, 12 Sep 2024 21:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797826.1207890; Thu, 12 Sep 2024 21:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sor7m-0006Kb-0m; Thu, 12 Sep 2024 21:13:10 +0000
Received: by outflank-mailman (input) for mailman id 797826;
 Thu, 12 Sep 2024 21:13:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sor7l-0006KR-3L; Thu, 12 Sep 2024 21:13:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sor7l-0005iM-10; Thu, 12 Sep 2024 21:13:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sor7k-0003qa-Lh; Thu, 12 Sep 2024 21:13:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sor7k-0002hw-LF; Thu, 12 Sep 2024 21:13:08 +0000
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
	bh=7XH54ZYlwgoHDuAny2POEk1kOPWpuv6o15USjpAL0bE=; b=zQ0q7npMERxawiZlGepfSMGt1c
	xcoi/mxNtsEpC1WQSTmmKIAx6lK7pdwUGtNHMPVHOQEwRetC7Wi1s+w1rztJcSgkmNHptXVo80SeU
	e/C79g3qrOBEa3PqV8t15f5mpfGXemOmmr5zUjUHrh4zv5BTviT7XIthrlDd9vfoOyGA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187679: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8f74b95a21cf106fa4eb4932e22b404c57297ba2
X-Osstest-Versions-That:
    ovmf=fe6b6feca7b6012278a432226a56f0836ad1c457
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 21:13:08 +0000

flight 187679 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187679/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8f74b95a21cf106fa4eb4932e22b404c57297ba2
baseline version:
 ovmf                 fe6b6feca7b6012278a432226a56f0836ad1c457

Last test of basis   187676  2024-09-12 13:41:30 Z    0 days
Testing same since   187679  2024-09-12 19:43:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   fe6b6feca7..8f74b95a21  8f74b95a21cf106fa4eb4932e22b404c57297ba2 -> xen-tested-master

