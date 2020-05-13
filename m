Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F71D1B67
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 18:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYuRR-0006h9-UN; Wed, 13 May 2020 16:41:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Rkd=63=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYuRQ-0006h4-R7
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 16:41:08 +0000
X-Inumbo-ID: 89761ebf-9538-11ea-a3c0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89761ebf-9538-11ea-a3c0-12813bfff9fa;
 Wed, 13 May 2020 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DeNWY2o7OnmecMtfuyyCDIRH0saZGKSgIHGDxcTC2k=; b=3Msr9NuloYAiOE2RZj1rXjVVX
 WduaGhGcif4OFONCWNF/W6nUKbvVKiUGZULK+Gc38ich0i01ICklrgeAmNhqbsB6FggHd6OzSeJkp
 3fP6NNJQZ8/1IqeOb095rNg83VNr4EVs8cV4GZKsQYsEA0S2RQOfBad9qCbupaFQi4kYM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYuRN-0003XW-QL; Wed, 13 May 2020 16:41:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYuRN-0003NR-B4; Wed, 13 May 2020 16:41:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYuRN-0006HW-AC; Wed, 13 May 2020 16:41:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150160-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150160: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ceacd9e992cd12f3c07ae1a28a75a6b8750718aa
X-Osstest-Versions-That: ovmf=88899a372cfc44f8612315f4b43a084d1814fe69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 May 2020 16:41:05 +0000
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

flight 150160 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150160/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ceacd9e992cd12f3c07ae1a28a75a6b8750718aa
baseline version:
 ovmf                 88899a372cfc44f8612315f4b43a084d1814fe69

Last test of basis   150152  2020-05-12 19:39:31 Z    0 days
Failing since        150156  2020-05-13 06:10:56 Z    0 days    2 attempts
Testing same since   150160  2020-05-13 12:09:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Feng, YunhuaX <YunhuaX.Feng@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Yunhua Feng <yunhuax.feng@intel.com>

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
   88899a372c..ceacd9e992  ceacd9e992cd12f3c07ae1a28a75a6b8750718aa -> xen-tested-master

