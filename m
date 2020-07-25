Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADF22D587
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jul 2020 08:34:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzDjl-0001Gc-D7; Sat, 25 Jul 2020 06:32:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjDR=BE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jzDjk-0001GI-8Q
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2020 06:32:48 +0000
X-Inumbo-ID: a4777ac8-ce40-11ea-88f9-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4777ac8-ce40-11ea-88f9-bc764e2007e4;
 Sat, 25 Jul 2020 06:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U5jhLuC1YaKlDGwgjESw7IBpKfLJcVzYhkDxVByaTxg=; b=vno1RAtwid/K2BX3aTGKQOZL8
 3BpYDm52yh9jWcVPwFKpIuwIEAssgwCOe1bw1baqD4meW+iao7ICYeu4STlaWbF3NC30QgYk8aq6w
 RybjS8V9ncvxQJyQcGPUc0oyMzsfMEGJSnO5dAvDZi2lcYFMzJkzlCQfDxF+5hd3xvnJg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzDjd-00089z-EP; Sat, 25 Jul 2020 06:32:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzDjd-0000XN-5m; Sat, 25 Jul 2020 06:32:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jzDjd-00035Q-5B; Sat, 25 Jul 2020 06:32:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152186-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152186: all pass - PUSHED
X-Osstest-Versions-This: ovmf=91e4bcb313f0c1f0f19b87b5849f5486aa076be4
X-Osstest-Versions-That: ovmf=50528537b2fb0ebdf32c719a0525635c93b905c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Jul 2020 06:32:41 +0000
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

flight 152186 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152186/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 91e4bcb313f0c1f0f19b87b5849f5486aa076be4
baseline version:
 ovmf                 50528537b2fb0ebdf32c719a0525635c93b905c2

Last test of basis   152175  2020-07-24 09:41:10 Z    0 days
Testing same since   152186  2020-07-24 19:40:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   50528537b2..91e4bcb313  91e4bcb313f0c1f0f19b87b5849f5486aa076be4 -> xen-tested-master

