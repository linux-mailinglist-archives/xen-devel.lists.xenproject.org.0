Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D9207C6E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 21:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joBRa-0001mJ-Ji; Wed, 24 Jun 2020 19:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRKl=AF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1joBRY-0001lz-Vt
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 19:52:25 +0000
X-Inumbo-ID: 363a5598-b654-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 363a5598-b654-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+XiPqnh9NN0+rSpFl3doXTnKpHODje0LatmIO5WxocI=; b=FCXS8yGtXL1oaWtGBEoIGWfQy
 omcenS2ch956gDQcBg4Rp6tbheeSUEaN0LKieNQneGI9OM1rHhUdQbxMtJLVIiXb56t0y/G19J6B0
 o54mVh8OehRIt0EH9IkoM9TQ70Y+V0QCwaQWtMIxpi5UHUsd5ZQggB+7dt4ujIoJeqP4s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joBRS-0001Mh-Ty; Wed, 24 Jun 2020 19:52:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joBRS-0004lD-In; Wed, 24 Jun 2020 19:52:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1joBRS-0001iq-I8; Wed, 24 Jun 2020 19:52:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151320: all pass - PUSHED
X-Osstest-Versions-This: ovmf=1a992030522622c42aa063788b3276789c56c1e1
X-Osstest-Versions-That: ovmf=00b8bf7eda00fb6f0197d3968b6078cfdb4870fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jun 2020 19:52:18 +0000
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

flight 151320 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151320/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1a992030522622c42aa063788b3276789c56c1e1
baseline version:
 ovmf                 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa

Last test of basis   151303  2020-06-23 01:55:28 Z    1 days
Testing same since   151320  2020-06-23 22:10:13 Z    0 days    1 attempts

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
   00b8bf7eda..1a99203052  1a992030522622c42aa063788b3276789c56c1e1 -> xen-tested-master

