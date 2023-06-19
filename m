Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4E735CED
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 19:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551283.860752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIVh-0000Kh-1v; Mon, 19 Jun 2023 17:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551283.860752; Mon, 19 Jun 2023 17:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIVg-0000HO-VL; Mon, 19 Jun 2023 17:17:48 +0000
Received: by outflank-mailman (input) for mailman id 551283;
 Mon, 19 Jun 2023 17:17:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBIVf-0000HE-VN; Mon, 19 Jun 2023 17:17:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBIVf-00036h-JV; Mon, 19 Jun 2023 17:17:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBIVf-0003Xp-87; Mon, 19 Jun 2023 17:17:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBIVf-0000bJ-7j; Mon, 19 Jun 2023 17:17:47 +0000
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
	bh=IAX1Tp5lYwmhKYaCKj4j9V39ssjP8TDlAciXiOmYYVU=; b=1sjgucBVMFHLPKpsAqoKipgJVI
	FokRbDZmVVEBv3j4QPOfPr/1BI451r/SWueVV0gG1VHoe1ikn7L4ZE/D5fjW/USLDmsyNX3YPpcT5
	6NarBs4KC3GtUUX4j51dbi0PU1M8QTN5HC1te/EwFIKl02V0/LAeftvziDE9Wyb/GPlU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181504: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a17fd0feb6b6bbe82550f43d70654d894ed377ec
X-Osstest-Versions-That:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Jun 2023 17:17:47 +0000

flight 181504 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181504/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181476

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a17fd0feb6b6bbe82550f43d70654d894ed377ec
baseline version:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587

Last test of basis   181476  2023-06-17 04:00:28 Z    2 days
Testing same since   181504  2023-06-19 11:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit a17fd0feb6b6bbe82550f43d70654d894ed377ec
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Jun 19 10:09:32 2023 +0100

    automation: Disable QEMU build with Clang older than 10.0
    
    Since QEMU commit 74a1b256d775 ("configure: Bump minimum Clang version
    to 10.0"), or QEMU v8.0, Clang 10.0 is now the minimum to build QEMU.
    
    QEMU 8.0 fails to build on Ubuntu Bionic.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

