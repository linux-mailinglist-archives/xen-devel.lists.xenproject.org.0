Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75561EF6DD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:55:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAvk-0001GB-FO; Fri, 05 Jun 2020 11:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vDJQ=7S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhAvj-0001G6-13
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:54:35 +0000
X-Inumbo-ID: 526195be-a723-11ea-afa4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 526195be-a723-11ea-afa4-12813bfff9fa;
 Fri, 05 Jun 2020 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I90I8iOj7Xwt5/Mw1Doijh+XXWNpGPeBgsp1iEMgf1U=; b=lr2PfaBCIE96SUtVDdIPDn+UY
 K5GlaPjStCsDYWH1QFKSbfQJVV04mv3Sad0QxTjOQ/GrW3iiWq6gnVy8B6+zG8sZ3lLRxHm959xMn
 QAEhC/wLZb8WLjTOirzAmsdkHgxS/PXlWdqjXd6wQlmw0ZbxfCGg33/9tb2jBwUPJeBRs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhAvh-0003op-6v; Fri, 05 Jun 2020 11:54:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhAvh-00026S-0M; Fri, 05 Jun 2020 11:54:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhAvg-0000tv-Vv; Fri, 05 Jun 2020 11:54:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150819-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150819: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae
X-Osstest-Versions-That: ovmf=bb78cfbec07eda45118b630a09b0af549b43a135
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jun 2020 11:54:32 +0000
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

flight 150819 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150819/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae
baseline version:
 ovmf                 bb78cfbec07eda45118b630a09b0af549b43a135

Last test of basis   150687  2020-06-04 09:14:34 Z    1 days
Testing same since   150819  2020-06-05 08:09:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>

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
   bb78cfbec0..8035edbe12  8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae -> xen-tested-master

