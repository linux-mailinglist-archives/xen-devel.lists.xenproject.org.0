Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8337CB19C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 19:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617907.961008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsRl7-0008Md-0F; Mon, 16 Oct 2023 17:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617907.961008; Mon, 16 Oct 2023 17:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsRl6-0008Jy-Tk; Mon, 16 Oct 2023 17:52:04 +0000
Received: by outflank-mailman (input) for mailman id 617907;
 Mon, 16 Oct 2023 17:52:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsRl5-0008Jo-JX; Mon, 16 Oct 2023 17:52:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsRl5-0001Pi-D1; Mon, 16 Oct 2023 17:52:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsRl5-0000BI-17; Mon, 16 Oct 2023 17:52:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qsRl5-0007ni-0V; Mon, 16 Oct 2023 17:52:03 +0000
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
	bh=NeZlea87m6rcxuNVL1myo0ECEVdalVjuwSFXZhweRbs=; b=BxU0xHfIexSUrF97hmh86hTvQ1
	Hq/XmnhvssECbjPWqjf6oOj1qqIrXhHQMnfpDxbEOXyzLU6ZqMlkd05RNQSWfAET+z25qhOsrceNO
	slO8uwQHnKY5XzKDGGGk1IgJ7lkWEz/yVX76Y3N0p70e6BZqzw2880GANjiFAQKWx8VE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183385-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183385: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=618826f67306c32b2799e84ded9a8203f4109ccf
X-Osstest-Versions-That:
    xen=6432228fb5808150d3c5c14affb3d46af81b3878
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Oct 2023 17:52:03 +0000

flight 183385 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183385/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  618826f67306c32b2799e84ded9a8203f4109ccf
baseline version:
 xen                  6432228fb5808150d3c5c14affb3d46af81b3878

Last test of basis   183382  2023-10-16 10:03:41 Z    0 days
Testing same since   183385  2023-10-16 14:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@cloud.com>
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
   6432228fb5..618826f673  618826f67306c32b2799e84ded9a8203f4109ccf -> smoke

