Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC22142AB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 04:36:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrY0z-0002HY-51; Sat, 04 Jul 2020 02:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CV4e=AP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jrY0x-0002HB-Dv
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 02:34:51 +0000
X-Inumbo-ID: ec0e8f28-bd9e-11ea-8aa5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec0e8f28-bd9e-11ea-8aa5-12813bfff9fa;
 Sat, 04 Jul 2020 02:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttQRt2Pt0Ommx/+chINtvp6GF1RXe2q4hZ8VP+872jM=; b=DOvA4ea/xZ3K/eW4WB6wTN9MY
 NdjMV5DMHNX55g9VHb5Ay3l8IBgiJIVaUcbGtWJ2nZywa4/m4TX4abzA5fMQd8+bEqLIFS8/0OY5v
 wgFPzF82MW2K+1mO4bzpgRKp719wlSekHq4Qq/pDoiBp3oEoot6ZZPrRClYryz03E84bw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrY0q-0008HD-A6; Sat, 04 Jul 2020 02:34:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrY0p-0004EX-UJ; Sat, 04 Jul 2020 02:34:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jrY0p-0000kk-TW; Sat, 04 Jul 2020 02:34:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151590-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151590: all pass - PUSHED
X-Osstest-Versions-This: ovmf=627d1d6693b0594d257dbe1a3363a8d4bd4d8307
X-Osstest-Versions-That: ovmf=f43a14e3cff3fa45c30ff152c4172204a4458341
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Jul 2020 02:34:43 +0000
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

flight 151590 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151590/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 627d1d6693b0594d257dbe1a3363a8d4bd4d8307
baseline version:
 ovmf                 f43a14e3cff3fa45c30ff152c4172204a4458341

Last test of basis   151570  2020-07-03 05:15:25 Z    0 days
Testing same since   151590  2020-07-03 17:14:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>

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
   f43a14e3cf..627d1d6693  627d1d6693b0594d257dbe1a3363a8d4bd4d8307 -> xen-tested-master

