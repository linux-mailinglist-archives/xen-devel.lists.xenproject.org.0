Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971492211BC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:57:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjmG-0007aI-0X; Wed, 15 Jul 2020 15:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzA3=A2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jvjmE-0007aD-J7
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:56:58 +0000
X-Inumbo-ID: cfb1affe-c6b3-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfb1affe-c6b3-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 15:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0bLvbgZywoL0EDC0g/KkVkjpNSI183mn2yebHyHfy4=; b=0s/Rh+mTxFucxRz6mx8Hehlhj
 LzJekMzjLANuTYd1fsGMHTKPxW0JwldqTMXaBYF2N8PVj7fA9rXGesHiW4zQrBRyb3amfBDrB4DuX
 otAv7fsC1/8KwL1fThLHV/yBuuak8vGi0L0lX7MwClNtf3BeWyVFVauV7extHmj7brark=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvjmC-000116-R8; Wed, 15 Jul 2020 15:56:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvjmC-0003sE-Bp; Wed, 15 Jul 2020 15:56:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jvjmC-0007RG-B8; Wed, 15 Jul 2020 15:56:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151907-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151907: all pass - PUSHED
X-Osstest-Versions-This: ovmf=c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc
X-Osstest-Versions-That: ovmf=256c4470f86e53661c070f8c64a1052e975f9ef0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Jul 2020 15:56:56 +0000
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

flight 151907 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151907/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc
baseline version:
 ovmf                 256c4470f86e53661c070f8c64a1052e975f9ef0

Last test of basis   151898  2020-07-14 17:42:39 Z    0 days
Testing same since   151907  2020-07-15 03:30:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhichao Gao <zhichao.gao@intel.com>

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
   256c4470f8..c7195b9ec3  c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc -> xen-tested-master

