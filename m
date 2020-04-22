Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CA1B3BDB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRC9L-0000Lz-S6; Wed, 22 Apr 2020 09:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GuZW=6G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRC9K-0000Lu-75
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:58:34 +0000
X-Inumbo-ID: cee8856e-847f-11ea-924e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cee8856e-847f-11ea-924e-12813bfff9fa;
 Wed, 22 Apr 2020 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQBmOnL/bai8WT6lXnGaBxTwKILIHtVuc5OOFpNR+4Q=; b=maNOwoDMF0ngxQkS3VOMW3Mss
 4L+vjsRVufWIUDGiQvMXjvldSwQkB9R1sSZkkw9kUIN3ijHtHzap99fSVCEDGwVmqjk5mR12MJAQ9
 6v8chEtKHvDK0w46Mug60cvvsBz0bTuguhyVNEnHW34LDkBjzDOk5LWdA8NZjC1js40D8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRC9B-0002ID-EG; Wed, 22 Apr 2020 09:58:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRC9A-0003h2-VS; Wed, 22 Apr 2020 09:58:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRC9A-0002BW-Up; Wed, 22 Apr 2020 09:58:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149734-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149734: all pass - PUSHED
X-Osstest-Versions-This: xen=5730ac3c8346f56fe8ee90249cdcbdab2a4d5791
X-Osstest-Versions-That: xen=fcd06227f83643194f8018f8dd37adce57763a61
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Apr 2020 09:58:24 +0000
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

flight 149734 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149734/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5730ac3c8346f56fe8ee90249cdcbdab2a4d5791
baseline version:
 xen                  fcd06227f83643194f8018f8dd37adce57763a61

Last test of basis   149674  2020-04-15 09:19:13 Z    7 days
Testing same since   149734  2020-04-22 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Harsha Shamsundara Havanur <havanur@amazon.com>
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Jeff Kubascik <jeff.kubascik@dornerworks.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Peng Fan <peng.fan@nxp.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tim Deegan <tim@xen.org>
  Wei Liu <wei.liu2@citrix.com>
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
   fcd06227f8..5730ac3c83  5730ac3c8346f56fe8ee90249cdcbdab2a4d5791 -> coverity-tested/smoke

