Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B91A245D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 16:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMC3I-0006VV-VD; Wed, 08 Apr 2020 14:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MCEd=5Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMC3H-0006VQ-Pf
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 14:51:39 +0000
X-Inumbo-ID: 73453b26-79a8-11ea-81fb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73453b26-79a8-11ea-81fb-12813bfff9fa;
 Wed, 08 Apr 2020 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TSBMarnZxPIfGwmd17wvLD3GElVlOtZ02VgHXEmW3jM=; b=do2ruf41QBJoKwj/nPf+DiJz2
 RZKq+O5gpQMtS8ZspyBm9CPVtSnsxCt6P7w7tAy+Yjn/Et7V4lj6MdABpjT4P/SvGQq30C2uCaIrb
 lwNqbAGpaWop6B3RXcHytm8sx8LsXANe9kHTTMb3/s2fQS9jNdhK6viNrHDKQgl2VflJQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMC3G-0006bd-57; Wed, 08 Apr 2020 14:51:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMC3F-0008Td-P2; Wed, 08 Apr 2020 14:51:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMC3F-0000gi-ON; Wed, 08 Apr 2020 14:51:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149513-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149513: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d6f99b2ac4296662720db76d7c23d224f5288df3
X-Osstest-Versions-That: ovmf=3ab0dadd6618b7808a27e65d83aa3668462afcf2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Apr 2020 14:51:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149513 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149513/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d6f99b2ac4296662720db76d7c23d224f5288df3
baseline version:
 ovmf                 3ab0dadd6618b7808a27e65d83aa3668462afcf2

Last test of basis   149504  2020-04-08 01:40:39 Z    0 days
Testing same since   149513  2020-04-08 07:13:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>

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
   3ab0dadd66..d6f99b2ac4  d6f99b2ac4296662720db76d7c23d224f5288df3 -> xen-tested-master

