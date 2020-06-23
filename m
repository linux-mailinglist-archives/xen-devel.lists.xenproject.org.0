Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5B2067CA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 01:01:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnrtV-0005BN-R4; Tue, 23 Jun 2020 22:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ps9c=AE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jnrtT-0005BI-Mw
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 22:59:55 +0000
X-Inumbo-ID: 40b6155c-b5a5-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40b6155c-b5a5-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ucWI/h8qysrBMkmF1Xw45oFXgkc2cq3oKoy8b+N2iU4=; b=fcJR0C4H5MpKO8z+QOUHwHht/
 P382L+k8SaKJ98SZbLI3uBXpwZf79b51vzB4CfDHyYl6+Bm4NVQPTnPp4Pw0bzW8pSntrirvXk1g6
 tg9NALdmqtJXAboKv0SzqofkWISizqjci2eqGtL911PT2ly2hOhZKatjiPfOwJdFA6rYk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnrtS-0007jk-EK; Tue, 23 Jun 2020 22:59:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnrtS-00014d-1Y; Tue, 23 Jun 2020 22:59:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jnrtS-0006bS-0w; Tue, 23 Jun 2020 22:59:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151315-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 151315: regressions - trouble: fail/pass/starved
X-Osstest-Failures: examine:examine-italia0:examine-iommu:fail:regression
 examine:examine-debina1:examine-iommu:fail:regression
 examine:examine-debina0:examine-iommu:fail:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
 examine:examine-pinot1:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe1:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
 examine:examine-godello1:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay1:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe0:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-cubietruck-gleizes:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=150344
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jun 2020 22:59:54 +0000
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

flight 151315 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151315/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 examine-italia0              13 examine-iommu            fail REGR. vs. 150344
 examine-debina1              13 examine-iommu            fail REGR. vs. 150344

Tests which did not succeed, but are not blocking:
 examine-debina0              13 examine-iommu           fail blocked in 150344
 examine-fiano0                2 hosts-allocate               starved  n/a
 examine-pinot1                2 hosts-allocate               starved  n/a
 examine-chardonnay0           2 hosts-allocate               starved  n/a
 examine-fiano1                2 hosts-allocate               starved  n/a
 examine-huxelrebe1            2 hosts-allocate               starved  n/a
 examine-elbling1              2 hosts-allocate               starved  n/a
 examine-godello1              2 hosts-allocate               starved  n/a
 examine-chardonnay1           2 hosts-allocate               starved  n/a
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-pinot0                2 hosts-allocate               starved  n/a
 examine-huxelrebe0            2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-cubietruck-gleizes    2 hosts-allocate               starved  n/a
 examine-albana0               2 hosts-allocate               starved  n/a
 examine-albana1               2 hosts-allocate               starved  n/a

baseline version:
 flight               150344

jobs:
 examine-albana0                                              starved 
 examine-albana1                                              starved 
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    pass    
 examine-chardonnay0                                          starved 
 examine-chardonnay1                                          starved 
 examine-debina0                                              fail    
 examine-debina1                                              fail    
 examine-elbling0                                             starved 
 examine-elbling1                                             starved 
 examine-fiano0                                               starved 
 examine-fiano1                                               starved 
 examine-cubietruck-gleizes                                   starved 
 examine-godello0                                             starved 
 examine-godello1                                             starved 
 examine-huxelrebe0                                           starved 
 examine-huxelrebe1                                           starved 
 examine-italia0                                              fail    
 examine-arndale-lakeside                                     pass    
 examine-laxton0                                              pass    
 examine-laxton1                                              pass    
 examine-arndale-metrocentre                                  pass    
 examine-cubietruck-metzinger                                 pass    
 examine-cubietruck-picasso                                   pass    
 examine-pinot0                                               starved 
 examine-pinot1                                               starved 
 examine-rimava1                                              starved 
 examine-rochester0                                           pass    
 examine-rochester1                                           pass    
 examine-arndale-westfield                                    pass    


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


Push not applicable.


