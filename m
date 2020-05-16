Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C81D5DFE
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 04:46:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZmok-00076U-Vq; Sat, 16 May 2020 02:44:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWuL=66=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jZmoj-00076P-TY
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 02:44:49 +0000
X-Inumbo-ID: 32a68978-971f-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a68978-971f-11ea-b9cf-bc764e2007e4;
 Sat, 16 May 2020 02:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3mPqApx7MYBnMMJz/G6dGxkJPlQZvtgp3o/cTAZWW0=; b=ainkTF2a+tdPvUe03bglHLBdq
 fA8q1fQY9hmtW0pTNNW/OWjwgbKHt8dFvnJUT9hNauLgP8WwcW0VVJYvfv8/Xu0+hqceMooQNEXbO
 mXNLuYjuDqo9uFAYUe6vpDsnAqOFSPmKCQippJ49HtkB/KwqFwce0tkV7gB3QfElfeMQc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZmoc-0002Ud-Uh; Sat, 16 May 2020 02:44:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZmoc-00013w-K9; Sat, 16 May 2020 02:44:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jZmoc-0003ol-Hq; Sat, 16 May 2020 02:44:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150196-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150196: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9099dcbd61c8d22b5eedda783d143c222d2705a3
X-Osstest-Versions-That: ovmf=bcf181a33b2ea46c36c3be701a5b2e232deaece7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 16 May 2020 02:44:42 +0000
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

flight 150196 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150196/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9099dcbd61c8d22b5eedda783d143c222d2705a3
baseline version:
 ovmf                 bcf181a33b2ea46c36c3be701a5b2e232deaece7

Last test of basis   150187  2020-05-15 01:10:49 Z    1 days
Testing same since   150196  2020-05-15 13:16:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oleksiy Yakovlev <oleksiyy@ami.com>
  Ray Ni <ray.ni@intel.com>
  Robert Phelps <robert@ami.com>
  Wei6 Xu <wei6.xu@intel.com>
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
   bcf181a33b..9099dcbd61  9099dcbd61c8d22b5eedda783d143c222d2705a3 -> xen-tested-master

