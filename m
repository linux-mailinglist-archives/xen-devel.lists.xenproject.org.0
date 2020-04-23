Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2C1B6A1A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 01:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRlYD-00040g-8S; Thu, 23 Apr 2020 23:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HETR=6H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRlYC-00040b-7y
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 23:46:36 +0000
X-Inumbo-ID: a5ac0463-85bc-11ea-9432-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5ac0463-85bc-11ea-9432-12813bfff9fa;
 Thu, 23 Apr 2020 23:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YTgUcQT7dHeYqNjNxaF5Yo3r3I0dQgvLHiwABNL65CY=; b=7PtL2mOExD17/TQCj1LTllZu6
 nTj+au+pZpyu3HgzxH5ncQpB5UlwwcGcrlowiEvk+60xOIrpzYIE28hZ4iY/J2IVJAny10s6cdwfx
 TPq4WpKbpNb+OM2whL2EbygyGNtSL5MqOEecuOZLRl2n7Cw7S/zKgHxx82VZesAqPCw/c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRlY3-0000nu-1g; Thu, 23 Apr 2020 23:46:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRlY2-00043N-Nd; Thu, 23 Apr 2020 23:46:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRlY2-0001uj-Mw; Thu, 23 Apr 2020 23:46:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149768-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 149768: tolerable trouble: pass/starved
X-Osstest-Failures: examine:examine-laxton1:hosts-allocate:starved:nonblocking
 examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
 examine:examine-laxton0:hosts-allocate:starved:nonblocking
 examine:examine-rochester0:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-cubietruck-braque:hosts-allocate:starved:nonblocking
 examine:examine-italia0:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
 examine:examine-pinot1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=149739
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Apr 2020 23:46:26 +0000
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

flight 149768 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149768/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-laxton1               2 hosts-allocate               starved  n/a
 examine-fiano1                2 hosts-allocate               starved  n/a
 examine-fiano0                2 hosts-allocate               starved  n/a
 examine-laxton0               2 hosts-allocate               starved  n/a
 examine-rochester0            2 hosts-allocate               starved  n/a
 examine-albana0               2 hosts-allocate               starved  n/a
 examine-cubietruck-braque     2 hosts-allocate               starved  n/a
 examine-italia0               2 hosts-allocate               starved  n/a
 examine-pinot0                2 hosts-allocate               starved  n/a
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-debina0               2 hosts-allocate               starved  n/a
 examine-chardonnay0           2 hosts-allocate               starved  n/a
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a
 examine-albana1               2 hosts-allocate               starved  n/a
 examine-pinot1                2 hosts-allocate               starved  n/a

baseline version:
 flight               149739

jobs:
 examine-albana0                                              starved 
 examine-albana1                                              starved 
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    starved 
 examine-chardonnay0                                          starved 
 examine-chardonnay1                                          pass    
 examine-debina0                                              starved 
 examine-debina1                                              pass    
 examine-elbling0                                             starved 
 examine-elbling1                                             pass    
 examine-fiano0                                               starved 
 examine-fiano1                                               starved 
 examine-cubietruck-gleizes                                   pass    
 examine-godello0                                             starved 
 examine-godello1                                             pass    
 examine-huxelrebe0                                           pass    
 examine-huxelrebe1                                           pass    
 examine-italia0                                              starved 
 examine-arndale-lakeside                                     pass    
 examine-laxton0                                              starved 
 examine-laxton1                                              starved 
 examine-arndale-metrocentre                                  pass    
 examine-cubietruck-metzinger                                 pass    
 examine-cubietruck-picasso                                   pass    
 examine-pinot0                                               starved 
 examine-pinot1                                               starved 
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


