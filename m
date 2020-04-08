Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5701A1957
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 02:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLyvb-0004Jg-1N; Wed, 08 Apr 2020 00:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MCEd=5Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jLyva-0004Jb-Da
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 00:50:50 +0000
X-Inumbo-ID: fa3aff4c-7932-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa3aff4c-7932-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 00:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dNGISrm2DnCZXxHE3tLFZttm6VtKdVKjj0McHGy6+XM=; b=15A1/e7b3mnBUVIxQ3go6RS2J
 w8cYUrX9L4LFzzSApLEx0QJ1VQ0E8z95+5QBBX7UJROCOWl1LYZPwibBRa8QS/efscSUAhRffKKMM
 TF7b/C7qQ1MkMmG04osmi4vOaWTKyxH1WVNQEvVLChLRc8cVXYI5ChseY5gct7F6/nmvw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLyvT-0000zk-4W; Wed, 08 Apr 2020 00:50:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLyvS-0008RI-JO; Wed, 08 Apr 2020 00:50:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jLyvS-00083K-Ie; Wed, 08 Apr 2020 00:50:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149497-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149497: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9bb1f080c45f7253f9270662d55865a8718cebc8
X-Osstest-Versions-That: ovmf=aab6a9c9aebb1f6614e72e98bdf6b5af93a43527
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Apr 2020 00:50:42 +0000
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

flight 149497 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149497/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9bb1f080c45f7253f9270662d55865a8718cebc8
baseline version:
 ovmf                 aab6a9c9aebb1f6614e72e98bdf6b5af93a43527

Last test of basis   149485  2020-04-07 08:40:39 Z    0 days
Testing same since   149497  2020-04-07 19:10:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
  Sean Brogan <sean.brogan@microsoft.com>
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
   aab6a9c9ae..9bb1f080c4  9bb1f080c45f7253f9270662d55865a8718cebc8 -> xen-tested-master

