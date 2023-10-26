Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670077D7B4C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 05:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623463.971312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvr8N-0001GV-R2; Thu, 26 Oct 2023 03:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623463.971312; Thu, 26 Oct 2023 03:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvr8N-0001E9-OR; Thu, 26 Oct 2023 03:34:11 +0000
Received: by outflank-mailman (input) for mailman id 623463;
 Thu, 26 Oct 2023 03:34:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvr8M-0001Ci-KW; Thu, 26 Oct 2023 03:34:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvr8M-0005jy-6o; Thu, 26 Oct 2023 03:34:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvr8L-0008Hq-OG; Thu, 26 Oct 2023 03:34:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvr8L-0003iA-Nh; Thu, 26 Oct 2023 03:34:09 +0000
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
	bh=FarVIZohBdYskKwfNlllMuW4J+Ai5TaYUmCzBhHE3aU=; b=I6CaXu6aqrRYpyCk49aNEj0aNb
	BOpy2Q6u3zXV62CdC2X3vUI7FvvvA1j2jH3V6GUUiFE21w4GjP1FrjWu9rqkgIABxA/m5/uFqq5rB
	wRKstISB+HtbmoRdpmFNS5XZ6BUWz6nqrsV22Y1Q4044AmP+kvwuSBPGfhaXM7h1uWnE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183532: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9bb5ef1287c6765c477fb2cb3107339f700ab419
X-Osstest-Versions-That:
    ovmf=884ef984541c3e346d39e423fea53cf25066ff5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Oct 2023 03:34:09 +0000

flight 183532 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183532/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9bb5ef1287c6765c477fb2cb3107339f700ab419
baseline version:
 ovmf                 884ef984541c3e346d39e423fea53cf25066ff5a

Last test of basis   183526  2023-10-25 14:14:10 Z    0 days
Testing same since   183532  2023-10-26 01:44:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Li <chrisli@os.amperecomputing.com>

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
   884ef98454..9bb5ef1287  9bb5ef1287c6765c477fb2cb3107339f700ab419 -> xen-tested-master

