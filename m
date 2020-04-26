Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822F1B8EB5
	for <lists+xen-devel@lfdr.de>; Sun, 26 Apr 2020 12:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSeEd-0003gL-Bt; Sun, 26 Apr 2020 10:10:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wn3c=6K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSeEb-0003Vr-Ju
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2020 10:10:01 +0000
X-Inumbo-ID: 16e32bb6-87a6-11ea-9686-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16e32bb6-87a6-11ea-9686-12813bfff9fa;
 Sun, 26 Apr 2020 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wGYEHgU7+QpRIG/+r/0jjEgmjMDQYzNyElS5Z6FR0k=; b=e+VQLkj4osr8h44/wyF2ka3/2
 Ox74inbROujZWlPwafT1hECKAEKimBogtXFhXKoIGMWWCrukDtJayN/ZvS/VZ8/ideJGCqDVhQuqZ
 DSz+QtOEX1gMzBHQpzkVcUk76kG6pf3eHCRZMcI8VCZzdZlnfg3UO0juTtcJNAgehVlyk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeEa-0006mB-HM; Sun, 26 Apr 2020 10:10:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeEa-0006vI-8c; Sun, 26 Apr 2020 10:10:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeEa-0000MT-80; Sun, 26 Apr 2020 10:10:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149827-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149827: all pass - PUSHED
X-Osstest-Versions-This: ovmf=0f1946b6626e263c7f764c21cc241cc9faf8a1ae
X-Osstest-Versions-That: ovmf=c5c5c980dbaadf32193ac5e4ed2a35b665e0c76e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Apr 2020 10:10:00 +0000
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

flight 149827 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149827/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0f1946b6626e263c7f764c21cc241cc9faf8a1ae
baseline version:
 ovmf                 c5c5c980dbaadf32193ac5e4ed2a35b665e0c76e

Last test of basis   149825  2020-04-26 01:40:21 Z    0 days
Testing same since   149827  2020-04-26 06:40:24 Z    0 days    1 attempts

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
   c5c5c980db..0f1946b662  0f1946b6626e263c7f764c21cc241cc9faf8a1ae -> xen-tested-master

