Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168B93980D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 03:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762535.1172695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW4fC-0001oo-UM; Tue, 23 Jul 2024 01:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762535.1172695; Tue, 23 Jul 2024 01:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW4fC-0001mG-Qu; Tue, 23 Jul 2024 01:50:02 +0000
Received: by outflank-mailman (input) for mailman id 762535;
 Tue, 23 Jul 2024 01:50:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sW4fB-0001bi-Cp; Tue, 23 Jul 2024 01:50:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sW4fB-0000Qg-8I; Tue, 23 Jul 2024 01:50:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sW4fA-0004Iu-Th; Tue, 23 Jul 2024 01:50:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sW4fA-00036U-Sz; Tue, 23 Jul 2024 01:50:00 +0000
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
	bh=Ttd7pqhqCpxUvqHnuYnTWLCheeCvR30R2x1FIxvR80Y=; b=UT/nGxIL1k6mSXPDoxsWS9LGh/
	m30qSJjvkBCHxx+gXg/GLSEjfpGv66YvINofEdSwhLT3yTr5QZ3/YambU8Ux0CqdoMv+lR3+IufQv
	+wAl/l983oe3ueqYbPeONkr/i8bTE5Co0DC7uzSM+YqznCMLyB19vX6Etyt1ZXbWtTdk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186956-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186956: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5582e435c2ed7faa5bee46b5c7a5d04b8edfeaa
X-Osstest-Versions-That:
    ovmf=8984fba2f22a2cd44e1189403e3553f447b82852
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jul 2024 01:50:00 +0000

flight 186956 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186956/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5582e435c2ed7faa5bee46b5c7a5d04b8edfeaa
baseline version:
 ovmf                 8984fba2f22a2cd44e1189403e3553f447b82852

Last test of basis   186954  2024-07-22 22:11:30 Z    0 days
Testing same since   186956  2024-07-23 00:13:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
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
   8984fba2f2..c5582e435c  c5582e435c2ed7faa5bee46b5c7a5d04b8edfeaa -> xen-tested-master

