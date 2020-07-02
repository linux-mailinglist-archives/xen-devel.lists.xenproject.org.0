Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD3212D3C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 21:42:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr55J-0004R0-Mv; Thu, 02 Jul 2020 19:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CtVa=AN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jr55H-0004QH-En
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 19:41:23 +0000
X-Inumbo-ID: 01b0a4e6-bc9c-11ea-88a2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01b0a4e6-bc9c-11ea-88a2-12813bfff9fa;
 Thu, 02 Jul 2020 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aF90RyIGZCSTCNX/ltVo3zjsa6gH1DiSNDfKO6WF00=; b=Hp518mBfkIFb7CWFH2udzBaUX
 oUvb37YEk/0ow1EIvlWJlgHamQXMjiWz1QhaxZBF2Qo9vVK7mlzhoRqQ12rBeDIMWJsUn3lqw2d0g
 gZ7G4s/UeA+JsCnfGy2XCb8bzXAiFdznggOWjSVDvmtWsIpcXEQ1BmX3bWTYVG7vqSZEs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jr55F-00018G-C2; Thu, 02 Jul 2020 19:41:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jr55E-0005Gr-VY; Thu, 02 Jul 2020 19:41:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jr55E-0006Ve-UM; Thu, 02 Jul 2020 19:41:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151532: all pass - PUSHED
X-Osstest-Versions-This: ovmf=c8edb70945099fd35a0997d3f3db105efc144e13
X-Osstest-Versions-That: ovmf=00217f1919270007d7a911f89b32e39b9dcaa907
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Jul 2020 19:41:20 +0000
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

flight 151532 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151532/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c8edb70945099fd35a0997d3f3db105efc144e13
baseline version:
 ovmf                 00217f1919270007d7a911f89b32e39b9dcaa907

Last test of basis   151465  2020-06-30 01:43:31 Z    2 days
Testing same since   151532  2020-07-02 07:45:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Irene Park <ipark@nvidia.com>

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
   00217f1919..c8edb70945  c8edb70945099fd35a0997d3f3db105efc144e13 -> xen-tested-master

