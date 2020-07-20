Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A522619A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 16:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxWRj-0004vT-Er; Mon, 20 Jul 2020 14:07:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjZm=A7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jxWRh-0004v7-TL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 14:07:09 +0000
X-Inumbo-ID: 497e73c6-ca92-11ea-8494-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 497e73c6-ca92-11ea-8494-bc764e2007e4;
 Mon, 20 Jul 2020 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ezi5X1KWTHKJzPwcY30nxBgiKQFsZjCPZ4Kpb4ZZ+KA=; b=vx+ejDTm/hN1oC+y7WvxpI9ZR
 q7LrZtvT+jrAnyVCVkbCNUHJlFRoQjuU3sdXEFYPp8EDkpFVRvhELMcN9p+XLSZSTiUY5ZjFqVN7u
 lNa11aVEAuouQT+Ox1iZLXKEYajAowGrWAO8A1VSv0SlZXDIjQj/Fb2Ed3fk+dLsFJRzE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxWRb-0007X9-Cc; Mon, 20 Jul 2020 14:07:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxWRa-0006Qt-Tk; Mon, 20 Jul 2020 14:07:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jxWRa-0002aI-Sx; Mon, 20 Jul 2020 14:07:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152037-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152037: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3d9d66ad760b67bfdfb5b4b8e9b34f6af6c45935
X-Osstest-Versions-That: ovmf=3d8327496762b4f2a54c9bafd7a214314ec28e9e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Jul 2020 14:07:02 +0000
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

flight 152037 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152037/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3d9d66ad760b67bfdfb5b4b8e9b34f6af6c45935
baseline version:
 ovmf                 3d8327496762b4f2a54c9bafd7a214314ec28e9e

Last test of basis   151982  2020-07-18 02:36:30 Z    2 days
Testing same since   152037  2020-07-20 07:09:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   3d83274967..3d9d66ad76  3d9d66ad760b67bfdfb5b4b8e9b34f6af6c45935 -> xen-tested-master

