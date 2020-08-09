Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B423FD0B
	for <lists+xen-devel@lfdr.de>; Sun,  9 Aug 2020 08:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4f18-0001On-6C; Sun, 09 Aug 2020 06:41:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJHn=BT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k4f16-0001Oi-K0
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2020 06:41:12 +0000
X-Inumbo-ID: 427d1803-1ab4-4214-bc09-37a97a0b1282
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 427d1803-1ab4-4214-bc09-37a97a0b1282;
 Sun, 09 Aug 2020 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qB9/0znosrPD08yFNbo8vjTY2CQ/zXSW2i+LLySDZ3U=; b=kTFs1ug3cqQ4oN6nh8rQLwNE3
 vKyRnMqUnIbwkoF8IX1F9kBPQejk/hFEdC0OeFNEqAyFtSSJGQ6ftjGQSfMcClOdDVwbMBpy3o1Y4
 vQEHpS04aOYD8+3UKglOeWpaexmz+jOW5z/r8O9T3u047I73sKxPLKi12t+WkXmKeAmc0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4f13-0002xu-LP; Sun, 09 Aug 2020 06:41:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4f12-0002o8-Sz; Sun, 09 Aug 2020 06:41:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k4f12-0007AK-R1; Sun, 09 Aug 2020 06:41:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152536-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152536: all pass - PUSHED
X-Osstest-Versions-This: ovmf=a3741780fe3535e19e02efa869a7cac481891129
X-Osstest-Versions-That: ovmf=9565ab67c2095a5ea893e63561a49aedf3387b8f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Aug 2020 06:41:08 +0000
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

flight 152536 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152536/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a3741780fe3535e19e02efa869a7cac481891129
baseline version:
 ovmf                 9565ab67c2095a5ea893e63561a49aedf3387b8f

Last test of basis   152517  2020-08-07 09:02:31 Z    1 days
Testing same since   152536  2020-08-08 05:47:10 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <brbarkel@microsoft.com>
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   9565ab67c2..a3741780fe  a3741780fe3535e19e02efa869a7cac481891129 -> xen-tested-master

