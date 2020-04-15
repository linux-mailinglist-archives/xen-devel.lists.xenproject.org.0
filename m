Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E51A9AB0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:36:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfOf-0003JD-07; Wed, 15 Apr 2020 10:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+yDq=57=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jOfOd-0003J8-5s
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:35:55 +0000
X-Inumbo-ID: df61b148-7f04-11ea-8a2b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df61b148-7f04-11ea-8a2b-12813bfff9fa;
 Wed, 15 Apr 2020 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L87jQAE7GE8jHv7FAN0VirH5MQhaypPsJDf8TlGnwlg=; b=SWQipN0BIFluTbuY+Y4RnnY8V
 6igeWMQpgiqo1nz5pPLGB4KsM6kuRuqwy8zkTWSoH29XdlJpno3q3Ua2uc0zk8DEwz8Z0P3KAzCZO
 ElsKqZz3rykv9RBLstgu87R+1Ps5oUpSI+E1iCAL1JWSPnL4OqakpEKRA0/LXxs76+PBk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOfOX-0000XI-1U; Wed, 15 Apr 2020 10:35:49 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOfOW-0005FH-LX; Wed, 15 Apr 2020 10:35:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jOfOW-0004xw-KZ; Wed, 15 Apr 2020 10:35:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149674-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149674: all pass - PUSHED
X-Osstest-Versions-This: xen=fcd06227f83643194f8018f8dd37adce57763a61
X-Osstest-Versions-That: xen=7372466b21c3b6c96bb7a52754e432bac883a1e3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Apr 2020 10:35:48 +0000
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

flight 149674 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149674/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  fcd06227f83643194f8018f8dd37adce57763a61
baseline version:
 xen                  7372466b21c3b6c96bb7a52754e432bac883a1e3

Last test of basis   149630  2020-04-12 09:19:20 Z    3 days
Testing same since   149674  2020-04-15 09:19:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandru Isaila <aisaila@bitdefender.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Pawel Wieczorkiewicz <wipawel@amazon.de>
  Ross Lagerwall <ross.lagerwall@citrix.com>
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
   7372466b21..fcd06227f8  fcd06227f83643194f8018f8dd37adce57763a61 -> coverity-tested/smoke

