Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E921DCCE1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 14:29:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbkJr-0003VP-G2; Thu, 21 May 2020 12:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcJi=7D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbkJp-0003UY-Rd
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 12:29:01 +0000
X-Inumbo-ID: a38476d0-9b5e-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a38476d0-9b5e-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xs5UMk5nNnqEEXlm7pF8IJ2sKoY+CP/8DvsctX11D8Y=; b=FfeWJRpH9T3IN0ZYBIXqRhYLg
 NxyUQKDsYRDwFgTu9IHndqD0G/gbNTzk2jY0QWvByWxKFUEoKjzcGsNrXG5OwJizgGq79cu0J6iy7
 sbBeCTVFV9TNM15zxhI3B3fO1rkxxEc5+icLTWlaQxivf+W50LGtVgH37cxyyu+kRJlDE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbkJj-0001Q8-MP; Thu, 21 May 2020 12:28:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbkJj-00061b-Ac; Thu, 21 May 2020 12:28:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbkJj-0000tA-9z; Thu, 21 May 2020 12:28:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150293-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150293: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3f89db869028fa65a37756fd7f391cbd69f4579c
X-Osstest-Versions-That: ovmf=bc5012b8fbf9f769a62d8a7a2dbf04343c16d398
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 May 2020 12:28:55 +0000
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

flight 150293 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150293/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3f89db869028fa65a37756fd7f391cbd69f4579c
baseline version:
 ovmf                 bc5012b8fbf9f769a62d8a7a2dbf04343c16d398

Last test of basis   150284  2020-05-20 20:09:31 Z    0 days
Testing same since   150293  2020-05-21 07:12:32 Z    0 days    1 attempts

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
   bc5012b8fb..3f89db8690  3f89db869028fa65a37756fd7f391cbd69f4579c -> xen-tested-master

