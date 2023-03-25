Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CF6C8A22
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 03:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514512.796837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftLy-0003hU-Tf; Sat, 25 Mar 2023 02:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514512.796837; Sat, 25 Mar 2023 02:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftLy-0003eN-Om; Sat, 25 Mar 2023 02:09:58 +0000
Received: by outflank-mailman (input) for mailman id 514512;
 Sat, 25 Mar 2023 02:09:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pftLx-0003eD-Fm; Sat, 25 Mar 2023 02:09:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pftLx-0003Fp-Dn; Sat, 25 Mar 2023 02:09:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pftLx-0003am-28; Sat, 25 Mar 2023 02:09:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pftLx-0008Hk-1i; Sat, 25 Mar 2023 02:09:57 +0000
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
	bh=CqN0Gb/gtYl1HfNCn548ICwYzLfN6J3sSMjQfbV6KPc=; b=L5yndmgDaUZsNl8Pwp2w3vXlmL
	bcnrkUOQOpeBEbpBjPmTFcslhdgtu85jBnjGsvoP9wxw3/B0A9RpvbahBHNkhEnVmCjFQr7Aj6HtJ
	2eUYLeov+gyyeQD0pDD7OZDpFrLE77w08Q0+QThXc6rhl0euoTPzyfvCnnSsfKHXJQkM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179950-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179950: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388
X-Osstest-Versions-That:
    ovmf=1f26a9e62e0d7d930b8c260c58b16cb9fb1cc940
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Mar 2023 02:09:57 +0000

flight 179950 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179950/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388
baseline version:
 ovmf                 1f26a9e62e0d7d930b8c260c58b16cb9fb1cc940

Last test of basis   179927  2023-03-24 15:10:43 Z    0 days
Testing same since   179950  2023-03-25 00:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   1f26a9e62e..f6bd3286ed  f6bd3286edfbe5eb6b50946cc8bb89e5c60b9388 -> xen-tested-master

