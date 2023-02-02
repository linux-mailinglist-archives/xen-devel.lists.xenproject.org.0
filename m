Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E1687E38
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 14:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488804.757057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNZEA-00057m-Pq; Thu, 02 Feb 2023 13:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488804.757057; Thu, 02 Feb 2023 13:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNZEA-00055U-Lk; Thu, 02 Feb 2023 13:02:10 +0000
Received: by outflank-mailman (input) for mailman id 488804;
 Thu, 02 Feb 2023 13:02:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNZE9-00055K-At; Thu, 02 Feb 2023 13:02:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNZE9-00035r-8X; Thu, 02 Feb 2023 13:02:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNZE8-0004Tn-TO; Thu, 02 Feb 2023 13:02:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNZE8-0006zS-Ss; Thu, 02 Feb 2023 13:02:08 +0000
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
	bh=UMUePj0OSorIRcM+jDa+7lbrrPhIyLQRjYq+Tld13Cw=; b=vqFp5c3b3NlL6jHA1IIuxkn17U
	Sf4tYJb3FR4tBgXCLKB4SRKwog65i+mNIdytE/khiCO0YWLg49AZLppvRJQzelm/MF9U8GFiCWJWG
	FTheHqvmNuVsLXmrdUxk7Z9a5dO3Dt8RLDa98SvfmqfvDT1dFak5fM+gdnHIyugJlo2c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176328-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176328: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae6e470252d9312dce20d0b21e7f622c4ca9ad0a
X-Osstest-Versions-That:
    ovmf=d375273c899bfa279c2732c509caf455af285006
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Feb 2023 13:02:08 +0000

flight 176328 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176328/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae6e470252d9312dce20d0b21e7f622c4ca9ad0a
baseline version:
 ovmf                 d375273c899bfa279c2732c509caf455af285006

Last test of basis   176323  2023-02-02 02:10:46 Z    0 days
Testing same since   176328  2023-02-02 06:12:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeshua Smith <jeshuas@nvidia.com>
  Ranbir Singh <Ranbir.Singh3@Dell.com>

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
   d375273c89..ae6e470252  ae6e470252d9312dce20d0b21e7f622c4ca9ad0a -> xen-tested-master

