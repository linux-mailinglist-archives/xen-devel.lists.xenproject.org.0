Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3E9A6E95
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823737.1237825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc4-0008E2-7f; Mon, 21 Oct 2024 15:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823737.1237825; Mon, 21 Oct 2024 15:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc4-0008Ao-1O; Mon, 21 Oct 2024 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 823737;
 Mon, 21 Oct 2024 15:46:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2uc1-0007cv-LW; Mon, 21 Oct 2024 15:46:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2uc1-0003Oq-IW; Mon, 21 Oct 2024 15:46:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t2uc0-0007gJ-WE; Mon, 21 Oct 2024 15:46:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t2uc0-0006GH-Vf; Mon, 21 Oct 2024 15:46:28 +0000
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
	bh=WHep3VsM+s47Mbck/G5G+877jkT+0Q48c6nAhADJ/es=; b=IbjGnK5OmIl0vkpvmpvSbd5aQf
	wbwiyxx5e0VT8KtKoo+U5TpMkEIiPe/6hQWS7q2LIJTlpJyjjiXOfdVHKRhHWNz7GjOM8lgaDYjs4
	LuV9Mh8dZ83kWXhAPxpWwydLmSZLL2YFMprFmuL42kHaLgQedBNcLigct9VuMX+B3Zmc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188312-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 188312: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7cf6e073e47f7c7edfe764ce904df283ec7ddad8
X-Osstest-Versions-That:
    xen=73785a4c7727cd7a888c7d16ca6a77c3ed0161d7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Oct 2024 15:46:28 +0000

flight 188312 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188312/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7cf6e073e47f7c7edfe764ce904df283ec7ddad8
baseline version:
 xen                  73785a4c7727cd7a888c7d16ca6a77c3ed0161d7

Last test of basis   188307  2024-10-19 19:00:26 Z    1 days
Testing same since   188312  2024-10-21 12:03:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>

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
   73785a4c77..7cf6e073e4  7cf6e073e47f7c7edfe764ce904df283ec7ddad8 -> smoke

