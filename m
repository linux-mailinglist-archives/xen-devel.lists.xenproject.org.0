Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049049644E6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785827.1195334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeTW-0008DF-OF; Thu, 29 Aug 2024 12:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785827.1195334; Thu, 29 Aug 2024 12:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeTW-0008B9-L8; Thu, 29 Aug 2024 12:42:06 +0000
Received: by outflank-mailman (input) for mailman id 785827;
 Thu, 29 Aug 2024 12:42:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjeTV-0008Az-CS; Thu, 29 Aug 2024 12:42:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjeTV-0003Fg-2L; Thu, 29 Aug 2024 12:42:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjeTU-0001TP-FK; Thu, 29 Aug 2024 12:42:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjeTU-0008Q9-Eo; Thu, 29 Aug 2024 12:42:04 +0000
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
	bh=26hgDvGlVP0BC7dNgUGTYtCaCiwQRafayvNAMigYLgA=; b=Me1VmCHwiWK+1/0gTNfy1CP7JP
	ZVevsobhlxW1qvR9reWzKGq9AlviHikk5veB/NpFG7XuBAGZYvTL0w7L2xOSh3Iodx2hLfpFbNv/h
	OTHWrdbPZL9Dob3emf4xouHv1Ie7UKwQ2j8loSK4XiO8jyT3rgKL6sc6D71LrX2WYYs4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187402-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187402: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb248a95091ab542440053d9c289a97e80eb6630
X-Osstest-Versions-That:
    ovmf=31f022500549f1d862af531da704a9b3c6568ff5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 12:42:04 +0000

flight 187402 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187402/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb248a95091ab542440053d9c289a97e80eb6630
baseline version:
 ovmf                 31f022500549f1d862af531da704a9b3c6568ff5

Last test of basis   187398  2024-08-29 06:13:23 Z    0 days
Testing same since   187402  2024-08-29 10:11:27 Z    0 days    1 attempts

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
   31f0225005..bb248a9509  bb248a95091ab542440053d9c289a97e80eb6630 -> xen-tested-master

