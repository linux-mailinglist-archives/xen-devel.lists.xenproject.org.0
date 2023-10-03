Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A687B699A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 14:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612216.952056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnevt-0005wF-OM; Tue, 03 Oct 2023 12:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612216.952056; Tue, 03 Oct 2023 12:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnevt-0005uZ-Ld; Tue, 03 Oct 2023 12:55:25 +0000
Received: by outflank-mailman (input) for mailman id 612216;
 Tue, 03 Oct 2023 12:55:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnevs-0005uN-5X; Tue, 03 Oct 2023 12:55:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnevr-0008I2-Lm; Tue, 03 Oct 2023 12:55:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnevr-0002er-Ax; Tue, 03 Oct 2023 12:55:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qnevr-0008A4-AS; Tue, 03 Oct 2023 12:55:23 +0000
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
	bh=OJjBxLHDkyzhkriWdpaoYEvi1pkYCMZCZk3h/khttVE=; b=JNkeinu55HVUsMaXUuiy7AJfey
	QOD1huqHufERxbLR4/nEOl7FlrzZ/fkzvl7fri3EI/15DUZ40ajsRpJ0X1W1za9X048LfDEihcrsr
	1ipOJRNp2GeqJI5qPJPMKER/2ul9nXM8/orhNpKP+pvSoHmljRQg4WaZ9FiZB6Ag+ytQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183248-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 183248: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=164d1083e891247ef90f5cffc615a4bdf3da5785
X-Osstest-Versions-That:
    xtf=3c0b315d79eb67846d99060e51989ff62bb33464
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Oct 2023 12:55:23 +0000

flight 183248 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183248/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  164d1083e891247ef90f5cffc615a4bdf3da5785
baseline version:
 xtf                  3c0b315d79eb67846d99060e51989ff62bb33464

Last test of basis   183240  2023-10-02 17:14:27 Z    0 days
Testing same since   183248  2023-10-03 11:10:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   3c0b315..164d108  164d1083e891247ef90f5cffc615a4bdf3da5785 -> xen-tested-master

