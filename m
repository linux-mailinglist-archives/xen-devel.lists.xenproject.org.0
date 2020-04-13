Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D4F1A64C7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 11:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNvbM-0005IJ-AV; Mon, 13 Apr 2020 09:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F6Pd=55=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jNvbK-0005IE-Vj
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 09:41:59 +0000
X-Inumbo-ID: 0486ec18-7d6b-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0486ec18-7d6b-11ea-b58d-bc764e2007e4;
 Mon, 13 Apr 2020 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tmLbJzDwoxs0B3GLsza3hkXUTDwhWjRg0Fe/wl60Gj0=; b=GkKVx7mZlS1JPaOaNxv2QvepX
 pRMZNZ7W1Sf/HLN6exIgwI3XDqkEPvZlfwwV+ifyAfdcoMPtMpKU4c7YsbQsJi/O2U/MXWJGY1Dsy
 FtcnhN8xMSBiYyDq7SjfQuOjZu705LMmGfQsuKYaATUKv0u3SEZfbkywC2ImIOC88iyno=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jNvbJ-0005R3-MQ; Mon, 13 Apr 2020 09:41:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jNvbJ-0005YI-DX; Mon, 13 Apr 2020 09:41:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jNvbJ-00033C-Cs; Mon, 13 Apr 2020 09:41:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149636-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149636: all pass - PUSHED
X-Osstest-Versions-This: ovmf=776ec4ea3cbf027d258904a1d0a5b9821d07f2ef
X-Osstest-Versions-That: ovmf=48b6c60cc6a234d971d7ca97f7cd0ca9a9499de5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Apr 2020 09:41:57 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149636 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149636/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 776ec4ea3cbf027d258904a1d0a5b9821d07f2ef
baseline version:
 ovmf                 48b6c60cc6a234d971d7ca97f7cd0ca9a9499de5

Last test of basis   149633  2020-04-13 01:39:17 Z    0 days
Testing same since   149636  2020-04-13 06:12:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dong, Eric <eric.dong@intel.com>
  Eric Dong <eric.dong@intel.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Ray Ni <niruiyu@users.noreply.github.com>
  Ray Ni <ray.ni@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>

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
   48b6c60cc6..776ec4ea3c  776ec4ea3cbf027d258904a1d0a5b9821d07f2ef -> xen-tested-master

