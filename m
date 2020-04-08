Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEF1A1FBE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8n9-0003oW-Re; Wed, 08 Apr 2020 11:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MCEd=5Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jM8n8-0003oM-Di
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:22:46 +0000
X-Inumbo-ID: 4308724c-798b-11ea-81ce-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4308724c-798b-11ea-81ce-12813bfff9fa;
 Wed, 08 Apr 2020 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIYToYQT7yKCp/SPUmOo5TEA8gCvNbAzIp2Msi3Q2xs=; b=L0Cdzuz5jFv6o3BH9Xn1AiZ48
 zkz6/1gz4rKZ5iOEwPY6YEeuTF0Yr/qp8FGjrNHaP0wnky++Ec122mRdK8JfrzmiGxd2rFL6DQqdz
 ij8a9PB9wtYuD96Ruu+qKRX0l5LeywgvOqw8LaXQhXCqlL07Z5UWm8qvFY6JecKxNYBEM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jM8n3-0002SQ-Pi; Wed, 08 Apr 2020 11:22:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jM8n3-0007YS-9C; Wed, 08 Apr 2020 11:22:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jM8n3-0006sv-8V; Wed, 08 Apr 2020 11:22:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149517-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149517: all pass - PUSHED
X-Osstest-Versions-This: xen=e013e8514389b739153016349e49f5a78e34ddf0
X-Osstest-Versions-That: xen=990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Apr 2020 11:22:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149517 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149517/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e013e8514389b739153016349e49f5a78e34ddf0
baseline version:
 xen                  990b6e38d93c6e60f9d81e8b71ddfd209fca00bd

Last test of basis   149438  2020-04-05 09:19:59 Z    3 days
Testing same since   149517  2020-04-08 09:19:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>
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
   990b6e38d9..e013e85143  e013e8514389b739153016349e49f5a78e34ddf0 -> coverity-tested/smoke

