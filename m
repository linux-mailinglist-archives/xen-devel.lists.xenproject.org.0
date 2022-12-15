Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3764DC96
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463433.721605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5okX-0004HU-S0; Thu, 15 Dec 2022 13:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463433.721605; Thu, 15 Dec 2022 13:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5okX-0004Fh-P9; Thu, 15 Dec 2022 13:58:13 +0000
Received: by outflank-mailman (input) for mailman id 463433;
 Thu, 15 Dec 2022 13:58:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5okV-0004F6-MZ; Thu, 15 Dec 2022 13:58:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5okV-0003o4-Lr; Thu, 15 Dec 2022 13:58:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5okV-00051g-CW; Thu, 15 Dec 2022 13:58:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5okV-00054c-C4; Thu, 15 Dec 2022 13:58:11 +0000
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
	bh=5IQ37ZK8df38NX+vjMtpQsn+D5UN1oaAYy4zhHZOcaE=; b=QQ4P291fj+BpK6mLwfLwEdmlnP
	MkntTLt84Ri64GTrSYEhGTJrrXFHmWy8GKo5Bhvri/UD9qc2ocR0v1QtTMlzqaawwiRtXMyLPkl4B
	wWgpXHFIU0O52JYQ+hNzBgV1lmH8SZpbTNPH4nfr79JYfu8op5CvQVnpOM3jWPU7+QLE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175272-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175272: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=88168c418c3bde7d51797e7cf875d528a8aa0eb1
X-Osstest-Versions-That:
    xen=630dc3798e1d0d1b95f7be8b176563eb40e866e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 13:58:11 +0000

flight 175272 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175272/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 175173

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  88168c418c3bde7d51797e7cf875d528a8aa0eb1
baseline version:
 xen                  630dc3798e1d0d1b95f7be8b176563eb40e866e5

Last test of basis   175173  2022-12-13 15:00:27 Z    1 days
Failing since        175199  2022-12-14 12:01:52 Z    1 days   12 attempts
Testing same since   175272  2022-12-15 12:03:24 Z    0 days    1 attempts

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

(No revision log; it would be 431 lines long.)

