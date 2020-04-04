Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27519E4D4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 14:06:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKhYf-0008Rn-0p; Sat, 04 Apr 2020 12:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qJcp=5U=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jKhYe-0008Ri-09
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 12:05:52 +0000
X-Inumbo-ID: 9db79168-766c-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9db79168-766c-11ea-b58d-bc764e2007e4;
 Sat, 04 Apr 2020 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S2v+xF7RK1/KpEq2x5H8mwOdMIYa1NiG6hzfYilS8DI=; b=i7cb6dfmUZ3B1fcLgHJDiQ9Cm
 bxwwMs3Hjk+oGZ4D7DsK2P/8w2qstI1p/+bu6R9TQVUUKBtQKmGDR5q5wiXO5gkpMO00WqP6vk1qW
 We/5OMhiWaIHUiPFc5F0C3J4hLITKc3Px3rTBoZAb6rCfkS3/89rJaBw072wC7SVI5ZyM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jKhYY-00071O-3w; Sat, 04 Apr 2020 12:05:46 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jKhYX-0008NQ-Md; Sat, 04 Apr 2020 12:05:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jKhYX-0005Po-Ly; Sat, 04 Apr 2020 12:05:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149393: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a
X-Osstest-Versions-That: ovmf=f73c9adfc68c7ff189b17cb2531a071d4b30cd75
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Apr 2020 12:05:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149393/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a
baseline version:
 ovmf                 f73c9adfc68c7ff189b17cb2531a071d4b30cd75

Last test of basis   149368  2020-04-03 00:10:25 Z    1 days
Testing same since   149393  2020-04-03 17:09:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Daniel Schaefer <daniel.schaefer@hpe.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   f73c9adfc6..ef5dcba975  ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a -> xen-tested-master

