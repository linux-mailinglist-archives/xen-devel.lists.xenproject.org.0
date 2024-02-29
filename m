Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51786C6F7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 11:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686936.1069569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdhL-0007dG-Dy; Thu, 29 Feb 2024 10:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686936.1069569; Thu, 29 Feb 2024 10:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdhL-0007ao-BF; Thu, 29 Feb 2024 10:31:31 +0000
Received: by outflank-mailman (input) for mailman id 686936;
 Thu, 29 Feb 2024 10:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfdhK-0007ad-Dr; Thu, 29 Feb 2024 10:31:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfdhK-0001Bi-AU; Thu, 29 Feb 2024 10:31:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfdhJ-0006G9-Vi; Thu, 29 Feb 2024 10:31:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rfdhJ-0007x1-VI; Thu, 29 Feb 2024 10:31:29 +0000
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
	bh=dxIDtgwBIcmVEkK87cp4dQfZLn9Pklq6Gn53wXhX4nk=; b=jCCUSu6aAKNmc1kaASQygG6E0L
	G567e/7W1Ax1QN8j1NiEO5+/MrL812LHpTr13lqGHS+gf/emxqrEf+Hs5IDrAk7E08BNZAin/XKf2
	8Ih0rh8+qgAhnc8+0YRmz+8AynCOMk6sj+2pdpsB2kC70578IOhGuORT+iJFL/9PfInk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184817-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184817: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c20850540ad6a32f4fc17bde9b01c92b0df18bf0
X-Osstest-Versions-That:
    xen=54fd7b997470e6686667ca8e18f9ba6139efcdea
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Feb 2024 10:31:29 +0000

flight 184817 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184817/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c20850540ad6a32f4fc17bde9b01c92b0df18bf0
baseline version:
 xen                  54fd7b997470e6686667ca8e18f9ba6139efcdea

Last test of basis   184810  2024-02-28 19:02:05 Z    0 days
Testing same since   184817  2024-02-29 08:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   54fd7b9974..c20850540a  c20850540ad6a32f4fc17bde9b01c92b0df18bf0 -> smoke

