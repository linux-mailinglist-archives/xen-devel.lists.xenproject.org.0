Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C87744167
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 19:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557597.871088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFI3P-0000ah-4l; Fri, 30 Jun 2023 17:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557597.871088; Fri, 30 Jun 2023 17:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFI3P-0000YG-1h; Fri, 30 Jun 2023 17:37:07 +0000
Received: by outflank-mailman (input) for mailman id 557597;
 Fri, 30 Jun 2023 17:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFI3N-0000Y6-Js; Fri, 30 Jun 2023 17:37:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFI3M-0004hb-Pc; Fri, 30 Jun 2023 17:37:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFI3M-0007aa-AE; Fri, 30 Jun 2023 17:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qFI3M-0003P0-9b; Fri, 30 Jun 2023 17:37:04 +0000
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
	bh=UPNrsukw3156HgbNW4DGEgcScQiSErdsbiUbjG8l9v8=; b=6qF2u4ouSxPHHldGDB3xtarJvg
	tSChfCvsVhNbhG3AIvcZLde8yduO3y2Ds9VssBS7HUNgkv398fl+oij5dQQhtfFMUKtTe9r1exJLN
	BDgme8XumlSMZ7R2e2+1Y9ecJIcZfhczMDsUIp7hp1FBoNGWeLMKXvG+vSkbsnp7Flic=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181656-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181656: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9dd3caf12f52b859947c260b1cb3a48b491d53b6
X-Osstest-Versions-That:
    xen=c81b287e00b1a21beb65637d9cfb812da3a0e5ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Jun 2023 17:37:04 +0000

flight 181656 xen-unstable-smoke real [real]
flight 181658 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181656/
http://logs.test-lab.xenproject.org/osstest/logs/181658/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 181654

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9dd3caf12f52b859947c260b1cb3a48b491d53b6
baseline version:
 xen                  c81b287e00b1a21beb65637d9cfb812da3a0e5ce

Last test of basis   181654  2023-06-30 11:01:56 Z    0 days
Testing same since   181656  2023-06-30 14:01:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Julien Grall <jgrall@amazon.com>

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
commit 9dd3caf12f52b859947c260b1cb3a48b491d53b6
Author: George Dunlap <george.dunlap@citrix.com>
Date:   Tue Oct 6 12:03:52 2020 +0100

    {x86,arm}/mm.c: Make populate_pt_range __init
    
    It's only called from another __init function.
    
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

