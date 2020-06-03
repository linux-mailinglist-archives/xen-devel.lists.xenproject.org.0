Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A961ED87C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:16:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbfT-0003Vv-2C; Wed, 03 Jun 2020 22:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GLy=7Q=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jgbfS-0003Vq-DK
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:15:26 +0000
X-Inumbo-ID: b5a74084-a5e7-11ea-adbe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5a74084-a5e7-11ea-adbe-12813bfff9fa;
 Wed, 03 Jun 2020 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6OxDBR2snl2npbb3UJyTDf5nnFn7wmPqkfhbUfEImWk=; b=Lv44RZRwtSks8k5VAADEVdz7P
 4z3sfaEbJKsO+kYuNyhSvtEejTECw1wvD1xlK5lbM8QNZsD/TE+Ust77+NAwHYRBLsevyxMZJg+2J
 NOg9TwMETRuHVQgls7bLcO0hDEiEGIjFFU9WwWlTDbHuoJbfsTTzzmvbOxeM+0k0oKq8g=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgbfK-0008Lc-UV; Wed, 03 Jun 2020 22:15:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgbfK-0005f2-Me; Wed, 03 Jun 2020 22:15:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jgbfK-0005TK-M1; Wed, 03 Jun 2020 22:15:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150664-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150664: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:heisenbug
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
X-Osstest-Versions-That: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Jun 2020 22:15:18 +0000
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

flight 150664 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150664/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 150438

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail pass in 150658

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
baseline version:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199

Last test of basis   150438  2020-05-28 14:01:19 Z    6 days
Failing since        150465  2020-05-29 09:02:14 Z    5 days   41 attempts
Testing same since   150649  2020-06-03 13:01:44 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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

(No revision log; it would be 1522 lines long.)

