Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA375C4D1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567469.886559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMnXO-00080a-8q; Fri, 21 Jul 2023 10:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567469.886559; Fri, 21 Jul 2023 10:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMnXO-0007yN-5g; Fri, 21 Jul 2023 10:39:06 +0000
Received: by outflank-mailman (input) for mailman id 567469;
 Fri, 21 Jul 2023 10:39:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMnXM-0007y2-TF; Fri, 21 Jul 2023 10:39:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMnXM-00024e-SP; Fri, 21 Jul 2023 10:39:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMnXM-0005jR-ID; Fri, 21 Jul 2023 10:39:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMnXM-0002a5-Hi; Fri, 21 Jul 2023 10:39:04 +0000
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
	bh=x04SAI3xoD+9evBP60+6KyOJaDfxMgAu3nIOWQENlw4=; b=JZz1gXcuV9Bgao1Az6izsiBzsC
	wtLALDv4lNW6Q6DBCHq73EVqb8Y0nDLzOZtsZO8tSiuZk2Ab9+n/Uiw/RLYSM0EJ2yxWpXcGZCXUG
	mLMV284U+k586BB8TqLK3tKNRrpHuQ4SVHRKNdqXzHoMgQMnW/6xuougC2guHPHCV2Ng=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181948-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181948: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0c53c638e16278078371ce028c74693841d7738a
X-Osstest-Versions-That:
    xen=1ab2ae1610d99423af5b810829959431e43de12d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jul 2023 10:39:04 +0000

flight 181948 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181948/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 181941

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0c53c638e16278078371ce028c74693841d7738a
baseline version:
 xen                  1ab2ae1610d99423af5b810829959431e43de12d

Last test of basis   181941  2023-07-20 23:03:34 Z    0 days
Testing same since   181948  2023-07-21 07:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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


Not pushing.

------------------------------------------------------------
commit 0c53c638e16278078371ce028c74693841d7738a
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jul 21 08:32:43 2023 +0200

    tools/xenstore: fix XSA-417 patch
    
    The fix for XSA-417 had a bug: domain_alloc_permrefs() will not return
    a negative value in case of an error, but a plain errno value.
    
    Note this is not considered to be a security issue, as the only case
    where domain_alloc_permrefs() will return an error is a failed memory
    allocation. As a guest should not be able to drive Xenstore out of
    memory, this is NOT a problem a guest can trigger at will.
    
    Fixes: ab128218225d ("tools/xenstore: fix checking node permissions")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 65fc6d8c92bc339d8ed874c5821e0e65101f6c52
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jul 21 08:32:15 2023 +0200

    x86/mtrr: address violations of MISRA C:2012 Rule 8.3 on parameter types
    
    Change parameter types of function declarations to be consistent with
    the ones used in the corresponding definitions,
    thus addressing violations of MISRA C:2012 Rule 8.3 ("All declarations
    of an object or function shall use the same names and type qualifiers").
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 652d8fbb8182f0b9a57ba371c24d21e0a981ee07
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jul 21 08:31:42 2023 +0200

    x86/HVM: address violations of MISRA C:2012 Rules 8.2 and 8.3
    
    Give a name to unnamed parameters thus addressing violations of
    MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
    named parameters").
    Keep consistency between parameter names and types used in function
    declarations and the ones used in the corresponding function
    definitions, thus addressing violations of MISRA C:2012 Rule 8.3
    ("All declarations of an object or function shall use the same names
    and type qualifiers").
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 60576722d0523122ce34c81b91fd1eafac8f7f5f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 21 08:31:09 2023 +0200

    x86/vRTC: move and tidy convert_hour() and {to,from}_bcd()
    
    This is to avoid the need for forward declarations, which in turn
    addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations of an
    object or function shall use the same names and type qualifiers").
    
    While doing so,
    - drop inline (leaving the decision to the compiler),
    - add const,
    - add unsigned,
    - correct style.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit cd5048353725f37746da231202feaf5b88ceb46a
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Fri Jul 21 08:30:29 2023 +0200

    xen: address MISRA C:2012 Rule 4.1
    
    MISRA C:2012 Rule 4.1 has the following headline:
    "Octal and hexadecimal escape sequences shall be terminated."
    
    The string literals modified by this patch contain octal or
    hexadecimal escape sequences that are neither terminated by the
    end of the literal, nor by the beginning of another escape sequence.
    
    Therefore, such unterminated sequences have been split into a
    separate literal as a way to comply with the rule and preserve the
    semantics of the code.
    
    No functional changes.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

