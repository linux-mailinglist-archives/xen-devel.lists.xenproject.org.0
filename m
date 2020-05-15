Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523981D4282
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 02:57:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZOeo-0001kN-Ty; Fri, 15 May 2020 00:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibeu=65=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jZOen-0001kI-Mb
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 00:56:57 +0000
X-Inumbo-ID: f5f19d20-9646-11ea-a504-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5f19d20-9646-11ea-a504-12813bfff9fa;
 Fri, 15 May 2020 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dWCkKoMV72pQaoHg4eoLv8zshDjaE2KQ8xF76BEnwcg=; b=UqvNBiFoDqtHgXKpr+80Tusf7
 kDB5/56lkm5vro0DdfLB/MXHBhXphUcd0MTAoKR8WUodAhFoalSt4swNn6Gmrh+Hor62mJ/LSEH0F
 H+U1iD09El+OEenwRr9R9Cd+asAe8tPnSK730z+xd5f1/cpU/kpFulxwQT7pSD03D4q6M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZOeg-0006oq-D5; Fri, 15 May 2020 00:56:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZOef-0003Yq-Qk; Fri, 15 May 2020 00:56:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jZOef-0003ci-Q7; Fri, 15 May 2020 00:56:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150178-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150178: all pass - PUSHED
X-Osstest-Versions-This: ovmf=f2cdb268ef04eeec51948b5d81eeca5cab5ed9af
X-Osstest-Versions-That: ovmf=ceacd9e992cd12f3c07ae1a28a75a6b8750718aa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 May 2020 00:56:49 +0000
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

flight 150178 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150178/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f2cdb268ef04eeec51948b5d81eeca5cab5ed9af
baseline version:
 ovmf                 ceacd9e992cd12f3c07ae1a28a75a6b8750718aa

Last test of basis   150160  2020-05-13 12:09:21 Z    1 days
Testing same since   150178  2020-05-14 12:39:29 Z    0 days    1 attempts

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
   ceacd9e992..f2cdb268ef  f2cdb268ef04eeec51948b5d81eeca5cab5ed9af -> xen-tested-master

