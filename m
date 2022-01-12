Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C883448C2FC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256525.440325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bdI-0006Ra-8J; Wed, 12 Jan 2022 11:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256525.440325; Wed, 12 Jan 2022 11:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bdI-0006OX-5N; Wed, 12 Jan 2022 11:17:36 +0000
Received: by outflank-mailman (input) for mailman id 256525;
 Wed, 12 Jan 2022 11:17:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7bdH-0006ON-ET; Wed, 12 Jan 2022 11:17:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7bdH-0004MA-C9; Wed, 12 Jan 2022 11:17:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n7bdH-0004ZO-4g; Wed, 12 Jan 2022 11:17:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n7bdH-0004RY-4E; Wed, 12 Jan 2022 11:17:35 +0000
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
	bh=A9uNJpLP1gnIGAe/azfk7cSjT7w5vUN46qqikW+VaMA=; b=QpgSWiXKdIZnuDhNOMpkgDaZ9g
	NhhhvtHgesmgP3wzx7hbthfvVzmHF4KAl5oFSg5H76/4y7s8a09jlW1upgnuWfGkYyjmis2esMwtg
	rf3FGoOfTE+0K5kSJFrpSuCieMDAK5oCNt4YZEPLcxmU8uYOF0pa7uJZiXnSGtYlJtpQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167671-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167671: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0cf6521ea95dd78accf1e5c13cbfe8156b3611d0
X-Osstest-Versions-That:
    xen=22891e12a45f9bb2e1dbb5daf2ba39cbe002e4f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Jan 2022 11:17:35 +0000

flight 167671 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167671/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0cf6521ea95dd78accf1e5c13cbfe8156b3611d0
baseline version:
 xen                  22891e12a45f9bb2e1dbb5daf2ba39cbe002e4f4

Last test of basis   167658  2022-01-11 11:02:59 Z    1 days
Testing same since   167671  2022-01-12 08:01:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   22891e12a4..0cf6521ea9  0cf6521ea95dd78accf1e5c13cbfe8156b3611d0 -> smoke

