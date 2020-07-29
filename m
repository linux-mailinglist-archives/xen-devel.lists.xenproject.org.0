Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A13231F35
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 15:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0m21-0007eL-DD; Wed, 29 Jul 2020 13:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ULCb=BI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0m20-0007e1-EC
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 13:22:04 +0000
X-Inumbo-ID: 7a705248-d19e-11ea-a9d3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a705248-d19e-11ea-a9d3-12813bfff9fa;
 Wed, 29 Jul 2020 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXeePRQFOlKZZKH0vaaXF+/Hb68nt34CUdMTZ/EbfII=; b=whN2Ma5uzuFHOajIPgMrw89RB
 Ex7GdoZg1u0+KXxGALi9RedjoQ+BgYJ+kfioa1rXx9yixIj47++EHr1jV/W8Icf4PyqDA4abeH6ju
 /2gVky4wIMIovGpxUnID0UWSv9e/98l/aZXbAhubE8LmjjNl/rRMYNwEK0m5UK6kvpl0I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0m1t-0000NW-9z; Wed, 29 Jul 2020 13:21:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0m1s-0003dF-Tf; Wed, 29 Jul 2020 13:21:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0m1s-0007Vl-T0; Wed, 29 Jul 2020 13:21:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152277-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152277: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e848b58d7c85293cd4121287abcea2d22a4f0620
X-Osstest-Versions-That: ovmf=744ad444e5306ef68edbe899b5f5dc87e82c146b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jul 2020 13:21:56 +0000
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

flight 152277 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152277/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e848b58d7c85293cd4121287abcea2d22a4f0620
baseline version:
 ovmf                 744ad444e5306ef68edbe899b5f5dc87e82c146b

Last test of basis   152270  2020-07-28 19:10:31 Z    0 days
Testing same since   152277  2020-07-29 04:16:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   744ad444e5..e848b58d7c  e848b58d7c85293cd4121287abcea2d22a4f0620 -> xen-tested-master

