Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81CF4D3AC9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 21:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288053.488466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2XQ-0001pp-0l; Wed, 09 Mar 2022 20:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288053.488466; Wed, 09 Mar 2022 20:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2XP-0001mr-Sa; Wed, 09 Mar 2022 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 288053;
 Wed, 09 Mar 2022 20:03:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nS2XO-0001mh-Qi; Wed, 09 Mar 2022 20:03:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nS2XO-000409-KI; Wed, 09 Mar 2022 20:03:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nS2XN-0007hp-Vi; Wed, 09 Mar 2022 20:03:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nS2XN-0001Bv-VE; Wed, 09 Mar 2022 20:03:57 +0000
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
	bh=L8+EqG0iCt0wiWTrCOK8qmmjyKNWRA7bu+Giik4s9ok=; b=cxQZF3+idNtyNF9ehlBgcNXyTR
	Y9/tani+hw4EMjC0z2/6agIaTB3Vf/J2wca/cmKfT05bEiozz9X5LW6akkgNeGeJKhdQ8uCsR8cBN
	KD9zu7zA6xcnV9PUCeG4DBVWmLt1KuZc+qrmgUPMPfuJEey4amZXPtq8FiEOuSsfSn9s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168495-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168495: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5142dc5c25e317c208e3dc16d16b664b9f05dab5
X-Osstest-Versions-That:
    xen=8d03080d2a339840d3a59e0932a94f804e45110d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Mar 2022 20:03:57 +0000

flight 168495 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168495/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5142dc5c25e317c208e3dc16d16b664b9f05dab5
baseline version:
 xen                  8d03080d2a339840d3a59e0932a94f804e45110d

Last test of basis   168487  2022-03-08 19:02:58 Z    1 days
Testing same since   168495  2022-03-09 16:03:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Olson <Alex.Olson@starlab.io>
  Bjoern Doebel <doebel@amazon.de>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
   8d03080d2a..5142dc5c25  5142dc5c25e317c208e3dc16d16b664b9f05dab5 -> smoke

