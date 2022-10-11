Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B25FBC15
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 22:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420479.665332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiLvk-0003YX-Ks; Tue, 11 Oct 2022 20:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420479.665332; Tue, 11 Oct 2022 20:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiLvk-0003Wj-I9; Tue, 11 Oct 2022 20:32:48 +0000
Received: by outflank-mailman (input) for mailman id 420479;
 Tue, 11 Oct 2022 20:32:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiLvj-0003WZ-Bi; Tue, 11 Oct 2022 20:32:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiLvj-0003V5-9O; Tue, 11 Oct 2022 20:32:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiLvi-0007SU-TY; Tue, 11 Oct 2022 20:32:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oiLvi-000852-T7; Tue, 11 Oct 2022 20:32:46 +0000
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
	bh=pHzpv07ClwMb7L2q73ke8kGA3ZlXrKkKWh1rxEv4eAY=; b=dsv0/dp9jmKbLUZTkIFuOlNBuf
	xVFDN4LiigWvo611LlSrNXN9e5oIn2/VIPM9ojU7FfzGXz9D/939ejMMm80uj/KNWezfCbQGWCjbI
	U1qDb5DWTU9WwzUKzLV02w1Gb1BumV8QSku5j01w/uoQ3bEkc5oy28JHXlfPza0D9ouQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173501-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173501: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=87a20c98d9f0f422727fe9b4b9e22c2c43a5cd9c
X-Osstest-Versions-That:
    xen=9029bc265cdf2bd63376dde9fdd91db4ce9c0586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Oct 2022 20:32:46 +0000

flight 173501 xen-unstable-smoke real [real]
flight 173503 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173501/
http://logs.test-lab.xenproject.org/osstest/logs/173503/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  87a20c98d9f0f422727fe9b4b9e22c2c43a5cd9c
baseline version:
 xen                  9029bc265cdf2bd63376dde9fdd91db4ce9c0586

Last test of basis   173457  2022-10-07 14:03:14 Z    4 days
Testing same since   173492  2022-10-11 13:01:50 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

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

(No revision log; it would be 427 lines long.)

