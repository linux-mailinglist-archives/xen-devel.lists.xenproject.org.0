Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17291F889A
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2020 13:29:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkQnR-0005yp-KI; Sun, 14 Jun 2020 11:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BL3k=73=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jkQnQ-0005yU-P2
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 11:27:28 +0000
X-Inumbo-ID: 03558b86-ae32-11ea-b736-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03558b86-ae32-11ea-b736-12813bfff9fa;
 Sun, 14 Jun 2020 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CqhVlYgpidU46rUCBNg6bBqT6FXDeV5Tq287JTyscnE=; b=Zf81fnxCxYOf6jQb2Yhs1o1ND
 qczUU1pQw8/8n96xjPdbEiRDHGpQ+v9HrYP3mxEu7n2iDNNFTSb36ej5a6HfoXIwIm1fNnBkX68qp
 mDUOXbX42vp3cWuKdoKa+48vPANPUZ/5Lh1gxf0g1my0azFeh0ry2Uku2sxmSmLxXyx7I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkQnI-0001RL-Ug; Sun, 14 Jun 2020 11:27:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkQnH-0001yE-NU; Sun, 14 Jun 2020 11:27:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jkQnH-00006s-Mn; Sun, 14 Jun 2020 11:27:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151106-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151106: all pass - PUSHED
X-Osstest-Versions-This: xen=b91825f628c9a62cf2a3a0d972ea81484a8b7fce
X-Osstest-Versions-That: xen=51ca66c37371b10b378513af126646de22eddb17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Jun 2020 11:27:19 +0000
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

flight 151106 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151106/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b91825f628c9a62cf2a3a0d972ea81484a8b7fce
baseline version:
 xen                  51ca66c37371b10b378513af126646de22eddb17

Last test of basis   150905  2020-06-07 09:19:18 Z    7 days
Failing since        151009  2020-06-10 09:20:09 Z    4 days    2 attempts
Testing same since   151106  2020-06-14 09:23:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
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
   51ca66c373..b91825f628  b91825f628c9a62cf2a3a0d972ea81484a8b7fce -> coverity-tested/smoke

