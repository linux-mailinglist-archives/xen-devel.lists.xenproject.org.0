Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA57C23186A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 06:12:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0dRe-0002bc-IL; Wed, 29 Jul 2020 04:11:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ULCb=BI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0dRd-0002ar-23
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 04:11:57 +0000
X-Inumbo-ID: a075e2ca-d151-11ea-a971-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a075e2ca-d151-11ea-a971-12813bfff9fa;
 Wed, 29 Jul 2020 04:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NHUOzWPSaQhnOlhh5rWELBJp/koy/2ltrgleOsY2HeM=; b=0K8tn0iu06kzwRfjVOvVs2EE+
 Mkglx25u7o60lrkgdEBIOGVinFvTOhHvYOz+CGyF51EezqXkyr+PYb7ASjnyNiYXyryoKpaMWTiS6
 G70HrPwqpPREmJHZPTkce0o12WTQymzxgkYhbG4T0K4nKXPScclEw0S52rNiZrf2TVGMQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0dRV-00051H-Q7; Wed, 29 Jul 2020 04:11:49 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0dRV-00036r-DZ; Wed, 29 Jul 2020 04:11:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0dRV-0006Vi-Cq; Wed, 29 Jul 2020 04:11:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152270-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152270: all pass - PUSHED
X-Osstest-Versions-This: ovmf=744ad444e5306ef68edbe899b5f5dc87e82c146b
X-Osstest-Versions-That: ovmf=3887820e5fecdb9e948f88eb4e92298f6c3dd86f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jul 2020 04:11:49 +0000
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

flight 152270 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152270/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 744ad444e5306ef68edbe899b5f5dc87e82c146b
baseline version:
 ovmf                 3887820e5fecdb9e948f88eb4e92298f6c3dd86f

Last test of basis   152261  2020-07-28 12:10:07 Z    0 days
Testing same since   152270  2020-07-28 19:10:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   3887820e5f..744ad444e5  744ad444e5306ef68edbe899b5f5dc87e82c146b -> xen-tested-master

