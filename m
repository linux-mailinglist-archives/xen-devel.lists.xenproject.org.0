Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF8608C65
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428228.678184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCT7-0004lC-72; Sat, 22 Oct 2022 11:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428228.678184; Sat, 22 Oct 2022 11:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCT7-0004jV-3E; Sat, 22 Oct 2022 11:15:09 +0000
Received: by outflank-mailman (input) for mailman id 428228;
 Sat, 22 Oct 2022 11:15:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omCT5-0004jL-Au; Sat, 22 Oct 2022 11:15:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omCT5-0001Rr-A2; Sat, 22 Oct 2022 11:15:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1omCT4-0007YS-Sc; Sat, 22 Oct 2022 11:15:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1omCT4-0005WI-SB; Sat, 22 Oct 2022 11:15:06 +0000
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
	bh=jduODl6c+z/pi0jmjU6vsh8qUetCg78uTst0Y8/O2K4=; b=5wMDFFOFiZQS43AibopCtbkhma
	+t1f2SE/PeivCobJ4CX9pMMXUoqJMdeDPUxsgMBhlKCrlOQMPII9Hr8iihgnn+38D0RZQcKZv6ap8
	LUY1kWc7RFoC822FdLo46/n6wU51ZGQYk+YPFqFauTllpClRVvQS1DkNJeDaVOpnPZ5M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174250-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174250: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2355f0c09c52d6979f9f471b23816f3081cc946b
X-Osstest-Versions-That:
    ovmf=913a308df934952bcbedacb6baa8bd023a25b978
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Oct 2022 11:15:06 +0000

flight 174250 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174250/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2355f0c09c52d6979f9f471b23816f3081cc946b
baseline version:
 ovmf                 913a308df934952bcbedacb6baa8bd023a25b978

Last test of basis   174243  2022-10-22 07:10:26 Z    0 days
Testing same since   174250  2022-10-22 09:41:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   913a308df9..2355f0c09c  2355f0c09c52d6979f9f471b23816f3081cc946b -> xen-tested-master

