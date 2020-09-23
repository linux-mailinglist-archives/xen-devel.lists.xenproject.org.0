Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E5276328
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 23:32:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLCMk-0004d5-KR; Wed, 23 Sep 2020 21:31:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3kw=DA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLCMj-0004cl-18
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 21:31:53 +0000
X-Inumbo-ID: 8f88bf7c-d4bf-4eae-b309-d2a401224235
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f88bf7c-d4bf-4eae-b309-d2a401224235;
 Wed, 23 Sep 2020 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=pb4VyHPKY1fgVUJuLm8h8cL8l7YN1nhp+TRWWPPCY28=; b=yyys7E/HOof7VIYmZN0bHLIkDg
 zK+mrW14K4XWwJH27LRnj8M6z3E6HeowaR9nUGnRjYFYBGpcVc0hWBjsrze1KYOMyT0pG0MgXrM/I
 FsK2867WD+adP8stAWTBlcaGiPbey03hBprcXVdBeKhwp+Df4e63GzQI6xmgMqg0VBp0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLCMc-00055W-C6; Wed, 23 Sep 2020 21:31:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLCMc-0005Jm-2K; Wed, 23 Sep 2020 21:31:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLCMc-0003gv-1p; Wed, 23 Sep 2020 21:31:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154650-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 154650: tolerable trouble: fail/pass/starved
X-Osstest-Failures: examine:examine-italia0:host-install:broken:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe0:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay1:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-debina1:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
 examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-godello1:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe1:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-pinot1:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=152701
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Sep 2020 21:31:46 +0000
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

flight 154650 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154650/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-italia0               5 host-install                broken like 152701
 examine-albana1               2 hosts-allocate               starved  n/a
 examine-huxelrebe0            2 hosts-allocate               starved  n/a
 examine-albana0               2 hosts-allocate               starved  n/a
 examine-chardonnay1           2 hosts-allocate               starved  n/a
 examine-debina0               2 hosts-allocate               starved  n/a
 examine-debina1               2 hosts-allocate               starved  n/a
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-elbling1              2 hosts-allocate               starved  n/a
 examine-fiano1                2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a
 examine-godello1              2 hosts-allocate               starved  n/a
 examine-huxelrebe1            2 hosts-allocate               starved  n/a
 examine-pinot0                2 hosts-allocate               starved  n/a
 examine-pinot1                2 hosts-allocate               starved  n/a
 examine-rimava1               2 hosts-allocate               starved  n/a
 examine-chardonnay0           2 hosts-allocate               starved  n/a
 examine-fiano0                2 hosts-allocate               starved  n/a

baseline version:
 flight               152701

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
 examine-himrod1                                              pass    
 examine-himrod2                                              pass    
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


