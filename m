Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E461F1101
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 03:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ji6YN-0008WM-BD; Mon, 08 Jun 2020 01:26:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Py4y=7V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ji6YM-0008WH-3L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 01:26:18 +0000
X-Inumbo-ID: 07247818-a927-11ea-b22c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07247818-a927-11ea-b22c-12813bfff9fa;
 Mon, 08 Jun 2020 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EU/Hp1n7VN94C9UWru7ihtoj7OhYsGB4K61DOOd3YR4=; b=btj0bK3UTu2KBL7xqwcUHvSUu
 g6ypGWHkHzw+Y9o6w+7uoIhSSA69S92KvoZLl+FXF2x9r0QqiZkev4aVktdzTE2ni5vGhALAaA6ot
 /ESDc3QtkajfMvPDaA3dwl9XhjteZxdAPLxIY/eKtFbBDxeOideWQRG/3AzphaErxDVFw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ji6YA-0006GM-QH; Mon, 08 Jun 2020 01:26:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ji6YA-00024e-Gj; Mon, 08 Jun 2020 01:26:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ji6YA-0008JG-G7; Mon, 08 Jun 2020 01:26:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150911-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150911: all pass - PUSHED
X-Osstest-Versions-This: ovmf=cfd73e0065f523e1d56bb32b5c9d48e162c903f8
X-Osstest-Versions-That: ovmf=28dd887d68409c8788c858e29063ee599ebaaa91
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jun 2020 01:26:06 +0000
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

flight 150911 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150911/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cfd73e0065f523e1d56bb32b5c9d48e162c903f8
baseline version:
 ovmf                 28dd887d68409c8788c858e29063ee599ebaaa91

Last test of basis   150908  2020-06-07 13:10:15 Z    0 days
Testing same since   150911  2020-06-07 20:10:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
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
   28dd887d68..cfd73e0065  cfd73e0065f523e1d56bb32b5c9d48e162c903f8 -> xen-tested-master

