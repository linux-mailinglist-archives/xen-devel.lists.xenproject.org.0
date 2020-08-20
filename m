Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0024AD73
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 05:47:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8bXS-0000oX-DO; Thu, 20 Aug 2020 03:46:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wn9w=B6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k8bXR-0000o8-IB
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 03:46:53 +0000
X-Inumbo-ID: 2aade9de-557b-4f87-be62-061322069a6a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aade9de-557b-4f87-be62-061322069a6a;
 Thu, 20 Aug 2020 03:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=bz6hwKfYickDT8AkpUvj3bgDn895H10lcblcA014ORw=; b=wyJbvLmZyz5lKhVoxw+ZS5StZs
 zdYNNZu6YwCx6A8mQsPX+3x2WgzFL0x9ozi67IxiQ3PpZd4frVBSLPoNOYot84UFpAVVduryr3N5l
 3T4ymfZsr3zSqToNZCguP5fYI081xNqYpEaBaTB54bcPkmWwI58daOvd1ia+Lxa5jx+8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8bXK-0007aF-Gu; Thu, 20 Aug 2020 03:46:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8bXK-0004BW-9P; Thu, 20 Aug 2020 03:46:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k8bXK-0002OQ-90; Thu, 20 Aug 2020 03:46:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152617-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152617: all pass - PUSHED
X-Osstest-Versions-This: ovmf=a048af3c9073e4b8108e6cf920bbb35574059639
X-Osstest-Versions-That: ovmf=7f7f511c5a74676523ed48435350f6e35282b62b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Aug 2020 03:46:46 +0000
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

flight 152617 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152617/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a048af3c9073e4b8108e6cf920bbb35574059639
baseline version:
 ovmf                 7f7f511c5a74676523ed48435350f6e35282b62b

Last test of basis   152594  2020-08-14 03:13:03 Z    6 days
Testing same since   152617  2020-08-19 09:13:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Cole Robinson <crobinso@redhat.com>
  Hao A Wu <hao.a.wu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Ray Ni <ray.ni@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   7f7f511c5a..a048af3c90  a048af3c9073e4b8108e6cf920bbb35574059639 -> xen-tested-master

