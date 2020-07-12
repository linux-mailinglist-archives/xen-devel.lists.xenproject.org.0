Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465221C879
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2020 12:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juZ42-0001dJ-8e; Sun, 12 Jul 2020 10:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZHa=AX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1juZ41-0001dE-FQ
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 10:18:29 +0000
X-Inumbo-ID: 074ef030-c429-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 074ef030-c429-11ea-bb8b-bc764e2007e4;
 Sun, 12 Jul 2020 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7aLdQhRPmWh+wVWWA6pZY3Kfru/iky5rj172kDlGXGY=; b=fWV25ik4+Dg1g0XJFYYMWUpN/
 oDH82goTnW1gK3rWUZzH5ou8JoGG/ktfXNpmmfUKd8SH1bIIm5DUAPIQxqR7goleCp5BEQIzJIOq+
 Q81omDxZekA8JYD8ZFAtXgt4U1prZsipG0f3e63jNm+emM7/otlfPxZm76fqTxxRO+0r8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1juZ3z-0002kO-IX; Sun, 12 Jul 2020 10:18:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1juZ3z-0003kC-Ae; Sun, 12 Jul 2020 10:18:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1juZ3z-0001gS-9z; Sun, 12 Jul 2020 10:18:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151847-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151847: all pass - PUSHED
X-Osstest-Versions-This: xen=02d69864b51a4302a148c28d6d391238a6778b4b
X-Osstest-Versions-That: xen=3fdc211b01b29f252166937238efe02d15cb5780
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Jul 2020 10:18:27 +0000
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

flight 151847 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151847/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  02d69864b51a4302a148c28d6d391238a6778b4b
baseline version:
 xen                  3fdc211b01b29f252166937238efe02d15cb5780

Last test of basis   151733  2020-07-08 09:19:56 Z    4 days
Testing same since   151847  2020-07-12 09:18:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   3fdc211b01..02d69864b5  02d69864b51a4302a148c28d6d391238a6778b4b -> coverity-tested/smoke

