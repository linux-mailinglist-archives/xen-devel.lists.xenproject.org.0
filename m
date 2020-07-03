Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6B213359
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 07:09:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrDw7-00029o-R2; Fri, 03 Jul 2020 05:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYi7=AO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jrDw6-00029j-Dj
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 05:08:30 +0000
X-Inumbo-ID: 3bb67cf2-bceb-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb67cf2-bceb-11ea-b7bb-bc764e2007e4;
 Fri, 03 Jul 2020 05:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bZ+U/6nF6RWIuETCBLIc6DE1qhEWRf/LIsjgTkq5Kqs=; b=YPNZ4o8V5bXjKroT8rHdfhq1q
 T/piFx1x/HukLleojvP2xIBudL2qJxjnGwPV6he9fEUlz9MHrDz7aCS3G4QIlyQZUEREqJrqMk3Zr
 XM088kwyk8IHzn5/jjV2KC5OqayMKW5YHllr9zHsRRO0TuqBi0PAaCdyy0krGi6XlG0m0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrDw4-0006Lc-VA; Fri, 03 Jul 2020 05:08:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrDw4-0004Ng-A2; Fri, 03 Jul 2020 05:08:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jrDw4-0003gj-9S; Fri, 03 Jul 2020 05:08:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151550-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151550: all pass - PUSHED
X-Osstest-Versions-This: ovmf=0622a7b1b203ad4ab1675533e958792fc1afc12b
X-Osstest-Versions-That: ovmf=c8edb70945099fd35a0997d3f3db105efc144e13
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jul 2020 05:08:28 +0000
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

flight 151550 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151550/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0622a7b1b203ad4ab1675533e958792fc1afc12b
baseline version:
 ovmf                 c8edb70945099fd35a0997d3f3db105efc144e13

Last test of basis   151532  2020-07-02 07:45:27 Z    0 days
Testing same since   151550  2020-07-02 20:09:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>

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
   c8edb70945..0622a7b1b2  0622a7b1b203ad4ab1675533e958792fc1afc12b -> xen-tested-master

