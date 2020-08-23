Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F424EF4C
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 20:39:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9utV-0004fj-Vx; Sun, 23 Aug 2020 18:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTdr=CB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k9utU-0004fe-E3
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 18:39:04 +0000
X-Inumbo-ID: 7ecc94a9-44ed-47fb-9262-95bcd794cd31
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ecc94a9-44ed-47fb-9262-95bcd794cd31;
 Sun, 23 Aug 2020 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=rFhUviiUg/I1mGCABEASRL768bx7mrtACkH1RCgSYlI=; b=vhs4VByTlxxK4alZilqWKLVT4O
 v7KUgZ8KV902jcku+8e3KI3Hpkd8DrVwB/hdJRewfmYBalW6Giig44gCG6cZsCi46HqJeW6/ddPfG
 I8p85WRzKDmKJjVXGBntHxJl6huESiGdj0tHZdwRZJkBBJ/6vRov6Wp3sxuaujQFZEoY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9utS-0005SI-9V; Sun, 23 Aug 2020 18:39:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9utS-0004CE-2S; Sun, 23 Aug 2020 18:39:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k9utS-00038Q-1s; Sun, 23 Aug 2020 18:39:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152701-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 152701: tolerable trouble: fail/pass/starved
X-Osstest-Failures: examine:examine-italia0:host-install:broken:nonblocking
 examine:examine-debina0:host-install:broken:nonblocking
 examine:examine-chardonnay1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe1:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-debina1:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
 examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe0:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-pinot1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=152156
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Aug 2020 18:39:02 +0000
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

flight 152701 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152701/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-italia0               5 host-install                broken like 152156
 examine-debina0               5 host-install                broken like 152156
 examine-chardonnay1           2 hosts-allocate               starved  n/a
 examine-huxelrebe1            2 hosts-allocate               starved  n/a
 examine-albana0               2 hosts-allocate               starved  n/a
 examine-albana1               2 hosts-allocate               starved  n/a
 examine-chardonnay0           2 hosts-allocate               starved  n/a
 examine-debina1               2 hosts-allocate               starved  n/a
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-elbling1              2 hosts-allocate               starved  n/a
 examine-fiano0                2 hosts-allocate               starved  n/a
 examine-fiano1                2 hosts-allocate               starved  n/a
 examine-huxelrebe0            2 hosts-allocate               starved  n/a
 examine-pinot0                2 hosts-allocate               starved  n/a
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-pinot1                2 hosts-allocate               starved  n/a

baseline version:
 flight               152156

jobs:
 examine-albana0                                              starved 
 examine-albana1                                              starved 
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    pass    
 examine-chardonnay0                                          starved 
 examine-chardonnay1                                          starved 
 examine-debina0                                              fail    
 examine-debina1                                              starved 
 examine-elbling0                                             starved 
 examine-elbling1                                             starved 
 examine-fiano0                                               starved 
 examine-fiano1                                               starved 
 examine-cubietruck-gleizes                                   pass    
 examine-godello0                                             pass    
 examine-godello1                                             pass    
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


