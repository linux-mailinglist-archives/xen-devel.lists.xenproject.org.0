Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4895CDDA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 15:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782356.1191834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shUMl-000388-Hp; Fri, 23 Aug 2024 13:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782356.1191834; Fri, 23 Aug 2024 13:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shUMl-00035G-Ec; Fri, 23 Aug 2024 13:30:11 +0000
Received: by outflank-mailman (input) for mailman id 782356;
 Fri, 23 Aug 2024 13:30:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shUMk-000356-9k; Fri, 23 Aug 2024 13:30:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shUMk-0007oG-69; Fri, 23 Aug 2024 13:30:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shUMj-0002ZX-NH; Fri, 23 Aug 2024 13:30:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1shUMj-0004TU-Mc; Fri, 23 Aug 2024 13:30:09 +0000
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
	bh=r4dOWORI1X8Z/NZWjheD+jLvBNMcE2RQvFzAnQDmroo=; b=fosEmr8r7jmTcmciC33vzvtFHk
	0lhLj1Wpe7xCR0dVn+gU8BMEKvQp1ZK4BleVQ/HUGTymhKJYdTTTBtBMHg8Sqm7WVnuEXbG6FDZkx
	TC4irjbgsypm0W3HZ06oz5/QpbWsNXaRQAa6Miyd33FjlOCbQewMDUCe8CMbY3O+qSHs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187320: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-saverestore:fail:regression
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-localmigrate:fail:allowable
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5231765a4e6528a3208e49885b9eeff42519a6c1
X-Osstest-Versions-That:
    xen=aa80a04df488528d90a0d892f0752571b1759e8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Aug 2024 13:30:09 +0000

flight 187320 xen-unstable-smoke real [real]
flight 187323 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187320/
http://logs.test-lab.xenproject.org/osstest/logs/187323/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     17 guest-saverestore        fail REGR. vs. 187314

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 16 guest-localmigrate fail REGR. vs. 187314

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5231765a4e6528a3208e49885b9eeff42519a6c1
baseline version:
 xen                  aa80a04df488528d90a0d892f0752571b1759e8b

Last test of basis   187314  2024-08-22 21:04:01 Z    0 days
Testing same since   187320  2024-08-23 08:02:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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
commit 5231765a4e6528a3208e49885b9eeff42519a6c1
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 23 09:13:07 2024 +0200

    x86emul: convert op_bytes/opc checks in SIMD emulation
    
    Raising #UD for an internal shortcoming of the emulator isn't quite
    right. Similarly BUG() is bigger a hammer than needed.
    
    Switch to using EXPECT() instead. This way even for insns not covered by
    the test harness fuzzers will have a chance of noticing issues, should
    any still exist or new ones be introduced.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6fa6b7feaafd622db3a2f3436750cf07782f4c12
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 23 09:12:24 2024 +0200

    x86emul: set (fake) operand size for AVX512CD broadcast insns
    
    Back at the time I failed to pay attention to op_bytes still being zero
    when reaching the respective case block: With the ext0f38_table[]
    entries having simd_packed_int, the defaulting at the bottom of
    x86emul_decode() won't set the field to non-zero for F3-prefixed insns.
    
    Fixes: 37ccca740c26 ("x86emul: support AVX512CD insns")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d45687cca2450bfebe1dfbddb22f4f03c6fbc9cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 23 09:11:15 2024 +0200

    x86emul: always set operand size for AVX-VNNI-INT8 insns
    
    Unlike for AVX-VNNI-INT16 I failed to notice that op_bytes may still be
    zero when reaching the respective case block: With the ext0f38_table[]
    entries having simd_packed_int, the defaulting at the bottom of
    x86emul_decode() won't set the field to non-zero for F3- or F2-prefixed
    insns.
    
    Fixes: 842acaa743a5 ("x86emul: support AVX-VNNI-INT8")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

