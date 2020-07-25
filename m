Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B322D91B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jul 2020 19:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzOMy-0008Pm-2A; Sat, 25 Jul 2020 17:54:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjDR=BE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jzOMw-0008Ph-ED
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2020 17:53:58 +0000
X-Inumbo-ID: cf802e04-ce9f-11ea-a5c5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf802e04-ce9f-11ea-a5c5-12813bfff9fa;
 Sat, 25 Jul 2020 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RXQr/8nAWfufg2gtOZbMlvMwgsa/YNn6yWvsRd47dCo=; b=Lxy2Rn1Gvq7SE25FUpu5yocga
 I9royfYCSZPgsWt7xFggv5K/uuq0mZqrrjnZ9yQaaQlGfmJWvnVc8HpgC9YO7I8MfumEdJPZewrdJ
 ftKdV4iae5F03BLnWc+AYRhhMY5R6TUgGQdq/5cNwggnXjucQhc1FU2uQp4aCZ6Z90vQ8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzOMu-0006DK-0Z; Sat, 25 Jul 2020 17:53:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzOMt-0008KD-Ki; Sat, 25 Jul 2020 17:53:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jzOMt-0001da-KB; Sat, 25 Jul 2020 17:53:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152194-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152194: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8c30327debb28c0b6cfa2106b736774e0b20daac
X-Osstest-Versions-That: ovmf=91e4bcb313f0c1f0f19b87b5849f5486aa076be4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Jul 2020 17:53:55 +0000
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

flight 152194 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152194/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c30327debb28c0b6cfa2106b736774e0b20daac
baseline version:
 ovmf                 91e4bcb313f0c1f0f19b87b5849f5486aa076be4

Last test of basis   152186  2020-07-24 19:40:28 Z    0 days
Testing same since   152194  2020-07-25 06:34:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  Laszlo Ersek <lersek@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   91e4bcb313..8c30327deb  8c30327debb28c0b6cfa2106b736774e0b20daac -> xen-tested-master

