Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA45213DB6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 18:46:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrOoD-0002qH-6R; Fri, 03 Jul 2020 16:45:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYi7=AO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jrOoC-0002qC-DC
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 16:45:04 +0000
X-Inumbo-ID: 89a6ced9-bd4c-11ea-89fb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89a6ced9-bd4c-11ea-89fb-12813bfff9fa;
 Fri, 03 Jul 2020 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c58/bStT32waMtpPye2oON5AG+pdsLQMX0JoHkPS4ao=; b=xb+kpYnoEjTWb0RzAv+9HOgwY
 AvYGQrocMhN9E/Ffwt0wa3ZV4sH6MPkaKECDQW1jEF02jI9Gxkh1H2AVlzwGYAK8WsU7WLzBSBJE2
 zMU9GtWRsewsaGY+brJHrT2s/Dcp4wok+hmNol+2z4AEqDkpZNJlIvsKZ9s7NnogIZ6Wk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrOo8-0003UF-Vd; Fri, 03 Jul 2020 16:45:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrOo8-0002Lj-LN; Fri, 03 Jul 2020 16:45:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jrOo8-0005gw-HN; Fri, 03 Jul 2020 16:45:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151570-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151570: all pass - PUSHED
X-Osstest-Versions-This: ovmf=f43a14e3cff3fa45c30ff152c4172204a4458341
X-Osstest-Versions-That: ovmf=0622a7b1b203ad4ab1675533e958792fc1afc12b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jul 2020 16:45:00 +0000
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

flight 151570 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151570/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f43a14e3cff3fa45c30ff152c4172204a4458341
baseline version:
 ovmf                 0622a7b1b203ad4ab1675533e958792fc1afc12b

Last test of basis   151550  2020-07-02 20:09:20 Z    0 days
Testing same since   151570  2020-07-03 05:15:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>
  Oleksiy Yakovlev <oleksiyy@ami.com>

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
   0622a7b1b2..f43a14e3cf  f43a14e3cff3fa45c30ff152c4172204a4458341 -> xen-tested-master

