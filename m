Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919A1F0686
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 14:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhY9U-0007h4-IA; Sat, 06 Jun 2020 12:42:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUo7=7T=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhY9T-0007gz-5S
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 12:42:19 +0000
X-Inumbo-ID: 28001072-a7f3-11ea-96fb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28001072-a7f3-11ea-96fb-bc764e2007e4;
 Sat, 06 Jun 2020 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pO0jUbaA8FYBb9Ng1rSLv/S7LPBnHO9OlYuBB1apSQw=; b=D2ls59CDB3veZKkGXCYcBbq9D
 THVCmGoE3ShjYIWwFCKT/uMegNW4yB0gAmQqa4UFwR5E9zRswDmQHOUdtCyVac6MfmUzoV7QWUnEJ
 Bx2ZST/wNVIULZsfnYFeSqad7adg+A4oD2hVAvHUmr2RQZgD0bLN/tGUPSZ6wZQl0f8ug=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhY9R-00050B-Hm; Sat, 06 Jun 2020 12:42:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhY9R-0003Ax-9H; Sat, 06 Jun 2020 12:42:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhY9R-00071E-8i; Sat, 06 Jun 2020 12:42:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150894-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150894: all pass - PUSHED
X-Osstest-Versions-This: ovmf=037d86dd7a9ef36c85bf416d358f2ef60a4940b3
X-Osstest-Versions-That: ovmf=8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jun 2020 12:42:17 +0000
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

flight 150894 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150894/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 037d86dd7a9ef36c85bf416d358f2ef60a4940b3
baseline version:
 ovmf                 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae

Last test of basis   150819  2020-06-05 08:09:18 Z    1 days
Testing same since   150894  2020-06-06 08:09:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Leif Lindholm <leif@nuviainc.com>

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
   8035edbe12..037d86dd7a  037d86dd7a9ef36c85bf416d358f2ef60a4940b3 -> xen-tested-master

