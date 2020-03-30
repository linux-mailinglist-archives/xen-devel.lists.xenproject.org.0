Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C77197B95
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 14:11:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jItDY-00014w-Nc; Mon, 30 Mar 2020 12:08:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k668=5P=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jItDX-00014r-JC
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 12:08:35 +0000
X-Inumbo-ID: 2df9b22a-727f-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2df9b22a-727f-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVr0CHLz3TX+w+iIQW4ptDj2+trKNNyhael+ZaWB+vk=; b=mm9tnELjIDcG49lblvO6sDYZj
 dLrdNdoAc9+/Bi1/GVHDTOzQE9vgWCn83M9UFiMF6P2evLZpeqBwda1TeWvuu4kBEvKfoGsKq9vVp
 xRP4OyqJvpuzB9W4SRpdb7acs8hmMH43sQLdwxFqhOA7wittBmegpaMrOq8NeqRqChyyw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jItDW-0003DR-Ca; Mon, 30 Mar 2020 12:08:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jItDW-0002n1-5O; Mon, 30 Mar 2020 12:08:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jItDW-0005as-4k; Mon, 30 Mar 2020 12:08:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=d671d1fa48dbb3f22b68c1d67914c55ba1d58454
X-Osstest-Versions-That: ovmf=6e9bd495b38e05ece5f53872df62d66052f29bb6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Mar 2020 12:08:34 +0000
Subject: [Xen-devel] [ovmf test] 149176: all pass - PUSHED
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

flight 149176 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149176/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d671d1fa48dbb3f22b68c1d67914c55ba1d58454
baseline version:
 ovmf                 6e9bd495b38e05ece5f53872df62d66052f29bb6

Last test of basis   149116  2020-03-27 19:31:19 Z    2 days
Testing same since   149176  2020-03-29 17:13:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   6e9bd495b3..d671d1fa48  d671d1fa48dbb3f22b68c1d67914c55ba1d58454 -> xen-tested-master

