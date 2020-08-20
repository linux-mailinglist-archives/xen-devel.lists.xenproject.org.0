Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B024C5A1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 20:34:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8pOH-0006su-KV; Thu, 20 Aug 2020 18:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wn9w=B6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k8pOF-0006so-Ta
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 18:34:19 +0000
X-Inumbo-ID: 79c14eef-30eb-494f-858b-9704cab9dba9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79c14eef-30eb-494f-858b-9704cab9dba9;
 Thu, 20 Aug 2020 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=HO9vF3vX2l83DQR3i9CRt4tnx1cUtey2TLGmwO0bEEs=; b=nctotBA9j+l5CL7zdsYg3FL7AQ
 hBhmVJvzsNHj8PL9gD6EkOeZbDzdVfJqUbQqS1PzXMW/qeTyTnFffYDp51m/l/adE6ZVlb1B2cvlx
 yTFXp3SfM4bEAuaORQ3xKzCDmUaLibuCnqltTQS7fL4aVKykgEfjSx9g7Q3+1pMA880Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8pOD-0002Sh-9W; Thu, 20 Aug 2020 18:34:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8pOC-0000Bg-VF; Thu, 20 Aug 2020 18:34:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k8pOC-00064z-Uj; Thu, 20 Aug 2020 18:34:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152627-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152627: all pass - PUSHED
X-Osstest-Versions-This: ovmf=5a6d764e1d073d28e8f398289ccb5592bf9a72ba
X-Osstest-Versions-That: ovmf=a048af3c9073e4b8108e6cf920bbb35574059639
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Aug 2020 18:34:16 +0000
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

flight 152627 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152627/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5a6d764e1d073d28e8f398289ccb5592bf9a72ba
baseline version:
 ovmf                 a048af3c9073e4b8108e6cf920bbb35574059639

Last test of basis   152617  2020-08-19 09:13:09 Z    1 days
Testing same since   152627  2020-08-20 03:50:23 Z    0 days    1 attempts

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
   a048af3c90..5a6d764e1d  5a6d764e1d073d28e8f398289ccb5592bf9a72ba -> xen-tested-master

