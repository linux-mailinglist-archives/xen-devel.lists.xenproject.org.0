Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52F28E7F3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 22:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7006.18349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnb3-0004qg-3E; Wed, 14 Oct 2020 20:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7006.18349; Wed, 14 Oct 2020 20:42:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnb2-0004qH-W2; Wed, 14 Oct 2020 20:42:04 +0000
Received: by outflank-mailman (input) for mailman id 7006;
 Wed, 14 Oct 2020 20:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSnb2-0004pp-0l
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:42:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4ac64cb-00d3-474c-9efe-0569171a6c9e;
 Wed, 14 Oct 2020 20:41:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnav-0006h8-Cs; Wed, 14 Oct 2020 20:41:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnav-0004OJ-1Z; Wed, 14 Oct 2020 20:41:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnav-0005PE-13; Wed, 14 Oct 2020 20:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSnb2-0004pp-0l
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:42:04 +0000
X-Inumbo-ID: b4ac64cb-00d3-474c-9efe-0569171a6c9e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b4ac64cb-00d3-474c-9efe-0569171a6c9e;
	Wed, 14 Oct 2020 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=qouX04pPMfJiGMibt/gR7xQtjAgg4Gohcb+uBSC+pGQ=; b=7ASReugEpcmvVTIHFfyQOab5pX
	kI3XZtMI+pLbjta/v3Ra7nuplM4igdXNvgFwTvijnkI6X20maoRwNoy0rgd+FD7vON+RekA48RVM/
	RY+Hq6EcmUchgVfjjIX2jt1yFNfm3SsTjz8/5WBOhJh108pfD5KdfuhGt860yJYtLVS4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnav-0006h8-Cs; Wed, 14 Oct 2020 20:41:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnav-0004OJ-1Z; Wed, 14 Oct 2020 20:41:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnav-0005PE-13; Wed, 14 Oct 2020 20:41:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155811-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155811: regressions - FAIL
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
    xen=f776e5fb3ee699745f6442ec8c47d0fa647e0575
X-Osstest-Versions-That:
    xen=884ef07f4f66b9d12fc4811047db95ba649db85c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Oct 2020 20:41:57 +0000

flight 155811 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155811/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 155805

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f776e5fb3ee699745f6442ec8c47d0fa647e0575
baseline version:
 xen                  884ef07f4f66b9d12fc4811047db95ba649db85c

Last test of basis   155805  2020-10-14 13:00:28 Z    0 days
Testing same since   155811  2020-10-14 18:03:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@arm.com>

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

------------------------------------------------------------
commit f776e5fb3ee699745f6442ec8c47d0fa647e0575
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed Oct 14 12:05:41 2020 +0200

    xen/arm: Document the erratum #853709 related to Cortex A72
    
    The Cortex-A72 erratum #853709 is the same as the Cortex-A57
    erratum #852523. As the latter is already workaround, we only
    need to update the documentation.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    [julieng: Reworded the commit message]
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
(qemu changes not included)

