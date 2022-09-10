Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898FC5B4363
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 02:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404596.647146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWoKG-0003VM-J6; Sat, 10 Sep 2022 00:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404596.647146; Sat, 10 Sep 2022 00:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWoKG-0003Sp-Fa; Sat, 10 Sep 2022 00:26:24 +0000
Received: by outflank-mailman (input) for mailman id 404596;
 Sat, 10 Sep 2022 00:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oWoKE-0003Sd-Iq; Sat, 10 Sep 2022 00:26:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oWoKE-0007P7-H8; Sat, 10 Sep 2022 00:26:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oWoKE-0001Mo-0q; Sat, 10 Sep 2022 00:26:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oWoKE-00049G-01; Sat, 10 Sep 2022 00:26:22 +0000
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
	bh=GSjtNZok0UrvF7etgrqgB6jfWH2qRdvOz7CqNOcfeAs=; b=EIzAMzDMXBr+uwIdHV83E0QwDI
	e2Lk3LKUthaGNyk+7Y1siUdD5VOwfaY9n0YeiGc4b77zyFLYzBZMlxgvSWr6ItfzyGMokNaPznyOo
	tK/fcxakJlmGIcIF08CFRryQDzY8x/xkH7XHI9/eNKS/6b/Zy/HuRJXvxs3r50ptnrsw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173096-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173096: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:debian-install:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=52daa6a8483e4fbd6757c9d1b791e23931791608
X-Osstest-Versions-That:
    xen=9066d877bf57a47b0f09741dac996ee1055d6407
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Sep 2022 00:26:22 +0000

flight 173096 xen-unstable-smoke real [real]
flight 173099 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173096/
http://logs.test-lab.xenproject.org/osstest/logs/173099/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          12 debian-install           fail REGR. vs. 173090

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 173090
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  52daa6a8483e4fbd6757c9d1b791e23931791608
baseline version:
 xen                  9066d877bf57a47b0f09741dac996ee1055d6407

Last test of basis   173090  2022-09-09 10:01:57 Z    0 days
Testing same since   173096  2022-09-09 17:03:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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
commit 52daa6a8483e4fbd6757c9d1b791e23931791608
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Sep 9 14:53:47 2022 +0200

    xen/gnttab: fix gnttab_acquire_resource()
    
    Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
    warning") was wrong, as vaddrs can legitimately be NULL in case
    XENMEM_resource_grant_table_id_status was specified for a grant table
    v1. This would result in crashes in debug builds due to
    ASSERT_UNREACHABLE() triggering.
    
    Check vaddrs only to be NULL in the rc == 0 case.
    
    Expand the tests in tools/tests/resource to tickle this path, and verify that
    using XENMEM_resource_grant_table_id_status on a v1 grant table fails.
    
    Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com> # xen
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

