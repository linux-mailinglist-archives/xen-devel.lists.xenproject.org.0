Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5335624A9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 22:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358697.588012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o71Cp-0001pv-VT; Thu, 30 Jun 2022 20:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358697.588012; Thu, 30 Jun 2022 20:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o71Cp-0001o2-Rx; Thu, 30 Jun 2022 20:56:07 +0000
Received: by outflank-mailman (input) for mailman id 358697;
 Thu, 30 Jun 2022 20:56:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o71Co-0001ns-7s; Thu, 30 Jun 2022 20:56:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o71Co-0004zf-4V; Thu, 30 Jun 2022 20:56:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o71Cn-00055T-Kq; Thu, 30 Jun 2022 20:56:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o71Cn-0000Lx-KN; Thu, 30 Jun 2022 20:56:05 +0000
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
	bh=1OOXTFzbw9vLVxS6J8cfc83qcpurZ3DgcSSOp6dmF1E=; b=YLFvs8F5Igc4NOBmZ6tYuDNWLa
	lPP+5k3llUfOmj8nJvBW+dKLgHHhSxhwK6P/XSOocJLo5tl0OGlDo1o4AGKKydzFjJwP2H+lVklLC
	yX6dcncYXExC/SIlb04W6pbqJAIFpmN3+ren9zbJ9PPofdbtct3E+p/26TaPJoulsYcU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171428: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=60d1adfa18793f4ddb70c8e901562d8d3e9be3dc
X-Osstest-Versions-That:
    xen=93aa071f66b78a2abbf134aeb96b02f066e6091d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Jun 2022 20:56:05 +0000

flight 171428 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171428/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  60d1adfa18793f4ddb70c8e901562d8d3e9be3dc
baseline version:
 xen                  93aa071f66b78a2abbf134aeb96b02f066e6091d

Last test of basis   171391  2022-06-29 01:01:48 Z    1 days
Testing same since   171428  2022-06-30 18:01:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
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
   93aa071f66..60d1adfa18  60d1adfa18793f4ddb70c8e901562d8d3e9be3dc -> smoke

