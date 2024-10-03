Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01A98F611
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809805.1222329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQZ9-0007yH-Pr; Thu, 03 Oct 2024 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809805.1222329; Thu, 03 Oct 2024 18:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQZ9-0007wB-Lg; Thu, 03 Oct 2024 18:28:43 +0000
Received: by outflank-mailman (input) for mailman id 809805;
 Thu, 03 Oct 2024 18:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swQZ8-0007w1-DQ; Thu, 03 Oct 2024 18:28:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swQZ8-0000ep-8m; Thu, 03 Oct 2024 18:28:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swQZ7-0001Lv-Q1; Thu, 03 Oct 2024 18:28:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swQZ7-0005p1-PS; Thu, 03 Oct 2024 18:28:41 +0000
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
	bh=IWq1h8HkCbNDLUo0uZJQNkcLxilohWBSxm0D+z34Ih0=; b=ANv/Q48jue7ZyaA45xZ6fwrLbU
	EzFUnQgZza+kMvsPNwViW26sm69/ab/96Y39qPHhvVApVjB21YILf3gQE+0mzl+pOXR/HskSV6o1C
	Zx/wabW1mkOHGIAvByXqEmwJijN4Bes4enHNxzJiRZ9ykyuk/8ZsOokpEb3KtBZw/NkQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187954-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187954: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=eb21ce14d709ef0c0030d0625028a4868c81126f
X-Osstest-Versions-That:
    xen=444cb9350f2c1cc202b6b86176ddd8e57525e2d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Oct 2024 18:28:41 +0000

flight 187954 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187954/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  eb21ce14d709ef0c0030d0625028a4868c81126f
baseline version:
 xen                  444cb9350f2c1cc202b6b86176ddd8e57525e2d9

Last test of basis   187950  2024-10-03 10:00:24 Z    0 days
Testing same since   187954  2024-10-03 14:02:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   444cb9350f..eb21ce14d7  eb21ce14d709ef0c0030d0625028a4868c81126f -> smoke

