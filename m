Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7A22480D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 04:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwchC-0005do-64; Sat, 18 Jul 2020 02:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OolH=A5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jwchB-0005dj-27
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 02:35:25 +0000
X-Inumbo-ID: 53ea0bd0-c89f-11ea-96e2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53ea0bd0-c89f-11ea-96e2-12813bfff9fa;
 Sat, 18 Jul 2020 02:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YZ4PaY/GwDYgB99Nzvrdl5h7M7Lmm100ZAnzVhqeqY=; b=BHqwHAPywpyNr6kuVj2+Ds7yO
 hABhqOvVhSlrM1IgVH2H3Pks1/c2IFa2YayS5RzgVWsdYRuQnm0shmKvE5Ky5qiBPGtFvLIMuBVg6
 30xQlFkEmGv6cGBKOoEQrOgjlmmgPlKra9hw24gTVERu/WiI6VO1vbpqw9phgPaBMZQ6M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwch7-0000T9-6n; Sat, 18 Jul 2020 02:35:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwch6-0004BI-SY; Sat, 18 Jul 2020 02:35:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jwch6-000589-Ru; Sat, 18 Jul 2020 02:35:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151972-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151972: all pass - PUSHED
X-Osstest-Versions-This: ovmf=6ff53d2a13740e39dea110d6b3509c156c659586
X-Osstest-Versions-That: ovmf=21a23e6966c2eb597a8db98d6837a4c01b3cad4a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Jul 2020 02:35:20 +0000
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

flight 151972 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151972/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ff53d2a13740e39dea110d6b3509c156c659586
baseline version:
 ovmf                 21a23e6966c2eb597a8db98d6837a4c01b3cad4a

Last test of basis   151959  2020-07-17 05:19:56 Z    0 days
Testing same since   151972  2020-07-17 16:51:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jian J Wang <jian.j.wang@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   21a23e6966..6ff53d2a13  6ff53d2a13740e39dea110d6b3509c156c659586 -> xen-tested-master

