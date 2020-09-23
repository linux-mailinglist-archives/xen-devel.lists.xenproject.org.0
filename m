Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C261F27556B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1rc-0004u2-TS; Wed, 23 Sep 2020 10:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3kw=DA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kL1rb-0004ti-7I
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:19:03 +0000
X-Inumbo-ID: cf0e5b58-c717-4fde-b778-93005ee58a32
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf0e5b58-c717-4fde-b778-93005ee58a32;
 Wed, 23 Sep 2020 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=1VCbXW0Zr9qGMp9ey7myNCMAzp5bj+n4/Hw7bu9nuuY=; b=DJ775kMYR1Wd5ERVAaSzQaQn+0
 AY+eDHLdVHSBklpge42P6O2bPSF5ZRpa34A93KUmimbTKqbbqS/RzGFJCaj0GECdAPy8/vI6bEw4C
 RQcKbxxYo1C+4RAy1OsOXS5L4Q4+Q91HZboSO+PBoizsyQRDhprcKP5jEcbk3jHivft4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kL1rU-00078e-RV; Wed, 23 Sep 2020 10:18:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kL1rU-00049n-HT; Wed, 23 Sep 2020 10:18:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kL1rU-0002o1-H0; Wed, 23 Sep 2020 10:18:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154638-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154638: all pass - PUSHED
X-Osstest-Versions-This: xen=2785b2a9e04abc148e1c5259f4faee708ea356f4
X-Osstest-Versions-That: xen=baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Sep 2020 10:18:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154638 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154638/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  2785b2a9e04abc148e1c5259f4faee708ea356f4
baseline version:
 xen                  baa4d064e91b6d2bcfe400bdf71f83b961e4c28e

Last test of basis   154529  2020-09-20 09:19:32 Z    3 days
Testing same since   154638  2020-09-23 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Trammell Hudson <hudson@trmm.net>

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
   baa4d064e9..2785b2a9e0  2785b2a9e04abc148e1c5259f4faee708ea356f4 -> coverity-tested/smoke

