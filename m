Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B7218483
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 12:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt6rF-0006St-JH; Wed, 08 Jul 2020 09:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okql=AT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jt6rD-0006So-Rm
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 09:59:15 +0000
X-Inumbo-ID: adbcd2fa-c101-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adbcd2fa-c101-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QJsgid+SQfFcIKRxEoHEZS0zVtL3U2OEnqIYnkazhjM=; b=pv3fgA4mdGAPLI72lBRrZY3s+
 BpMQzontS1sviunBLn1DFNuqK+brbgj296rcAUuJC2ueUiymXURkaZyBwQFTbjzuXqafwPAr5Ljce
 cvVfliWLF8ogcTGyWHY+4QdJzI5OkbIxC9zdOVke2UVXBv0k8Z5fp2ryWoDcDxbsAn4gA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jt6rB-00067d-Vs; Wed, 08 Jul 2020 09:59:14 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jt6rB-0007Fh-GC; Wed, 08 Jul 2020 09:59:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jt6rB-0007pa-FY; Wed, 08 Jul 2020 09:59:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151733-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151733: all pass - PUSHED
X-Osstest-Versions-This: xen=3fdc211b01b29f252166937238efe02d15cb5780
X-Osstest-Versions-That: xen=be63d9d47f571a60d70f8fb630c03871312d9655
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jul 2020 09:59:13 +0000
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

flight 151733 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151733/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3fdc211b01b29f252166937238efe02d15cb5780
baseline version:
 xen                  be63d9d47f571a60d70f8fb630c03871312d9655

Last test of basis   151641  2020-07-05 09:18:32 Z    3 days
Testing same since   151733  2020-07-08 09:19:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

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
   be63d9d47f..3fdc211b01  3fdc211b01b29f252166937238efe02d15cb5780 -> coverity-tested/smoke

