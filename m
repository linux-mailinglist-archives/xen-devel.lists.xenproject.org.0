Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1531A430F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 09:39:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMoF4-0002Zd-C6; Fri, 10 Apr 2020 07:38:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fqfT=52=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMoF3-0002ZY-CL
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 07:38:21 +0000
X-Inumbo-ID: 3f9b3ecd-7afe-11ea-83c0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f9b3ecd-7afe-11ea-83c0-12813bfff9fa;
 Fri, 10 Apr 2020 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CCsgA5NXGgF5gDQi8fTwS9qFKVygd9HVPn8qugm6kRY=; b=QH578UH2yJ0E8uGxdEpMObdia
 Ae4T2rtMHQE2rqxkfV4BDqDSchf73WF8tRAhFM9IbrAX0BBwpLSsA0/xOI+o3So7cmb8Q5k7J68bK
 Vr+2DG5FWaO1jvD3GCPnShK7XbYy6dxaWI/9+79ONB8Am/Z+h7C9YjaMdW8WmA/x3KIX0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMoF1-0008AZ-RB; Fri, 10 Apr 2020 07:38:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMoF1-0002l6-G2; Fri, 10 Apr 2020 07:38:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMoF1-0004G4-FK; Fri, 10 Apr 2020 07:38:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149560-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149560: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e4004e8e505a9ca697b1d5aaee9b3ae25cdc3b21
X-Osstest-Versions-That: ovmf=d4bc5378e003e53a1c76d106997cec4af46a133a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Apr 2020 07:38:19 +0000
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

flight 149560 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149560/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e4004e8e505a9ca697b1d5aaee9b3ae25cdc3b21
baseline version:
 ovmf                 d4bc5378e003e53a1c76d106997cec4af46a133a

Last test of basis   149528  2020-04-08 15:10:19 Z    1 days
Testing same since   149560  2020-04-09 10:09:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eugene Cohen <eugene@nuviainc.com>

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
   d4bc5378e0..e4004e8e50  e4004e8e505a9ca697b1d5aaee9b3ae25cdc3b21 -> xen-tested-master

