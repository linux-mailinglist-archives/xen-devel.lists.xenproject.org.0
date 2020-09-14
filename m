Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D199269016
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqW6-0002qD-VO; Mon, 14 Sep 2020 15:35:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qj2e=CX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHqW6-0002q8-5y
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:35:42 +0000
X-Inumbo-ID: 79a0b5f7-1791-4b7a-80ab-1e6ff1b344e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79a0b5f7-1791-4b7a-80ab-1e6ff1b344e4;
 Mon, 14 Sep 2020 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=6Pyfkr8gJ9L/6KYpViLsWx6H0IwYxdEleo6w/lEM83c=; b=DI4HqhPeG//+DS9IjUQf9nfSnG
 BCRtVWJjIB8WkxOxp/ajumpgyC9qk1KxxcgS4oPs1nb5eLWdNJDpSp2K2OH3BRwoACTMewIm3/HYY
 uhyqvGzlSjgFiK2HO7QzOlHVoTxhFwCR8XnmHV57LZJ8lXzXyHTT/ZbokPc8onyKnfvo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHqW4-0001Pg-Hv; Mon, 14 Sep 2020 15:35:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHqW4-0003CA-A0; Mon, 14 Sep 2020 15:35:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHqW4-0001JN-9Z; Mon, 14 Sep 2020 15:35:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154333-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154333: all pass - PUSHED
X-Osstest-Versions-This: ovmf=1b461403ee723dab01d5828714cca0b9396a6b3c
X-Osstest-Versions-That: ovmf=067503a8c675ddd38b099a0c604bc1a565e83838
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Sep 2020 15:35:40 +0000
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

flight 154333 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154333/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1b461403ee723dab01d5828714cca0b9396a6b3c
baseline version:
 ovmf                 067503a8c675ddd38b099a0c604bc1a565e83838

Last test of basis   154312  2020-09-14 04:09:48 Z    0 days
Testing same since   154333  2020-09-14 13:11:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   067503a8c6..1b461403ee  1b461403ee723dab01d5828714cca0b9396a6b3c -> xen-tested-master

