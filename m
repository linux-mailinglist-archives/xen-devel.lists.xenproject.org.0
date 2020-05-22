Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0931DEA76
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:56:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc94u-0006fT-Ji; Fri, 22 May 2020 14:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obdr=7E=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jc94s-0006fO-V4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:55:14 +0000
X-Inumbo-ID: 3b199aba-9c3c-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b199aba-9c3c-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5uh8SK0CzB13ud1UpLCQsQg+EtHlPgoL2KVr0i3fRQ=; b=dZ64Ix5C89TT2O3kt/FsJfQRR
 gYslCF571gCa/GDsXT7Bj2LMZJ7JIc9pgzga1OcajyhVcpAATl2H35oU1ZBDwJVbriTAogkcqj8M8
 EqPdhIxOrdlIaYYqAHt4HwPWYP9VJCm8Im36WW41g02owx72jtMv02oTv/Qi3mijNL6GM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jc94m-0004wS-Mm; Fri, 22 May 2020 14:55:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jc94m-0001w6-EO; Fri, 22 May 2020 14:55:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jc94m-0005HP-Dk; Fri, 22 May 2020 14:55:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150318-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150318: all pass - PUSHED
X-Osstest-Versions-This: ovmf=1c877c716038a862e876cac8f0929bab4a96e849
X-Osstest-Versions-That: ovmf=1a2ad3ba9efdd0db4bf1b6c114eedb59d6c483ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 May 2020 14:55:08 +0000
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

flight 150318 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150318/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1c877c716038a862e876cac8f0929bab4a96e849
baseline version:
 ovmf                 1a2ad3ba9efdd0db4bf1b6c114eedb59d6c483ca

Last test of basis   150313  2020-05-21 23:10:47 Z    0 days
Testing same since   150318  2020-05-22 05:16:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <liming.gao@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Vitaly Cheptsov <vit9696@protonmail.com>

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
   1a2ad3ba9e..1c877c7160  1c877c716038a862e876cac8f0929bab4a96e849 -> xen-tested-master

