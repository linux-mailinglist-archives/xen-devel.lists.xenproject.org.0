Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390D7D7128
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 17:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623095.970577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvg4O-0002SN-Ib; Wed, 25 Oct 2023 15:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623095.970577; Wed, 25 Oct 2023 15:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvg4O-0002Qw-FZ; Wed, 25 Oct 2023 15:45:20 +0000
Received: by outflank-mailman (input) for mailman id 623095;
 Wed, 25 Oct 2023 15:45:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvg4N-0002Qm-24; Wed, 25 Oct 2023 15:45:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvg4M-00055s-Qt; Wed, 25 Oct 2023 15:45:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvg4M-0002wx-Fc; Wed, 25 Oct 2023 15:45:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvg4M-0000hR-F5; Wed, 25 Oct 2023 15:45:18 +0000
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
	bh=Tcj9EfCcMEN+wbBhkF9Ou5dBoOJ5oT0PHs+9DfjuUa0=; b=d3HTT0qL2+ju/rj+hpVitYwiga
	ZO1FtAEkVv/Xor53kwff0rd748/RPZbRNXL/vsS5e+yZJNc7hlELDCB1t82eZJ0181GtotQg200v4
	kNUpYGLWB0FffvX+bVUX48fMt6fiC0jnpES0mJOvzDj6Zym1KA3a5+uO74S43HUzjjF8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183525-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183525: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5415b2b2118bd78d8a04f276a8312f7f0cb1a466
X-Osstest-Versions-That:
    xen=d9f07b06cfc967e128371c11f56699cf5ee40b43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Oct 2023 15:45:18 +0000

flight 183525 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183525/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5415b2b2118bd78d8a04f276a8312f7f0cb1a466
baseline version:
 xen                  d9f07b06cfc967e128371c11f56699cf5ee40b43

Last test of basis   183517  2023-10-24 19:02:08 Z    0 days
Testing same since   183525  2023-10-25 11:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>

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
   d9f07b06cf..5415b2b211  5415b2b2118bd78d8a04f276a8312f7f0cb1a466 -> smoke

