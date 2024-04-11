Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE048A223E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 01:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704247.1100509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv3jI-00016d-2v; Thu, 11 Apr 2024 23:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704247.1100509; Thu, 11 Apr 2024 23:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv3jI-00015A-0B; Thu, 11 Apr 2024 23:21:16 +0000
Received: by outflank-mailman (input) for mailman id 704247;
 Thu, 11 Apr 2024 23:21:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rv3jG-000150-Jr; Thu, 11 Apr 2024 23:21:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rv3jG-00074x-Gn; Thu, 11 Apr 2024 23:21:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rv3jG-0002Wn-6b; Thu, 11 Apr 2024 23:21:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rv3jG-0007Bz-68; Thu, 11 Apr 2024 23:21:14 +0000
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
	bh=CKmIYm8D0yptCRr6q+tyCaWpebAH98mNt7fQzxSglHU=; b=4yLnf3G1JYtWmEy0BH9LqrEAHI
	zjqg9ClLZ2Sf7a3dNFAe8MJXG30+ULQ/L8HjQKSqAiTddhawAMsx5m6jM21gK6kZpIJOW3H6yoIbD
	B5sTdTcUls5xL3Kr1nlSYrjOS+ek/aTawe5E/PGkjZilhoix9JWhrItsi+qxiz/Szk1o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185326-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185326: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=af4cd0a6a61cdb03bc1afca9478b05b0c9703599
X-Osstest-Versions-That:
    xen=6cb501e3e6db36b1b4b6345f5af8adc0a291b404
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Apr 2024 23:21:14 +0000

flight 185326 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185326/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  af4cd0a6a61cdb03bc1afca9478b05b0c9703599
baseline version:
 xen                  6cb501e3e6db36b1b4b6345f5af8adc0a291b404

Last test of basis   185317  2024-04-11 14:00:34 Z    0 days
Testing same since   185326  2024-04-11 19:04:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Juergen Gross <jgross@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   6cb501e3e6..af4cd0a6a6  af4cd0a6a61cdb03bc1afca9478b05b0c9703599 -> smoke

