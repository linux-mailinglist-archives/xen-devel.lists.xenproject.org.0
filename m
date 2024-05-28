Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBBA8D18B1
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 12:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731082.1136408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBuBl-0000zI-3Q; Tue, 28 May 2024 10:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731082.1136408; Tue, 28 May 2024 10:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBuBl-0000x7-0Z; Tue, 28 May 2024 10:36:17 +0000
Received: by outflank-mailman (input) for mailman id 731082;
 Tue, 28 May 2024 10:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBuBj-0000wx-CI; Tue, 28 May 2024 10:36:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBuBj-0002u6-6c; Tue, 28 May 2024 10:36:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBuBi-00021g-Vf; Tue, 28 May 2024 10:36:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sBuBi-00040V-VD; Tue, 28 May 2024 10:36:14 +0000
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
	bh=1m8qx6mEe6gdNMs3zu9lnat5v18BMwKXa6w6j5Hic0w=; b=KGpZyKaZXZ6soKPx8sGVbmvvvh
	Ub7xEKoBVPh5q3JyJhWc2Jm9JaWq63SVDh3aPzRwDJTFvePsAYb08d+9nWaZzjOuWHWTb09h6RrAC
	vB8feNKvgNq00W3CRpqe8N/p4JNE6YZxDbILEbWSa1AEnkgbNo6jTbVsdHeLPC/pRhRo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186166-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186166: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2d93f78bfe25f695d8ffb61d110da9df293ed71b
X-Osstest-Versions-That:
    xen=96af090e33130b0bf0953f3ccab8e7a163392318
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 May 2024 10:36:14 +0000

flight 186166 xen-unstable-smoke real [real]
flight 186167 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186166/
http://logs.test-lab.xenproject.org/osstest/logs/186167/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 186164

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2d93f78bfe25f695d8ffb61d110da9df293ed71b
baseline version:
 xen                  96af090e33130b0bf0953f3ccab8e7a163392318

Last test of basis   186164  2024-05-28 02:00:23 Z    0 days
Testing same since   186166  2024-05-28 07:02:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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


Not pushing.

------------------------------------------------------------
commit 2d93f78bfe25f695d8ffb61d110da9df293ed71b
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Tue May 28 08:52:27 2024 +0200

    x86/traps: address violation of MISRA C Rule 8.4
    
    Rule 8.4 states: "A compatible declaration shall be visible when
    an object or function with external linkage is defined".
    
    The function do_general_protection is either used is asm code
    or only within this unit, so there is no risk of this getting
    out of sync with its definition, but the function must remain
    extern.
    
    Therefore, this function is deviated using a comment-based deviation.
    No functional change.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 8b977fe57254ff8d343e4bf50cf98fa6c2b36b8b
Author: Jason Andryuk <jason.andryuk@amd.com>
Date:   Tue May 28 08:52:15 2024 +0200

    CHANGELOG: Mention libxl blktap/tapback support
    
    Add entry for backendtype=tap support in libxl.  blktap needs some
    changes to work with libxl, which haven't been merged.  They are
    available from this PR: https://github.com/xapi-project/blktap/pull/394
    
    Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(qemu changes not included)

