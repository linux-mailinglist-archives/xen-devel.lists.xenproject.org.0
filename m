Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBF79D727
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 19:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600684.936424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6nt-0003yn-TL; Tue, 12 Sep 2023 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600684.936424; Tue, 12 Sep 2023 17:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6nt-0003wQ-Pr; Tue, 12 Sep 2023 17:03:57 +0000
Received: by outflank-mailman (input) for mailman id 600684;
 Tue, 12 Sep 2023 17:03:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg6nt-0003wG-8g; Tue, 12 Sep 2023 17:03:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg6nt-00042E-80; Tue, 12 Sep 2023 17:03:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg6nt-0001Ie-0H; Tue, 12 Sep 2023 17:03:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qg6ns-0000Hd-W1; Tue, 12 Sep 2023 17:03:56 +0000
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
	bh=tIMYZx8sV+oOzwcOF758XNt1laxppGUxCOQRA+HG/bU=; b=cN0jiaTg7DjrdCG6fEcecj0Lqf
	E/A9Siwn5rnTmg7HJQFsZJpBvbzS0o51dhfmnPsaGusXBEfMG0NajOblaO1E/e+FesS3jn2q5aH9g
	WyJjae/mRftf5fqSmr5XIhB4nsUhLThCqU3TeEsbBhILIjp1iWsF77hOfKP2copV/7JA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182968-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182968: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=21ec0c42267be169be6019e5a09b61cbf16d10ce
X-Osstest-Versions-That:
    xen=5e8df433db791ba7e63ac1253e4e2a06ccd353d7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Sep 2023 17:03:56 +0000

flight 182968 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182968/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  21ec0c42267be169be6019e5a09b61cbf16d10ce
baseline version:
 xen                  5e8df433db791ba7e63ac1253e4e2a06ccd353d7

Last test of basis   182963  2023-09-12 10:00:26 Z    0 days
Testing same since   182968  2023-09-12 14:03:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@amd.com>

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
   5e8df433db..21ec0c4226  21ec0c42267be169be6019e5a09b61cbf16d10ce -> smoke

