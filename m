Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0593B95F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 01:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764571.1175048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWl0D-0001C7-H8; Wed, 24 Jul 2024 23:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764571.1175048; Wed, 24 Jul 2024 23:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWl0D-00019S-Dh; Wed, 24 Jul 2024 23:02:33 +0000
Received: by outflank-mailman (input) for mailman id 764571;
 Wed, 24 Jul 2024 23:02:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWl0C-00019I-96; Wed, 24 Jul 2024 23:02:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWl0B-0002pS-T3; Wed, 24 Jul 2024 23:02:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWl0B-0005EU-BO; Wed, 24 Jul 2024 23:02:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWl0B-0002Vp-Aw; Wed, 24 Jul 2024 23:02:31 +0000
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
	bh=w45eP2e6OyfmHDcwvegWRQu2cgR6wRFL7g0kwIcqp4w=; b=PfbqvDULWvEdk9qpNhZ+yA38pI
	mGox2dG0Y3CczrVPzulqjRvbB/QEB/RjbgBYaiKc8jTkF7ORr2GNVx9pAU/Mw2xGE8Zoas1I86nDW
	IR/GiUBWvRMYR8/tmItp+REQywxJSw6+PUp6Y8juitXVZuppe2iqjt6YYfsbm2P9sGVs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186987-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186987: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b25b28ede1cba43eda1e0b84ad967683b8196847
X-Osstest-Versions-That:
    xen=5795a0bf5493d411155093180ed16e4ba63d37bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 23:02:31 +0000

flight 186987 xen-unstable-smoke real [real]
flight 186990 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186987/
http://logs.test-lab.xenproject.org/osstest/logs/186990/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 186984

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b25b28ede1cba43eda1e0b84ad967683b8196847
baseline version:
 xen                  5795a0bf5493d411155093180ed16e4ba63d37bf

Last test of basis   186984  2024-07-24 14:03:56 Z    0 days
Testing same since   186987  2024-07-24 19:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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

------------------------------------------------------------
commit b25b28ede1cba43eda1e0b84ad967683b8196847
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu May 9 18:52:59 2024 +0100

    hvmloader: Use fastcall everywhere
    
    HVMLoader is a single freestanding 32bit program with no external
    dependencies.  Use the fastcall calling convetion (up to 3 parameters in
    registers) globally, which is more efficient than passing all parameters on
    the stack.
    
    Some bloat-o-meter highlights are:
    
      add/remove: 0/0 grow/shrink: 3/118 up/down: 8/-3004 (-2996)
      Function                                     old     new   delta
      ...
      hvmloader_acpi_build_tables                 1125     961    -164
      acpi_build_tables                           1277    1081    -196
      pci_setup                                   4756    4516    -240
      construct_secondary_tables                  1689    1447    -242
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

