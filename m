Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79C43792E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 16:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215127.374119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdvnS-0005he-EW; Fri, 22 Oct 2021 14:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215127.374119; Fri, 22 Oct 2021 14:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdvnS-0005fk-AZ; Fri, 22 Oct 2021 14:45:26 +0000
Received: by outflank-mailman (input) for mailman id 215127;
 Fri, 22 Oct 2021 14:45:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdvnR-0005fa-8B; Fri, 22 Oct 2021 14:45:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdvnR-0006Ef-2x; Fri, 22 Oct 2021 14:45:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdvnQ-0004ua-RW; Fri, 22 Oct 2021 14:45:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mdvnQ-0007s2-R2; Fri, 22 Oct 2021 14:45:24 +0000
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
	bh=b2V10T0oAIXt8i455P8D76VZXZ5AvkEbO1a6/K1cDH0=; b=roIrLsOOLni/kFq38NLEUyy+Uk
	w7S1+j4WozrvbwdNa6S1rqlLLhIPTitLKqaNocPE1D8nzCDbvlXS6odf5uB2i+17h1l4PtAO/pii8
	pmzTrUR70Op1s5FeKLQUXoB3elPqHHAHCUExAMGjfbu1n4zm+uOARuawEZcafOiSldBg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165767-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165767: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bd5ec03d87cacc5be2de4284b092aafd4ac4eb31
X-Osstest-Versions-That:
    ovmf=2f286930a8280f4d817460020110009938f695b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Oct 2021 14:45:24 +0000

flight 165767 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165767/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bd5ec03d87cacc5be2de4284b092aafd4ac4eb31
baseline version:
 ovmf                 2f286930a8280f4d817460020110009938f695b6

Last test of basis   165714  2021-10-21 15:40:13 Z    0 days
Testing same since   165767  2021-10-22 10:10:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gary Lin <gary.lin@hpe.com>
  Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>

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
   2f286930a8..bd5ec03d87  bd5ec03d87cacc5be2de4284b092aafd4ac4eb31 -> xen-tested-master

