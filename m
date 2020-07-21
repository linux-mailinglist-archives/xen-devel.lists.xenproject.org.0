Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA224228CB2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 01:27:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy1eP-0001fF-1T; Tue, 21 Jul 2020 23:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tByU=BA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jy1eN-0001es-D3
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 23:26:19 +0000
X-Inumbo-ID: 91179f9c-cba9-11ea-85f0-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91179f9c-cba9-11ea-85f0-bc764e2007e4;
 Tue, 21 Jul 2020 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=al3zr13s4ap9TCuTT30xKSNOKZIGN3eHcSdajgbYUP4=; b=BazIFIAc0FM9f/knjOWXX8s6n
 NBsCvVfVSeFHTzr+QyRBQ9maCFKDuTW+//vhoo85dfBVWeXq305picYsE7eiHlJjfUOIUK2GmBtbl
 lFP5KYeIBDEbYtZNyM2Sn7flQvuDhZ/Qu03OZIkADupV411lstx6b2kGbDQlq8ai8lkBs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jy1eG-0003J1-PQ; Tue, 21 Jul 2020 23:26:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jy1eG-0001M4-Dx; Tue, 21 Jul 2020 23:26:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jy1eG-0003Y6-D2; Tue, 21 Jul 2020 23:26:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152068-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152068: all pass - PUSHED
X-Osstest-Versions-This: ovmf=02539e900854488343a1efa435d4dded1ddd66a2
X-Osstest-Versions-That: ovmf=cb38ace647231076acfc0c5bdd21d3aff43e4f83
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Jul 2020 23:26:12 +0000
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

flight 152068 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152068/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 02539e900854488343a1efa435d4dded1ddd66a2
baseline version:
 ovmf                 cb38ace647231076acfc0c5bdd21d3aff43e4f83

Last test of basis   152048  2020-07-20 15:10:26 Z    1 days
Testing same since   152068  2020-07-21 07:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Rebecca Cran <rebecca@bsdio.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   cb38ace647..02539e9008  02539e900854488343a1efa435d4dded1ddd66a2 -> xen-tested-master

