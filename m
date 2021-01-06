Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAB2EBC10
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 11:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62402.110484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx5fo-0002z0-Sz; Wed, 06 Jan 2021 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62402.110484; Wed, 06 Jan 2021 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx5fo-0002yX-Or; Wed, 06 Jan 2021 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 62402;
 Wed, 06 Jan 2021 10:04:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx5fn-0002yM-32; Wed, 06 Jan 2021 10:04:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx5fm-0005yK-Ue; Wed, 06 Jan 2021 10:04:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx5fm-00009D-J5; Wed, 06 Jan 2021 10:04:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kx5fm-0000R2-IZ; Wed, 06 Jan 2021 10:04:10 +0000
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
	bh=w1IdbaEDykiBoREF5MOsdsrvvMIQFXLfT7rJP754/e4=; b=Ea+06ko6a/95aTXNiJgPjSIKBI
	vN1ciRcB1OG3g265m0Ozzox7+yqZsZTvrnzvt0vMnwG4r6nbDHlIKhpzWOOaNZ6qHjYTLi+ivfmX8
	cPtwgm+CL4Ie1iOVq0bXytmbH1TAPLT9IzZQGc7/zEpulK4UdNbpBBklMOngpC+x7hcY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158201-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158201: all pass - PUSHED
X-Osstest-Versions-This:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
X-Osstest-Versions-That:
    xen=1516ecd6f55fe3608f374f4f2548491472d1c9a1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jan 2021 10:04:10 +0000

flight 158201 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158201/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a
baseline version:
 xen                  1516ecd6f55fe3608f374f4f2548491472d1c9a1

Last test of basis   158104  2021-01-03 09:19:26 Z    3 days
Testing same since   158201  2021-01-06 09:18:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 coverity-amd64                                               pass    


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
   1516ecd6f5..7ba2ab495b  7ba2ab495be54f608cb47440e1497b2795bd301a -> coverity-tested/smoke

