Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372B243538
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 09:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k67yP-0001Gd-8J; Thu, 13 Aug 2020 07:48:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrUg=BX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k67yO-0001GY-7A
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 07:48:28 +0000
X-Inumbo-ID: e54ad12f-1246-49fe-8123-61465c795d9d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e54ad12f-1246-49fe-8123-61465c795d9d;
 Thu, 13 Aug 2020 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=qIV2c9rsCEE2Eyn9ZITkOXF2+D507p7m1Udv4YrZS2Q=; b=6mhoVgYNmjXouBR9nsn/cZSChX
 GSVNKJ4AhnMWy3LOoMNOVDacOHS/BBwe2MgsBUzkiJt7tmwMEBRqGvoCNCOkv1xvtQj2Ttdic/J5L
 k2GMsg0v/WKI5U5RjMT/xLJs4EvVB6c5YV4IRcKmn8AvXQhHTVXTDwfPHD/cExe8aILk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k67yM-0002MV-B6; Thu, 13 Aug 2020 07:48:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k67yM-00066W-02; Thu, 13 Aug 2020 07:48:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k67yL-0003Fy-VI; Thu, 13 Aug 2020 07:48:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152568-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152568: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e6042aec1bc2bf3a2eaf4f2d3bfe9b90ef95948e
X-Osstest-Versions-That: ovmf=a3741780fe3535e19e02efa869a7cac481891129
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Aug 2020 07:48:25 +0000
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

flight 152568 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152568/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e6042aec1bc2bf3a2eaf4f2d3bfe9b90ef95948e
baseline version:
 ovmf                 a3741780fe3535e19e02efa869a7cac481891129

Last test of basis   152536  2020-08-08 05:47:10 Z    5 days
Testing same since   152568  2020-08-12 04:10:50 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Liming Gao <liming.gao@intel.com>

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
   a3741780fe..e6042aec1b  e6042aec1bc2bf3a2eaf4f2d3bfe9b90ef95948e -> xen-tested-master

