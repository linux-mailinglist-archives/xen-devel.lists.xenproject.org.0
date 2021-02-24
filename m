Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA7323F19
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 15:13:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89369.168257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuuG-000775-HN; Wed, 24 Feb 2021 14:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89369.168257; Wed, 24 Feb 2021 14:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuuG-00076b-Dm; Wed, 24 Feb 2021 14:12:48 +0000
Received: by outflank-mailman (input) for mailman id 89369;
 Wed, 24 Feb 2021 14:12:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEuuE-00076T-Ib; Wed, 24 Feb 2021 14:12:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEuuE-0006yq-DD; Wed, 24 Feb 2021 14:12:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEuuE-0004Ze-5b; Wed, 24 Feb 2021 14:12:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lEuuE-00061S-56; Wed, 24 Feb 2021 14:12:46 +0000
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
	bh=3iTksSRhvUWznluwgLcMWea0T6QdqJzPiHKFIOgJcuA=; b=jtgR7iCmqa6guU6K+ILkTbA3Cd
	43y43NmR/Ep7o1m5tWBk6WYl8wpoicwUTnvfrbywvOEIaDkxE26tjgvDURm1iBm0QRm4JRqCzMEM0
	TwR+BQg5RU76FUz2pD4WbL4V/pdQvPe3LVk34lfRiHhX5TiG1/6sS3NtHhLRBFPgxMoA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159624-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159624: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=81b2b328a26c1b89c275898d12e8ab26c0673dad
X-Osstest-Versions-That:
    xen=5d94433a66df29ce314696a13bdd324ec0e342fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 14:12:46 +0000

flight 159624 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159624/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 159600

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  81b2b328a26c1b89c275898d12e8ab26c0673dad
baseline version:
 xen                  5d94433a66df29ce314696a13bdd324ec0e342fe

Last test of basis   159600  2021-02-23 20:01:30 Z    0 days
Testing same since   159624  2021-02-24 12:01:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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


Not pushing.

------------------------------------------------------------
commit 81b2b328a26c1b89c275898d12e8ab26c0673dad
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Feb 24 12:48:13 2021 +0100

    hvmloader: use Xen private header for elf structs
    
    Do not use the system provided elf.h, and instead use elfstructs.h
    from libelf.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Feb 24 12:47:34 2021 +0100

    build: remove more absolute paths from dependency tracking files
    
    d6b12add90da ("DEPS handling: Remove absolute paths from references to
    cwd") took care of massaging the dependencies of the output file, but
    for our passing of -MP to the compiler to take effect the same needs to
    be done on the "phony" rules that the compiler emits.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

