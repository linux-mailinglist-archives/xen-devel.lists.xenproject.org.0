Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24525074D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 20:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAH4u-0004YR-Jm; Mon, 24 Aug 2020 18:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2P5=CC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAH4s-0004YM-SZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 18:20:18 +0000
X-Inumbo-ID: b2bbbdda-d119-4d38-98b2-b44f849820de
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2bbbdda-d119-4d38-98b2-b44f849820de;
 Mon, 24 Aug 2020 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=210SvOX+3zKP2u7pMX0XBo/8d15HBF0Xaus5ubcM5ck=; b=zPBxKeNb91nQJhDmVLkZeeKWFa
 h8mDVU4BKLIh9n4d2weIg+KBPEY0eqoFA33coiY6niZyBQnVq3nOsFOfJKjf+fgCNHeA7VT98lqjs
 siM5vJmqjHA1GDvczGPL5suqvjjGeUTTbSZYqYLPDhFXt6uHes/IPz8Qrj46BCFUzkfk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAH4r-00015U-CL; Mon, 24 Aug 2020 18:20:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAH4r-0001L8-3s; Mon, 24 Aug 2020 18:20:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAH4r-0008Rx-3N; Mon, 24 Aug 2020 18:20:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152743-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152743: all pass - PUSHED
X-Osstest-Versions-This: ovmf=4535fc312b76cb5b05b6a8064c1c64d9780f55ba
X-Osstest-Versions-That: ovmf=d4e0b9607c9a64a8eff20724b2e35ea2cd5bd33f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Aug 2020 18:20:17 +0000
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

flight 152743 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152743/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4535fc312b76cb5b05b6a8064c1c64d9780f55ba
baseline version:
 ovmf                 d4e0b9607c9a64a8eff20724b2e35ea2cd5bd33f

Last test of basis   152718  2020-08-24 03:09:44 Z    0 days
Testing same since   152743  2020-08-24 16:09:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>
  Vladimir Olovyannikov via groups.io <vladimir.olovyannikov=broadcom.com@groups.io>

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
   d4e0b9607c..4535fc312b  4535fc312b76cb5b05b6a8064c1c64d9780f55ba -> xen-tested-master

