Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B994DD336
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291837.495640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV2aR-0000I3-Gx; Fri, 18 Mar 2022 02:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291837.495640; Fri, 18 Mar 2022 02:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV2aR-0000Fi-CT; Fri, 18 Mar 2022 02:43:31 +0000
Received: by outflank-mailman (input) for mailman id 291837;
 Fri, 18 Mar 2022 02:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV2aP-0000FY-Th; Fri, 18 Mar 2022 02:43:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV2aP-0006z8-Pz; Fri, 18 Mar 2022 02:43:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV2aP-0005dm-Et; Fri, 18 Mar 2022 02:43:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nV2aP-0004P3-ER; Fri, 18 Mar 2022 02:43:29 +0000
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
	bh=rRHLJAulTacWTcVPxu3hh+2Ak6Su5PEzAWs/rvt+3IU=; b=rIwk15qvsa4q4aKGJ+B1fmeoG6
	H2Wqd90gpcdjcSX8Ng8zh2egtYRUXxRdoOYlcXf+O8bjoUqAO6SeonpCMvPF77vqXVntFWRrJNdB3
	WpCVyegJ0rWKiPVdsWitBsaTg46KF8Root8E44BDI/oSGmThosvDMw1yu5Wa94Iz3wV0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168669-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168669: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6974c75180f1aad44e5428eabf2396b2b50fb0e4
X-Osstest-Versions-That:
    xen=7b41b91fd2ecbf87b91120b468689e10296b656c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Mar 2022 02:43:29 +0000

flight 168669 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168669/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6974c75180f1aad44e5428eabf2396b2b50fb0e4
baseline version:
 xen                  7b41b91fd2ecbf87b91120b468689e10296b656c

Last test of basis   168666  2022-03-17 18:00:27 Z    0 days
Testing same since   168669  2022-03-17 23:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bjoern Doebel <doebel@amazon.de>
  Jiamei Xie <jiamei.xie@arm.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

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
   7b41b91fd2..6974c75180  6974c75180f1aad44e5428eabf2396b2b50fb0e4 -> smoke

