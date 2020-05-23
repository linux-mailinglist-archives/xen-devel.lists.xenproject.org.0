Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC81DFB19
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 23:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcbKb-0000EP-8K; Sat, 23 May 2020 21:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlJ7=7F=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jcbKa-0000EK-IJ
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 21:05:20 +0000
X-Inumbo-ID: 18b9251e-9d39-11ea-ad54-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18b9251e-9d39-11ea-ad54-12813bfff9fa;
 Sat, 23 May 2020 21:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nvfc88kY6tEGi6kGeGQlvmu1mJk63BcBO2Gps+PSsqI=; b=CiU5oU6h7/mGnlBvUh3UcO5PK
 SVcj/h5XIP7/TKOptcNtfsbOk24N04q7ibDld0EE5AXDqTKMp91l/8Rn6LX+Eno7PB4+Plp2GcxlW
 U1QhrDO6G0iMM3nKY523vuQfYWxHXzs5vAAoDtuycT/VIisEWgDDHu6pCDJbIeKDMmGEM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcbKT-0004ct-Nk; Sat, 23 May 2020 21:05:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcbKT-0002jL-9S; Sat, 23 May 2020 21:05:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jcbKT-00041m-8l; Sat, 23 May 2020 21:05:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150344-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 150344: tolerable trouble: pass/starved
X-Osstest-Failures: examine:examine-albana0:memdisk-try-append:fail:nonblocking
 examine:examine-albana1:memdisk-try-append:fail:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-rochester0:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=149782
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 May 2020 21:05:13 +0000
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

flight 150344 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150344/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-albana0               4 memdisk-try-append           fail  like 149782
 examine-albana1               4 memdisk-try-append           fail  like 149782
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-rochester0            2 hosts-allocate               starved  n/a
 examine-debina0               2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a
 examine-elbling1              2 hosts-allocate               starved  n/a

baseline version:
 flight               149782

jobs:
 examine-albana0                                              pass    
 examine-albana1                                              pass    
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    pass    
 examine-chardonnay0                                          pass    
 examine-chardonnay1                                          pass    
 examine-debina0                                              starved 
 examine-debina1                                              pass    
 examine-elbling0                                             pass    
 examine-elbling1                                             starved 
 examine-fiano0                                               pass    
 examine-fiano1                                               pass    
 examine-cubietruck-gleizes                                   pass    
 examine-godello0                                             starved 
 examine-godello1                                             pass    
 examine-huxelrebe0                                           pass    
 examine-huxelrebe1                                           pass    
 examine-italia0                                              pass    
 examine-arndale-lakeside                                     pass    
 examine-laxton0                                              pass    
 examine-laxton1                                              pass    
 examine-arndale-metrocentre                                  pass    
 examine-cubietruck-metzinger                                 pass    
 examine-cubietruck-picasso                                   pass    
 examine-pinot0                                               pass    
 examine-pinot1                                               pass    
 examine-rimava1                                              starved 
 examine-rochester0                                           starved 
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


