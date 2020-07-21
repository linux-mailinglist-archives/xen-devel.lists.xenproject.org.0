Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6D227941
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 09:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxmOl-0002sc-ID; Tue, 21 Jul 2020 07:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tByU=BA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jxmOj-0002sI-Fx
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 07:09:09 +0000
X-Inumbo-ID: 0e67a0ca-cb21-11ea-a08a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e67a0ca-cb21-11ea-a08a-12813bfff9fa;
 Tue, 21 Jul 2020 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LiUN3/0udrFNW6f+LPagfn1VM+6YUkVoN89sqRuCPUs=; b=bQaX548DXBy15oaUnk58J93rL
 SMY+xFpaSwfvfogkhGoGAn0bWeHmk8Lva+Gg8TA364guHLcwtoCjNqAHGzPOp1xTS+n+nbXfPcXsg
 kSIaRmpKMH0bQ7/bO7cIFlUYE7RAHpLan3C86+LDg0PbVpEmNCpyH4FnWxBp+XkTSNLNs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxmOc-0006t3-6q; Tue, 21 Jul 2020 07:09:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jxmOb-0000IR-HL; Tue, 21 Jul 2020 07:09:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jxmOb-0001c0-Ge; Tue, 21 Jul 2020 07:09:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152048-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152048: all pass - PUSHED
X-Osstest-Versions-This: ovmf=cb38ace647231076acfc0c5bdd21d3aff43e4f83
X-Osstest-Versions-That: ovmf=3d9d66ad760b67bfdfb5b4b8e9b34f6af6c45935
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Jul 2020 07:09:01 +0000
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

flight 152048 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152048/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cb38ace647231076acfc0c5bdd21d3aff43e4f83
baseline version:
 ovmf                 3d9d66ad760b67bfdfb5b4b8e9b34f6af6c45935

Last test of basis   152037  2020-07-20 07:09:58 Z    0 days
Testing same since   152048  2020-07-20 15:10:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KrishnadasX Veliyathuparambil Prakashan <krishnadasx.veliyathuparambil.prakashan@intel.com>

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
   3d9d66ad76..cb38ace647  cb38ace647231076acfc0c5bdd21d3aff43e4f83 -> xen-tested-master

