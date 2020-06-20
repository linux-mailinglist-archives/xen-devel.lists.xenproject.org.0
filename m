Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8C2022CD
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 11:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmZga-00071y-Rf; Sat, 20 Jun 2020 09:21:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcHl=AB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jmZgY-00071s-RD
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2020 09:21:14 +0000
X-Inumbo-ID: 6145eade-b2d7-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6145eade-b2d7-11ea-bca7-bc764e2007e4;
 Sat, 20 Jun 2020 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zFt4BN8Mp4TYpBkNA2UIK8nOeqUyR66A7JkHwQGRcE=; b=qsIWiCyp9LaKZHqKENtlCT+QW
 H9FS4kcw0GO46Z+NXG+DSnVQ2/vEEXR72zguBVHiMmzEiz5Arvft66IJ7s5VlcZ439hwZ8UFhVcON
 3xOgJOWuqNP1F8M6ROSisLmyRk29+Y8bbxPAw3Odgq6KpPxSoVFUJ1d2pBrzdsEG9RPeE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmZgU-0000DK-65; Sat, 20 Jun 2020 09:21:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmZgT-0003ya-UF; Sat, 20 Jun 2020 09:21:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jmZgT-0000wq-Sl; Sat, 20 Jun 2020 09:21:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151228-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151228: all pass - PUSHED
X-Osstest-Versions-This: ovmf=239b50a863704f7960525799eda82de061c7c458
X-Osstest-Versions-That: ovmf=58ae92a993687d913aa6dd00ef3497a1bc5f6c40
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Jun 2020 09:21:09 +0000
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

flight 151228 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151228/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 239b50a863704f7960525799eda82de061c7c458
baseline version:
 ovmf                 58ae92a993687d913aa6dd00ef3497a1bc5f6c40

Last test of basis   151187  2020-06-17 09:28:29 Z    2 days
Testing same since   151228  2020-06-18 19:18:56 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Dorapika Wu <chuan-hsun.wu@hpe.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Laszlo Ersek <lersek@redhat.com>
  Ming Tan <ming.tan@intel.com>
  Tan, Ming <ming.tan@intel.com>

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
   58ae92a993..239b50a863  239b50a863704f7960525799eda82de061c7c458 -> xen-tested-master

