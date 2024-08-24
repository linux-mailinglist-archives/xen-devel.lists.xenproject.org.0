Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B050295DC20
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 07:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782840.1192341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shjiw-0005tN-NM; Sat, 24 Aug 2024 05:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782840.1192341; Sat, 24 Aug 2024 05:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shjiw-0005r5-KU; Sat, 24 Aug 2024 05:54:06 +0000
Received: by outflank-mailman (input) for mailman id 782840;
 Sat, 24 Aug 2024 05:54:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shjiv-0005qv-Vl; Sat, 24 Aug 2024 05:54:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shjiv-00014f-NP; Sat, 24 Aug 2024 05:54:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1shjiv-0000Bw-6u; Sat, 24 Aug 2024 05:54:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1shjiv-0004OB-6Q; Sat, 24 Aug 2024 05:54:05 +0000
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
	bh=TtmiKF0bBTV26hR/FyZWcw7mpgbwYxeuPoQ8iNwY5vk=; b=Hn2DMXveBSkl3N79AKvmGAKcQs
	/onqSBAkogKI8cOQM5Ht6AEebW4ijl1CGMKCoIP/9AiKtJHZlHLG85BCyIvx9Jb9/CEGuloMQMAWb
	nr84kjvjBO0mRP1Ew53khGRn8kw0EnK8wN5cimoGfS2WWJhLyI2cohrTCIfo7J7ZFArE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187331-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187331: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=95764a0817a51741b7ffb1f78cba2a19b08ab2d1
X-Osstest-Versions-That:
    xen=20885a36ce114f235d9d38cfcf4952c72ecda051
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Aug 2024 05:54:05 +0000

flight 187331 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187331/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  95764a0817a51741b7ffb1f78cba2a19b08ab2d1
baseline version:
 xen                  20885a36ce114f235d9d38cfcf4952c72ecda051

Last test of basis   187330  2024-08-23 22:04:09 Z    0 days
Testing same since   187331  2024-08-24 03:02:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Victor Lira <victorm.lira@amd.com>

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
   20885a36ce..95764a0817  95764a0817a51741b7ffb1f78cba2a19b08ab2d1 -> smoke

