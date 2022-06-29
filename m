Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01E55F4D4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 06:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357500.586083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6OxJ-0006tu-B4; Wed, 29 Jun 2022 04:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357500.586083; Wed, 29 Jun 2022 04:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6OxJ-0006qQ-87; Wed, 29 Jun 2022 04:05:33 +0000
Received: by outflank-mailman (input) for mailman id 357500;
 Wed, 29 Jun 2022 04:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6OxH-0006qG-KP; Wed, 29 Jun 2022 04:05:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6OxH-0007HQ-9L; Wed, 29 Jun 2022 04:05:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6OxH-0006IN-0g; Wed, 29 Jun 2022 04:05:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o6OxH-0005ix-0B; Wed, 29 Jun 2022 04:05:31 +0000
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
	bh=76p9gtFcaDWPTZ9RwSg4YsNUYZE9pR3PN7pSZUnLWv8=; b=txh/QrgcSQEXQqoqT6IYbGIQtG
	6u8CPI70ROV6e/8B0s3EyBtIqKHKYQ+y9Br44VEYXXRLkPPgvpXHIj/T0MbgGNvWLxSoxS0+e1Vda
	M7dl2o9Ei5N/txqvVb0GmWaQjygFE66YrtPUlgWXFgMc0QcAZOw6bCZYZfTub2jPhFNU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171391: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=93aa071f66b78a2abbf134aeb96b02f066e6091d
X-Osstest-Versions-That:
    xen=8c99264c6746541ddbfd7afec533e6ad1c8c41a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jun 2022 04:05:31 +0000

flight 171391 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171391/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  93aa071f66b78a2abbf134aeb96b02f066e6091d
baseline version:
 xen                  8c99264c6746541ddbfd7afec533e6ad1c8c41a5

Last test of basis   171383  2022-06-28 16:01:41 Z    0 days
Testing same since   171391  2022-06-29 01:01:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
   8c99264c67..93aa071f66  93aa071f66b78a2abbf134aeb96b02f066e6091d -> smoke

