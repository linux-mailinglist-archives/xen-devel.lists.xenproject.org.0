Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10DF310413
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 05:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81501.150724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7slW-0002Vx-Kw; Fri, 05 Feb 2021 04:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81501.150724; Fri, 05 Feb 2021 04:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7slW-0002VY-HV; Fri, 05 Feb 2021 04:30:42 +0000
Received: by outflank-mailman (input) for mailman id 81501;
 Fri, 05 Feb 2021 04:30:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7slV-0002VQ-Dx; Fri, 05 Feb 2021 04:30:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7slV-0005LZ-7M; Fri, 05 Feb 2021 04:30:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7slU-0006Fe-VN; Fri, 05 Feb 2021 04:30:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7slU-0003MN-Ur; Fri, 05 Feb 2021 04:30:40 +0000
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
	bh=hL4u8zOaXQEXFLbzb6I/sHthd0tW0JvP0ccui43Nfzc=; b=P0DiBGdRK4/ogVjKxXuGRd3Q6Q
	cuUGdYfSLRQveF/56GYJbZ9rXWe36UjS+qyhFlNuY8XvNNGPGfQEqXVF9xazjPQIqGwpRt+oiOkiU
	KmNtbWZCczH7kkAMH9e/WIoyRG3JyioRb18MO6/lQB/UOnZ7y5npDUMtlZ9L+i9J4QsA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159029-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159029: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:capture-logs(22):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7
X-Osstest-Versions-That:
    xen=def12125357ed2efd6d581d9033afcc9d66daa8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Feb 2021 04:30:40 +0000

flight 159029 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159029/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl          22 capture-logs(22)       broken REGR. vs. 159025

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7
baseline version:
 xen                  def12125357ed2efd6d581d9033afcc9d66daa8a

Last test of basis   159025  2021-02-04 22:00:27 Z    0 days
Testing same since   159029  2021-02-05 01:01:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl capture-logs(22)

Not pushing.

------------------------------------------------------------
commit ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 23 17:26:16 2020 +0100

    tools/tests: Introduce a test for acquire_resource
    
    For now, simply try to map 40 frames of grant table.  This catches most of the
    basic errors with resource sizes found and fixed through the 4.15 dev window.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

