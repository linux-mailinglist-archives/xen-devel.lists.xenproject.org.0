Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7992DB6C9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 00:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54917.95470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpJJA-0005a2-BK; Tue, 15 Dec 2020 23:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54917.95470; Tue, 15 Dec 2020 23:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpJJA-0005Za-6n; Tue, 15 Dec 2020 23:00:40 +0000
Received: by outflank-mailman (input) for mailman id 54917;
 Tue, 15 Dec 2020 23:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpJJ8-0005ZP-Ni; Tue, 15 Dec 2020 23:00:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpJJ8-0001Pg-Ij; Tue, 15 Dec 2020 23:00:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpJJ8-0000mw-9h; Tue, 15 Dec 2020 23:00:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kpJJ8-0000KB-95; Tue, 15 Dec 2020 23:00:38 +0000
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
	bh=aBZFOhTopP5DNsFBsbPPN3TbXEJurFkxgFsn8UI5tUA=; b=Y8jKsh3cL8ZTOEugNbn6k4J04c
	KTLC2dTrSbzUJmZtAgsy7B/m4sa5Jx+0YepjVMMpmhAqKHslgHaYKt+jSauUaUoEXDRwdsTuX4SUR
	+YfFJckPPuStK0kJWhed7zepIbNcT1MgQcQmNpAffOEoVgxME0hmDfnA9H2ApuAPZwyw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157575-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 157575: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8bf0fab14256057bbd145563151814300476bb28
X-Osstest-Versions-That:
    xen=904148ecb4a59d4c8375d8e8d38117b8605e10ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Dec 2020 23:00:38 +0000

flight 157575 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157575/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 157560

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8bf0fab14256057bbd145563151814300476bb28
baseline version:
 xen                  904148ecb4a59d4c8375d8e8d38117b8605e10ac

Last test of basis   157560  2020-12-15 13:00:26 Z    0 days
Testing same since   157570  2020-12-15 17:00:30 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <pdurrant@amazon.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
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

(No revision log; it would be 556 lines long.)

