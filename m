Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B923BF9B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 21:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k32PB-00060T-84; Tue, 04 Aug 2020 19:15:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oob=BO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k32P9-00060N-G7
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 19:15:19 +0000
X-Inumbo-ID: 6157cd1e-ddf6-4f5c-9b9b-93388cd9bc79
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6157cd1e-ddf6-4f5c-9b9b-93388cd9bc79;
 Tue, 04 Aug 2020 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2muXYs01Qs0Kky1ZN3hvlihh6Lxq/EYW6TQx8llERg=; b=4uvgOdIfM5XIV3yzMBU4AEVun
 Cne8RZTQgKfv90sDodEJvAYVoxXzt1qe8Wky622jVfcAQ5UXuBomqp1HXX3Cm9yl69y1uH/KMDvqS
 12eR4D/zsSIafQVIE22ZylGWJeXjEZOEKFNdZoq6JBKYubSdKl4HbOhzVxxDo2rG9DZ1g=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k32P7-0007iM-MY; Tue, 04 Aug 2020 19:15:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k32P7-0002uD-74; Tue, 04 Aug 2020 19:15:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k32P7-00074W-6T; Tue, 04 Aug 2020 19:15:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152459-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152459: all pass - PUSHED
X-Osstest-Versions-This: ovmf=aa211bb6ef8edc70d2e6dfdab01a7d29e53f1ee2
X-Osstest-Versions-That: ovmf=bbb8a818583853ec4bb7804e78ed1d304b709d33
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Aug 2020 19:15:17 +0000
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

flight 152459 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152459/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aa211bb6ef8edc70d2e6dfdab01a7d29e53f1ee2
baseline version:
 ovmf                 bbb8a818583853ec4bb7804e78ed1d304b709d33

Last test of basis   152422  2020-08-03 12:09:55 Z    1 days
Testing same since   152459  2020-08-04 07:31:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Wei6 Xu <wei6.xu@intel.com>
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
   bbb8a81858..aa211bb6ef  aa211bb6ef8edc70d2e6dfdab01a7d29e53f1ee2 -> xen-tested-master

