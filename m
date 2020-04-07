Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B51A1545
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 20:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLtKc-0007rl-0D; Tue, 07 Apr 2020 18:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VNrn=5X=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jLtKa-0007rg-RM
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 18:52:16 +0000
X-Inumbo-ID: e370c940-7900-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e370c940-7900-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8QUelkImtwK8dTNqVdGqj7N+hc/G2U2JS9Cj5gIr3c=; b=ZDkWg7zcXiHxioX10IslBeEJh
 x+PuvfyNd5vm5Y7x86UHpmig0ODTMvHHnE95yecF0Se1NunvHDQ+w1tkPJtdiYnXp47PTkshDs4j3
 W2n5New/uwS1RUuWHWxKgxAs5HUQa1Wm/2t0v1bN0bdAQaOaKvp9GEpDCIz56Og6UGYgc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLtKU-0001oX-RJ; Tue, 07 Apr 2020 18:52:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLtKU-0005ts-Dj; Tue, 07 Apr 2020 18:52:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jLtKU-0001Y9-DB; Tue, 07 Apr 2020 18:52:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149485-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149485: all pass - PUSHED
X-Osstest-Versions-This: ovmf=aab6a9c9aebb1f6614e72e98bdf6b5af93a43527
X-Osstest-Versions-That: ovmf=48f0e94921d83b8204f1025412e071b000394f04
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Apr 2020 18:52:10 +0000
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

flight 149485 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149485/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aab6a9c9aebb1f6614e72e98bdf6b5af93a43527
baseline version:
 ovmf                 48f0e94921d83b8204f1025412e071b000394f04

Last test of basis   149477  2020-04-07 01:39:26 Z    0 days
Testing same since   149485  2020-04-07 08:40:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Liming Gao <liming.gao@intel.com>

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
   48f0e94921..aab6a9c9ae  aab6a9c9aebb1f6614e72e98bdf6b5af93a43527 -> xen-tested-master

