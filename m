Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419E64DDE9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463535.721741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qHq-0006DX-40; Thu, 15 Dec 2022 15:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463535.721741; Thu, 15 Dec 2022 15:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qHq-0006An-19; Thu, 15 Dec 2022 15:36:42 +0000
Received: by outflank-mailman (input) for mailman id 463535;
 Thu, 15 Dec 2022 15:36:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qHo-0006AZ-K9; Thu, 15 Dec 2022 15:36:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qHo-00067C-Hj; Thu, 15 Dec 2022 15:36:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qHo-0001fZ-Al; Thu, 15 Dec 2022 15:36:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qHo-0000MF-AI; Thu, 15 Dec 2022 15:36:40 +0000
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
	bh=2RX63gKub2qBN5MntfUpj4pT3+8UiIJXjuS2vxK9S6o=; b=FvoPTIOp2MGKWainJEmyZJDYI0
	j0PsxToih59yda/O8q0UZdoAB40b6mn/afugSW0ClALbN7cD7P0X5ceOFuCsytBrZoPryVMXLlbAk
	i10phvQjxhnkrJPt7rrVFBDSYttCy7XSoqUF09yGkkimL2cCdTZBFLxInFoGQHqQVcT8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175279-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175279: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:xen-boot:fail:heisenbug
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=88168c418c3bde7d51797e7cf875d528a8aa0eb1
X-Osstest-Versions-That:
    xen=630dc3798e1d0d1b95f7be8b176563eb40e866e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 15:36:40 +0000

flight 175279 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175279/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 175173

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt      8 xen-boot                   fail pass in 175272

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt    15 migrate-support-check fail in 175272 never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  88168c418c3bde7d51797e7cf875d528a8aa0eb1
baseline version:
 xen                  630dc3798e1d0d1b95f7be8b176563eb40e866e5

Last test of basis   175173  2022-12-13 15:00:27 Z    2 days
Failing since        175199  2022-12-14 12:01:52 Z    1 days   13 attempts
Testing same since   175272  2022-12-15 12:03:24 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Viresh Kumar <viresh.kumar@linaro.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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

(No revision log; it would be 431 lines long.)

