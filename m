Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450317417F6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 20:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556544.869148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZpF-0002Pb-LQ; Wed, 28 Jun 2023 18:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556544.869148; Wed, 28 Jun 2023 18:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZpF-0002NM-IJ; Wed, 28 Jun 2023 18:23:33 +0000
Received: by outflank-mailman (input) for mailman id 556544;
 Wed, 28 Jun 2023 18:23:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEZpD-0002NC-P8; Wed, 28 Jun 2023 18:23:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEZpD-0002Ox-OG; Wed, 28 Jun 2023 18:23:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEZpD-0004nw-4w; Wed, 28 Jun 2023 18:23:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEZpD-00048p-4V; Wed, 28 Jun 2023 18:23:31 +0000
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
	bh=+glZRiXcXF7mk3ZIHkyge2tXCZe5MP0MaEjqOWNNDm0=; b=gJUCO1I6ySYyROkz7dGXmAsIPs
	/qWcE6HA0BVpPU8kvqxL2BJk6QiriR1zCrKq7i6iaaqX7TcfqYT5pNxsW3oVstNOh5lLNYHmH7gu3
	PSroTUMdo0cgtG1uDUw7UxlYvR+yo172ycEZtM2RzVgvGMbrxpQmxMXX89Yc0UswkDc4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181627-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181627: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6c32a08e2b7e6d796081ed84c84ad682bcc4b3a6
X-Osstest-Versions-That:
    xen=5c84f1f636981dab5341e84aaba8d4dd00bbc2cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 18:23:31 +0000

flight 181627 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181627/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 181547

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6c32a08e2b7e6d796081ed84c84ad682bcc4b3a6
baseline version:
 xen                  5c84f1f636981dab5341e84aaba8d4dd00bbc2cb

Last test of basis   181547  2023-06-22 03:02:21 Z    6 days
Testing same since   181627  2023-06-28 16:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
commit 6c32a08e2b7e6d796081ed84c84ad682bcc4b3a6
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 20 17:36:19 2023 +0100

    x86/vpmu: Simplify is_pmc_quirk
    
    This should be static, and there's no need for a separate (non-init, even)
    function to perform a simple equality test.  Drop the is_ prefix which is
    gramatically questionable, and make it __ro_after_init.
    
    Leave a TODO, because the behaviour is definitely wrong to be applied to all
    modern Intel CPUs.  The question has been raised on xen-devel previously
    without conclusion.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

