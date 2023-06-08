Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D40727C5E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 12:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545247.851578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CaQ-0000yE-Fq; Thu, 08 Jun 2023 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545247.851578; Thu, 08 Jun 2023 10:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CaQ-0000v7-Cc; Thu, 08 Jun 2023 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 545247;
 Thu, 08 Jun 2023 10:09:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7CaO-0000uq-LC; Thu, 08 Jun 2023 10:09:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7CaO-0000GG-Fj; Thu, 08 Jun 2023 10:09:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7CaN-00062O-Go; Thu, 08 Jun 2023 10:09:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q7CaN-00055C-GM; Thu, 08 Jun 2023 10:09:43 +0000
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
	bh=ajnE9VNcXIPu+KVUJkMPib7ifrnNPc7d/7dIgzUklzI=; b=BJFNsrQzRRJ0cxbDMpNwq+Pock
	S+yHEmhexFrJx0+Y1g4xp9uCuBJhJ6FdtCowmJkvYj4zOsPply5CsYbQThcfgaheEWIw1XeDx1RMM
	FkwiHDhTztT6uGWE+WEFoA55dA9bGuwkHsq2su5eZNH4bSuQvY3eG/HLqblxgEHaRmaU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181298-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181298: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8314a85893f5b75baa0031a5138028188a626243
X-Osstest-Versions-That:
    ovmf=69abcf1e78b67e7ce9ac53a9fe1ce61877df984c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jun 2023 10:09:43 +0000

flight 181298 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181298/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8314a85893f5b75baa0031a5138028188a626243
baseline version:
 ovmf                 69abcf1e78b67e7ce9ac53a9fe1ce61877df984c

Last test of basis   181268  2023-06-07 18:40:44 Z    0 days
Testing same since   181298  2023-06-08 07:41:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Simon Wang <simowang@nvidia.com>

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
   69abcf1e78..8314a85893  8314a85893f5b75baa0031a5138028188a626243 -> xen-tested-master

