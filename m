Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371C2350B6
	for <lists+xen-devel@lfdr.de>; Sat,  1 Aug 2020 07:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1kRy-0001sr-9F; Sat, 01 Aug 2020 05:52:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/imS=BL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k1kRx-0001s8-FE
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2020 05:52:53 +0000
X-Inumbo-ID: 3cba847c-d3bb-11ea-8ed9-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cba847c-d3bb-11ea-8ed9-bc764e2007e4;
 Sat, 01 Aug 2020 05:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X8zoxdh2O0JiBDWzseYObT+ngWa6395zHgld/a+2etI=; b=UGuHbqbF55Qd2UAym5l6MmZ9q
 xP4V9i36u7cgIP+LrhOUhrjTCUgw+3h988KRwb4yHCHH4DNWApAntAaqgTVJFYkczmXqoeEUkSGrn
 x1rLin3vGG5RJWzHwtr5MmJS8qFgb2BvyvRDgQq8ZUnYdpQjrVe479zTy0U2kHjB81guo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k1kRu-0005e2-UE; Sat, 01 Aug 2020 05:52:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k1kRu-0002jY-HP; Sat, 01 Aug 2020 05:52:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k1kRu-0000gC-Gp; Sat, 01 Aug 2020 05:52:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152329-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152329: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9001b750df64b25b14ec45a2efa1361a7b96c00a
X-Osstest-Versions-That: ovmf=7f79b736b0a57da71d87c987357db0227cd16ac6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Aug 2020 05:52:50 +0000
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

flight 152329 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152329/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9001b750df64b25b14ec45a2efa1361a7b96c00a
baseline version:
 ovmf                 7f79b736b0a57da71d87c987357db0227cd16ac6

Last test of basis   152315  2020-07-31 03:12:00 Z    1 days
Testing same since   152329  2020-07-31 15:40:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   7f79b736b0..9001b750df  9001b750df64b25b14ec45a2efa1361a7b96c00a -> xen-tested-master

