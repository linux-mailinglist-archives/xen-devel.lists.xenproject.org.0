Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F09D6E8268
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 22:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523799.814208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE8v-0000cB-SN; Wed, 19 Apr 2023 20:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523799.814208; Wed, 19 Apr 2023 20:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE8v-0000ZY-Oz; Wed, 19 Apr 2023 20:11:05 +0000
Received: by outflank-mailman (input) for mailman id 523799;
 Wed, 19 Apr 2023 20:11:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppE8u-0000ZJ-P5; Wed, 19 Apr 2023 20:11:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppE8u-0007gD-J3; Wed, 19 Apr 2023 20:11:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppE8u-00084l-7Y; Wed, 19 Apr 2023 20:11:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppE8u-0003rG-76; Wed, 19 Apr 2023 20:11:04 +0000
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
	bh=w64XKtEYXIRq8vwqnHJaUrQUAQKM4vomDVEkVsKV5W0=; b=ChZrbow0aTuQoQRP12cmHSiSs7
	dDRmiAfwidRlulxL0mY8rxBlfx/s6lJ2U0RRec/sFeQOw/3BR3Lo5RQdcE+5g2WEt01981UwNQooD
	Bo7g5acEtxMEhqwHtFE0XYwSgJOFy0UFBjMDe2IVpTF06YOlgl+1hYFmQyUb9D4kY4Lg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180321-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180321: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:hosts-allocate:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e74360e4ba4a6b6827a44f8b1b22a0ec4311694a
X-Osstest-Versions-That:
    xen=8676092a0f16ca6ad188d3fb270784a2caecf542
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Apr 2023 20:11:04 +0000

flight 180321 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180321/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   2 hosts-allocate         broken REGR. vs. 180302

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e74360e4ba4a6b6827a44f8b1b22a0ec4311694a
baseline version:
 xen                  8676092a0f16ca6ad188d3fb270784a2caecf542

Last test of basis   180302  2023-04-18 20:01:55 Z    1 days
Failing since        180314  2023-04-19 10:00:24 Z    0 days    4 attempts
Testing same since   180321  2023-04-19 18:01:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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

broken-job build-armhf broken
broken-step build-armhf hosts-allocate

Not pushing.

------------------------------------------------------------
commit e74360e4ba4a6b6827a44f8b1b22a0ec4311694a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 13 20:56:15 2023 +0100

    xen/livepatch: Fix .altinstructions safety checks
    
    The prior check has && vs || mixups, making it tautologically false and thus
    providing no safety at all.  There are boundary errors too.
    
    First start with a comment describing how the .altinstructions and
    .altinstr_replacement sections interact, and perform suitable cross-checking.
    
    Second, rewrite the alt_instr loop entirely from scratch.  Origin sites have
    non-zero size, and must be fully contained within the livepatches .text
    section(s).  Any non-zero sized replacements must be fully contained within
    the .altinstr_replacement section.
    
    Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

commit 418cf59c4e29451010d7efb3835b900690d19866
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sun Apr 16 01:10:43 2023 +0100

    arm/alternatives: Rename alt_instr fields which are used in common code
    
    Alternatives auditing for livepatches is currently broken.  To fix it, the
    livepatch code needs to inspect more fields of alt_instr.
    
    Rename ARM's fields to match x86's, because:
    
     * ARM already exposes alt_offset under the repl name via ALT_REPL_PTR().
     * "alt" is ambiguous in a structure entirely about alternatives already.
     * "repl", being the same width as orig leads to slightly neater code.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit cfa2bb82c01f0c656804cedd8f44eb2a99a2b5bc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sun Apr 16 01:29:09 2023 +0100

    xen/ELF: Fix ELF32 PRI formatters
    
    It is rude to hide width formatting inside a PRI* macro, doubly so when it's
    only in one bitness of the macro.
    
    However its fully buggy when all the users use %#"PRI because then it expands
    to the common trap of %#08x which does not do what the author intends.
    
    Switch the 32bit ELF PRI formatters to use plain integer PRI's, just like on
    the 64bit side already.  No practical change.
    
    Fixes: 7597fabca76e ("livepatch: Include sizes when an mismatch occurs")
    Fixes: 380b229634f8 ("xsplice: Implement payload loading")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

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

