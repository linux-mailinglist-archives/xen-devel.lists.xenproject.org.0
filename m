Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F143844A6C3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 07:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223689.386497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkKU2-0003jr-5O; Tue, 09 Nov 2021 06:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223689.386497; Tue, 09 Nov 2021 06:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkKU2-0003ho-0p; Tue, 09 Nov 2021 06:19:50 +0000
Received: by outflank-mailman (input) for mailman id 223689;
 Tue, 09 Nov 2021 06:19:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkKU1-0003he-BC; Tue, 09 Nov 2021 06:19:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkKU1-0008V2-2F; Tue, 09 Nov 2021 06:19:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkKU0-0007eP-OK; Tue, 09 Nov 2021 06:19:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkKU0-0006ze-Np; Tue, 09 Nov 2021 06:19:48 +0000
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
	bh=RzEg3SKyt7qQ6djPT1vNiwdgrWa9Gm81Y+BgAlfMaWo=; b=PMQmH+CE3qRDktu4Q1IDW5wGnO
	QBkjOX5d9JAySTW0h6jg4ZogyBCalN3gu4MOIwr7P2X77kxQQIrCfGW6fHqgGsZY0dLK2v0xeemJf
	xHsJfg3fnCMzgGVocPzhSjM6cchmNOH5gT9uGznGZpuxBcfqS/wm1uCDQH0nbFISA81k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c1b1fe634a233ad7570f2243027d6be8a7849a1
X-Osstest-Versions-That:
    ovmf=fd42dcb1fc416b85bbbee1d546abfb7ac758b5c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Nov 2021 06:19:48 +0000

flight 166090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c1b1fe634a233ad7570f2243027d6be8a7849a1
baseline version:
 ovmf                 fd42dcb1fc416b85bbbee1d546abfb7ac758b5c1

Last test of basis   166087  2021-11-08 18:10:05 Z    0 days
Testing same since   166090  2021-11-09 01:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Jones <christopher.jones@arm.com>

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
   fd42dcb1fc..8c1b1fe634  8c1b1fe634a233ad7570f2243027d6be8a7849a1 -> xen-tested-master

