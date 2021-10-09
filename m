Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF1427591
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 04:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205023.360268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ1lV-00067K-Aq; Sat, 09 Oct 2021 02:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205023.360268; Sat, 09 Oct 2021 02:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ1lV-00064I-45; Sat, 09 Oct 2021 02:07:09 +0000
Received: by outflank-mailman (input) for mailman id 205023;
 Sat, 09 Oct 2021 02:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZ1lT-000648-2p; Sat, 09 Oct 2021 02:07:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZ1lS-00086h-S4; Sat, 09 Oct 2021 02:07:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZ1lS-0004jh-Ix; Sat, 09 Oct 2021 02:07:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mZ1lS-0000Dm-IS; Sat, 09 Oct 2021 02:07:06 +0000
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
	bh=M1aP5mSddOEltarLWmp+LujWXpPUboWQlt3FKyQG8jE=; b=oP2ofDvh7YrSJUzVXfeVCKkpPq
	Ubuv4s42BmxXJ4Ok06mGAAEVtWE2QRGBHY44F6L4jyJlkR5f9cP4PlrM5zeD02OOHaYwR5YjnA86d
	apl9nAdB3phk0mBL/DI/LQiKMwr4PxjUMeXsg75vkLjT2B6vhXHp0d4T94mg+GdxF8DI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165437-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165437: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d4c9845e52cbb3cd62172809f62ee51dbb3ca7de
X-Osstest-Versions-That:
    xen=b11380f6cd58ce40422473262b2b4c2b210447a1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Oct 2021 02:07:06 +0000

flight 165437 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165437/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d4c9845e52cbb3cd62172809f62ee51dbb3ca7de
baseline version:
 xen                  b11380f6cd58ce40422473262b2b4c2b210447a1

Last test of basis   165436  2021-10-08 18:01:40 Z    0 days
Testing same since   165437  2021-10-08 23:02:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>

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
   b11380f6cd..d4c9845e52  d4c9845e52cbb3cd62172809f62ee51dbb3ca7de -> smoke

