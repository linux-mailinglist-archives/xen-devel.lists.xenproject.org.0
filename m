Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAE2EBD23
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62437.110586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6x3-00033l-Rf; Wed, 06 Jan 2021 11:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62437.110586; Wed, 06 Jan 2021 11:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6x3-00033M-Ng; Wed, 06 Jan 2021 11:26:05 +0000
Received: by outflank-mailman (input) for mailman id 62437;
 Wed, 06 Jan 2021 11:26:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx6x1-000336-Rq; Wed, 06 Jan 2021 11:26:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx6x1-0007M4-OG; Wed, 06 Jan 2021 11:26:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx6x1-0004m5-GA; Wed, 06 Jan 2021 11:26:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kx6x1-0005wU-Fd; Wed, 06 Jan 2021 11:26:03 +0000
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
	bh=aqYUZljXdhZhxIY0D0q8+4wqxxMYtjXC92L9qxU/HGo=; b=kgOf6GZlSxg6XNVueyxHcT8/JP
	elbQBFnzav1pEnmGl2GEdzEM274F79XLHLBfbvmPLbIHDwbsL1DWaPRyhCBq2AmqYSzRq/sbRMzco
	5LjXOZUiGkLS8fUfNR9YniwI7CsfK8A9ZYOlZr8q34gtONShHOJR5l1hyRjC0k1PDqrk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158195-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158195: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:heisenbug
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=edf5b22022aea0a76eaeb36cc060d984340e1e18
X-Osstest-Versions-That:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jan 2021 11:26:03 +0000

flight 158195 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158195/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 158134
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 158134

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-xsm       8 xen-boot                   fail pass in 158191

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 158191 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 158191 never pass

version targeted for testing:
 xen                  edf5b22022aea0a76eaeb36cc060d984340e1e18
baseline version:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a

Last test of basis   158134  2021-01-04 15:01:26 Z    1 days
Failing since        158142  2021-01-05 02:00:25 Z    1 days    8 attempts
Testing same since   158174  2021-01-05 22:00:25 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Manuel Bouyer <bouyer@antioche.eu.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
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

(No revision log; it would be 432 lines long.)

