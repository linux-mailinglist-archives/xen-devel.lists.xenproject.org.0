Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049042E09EB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 13:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57797.101301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgOW-0002qw-Gb; Tue, 22 Dec 2020 12:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57797.101301; Tue, 22 Dec 2020 12:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgOW-0002qX-D8; Tue, 22 Dec 2020 12:04:00 +0000
Received: by outflank-mailman (input) for mailman id 57797;
 Tue, 22 Dec 2020 12:03:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krgOV-0002qP-SH; Tue, 22 Dec 2020 12:03:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krgOV-00061i-FG; Tue, 22 Dec 2020 12:03:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krgOV-0006UP-75; Tue, 22 Dec 2020 12:03:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krgOV-00079Q-6a; Tue, 22 Dec 2020 12:03:59 +0000
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
	bh=BoqHHtRPelHrHKGg0eHET3CPcAq2Z1xRySV/DiLnaCA=; b=RMn7bl9xXa8gCbt2srBBrZIUD7
	P9oyN5hHYwCntSPvAGJOcGVlCrWnRu/E8Qe1Vu6wR7UfYAIiEZ9vyIKy+Ri/KCEZ1QEkZvL4suxvs
	EG2ByUIgaJunuD27r5mOVx5XeYkvYbE64LXAeWL9J0HO6tnGmXMfEUyTGMvokHok8ifw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 157786: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e93c3712d67098453760fd61c338cbf62dd08da1
X-Osstest-Versions-That:
    xen=8c8938dcc1bd37dd61f705410053e08804ca2b55
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Dec 2020 12:03:59 +0000

flight 157786 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157786/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e93c3712d67098453760fd61c338cbf62dd08da1
baseline version:
 xen                  8c8938dcc1bd37dd61f705410053e08804ca2b55

Last test of basis   157779  2020-12-21 23:00:27 Z    0 days
Testing same since   157786  2020-12-22 09:01:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Maximilian Engelhardt <maxi@daemonizer.de>

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
   8c8938dcc1..e93c3712d6  e93c3712d67098453760fd61c338cbf62dd08da1 -> smoke

