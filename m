Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A219023C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 00:50:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGWnW-00031W-9o; Mon, 23 Mar 2020 23:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGWnU-00031R-PV
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 23:47:56 +0000
X-Inumbo-ID: b4ee145c-6d60-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4ee145c-6d60-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MaM0eGaTlN8OUdes3BIkiyEVAsUJ1SHSK7S3EmcM0fE=; b=HUEVpq1GZyDA8KD9XYYxPJS63
 PXvZfJL1f7ZYJsRXoe9Dks4HVWxyti9KINGtXV2mjd7/RL0AugXFi8NEGWTkopsOCJWUoNXmC4hL1
 cZ6/rd7SyfvF63V7HIrlQisIcmcnh4/Gc3W/FW62XjTYEh3so+Dle+/OFIEBdVkO6VjGY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGWnO-0000KK-Kb; Mon, 23 Mar 2020 23:47:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGWnO-00050q-6D; Mon, 23 Mar 2020 23:47:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGWnO-0004Lh-5c; Mon, 23 Mar 2020 23:47:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148921-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe1:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-debina1:hosts-allocate:starved:nonblocking
 examine:examine-godello1:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe0:hosts-allocate:starved:nonblocking
 examine:examine-italia0:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay1:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=147499
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Mar 2020 23:47:50 +0000
Subject: [Xen-devel] [examine test] 148921: tolerable trouble: pass/starved
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

flight 148921 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/148921/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-fiano1                2 hosts-allocate               starved  n/a
 examine-huxelrebe1            2 hosts-allocate               starved  n/a
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-debina1               2 hosts-allocate               starved  n/a
 examine-godello1              2 hosts-allocate               starved  n/a
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-huxelrebe0            2 hosts-allocate               starved  n/a
 examine-italia0               2 hosts-allocate               starved  n/a
 examine-debina0               2 hosts-allocate               starved  n/a
 examine-fiano0                2 hosts-allocate               starved  n/a
 examine-albana1               2 hosts-allocate               starved  n/a
 examine-albana0               2 hosts-allocate               starved  n/a
 examine-chardonnay1           2 hosts-allocate               starved  n/a
 examine-chardonnay0           2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a
 examine-elbling1              2 hosts-allocate               starved  n/a

baseline version:
 flight               147499

jobs:
 examine-albana0                                              starved 
 examine-albana1                                              starved 
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    pass    
 examine-chardonnay0                                          starved 
 examine-chardonnay1                                          starved 
 examine-debina0                                              starved 
 examine-debina1                                              starved 
 examine-elbling0                                             starved 
 examine-elbling1                                             starved 
 examine-fiano0                                               starved 
 examine-fiano1                                               starved 
 examine-cubietruck-gleizes                                   pass    
 examine-godello0                                             starved 
 examine-godello1                                             starved 
 examine-huxelrebe0                                           starved 
 examine-huxelrebe1                                           starved 
 examine-italia0                                              starved 
 examine-arndale-lakeside                                     pass    
 examine-laxton0                                              pass    
 examine-laxton1                                              pass    
 examine-arndale-metrocentre                                  pass    
 examine-cubietruck-metzinger                                 pass    
 examine-cubietruck-picasso                                   pass    
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


