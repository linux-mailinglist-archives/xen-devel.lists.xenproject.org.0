Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1F915E2B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 07:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747165.1154494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLymA-00082n-Cp; Tue, 25 Jun 2024 05:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747165.1154494; Tue, 25 Jun 2024 05:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLymA-00080D-9P; Tue, 25 Jun 2024 05:31:30 +0000
Received: by outflank-mailman (input) for mailman id 747165;
 Tue, 25 Jun 2024 05:31:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLym8-000803-KM; Tue, 25 Jun 2024 05:31:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLym8-0007XS-7f; Tue, 25 Jun 2024 05:31:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLym7-00043M-Sb; Tue, 25 Jun 2024 05:31:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sLym7-0000CR-S6; Tue, 25 Jun 2024 05:31:27 +0000
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
	bh=kJVRie+R02PQik/n6N9k6w+Qg8V1rAlp8JaXe5W1g6g=; b=iYdl+TXyoCG0rzXO8It8Uq5Phx
	/+vUqsgB7gX5a4NJWyV9N7q1u4HsGvTdU0lCT/2FCzwWcv991yS5ItR0fy5y4d5V5B2k6SxPv6lDG
	Hwcz3SYbKhs2cvMNYFG99x++TcYUWe6Ck8mV6dNbppbbzMvqqoEPjfoBVauBdjuWERRU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186473-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186473: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-saverestore:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b14dae96c07ef27cc7f8107ddaa16989e9ab024b
X-Osstest-Versions-That:
    xen=c56f1ef577831ec70645ca5874d54f2e698c6761
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 05:31:27 +0000

flight 186473 xen-unstable-smoke real [real]
flight 186476 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186473/
http://logs.test-lab.xenproject.org/osstest/logs/186476/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 15 guest-saverestore fail REGR. vs. 186470

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b14dae96c07ef27cc7f8107ddaa16989e9ab024b
baseline version:
 xen                  c56f1ef577831ec70645ca5874d54f2e698c6761

Last test of basis   186470  2024-06-24 19:02:11 Z    0 days
Testing same since   186473  2024-06-25 01:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
commit b14dae96c07ef27cc7f8107ddaa16989e9ab024b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 21 21:57:59 2024 +0100

    x86/pagewalk: Address MISRA R8.3 violation in guest_walk_tables()
    
    Commit 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
    intentionally renamed guest_walk_tables()'s 'pfec' parameter to 'walk' because
    it's not a PageFault Error Code, despite the name of some of the constants
    passed in.  Sadly the constants-cleanup I've been meaning to do since then
    still hasn't come to pass.
    
    Update the declaration to match, to placate MISRA.
    
    Fixes: 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 6e07f41b27c3267e4528327ebc44dd03ac869ae3
Author: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Date:   Fri Jun 21 15:40:47 2024 +0200

    common/unlzo: address violation of MISRA C Rule 7.3
    
    This addresses violations of MISRA C:2012 Rule 7.3 which states as
    following: the lowercase character `l' shall not be used in a literal
    suffix.
    
    The file common/unlzo.c defines the non-compliant constant LZO_BLOCK_SIZE with
    having a lowercase 'l'.
    It is now defined as '256*1024L'.
    
    No functional change.
    
    Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit c2f4ea4dc9eba454dc2e761bfd39ccb72870d268
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jun 21 17:32:41 2024 +0200

    automation/eclair: add more guidelines to the monitored set
    
    Add more accepted guidelines to the monitored set to check them at each
    commit.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 5add709cc6595af95e181091dbbf6e00aae836e3
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Thu Jun 20 14:50:34 2024 +0200

    automation/eclair: add deviations of MISRA C Rule 5.5
    
    MISRA C Rule 5.5 states that "Identifiers shall be distinct from macro
    names".
    
    Update ECLAIR configuration to deviate:
    - macros expanding to their own name;
    - clashes between macros and non-callable entities;
    - clashes related to the selection of specific implementations of string
      handling functions.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 912412f97a293f5e1deece134d78c52b1b0b8856
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jun 14 11:15:38 2024 +0200

    automation/eclair: add deviation for MISRA C Rule 17.7
    
    Update ECLAIR configuration to deviate some cases where not using
    the return value of a function is not dangerous.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(qemu changes not included)

