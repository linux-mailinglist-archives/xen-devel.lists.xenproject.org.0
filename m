Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719726BAA2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 05:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIOBr-00071Z-91; Wed, 16 Sep 2020 03:33:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJNc=CZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIOBp-00071U-2i
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 03:33:01 +0000
X-Inumbo-ID: 3379edaa-d767-45ea-a6a4-fc00f9a7d5b3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3379edaa-d767-45ea-a6a4-fc00f9a7d5b3;
 Wed, 16 Sep 2020 03:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=ZtoZTr8UP0p6U3EWksTxz+cAdt0MxzEnnrYvaWmjlrc=; b=eb+lWSnh8YRG/Wst/3u1oyk2C0
 R4jx2Ue49YrTbv1DSrJ4nVVfBfAnPxuByqPN9r+RrMu5xEqPx+Ch2LuhiwjQ3k4k56Lpe5TbYBTrg
 GZyRfr808q0z6GTXjEvoVdChGCynB4OfKkOM37gOwLguDh+qmr2CFAKhOvfKaHdewmyg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIOBn-0001tJ-Fz; Wed, 16 Sep 2020 03:32:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIOBn-0007TA-7r; Wed, 16 Sep 2020 03:32:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIOBn-0003I6-7P; Wed, 16 Sep 2020 03:32:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154370: all pass - PUSHED
X-Osstest-Versions-This: ovmf=a62fb4229d149560cac2bf56011fba49a281ed2b
X-Osstest-Versions-That: ovmf=1b461403ee723dab01d5828714cca0b9396a6b3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Sep 2020 03:32:59 +0000
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

flight 154370 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154370/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a62fb4229d149560cac2bf56011fba49a281ed2b
baseline version:
 ovmf                 1b461403ee723dab01d5828714cca0b9396a6b3c

Last test of basis   154333  2020-09-14 13:11:13 Z    1 days
Testing same since   154370  2020-09-16 01:39:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matthew Carlson <macarl@microsoft.com>
  Matthew Carlson <matthewfcarlson@gmail.com>

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
   1b461403ee..a62fb4229d  a62fb4229d149560cac2bf56011fba49a281ed2b -> xen-tested-master

