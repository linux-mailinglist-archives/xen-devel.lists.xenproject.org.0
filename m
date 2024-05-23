Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6C8CD0DF
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728348.1133237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6H9-0003if-8P; Thu, 23 May 2024 11:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728348.1133237; Thu, 23 May 2024 11:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6H9-0003gb-5f; Thu, 23 May 2024 11:06:23 +0000
Received: by outflank-mailman (input) for mailman id 728348;
 Thu, 23 May 2024 11:06:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA6H8-0003gR-6Y; Thu, 23 May 2024 11:06:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA6H8-00046Y-3n; Thu, 23 May 2024 11:06:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA6H7-0007Gm-Sc; Thu, 23 May 2024 11:06:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sA6H7-00023E-S0; Thu, 23 May 2024 11:06:21 +0000
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
	bh=zwPpKFWaGmQXYDMeRj5Wg64ZA8pmCf6LL49YOpX/YwU=; b=RDCpEv5Plkr1/Mx5gceLEXyruk
	uPy18AoH6OVQ/7S2fOc/HnoZYtQb5hBTjLLEZqWNbdwj6dkT5yyrvq/7sq3VJyz381e4MoWiDZSbM
	mNWqLDI+1ehz398eDvJr13HrXApgAirOcDzHeAP2nAA/U6+49aX8mMk60rAIyjw8/Uts=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186104-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186104: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d6a7fd83039af36c28bd0ae2174f12c3888ce993
X-Osstest-Versions-That:
    xen=ced21fbb2842ac4655048bdee56232974ff9ff9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 May 2024 11:06:21 +0000

flight 186104 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186104/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 186064

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d6a7fd83039af36c28bd0ae2174f12c3888ce993
baseline version:
 xen                  ced21fbb2842ac4655048bdee56232974ff9ff9c

Last test of basis   186064  2024-05-21 15:04:02 Z    1 days
Testing same since   186104  2024-05-23 09:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Bobby Eshleman <bobbyeshleman@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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

(No revision log; it would be 387 lines long.)

