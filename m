Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F97934AC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 07:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596196.929982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdkg4-0001Qb-OO; Wed, 06 Sep 2023 05:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596196.929982; Wed, 06 Sep 2023 05:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdkg4-0001OK-LE; Wed, 06 Sep 2023 05:02:08 +0000
Received: by outflank-mailman (input) for mailman id 596196;
 Wed, 06 Sep 2023 05:02:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdkg3-0001OA-Gk; Wed, 06 Sep 2023 05:02:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdkg3-0008R6-Cv; Wed, 06 Sep 2023 05:02:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdkg2-0003dM-VB; Wed, 06 Sep 2023 05:02:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qdkg2-0008HY-Uj; Wed, 06 Sep 2023 05:02:06 +0000
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
	bh=KJC1kYeLbKjDIi17dQBAbwK2EJbykPwvXwf/98VZpPs=; b=kuXGymj0AD78pmpB+gVIgnVYA8
	xWjxWsQCRWr/Hp76hwkKbvhkeGYNbhQ5mYdy1KSl6kfYzNhHsarIrsbXv2Ef1YwYFBFhCldceNXiE
	GVlytpSGN+IC8JQJxDu/SngpHiCu+BbwM7i0fO27n2dpq10qbeH6jhZNVlc6fr/FBOrM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182641-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182641: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=61765a07e3d8a4dabbb8323b55f13ee75c80e54a
X-Osstest-Versions-That:
    xen=9a216e92de9f9011097e4f1fb55ff67ba0a21704
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Sep 2023 05:02:06 +0000

flight 182641 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182641/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 182635

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  61765a07e3d8a4dabbb8323b55f13ee75c80e54a
baseline version:
 xen                  9a216e92de9f9011097e4f1fb55ff67ba0a21704

Last test of basis   182635  2023-09-05 13:00:27 Z    0 days
Testing same since   182641  2023-09-06 02:02:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Gibson <david@gibson.dropbear.id.au>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>
  Juline Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Vikram Garhwal <fnu.vikram@xilinx.com>
  Vikram Garhwal <vikram.garhwal@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
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

(No revision log; it would be 380 lines long.)

