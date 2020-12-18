Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC02DE958
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 19:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56649.99205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqKsq-0006pV-Di; Fri, 18 Dec 2020 18:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56649.99205; Fri, 18 Dec 2020 18:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqKsq-0006p3-9q; Fri, 18 Dec 2020 18:53:44 +0000
Received: by outflank-mailman (input) for mailman id 56649;
 Fri, 18 Dec 2020 18:53:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqKso-0006ov-Rc; Fri, 18 Dec 2020 18:53:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqKso-0005gq-Jw; Fri, 18 Dec 2020 18:53:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqKso-0003Ny-Ch; Fri, 18 Dec 2020 18:53:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kqKso-00042C-CB; Fri, 18 Dec 2020 18:53:42 +0000
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
	bh=s9ie8fGjGxw2GTrjg8HVPBayE7wXjRRCFdv6OHZ7Zm0=; b=LuvYCIayGQ7Sr12WIhDMErOwy1
	jT4y9nixZGMudz/0j2wBQu90xAl2PueFlBQAPEWCv+4Sh7u2vYtg0+XGiWiHmuAR0+W+Lv0V0KoNG
	5N9k/DS4lXMi9wRE40KSZQlTAbKQY6fzW5e9aoHhYcT/kDkR76Kg9JMH9mqS6WF7hFO0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 157679: regressions - FAIL
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
    xen=8009c33b5179536e2ecce54462fe4cd069060f77
X-Osstest-Versions-That:
    xen=7a3b691a8f3aa7720eecaab0e7bd090aa392885a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Dec 2020 18:53:42 +0000

flight 157679 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157679/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 157656

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8009c33b5179536e2ecce54462fe4cd069060f77
baseline version:
 xen                  7a3b691a8f3aa7720eecaab0e7bd090aa392885a

Last test of basis   157656  2020-12-17 23:02:14 Z    0 days
Testing same since   157668  2020-12-18 13:00:30 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Wei Liu <wl@xen.org>

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
commit 8009c33b5179536e2ecce54462fe4cd069060f77
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:29:14 2020 +0100

    x86/mm: p2m_add_foreign() is HVM-only
    
    This is the case also for xenmem_add_to_physmap_one(), as is it's only
    caller of the function. Move the latter next to p2m_add_foreign(),
    allowing it one to become static at the same time. While moving, adjust
    indentation of the body of the main switch().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 173ae325026bd161ae5eecebda28dab2c7a80668
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:28:30 2020 +0100

    x86/p2m: tidy p2m_add_foreign() a little
    
    Drop a bogus ASSERT() - we don't typically assert incoming domain
    pointers to be non-NULL, and there's no particular reason to do so here.
    
    Replace the open-coded DOMID_SELF check by use of
    rcu_lock_remote_domain_by_id(), at the same time covering the request
    being made with the current domain's actual ID.
    
    Move the "both domains same" check into just the path where it really
    is meaningful.
    
    Swap the order of the two puts, such that
    - the p2m lock isn't needlessly held across put_page(),
    - a separate put_page() on an error path can be avoided,
    - they're inverse to the order of the respective gets.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f772b592b75d3144174d4c645b916f2718d9cce5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:25:40 2020 +0100

    lib: move sort code
    
    Build this code into an archive, partly paralleling bsearch().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 7c3af561acb70ddd16069b9c9cab3ce503a10987
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:23:42 2020 +0100

    lib: move bsearch code
    
    Convert this code to an inline function (backed by an instance in an
    archive in case the compiler decides against inlining), which results
    in not having it in x86 final binaries. This saves a little bit of dead
    code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit c54212261dc3305429344fe1d1cb298b30830155
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:22:54 2020 +0100

    lib: move rbtree code
    
    Build this code into an archive, which results in not linking it into
    x86 final binaries. This saves about 1.5k of dead code.
    
    While moving the source file, take the opportunity and drop the
    pointless EXPORT_SYMBOL() and an instance of trailing whitespace.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 3b1d8eb4744d210abcd1c033bf07d20345b926ba
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:22:10 2020 +0100

    lib: move init_constructors()
    
    ... into its own CU, for being unrelated to other things in
    common/lib.c.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 65fdf25768deba4e8bea751773f2ec4f7ff67ea5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:21:25 2020 +0100

    lib: move parse_size_and_unit()
    
    ... into its own CU, to build it into an archive.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 26dfde919cac720c29d076bc8fd38ad0af1b2abb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:20:42 2020 +0100

    lib: move list sorting code
    
    Build the source file always, as by putting it into an archive it still
    won't be linked into final binaries when not needed. This way possible
    build breakage will be easier to notice, and it's more consistent with
    us unconditionally building other library kind of code (e.g. sort() or
    bsearch()).
    
    While moving the source file, take the opportunity and drop the
    pointless EXPORT_SYMBOL() and an unnecessary #include.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit f301f9a9e84f3cfd18750065f8a3794c8182c7f0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Dec 18 13:17:57 2020 +0100

    lib: collect library files in an archive
    
    In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
    just to avoid bloating binaries when only some arch-es and/or
    configurations need generic library routines, combine objects under lib/
    into an archive, which the linker then can pick the necessary objects
    out of.
    
    Note that we can't use thin archives just yet, until we've raised the
    minimum required binutils version suitably.
    
    Note further that --start-group / --end-group get put in place right
    away to allow for symbol resolution across all archives, once we gain
    multuiple ones.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

