Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8FA231CA0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 12:22:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0jDS-0000yh-PL; Wed, 29 Jul 2020 10:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ULCb=BI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0jDR-0000yH-Db
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 10:21:41 +0000
X-Inumbo-ID: 47a37750-d185-11ea-8c38-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47a37750-d185-11ea-8c38-bc764e2007e4;
 Wed, 29 Jul 2020 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ve+SkCNJpYjbGsog950IRakGV/SqA1wfyx5ZBjk+UP8=; b=hMAlWPSyvKuWsTBxoI+yyuLsW
 aKeWl+YzH/9dQSWhHwoHe3Jm4Dz01qRTUuIeRNwDvaYGQSGYUXYDjUUfLsrgpIBUX69Bc24bUWVce
 9vORlz9cyyIRyRqelm7gavt7MqgTcDmNkxGpdEcdLAtXCcjrlmn5mp6Tf5T6FaTLGHIEE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0jDK-00059j-NT; Wed, 29 Jul 2020 10:21:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0jDK-0008KA-BE; Wed, 29 Jul 2020 10:21:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0jDK-0001gQ-AU; Wed, 29 Jul 2020 10:21:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152283-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152283: all pass - PUSHED
X-Osstest-Versions-This: xen=b071ec25e85c4aacf3da59e5258cda0b1c4df45d
X-Osstest-Versions-That: xen=0562cbc14cf02b8188b9f1f37f39a4886776ce7c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jul 2020 10:21:34 +0000
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

flight 152283 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152283/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b071ec25e85c4aacf3da59e5258cda0b1c4df45d
baseline version:
 xen                  0562cbc14cf02b8188b9f1f37f39a4886776ce7c

Last test of basis   152213  2020-07-26 09:18:31 Z    3 days
Testing same since   152283  2020-07-29 09:19:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

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
   0562cbc14c..b071ec25e8  b071ec25e85c4aacf3da59e5258cda0b1c4df45d -> coverity-tested/smoke

