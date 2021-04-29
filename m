Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06736F0C6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 22:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120201.227321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcCsq-0005oJ-AB; Thu, 29 Apr 2021 20:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120201.227321; Thu, 29 Apr 2021 20:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcCsq-0005nq-6J; Thu, 29 Apr 2021 20:03:36 +0000
Received: by outflank-mailman (input) for mailman id 120201;
 Thu, 29 Apr 2021 20:03:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcCso-0005nf-J2; Thu, 29 Apr 2021 20:03:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcCso-0003rP-Ef; Thu, 29 Apr 2021 20:03:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcCso-0007ZB-83; Thu, 29 Apr 2021 20:03:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lcCso-0005sm-7a; Thu, 29 Apr 2021 20:03:34 +0000
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
	bh=oh8kl3NBWRkOP+QcTcPAu/1ZF0nALcnBBe7c9iNmMZY=; b=KTkImwKiDHH/uRwKtJi+E2rLqy
	CZkhYOK6tjmV1P5KoPcpIf4oWm7Tf6wS9EgG/Y1Kr4/Whm/5ATRWGJCz0yS0loCKN3Lgx/xH0vzPK
	S8ftR3ZZvIKRXN4KgBFqleTaPrPr/AHm3sFwRix3SINN3EH0OCV18enEJoIfXyRJSLPc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161525-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 161525: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=39e7a942738f1ef48878fff67d140bbc0c83e7ff
X-Osstest-Versions-That:
    xen=972ba1d1d4bcb77018b50fd2bb63c0e628859ed3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Apr 2021 20:03:34 +0000

flight 161525 xen-unstable-smoke real [real]
flight 161528 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/161525/
http://logs.test-lab.xenproject.org/osstest/logs/161528/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 161483

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  39e7a942738f1ef48878fff67d140bbc0c83e7ff
baseline version:
 xen                  972ba1d1d4bcb77018b50fd2bb63c0e628859ed3

Last test of basis   161483  2021-04-27 13:00:27 Z    2 days
Testing same since   161525  2021-04-29 15:01:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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


Not pushing.

------------------------------------------------------------
commit 39e7a942738f1ef48878fff67d140bbc0c83e7ff
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Apr 29 16:05:00 2021 +0200

    x86/oprofile: remove compat accessors usage from backtrace
    
    Remove the unneeded usage of the compat layer to copy frame pointers
    from guest address space. Instead just use raw_copy_from_guest.
    
    While there change the accessibility check of one frame_head beyond to
    be performed as part of the copy, like it's done in the Linux code in
    5.11 and earlier versions. Note it's unclear why this is needed.
    
    Also drop the explicit truncation of the head pointer in the 32bit
    case as all callers already pass a zero extended value. The first
    value being rsp from the guest registers, and further calls will use
    ebp from frame_head_32bit struct.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 9a5071e80be67e7a480ef9ba9680af6754198cdb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 29 16:04:35 2021 +0200

    x86: correct comment about alternatives ordering
    
    Unlike Linux, Xen has never (so far) used alternatives patching for
    memcpy() or memset(), even less such utilizing multiple alternatives.
    Correct the Linux-inherited comment to match reality.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 111c8c33a8a18588f3da3c5dbb7f5c63ddb98ce5
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Apr 29 16:04:11 2021 +0200

    x86/cpuid: do not expand max leaves on restore
    
    When restoring limit the maximum leaves to the ones supported by Xen
    4.12 in order to not expand the maximum leaves a guests sees. Note
    this is unlikely to cause real issues.
    
    Guests restored from Xen versions 4.13 or greater will contain CPUID
    data on the stream that will override the values set by
    xc_cpuid_apply_policy.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit ec0ec164877be4e99dfef2ae27eea4ca6460cdf7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 29 16:03:38 2021 +0200

    xen/decompress: drop STATIC and INIT
    
    Except for one last instance, all users have been removed in earlier
    changes.
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 2c6af6c7bbaa7c6b6945c0d4cd88aeebec5e85fd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 29 16:02:59 2021 +0200

    unzstd: replace INIT and STATIC
    
    With xen/common/decompress.h now agreeing in both build modes about
    what STATIC expands to, there's no need for these abstractions anymore.
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

