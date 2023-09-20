Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C87A763A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605325.942935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisrA-0000tn-MI; Wed, 20 Sep 2023 08:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605325.942935; Wed, 20 Sep 2023 08:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisrA-0000rG-Iw; Wed, 20 Sep 2023 08:46:48 +0000
Received: by outflank-mailman (input) for mailman id 605325;
 Wed, 20 Sep 2023 08:46:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qisr9-0000r6-Fp; Wed, 20 Sep 2023 08:46:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qisr9-0007a7-6T; Wed, 20 Sep 2023 08:46:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qisr8-0001fu-PP; Wed, 20 Sep 2023 08:46:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qisr8-0005eN-Ox; Wed, 20 Sep 2023 08:46:46 +0000
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
	bh=eSKBP72qfvcEO2K8o17NLAJ3fiQSLbkrFuRhSJJ/ShE=; b=xTor4aanz3fQMZkOvkYe3atbAS
	Tfx8Q0cOpSvDFUQRpmCs5SjAFoH/Ls+fBn+R5SkNPtw6OMe9Lo9xC8QQicH3D7/4grIjyDdERDR4J
	N4kqpdLtRj2NQClTgMY5M7CO1UY3XTNC/KpJQxPZzJvdTnFI6uBgYq/16Kvy+60drYso=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183077-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183077: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4fb69c2bee3006b08ca2abba58843f7573e0c5c6
X-Osstest-Versions-That:
    ovmf=eb485b6438f488db5300b56949d9dad460c9f2d4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Sep 2023 08:46:46 +0000

flight 183077 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183077/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4fb69c2bee3006b08ca2abba58843f7573e0c5c6
baseline version:
 ovmf                 eb485b6438f488db5300b56949d9dad460c9f2d4

Last test of basis   183072  2023-09-19 20:45:49 Z    0 days
Testing same since   183077  2023-09-20 06:11:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ranbir Singh <Ranbir.Singh3@Dell.com>
  Ranbir Singh <rsingh@ventanamicro.com>

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
   eb485b6438..4fb69c2bee  4fb69c2bee3006b08ca2abba58843f7573e0c5c6 -> xen-tested-master

