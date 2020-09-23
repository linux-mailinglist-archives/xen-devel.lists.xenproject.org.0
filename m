Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA3275075
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 07:47:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKxcX-0003wn-Qi; Wed, 23 Sep 2020 05:47:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3kw=DA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kKxcW-0003wi-Km
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 05:47:12 +0000
X-Inumbo-ID: 6d853eab-e310-4207-8b08-a472f709b665
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d853eab-e310-4207-8b08-a472f709b665;
 Wed, 23 Sep 2020 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=tK/Bn7SJG5LeC8RDuLkoG6aPaTmUHWm5EP5cssMIje8=; b=NGqBOL4PaE9nR6LTKZTc9z9QQG
 nGj0q2kxTCgK4OfjLL4Lx9TRKDwP0poNb/hRrAOUF1dCoScDeXeXq9YiSKJEvX7CNXe4XZRf1rvsW
 TVIEgARJOrOZ0Kax00dLxeXYNyrD8ITzE29fpPqUfepAPDVNaUj73ZESaxsoXbsGgqeo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kKxcV-0000qd-15; Wed, 23 Sep 2020 05:47:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kKxcU-0005bC-LR; Wed, 23 Sep 2020 05:47:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kKxcU-0002vy-Kw; Wed, 23 Sep 2020 05:47:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154616-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154616: all pass - PUSHED
X-Osstest-Versions-This: ovmf=fb97626fe04747ec89599dce0992def9a36e2f6b
X-Osstest-Versions-That: ovmf=ea9af51479fe04955443f0d366376a1008f07c94
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Sep 2020 05:47:10 +0000
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

flight 154616 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154616/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fb97626fe04747ec89599dce0992def9a36e2f6b
baseline version:
 ovmf                 ea9af51479fe04955443f0d366376a1008f07c94

Last test of basis   154558  2020-09-21 03:10:34 Z    2 days
Testing same since   154616  2020-09-22 14:09:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Rebecca Cran <rebecca@bsdio.com>
  Tom Lendacky <thomas.lendacky@amd.com>
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
   ea9af51479..fb97626fe0  fb97626fe04747ec89599dce0992def9a36e2f6b -> xen-tested-master

