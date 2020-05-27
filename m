Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B671E3F4D
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 12:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdtWL-00077f-Nk; Wed, 27 May 2020 10:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeBB=7J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jdtWL-00077a-0l
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 10:42:49 +0000
X-Inumbo-ID: cb4ca604-a006-11ea-a717-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb4ca604-a006-11ea-a717-12813bfff9fa;
 Wed, 27 May 2020 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/P2ceX11wSG3BWn37Ezvgb0T0f7m3FmQgxu24Dpo2U=; b=Xj9UZI6KbJp2l6i8+pFMqHp/z
 G0n5zPEgjsjPilEec2PQs1kRScQT+XET1EmEhZmjXRXJtE4HyX4nvZkuiAYU6X0CZ41PKUYShUlcR
 0ZkN6E96fuz7ucnGYkpJaG0Vvsbl6oYbs+Hk91rZQvgoLNt5PhTAfQkIcI95GZyxuJrAs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jdtWE-0000MT-LR; Wed, 27 May 2020 10:42:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jdtWE-0003WP-8I; Wed, 27 May 2020 10:42:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jdtWE-0001jH-7d; Wed, 27 May 2020 10:42:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150392-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150392: all pass - PUSHED
X-Osstest-Versions-This: ovmf=568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3
X-Osstest-Versions-That: ovmf=1c877c716038a862e876cac8f0929bab4a96e849
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 May 2020 10:42:42 +0000
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

flight 150392 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150392/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3
baseline version:
 ovmf                 1c877c716038a862e876cac8f0929bab4a96e849

Last test of basis   150318  2020-05-22 05:16:35 Z    5 days
Testing same since   150392  2020-05-27 02:39:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   1c877c7160..568eee7cf3  568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 -> xen-tested-master

