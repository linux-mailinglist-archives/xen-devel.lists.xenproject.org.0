Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC592607CF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 02:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFRpS-0007Nt-Eq; Tue, 08 Sep 2020 00:49:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wajs=CR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFRpR-0007No-9d
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 00:49:45 +0000
X-Inumbo-ID: 408ff234-2cfa-4f89-9488-b554dce51436
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 408ff234-2cfa-4f89-9488-b554dce51436;
 Tue, 08 Sep 2020 00:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=8S3+DSAi81R8/7cPNk7rOaR80KJVbectI1aTgeNrrpE=; b=7D9Baq/2HB2LkxqdFEtkbmkrFR
 rngxJWEIdXd/e6w6NhzF7OxuvULHa3/rHmau0y3ybVC4JXqgnX+5sybVacwmvKlPZxeOa1P6KO1RX
 YvRwmG2jqXwQWmidGGTMXvlsLECYKTTeLVdvqfMuYWQdIdck9IsweGQuu/Af/srLIRLk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFRpP-0007VS-M2; Tue, 08 Sep 2020 00:49:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFRpP-0001Eu-FW; Tue, 08 Sep 2020 00:49:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFRpP-0005bT-F1; Tue, 08 Sep 2020 00:49:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153920-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 153920: regressions - FAIL
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-i386:xen-build:fail:regression
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d
X-Osstest-Versions-That: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Sep 2020 00:49:43 +0000
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

flight 153920 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153920/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 152863
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152863
 build-amd64                   6 xen-build                fail REGR. vs. 152863
 build-i386                    6 xen-build                fail REGR. vs. 152863

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d
baseline version:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00

Last test of basis   152863  2020-08-26 16:09:47 Z   12 days
Failing since        152915  2020-08-27 18:09:42 Z   11 days  185 attempts
Testing same since   153848  2020-09-07 02:52:00 Z    0 days   17 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Bob Feng <bob.c.feng@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Paul <paul.grimes@amd.com>
  Paul G <paul.grimes@amd.com>
  Qi Zhang <qi1.zhang@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

(No revision log; it would be 343 lines long.)

