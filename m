Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FEB4713D5
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 13:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245311.423352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw1jK-0001BA-Tm; Sat, 11 Dec 2021 12:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245311.423352; Sat, 11 Dec 2021 12:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw1jK-000183-Or; Sat, 11 Dec 2021 12:43:58 +0000
Received: by outflank-mailman (input) for mailman id 245311;
 Sat, 11 Dec 2021 12:43:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw1jJ-00017t-6Z; Sat, 11 Dec 2021 12:43:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw1jJ-0000nr-0s; Sat, 11 Dec 2021 12:43:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw1jI-0008Sc-NZ; Sat, 11 Dec 2021 12:43:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mw1jI-0006uz-N2; Sat, 11 Dec 2021 12:43:56 +0000
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
	bh=qGWp8Rj9sTes4wTyjmnvCZf0066t+WVdNOfVV9qvPoc=; b=ynM+pGFQ7yBWD3HnvGiF2qw+4r
	vwUFntil7PyvDYLLJQNz1x5CZEv3P7ZLeFHXFPiVCuIW755OSF+fsbY1L9h0FYj06Et+mSC8Ai25+
	exPAyzd8TIU1s0XQjUdcBQEXjcLHQz3/92WLOgIC0dTWSdp9FK1moJoZb73upnkSy2Xo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167371-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167371: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=e81a81e5846edcc4c2e91cf3a39d0ba8c31b687a
X-Osstest-Versions-That:
    ovmf=c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Dec 2021 12:43:56 +0000

flight 167371 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167371/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 167239
 build-i386-xsm                6 xen-build                fail REGR. vs. 167239
 build-i386                    6 xen-build                fail REGR. vs. 167239
 build-amd64-xsm               6 xen-build                fail REGR. vs. 167239

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 e81a81e5846edcc4c2e91cf3a39d0ba8c31b687a
baseline version:
 ovmf                 c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d

Last test of basis   167239  2021-12-09 06:23:17 Z    2 days
Failing since        167240  2021-12-09 08:42:46 Z    2 days   53 attempts
Testing same since   167352  2021-12-10 20:11:48 Z    0 days   16 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Brijesh Singh via groups.io <brijesh.singh=amd.com@groups.io>
  Chris Jones <christopher.jones@arm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Roth <michael.roth@amd.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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

(No revision log; it would be 1185 lines long.)

