Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366926C0AD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITp2-0007Q8-QQ; Wed, 16 Sep 2020 09:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJNc=CZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kITp1-0007Po-9M
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:33:51 +0000
X-Inumbo-ID: 1c87f463-b0a5-455d-b35e-243abdff92f9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c87f463-b0a5-455d-b35e-243abdff92f9;
 Wed, 16 Sep 2020 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=rpdKZobb1kYNBnQJrq6exxaQFvKYU6GLXD0JLUyRgOw=; b=B8RMxPm5/qsrvsVC/+op/aoKoS
 MYEtcN2Gx1lP73vrBc/N2nVWcOt3R1Im1S07O6Sipgi16jpsFmhoMc3Hr90NZ3wZuWGczviP5Or/K
 HPL5HEVhpxNQOTCxBMQLT/2RkMmMZv/mahrJE7zDg+vs9LLw1mHrjbtOIQcWPY/x12U4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kITou-0001yV-OT; Wed, 16 Sep 2020 09:33:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kITou-0003Sn-Fu; Wed, 16 Sep 2020 09:33:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kITou-0004Bl-FQ; Wed, 16 Sep 2020 09:33:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154378-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154378: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8028b2907e20b21cd7d69639a36ac82a77c81dc1
X-Osstest-Versions-That: ovmf=7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Sep 2020 09:33:44 +0000
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

flight 154378 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154378/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8028b2907e20b21cd7d69639a36ac82a77c81dc1
baseline version:
 ovmf                 7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed

Last test of basis   154376  2020-09-16 05:40:34 Z    0 days
Testing same since   154378  2020-09-16 07:40:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>

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
   7bcb021a6d..8028b2907e  8028b2907e20b21cd7d69639a36ac82a77c81dc1 -> xen-tested-master

