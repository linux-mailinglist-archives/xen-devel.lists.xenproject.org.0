Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0190E036
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 01:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743334.1150219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJicJ-0006El-GO; Tue, 18 Jun 2024 23:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743334.1150219; Tue, 18 Jun 2024 23:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJicJ-0006CE-DO; Tue, 18 Jun 2024 23:51:59 +0000
Received: by outflank-mailman (input) for mailman id 743334;
 Tue, 18 Jun 2024 23:51:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJicH-0006C4-SC; Tue, 18 Jun 2024 23:51:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJicH-0005LX-HD; Tue, 18 Jun 2024 23:51:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJicH-0001iw-7K; Tue, 18 Jun 2024 23:51:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJicH-0006l4-6l; Tue, 18 Jun 2024 23:51:57 +0000
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
	bh=vBWcF2h2wA78dl4aFgGjuAhkN+3/aPpGZDG8J/vRDRI=; b=RusA9+0xOm5eLRmqoE47C1MiQz
	REwEggCtZd5RM+mFe9Y5HHkkyQSnREKSqY/XtrP6/YlC31MuIQLpNlQLPlj+p5w6VKF63/Xy5S65q
	ZEVSA+/U5Gq76m61j2Gcc4oyl0rJJExqEKBIia53PbTK8irJH6+cnftisD/30X6gHIl4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186402-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186402: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c1d1910be6e04a8b1a73090cf2881fb698947a6e
X-Osstest-Versions-That:
    ovmf=ffce430d2b65d508a1604dc986ba16db3583943d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 23:51:57 +0000

flight 186402 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186402/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c1d1910be6e04a8b1a73090cf2881fb698947a6e
baseline version:
 ovmf                 ffce430d2b65d508a1604dc986ba16db3583943d

Last test of basis   186399  2024-06-18 19:43:01 Z    0 days
Testing same since   186402  2024-06-18 21:41:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   ffce430d2b..c1d1910be6  c1d1910be6e04a8b1a73090cf2881fb698947a6e -> xen-tested-master

