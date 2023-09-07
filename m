Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F118C79721F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 14:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597305.931527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDfs-00059b-6h; Thu, 07 Sep 2023 11:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597305.931527; Thu, 07 Sep 2023 11:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDfs-00057u-39; Thu, 07 Sep 2023 11:59:52 +0000
Received: by outflank-mailman (input) for mailman id 597305;
 Thu, 07 Sep 2023 11:59:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeDfq-00057g-K7; Thu, 07 Sep 2023 11:59:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeDfq-0008Cu-IH; Thu, 07 Sep 2023 11:59:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeDfq-0002O8-4c; Thu, 07 Sep 2023 11:59:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qeDfq-0000pO-48; Thu, 07 Sep 2023 11:59:50 +0000
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
	bh=3Q30AEIH+rrkTMuUZAeI5RZQ+ZV01XuGaYSnOL1IaDQ=; b=RI6nKpOzxAMEUtTv306CQlau4m
	N/0R3GIBR86ua3LsAOH9ehP2hzFXM91w0a7vzjj0zSKqd2kx5mN6XjdjKveFQABj1n4vvh+GSRK0B
	1zHtdIQK+YfM6HEWt/2cIuDoNLdqrDT2VRwGiGqK4e6Jqc7gljjHhE7haErYdqndyZGU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182718: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=03f64b54a1d14893e7851a60ba4855fb75abf30a
X-Osstest-Versions-That:
    xen=b2dd946ece74e2b6e0601f28caef72f4f9950102
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Sep 2023 11:59:50 +0000

flight 182718 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182718/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  03f64b54a1d14893e7851a60ba4855fb75abf30a
baseline version:
 xen                  b2dd946ece74e2b6e0601f28caef72f4f9950102

Last test of basis   182709  2023-09-07 02:00:31 Z    0 days
Testing same since   182718  2023-09-07 08:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   b2dd946ece..03f64b54a1  03f64b54a1d14893e7851a60ba4855fb75abf30a -> smoke

