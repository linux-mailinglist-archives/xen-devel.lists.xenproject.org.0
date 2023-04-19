Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAE6E79F1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523426.813461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7EZ-0002C2-0k; Wed, 19 Apr 2023 12:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523426.813461; Wed, 19 Apr 2023 12:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7EY-0002AG-Td; Wed, 19 Apr 2023 12:48:26 +0000
Received: by outflank-mailman (input) for mailman id 523426;
 Wed, 19 Apr 2023 12:48:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp7EX-0002A6-1h; Wed, 19 Apr 2023 12:48:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp7EW-0004LP-QS; Wed, 19 Apr 2023 12:48:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pp7EW-0007bt-IA; Wed, 19 Apr 2023 12:48:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pp7EW-00019q-Hi; Wed, 19 Apr 2023 12:48:24 +0000
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
	bh=NgqvswyJ/R3SbDTvB6ArLFnBtyc4zkRPHKz+TcGk/PY=; b=LGKN5h77RUXXUFN68p6XnfMBk+
	45n78MwZrJmPRWvPze3j+BY+1PQgArjqu3TW2XHJLXiE1MsxMxT6Tx6SvYCyzsHC0d4iBJV7vtUMy
	eb8uqlR/m08QrpGMeRE4T1SIM7mEOaL69ntO8GTOboBIbyteFQ44dULzoABGKt9/uWa0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180314-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180314: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:hosts-allocate:broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=569632a5832c02bd84790e0411940b8d3150fa17
X-Osstest-Versions-That:
    xen=8676092a0f16ca6ad188d3fb270784a2caecf542
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Apr 2023 12:48:24 +0000

flight 180314 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180314/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           3 hosts-allocate         broken REGR. vs. 180302

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  569632a5832c02bd84790e0411940b8d3150fa17
baseline version:
 xen                  8676092a0f16ca6ad188d3fb270784a2caecf542

Last test of basis   180302  2023-04-18 20:01:55 Z    0 days
Testing same since   180314  2023-04-19 10:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl hosts-allocate

Not pushing.

------------------------------------------------------------
commit 569632a5832c02bd84790e0411940b8d3150fa17
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Apr 19 11:03:30 2023 +0200

    CHANGELOG: add gnttab_max_{maptrack_,}frames option changes
    
    Note in the changelog that the purpose of
    gnttab_max_{maptrack_,}frames command line options has been changed.
    
    Fixes: b2ea81d2b935 ('xen/grants: repurpose command line max options')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Henry Wang <Henry.Wang@arm.com>

commit 768846690d64bc730c1a1123e8de3af731bb2eb3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 19 11:02:47 2023 +0200

    x86: fix build with old gcc after CPU policy changes
    
    Old gcc won't cope with initializers involving unnamed struct/union
    fields.
    
    Fixes: 441b1b2a50ea ("x86/emul: Switch x86_emulate_ctxt to cpu_policy")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 741599fa521fbbb4cf71a98d7ec22ba5f4671cfa
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 19 11:01:29 2023 +0200

    x86: cpu{id,}_policy_updated() can be static
    
    The function merely needs moving earlier in the file to avoid the need
    for a forward declaration. While moving it, also rename it following the
    recent folding of CPUID and MSR policies.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 224211c55bdded74c5a65f5a7e34281a8c5c56f2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 19 11:00:19 2023 +0200

    tests/cpu-policy: fix "run" goal
    
    An earlier change converted TARGET-y to TARGETS, but failed to replace
    all references. Convert run's dependency, but use $< in the command to
    avoid the leading blank that += inserts.
    
    Fixes: 6a9f5477637a ("tests/cpu-policy: Rework Makefile")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

