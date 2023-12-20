Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0881A885
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658311.1027411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4Mh-0004ch-8l; Wed, 20 Dec 2023 21:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658311.1027411; Wed, 20 Dec 2023 21:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4Mh-0004Zd-5q; Wed, 20 Dec 2023 21:44:31 +0000
Received: by outflank-mailman (input) for mailman id 658311;
 Wed, 20 Dec 2023 21:44:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rG4Mg-0004ZT-2L; Wed, 20 Dec 2023 21:44:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rG4Mf-0007LE-Rw; Wed, 20 Dec 2023 21:44:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rG4Mf-00063E-HH; Wed, 20 Dec 2023 21:44:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rG4Mf-0003hm-Er; Wed, 20 Dec 2023 21:44:29 +0000
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
	bh=cDM2egqDx9k3xInNiI5GJ90MKWeWcNLInnySe9H8O4I=; b=EX4MKNrklbi92HQn64qRJe7JbX
	Eq3fwTn4NHYuBmhyPr2agCeJBUI/aln9FPY56V9d26/1f62JgI0kYz6rN6A0ZanGSwy9kZwaQZ2L5
	sknKTRm3Q03VGdqIxNdXCF59dK3BF0Te7UcbpiBTNC4YFN+iGtUty4x2kAjGdXfVYXcM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184193-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184193: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e9786ba9ee5f0b4b6eadb4ca80417f195ce251a0
X-Osstest-Versions-That:
    xen=913a1774168f82565bbdc7d41a46013a40ba302d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Dec 2023 21:44:29 +0000

flight 184193 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184193/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e9786ba9ee5f0b4b6eadb4ca80417f195ce251a0
baseline version:
 xen                  913a1774168f82565bbdc7d41a46013a40ba302d

Last test of basis   184190  2023-12-20 11:00:27 Z    0 days
Testing same since   184193  2023-12-20 19:02:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Federico Serafini <federico.serafini@bugseng.com>
  Julien Grall <jgrall@amazon.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   913a177416..e9786ba9ee  e9786ba9ee5f0b4b6eadb4ca80417f195ce251a0 -> smoke

