Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DB1E872E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 21:05:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jekJb-0005kI-Cj; Fri, 29 May 2020 19:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8V9=7L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jekJZ-0005k7-MU
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 19:05:09 +0000
X-Inumbo-ID: 50663132-a1df-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50663132-a1df-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 19:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1UVK56gpo6abrF2Dj8xV+mzkLvna7y5eLTSJRGSnz3g=; b=c/aTv8POB6uUQDjqt6eLYBnBT
 GvAi9gutAFos0EhrfB3YDHItcwTqNwXCtspyD4GJjPdnpWKC96L1gzWb72OXJMcSunR1YBzVRAd6z
 2UjsNIWJXnLRTg4PZCHcFYCEgGgkj6Wrcs8NdnOkr5HonZA0CJUOFBGl9PSMJJslnUUwA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jekJY-0004tR-3G; Fri, 29 May 2020 19:05:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jekJX-0003HV-Pe; Fri, 29 May 2020 19:05:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jekJX-0003XE-P3; Fri, 29 May 2020 19:05:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150498-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150498: regressions - trouble: blocked/fail
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=8e2aa76dc1670e82eaa15683353853bc66bf54fc
X-Osstest-Versions-That: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 May 2020 19:05:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150498 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150498/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 150438
 build-amd64                   6 xen-build                fail REGR. vs. 150438
 build-armhf                   6 xen-build                fail REGR. vs. 150438

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  8e2aa76dc1670e82eaa15683353853bc66bf54fc
baseline version:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199

Last test of basis   150438  2020-05-28 14:01:19 Z    1 days
Failing since        150465  2020-05-29 09:02:14 Z    0 days    7 attempts
Testing same since   150498  2020-05-29 18:01:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
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

(No revision log; it would be 773 lines long.)

