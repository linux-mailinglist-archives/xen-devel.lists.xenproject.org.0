Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17E26BE33
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:36:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRzN-0003Bm-KI; Wed, 16 Sep 2020 07:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJNc=CZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIRzM-0003Aj-Bj
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:36:24 +0000
X-Inumbo-ID: 569d3a9f-0a8a-48bf-bb08-8ef8bd4b501b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 569d3a9f-0a8a-48bf-bb08-8ef8bd4b501b;
 Wed, 16 Sep 2020 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=HQ3I1m2KS2OgRPtu90cOEHs8LrPtgw3m1JVtpIN6IqA=; b=VBs4nMW7scHRTdpQz7etjjl5mc
 //xi3l1YjXUIotKnfgUNjzMrpxKfIvm3oqQA2LFh/n+hYKoJ1UBPZPa1KacMbl3Hlzec3BR+y3Vac
 U096H12AIhQLMv61suCH7etgruqdeVYQNB2IqKaITI8zjRNzM+DVLAMIiLxaElgJEDgA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIRzE-0007OI-DY; Wed, 16 Sep 2020 07:36:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIRzE-0000Lk-54; Wed, 16 Sep 2020 07:36:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIRzE-0005P7-4Z; Wed, 16 Sep 2020 07:36:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154376-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154376: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed
X-Osstest-Versions-That: ovmf=a62fb4229d149560cac2bf56011fba49a281ed2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Sep 2020 07:36:16 +0000
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

flight 154376 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154376/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed
baseline version:
 ovmf                 a62fb4229d149560cac2bf56011fba49a281ed2b

Last test of basis   154370  2020-09-16 01:39:54 Z    0 days
Testing same since   154376  2020-09-16 05:40:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qi Zhang <qi1.zhang@intel.com>

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
   a62fb4229d..7bcb021a6d  7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed -> xen-tested-master

