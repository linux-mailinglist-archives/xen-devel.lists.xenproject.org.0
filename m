Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FF1ED47B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 18:43:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWUD-00028Y-7Z; Wed, 03 Jun 2020 16:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GLy=7Q=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jgWUB-00028T-Sr
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 16:43:27 +0000
X-Inumbo-ID: 562dbed6-a5b9-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 562dbed6-a5b9-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=85NI97GHdoKjkfO5we6qMz1uo7X8fxNGUgDltHMrihU=; b=adpNz2FW2wgMZ8cmtR8gLwxdf
 uJih3BxMnGkqJrp3GfPwIjboWFNO9BvfJvZSKo4AoGr/1w8JKxcsnVLKGytIOB2byXGoI40n6C8US
 0txxnxSKAtYS7lj+H6NzyPZgm4xkSPQyXXrwzcPaxo9FLWiIyJxupDB3nXXnurOrMNZsI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgWU6-0001QC-06; Wed, 03 Jun 2020 16:43:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgWU5-0006gV-Mx; Wed, 03 Jun 2020 16:43:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jgWU5-0003Yc-MH; Wed, 03 Jun 2020 16:43:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150653-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150653: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7191dd3c5990416cf473ce36b3fb84ecb2f7b950
X-Osstest-Versions-That: ovmf=ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Jun 2020 16:43:21 +0000
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

flight 150653 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150653/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7191dd3c5990416cf473ce36b3fb84ecb2f7b950
baseline version:
 ovmf                 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9

Last test of basis   150614  2020-06-02 08:10:08 Z    1 days
Testing same since   150653  2020-06-03 14:09:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>

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
   ca407c7246..7191dd3c59  7191dd3c5990416cf473ce36b3fb84ecb2f7b950 -> xen-tested-master

