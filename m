Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1C7E2CCE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 20:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628262.979508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05GG-0002N7-Bf; Mon, 06 Nov 2023 19:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628262.979508; Mon, 06 Nov 2023 19:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05GG-0002KO-86; Mon, 06 Nov 2023 19:27:48 +0000
Received: by outflank-mailman (input) for mailman id 628262;
 Mon, 06 Nov 2023 19:27:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r05GF-0002KE-Al; Mon, 06 Nov 2023 19:27:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r05GF-0001xa-70; Mon, 06 Nov 2023 19:27:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r05GE-0003z9-SG; Mon, 06 Nov 2023 19:27:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r05GE-0001uP-Rp; Mon, 06 Nov 2023 19:27:46 +0000
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
	bh=MzTveY2+5Jg+hwxx39T/qNghzAswNmGWMjHSWNGMCbo=; b=c4/IBUj5eso5tcsKC4dMsNMGi6
	dRdjbd2NIYRwOwjlZDwmqPM1+oZ1BNPyaPe106paCjaq+7VHeG/DBUlfIfECWipVI3lXzboYHeHGJ
	hni9WQ+6cQG+aBHmaib4+n7SJWopjYGdrwmOY1d4avQzy1vryBG/cLg+WN9woV/gIOiU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183694-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183694: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1f849edc2f9ca7dc2f9ed7b0585c31bd6b81d7ef
X-Osstest-Versions-That:
    xen=5ae0a4ad3822e7118e33d162de87fb8c03db7ce7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Nov 2023 19:27:46 +0000

flight 183694 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183694/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1f849edc2f9ca7dc2f9ed7b0585c31bd6b81d7ef
baseline version:
 xen                  5ae0a4ad3822e7118e33d162de87fb8c03db7ce7

Last test of basis   183670  2023-11-03 11:00:26 Z    3 days
Testing same since   183694  2023-11-06 17:02:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@cloud.com>
  Jason Andryuk <jandryuk@gmail.com>

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
   5ae0a4ad38..1f849edc2f  1f849edc2f9ca7dc2f9ed7b0585c31bd6b81d7ef -> smoke

