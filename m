Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B5221B65
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 06:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvvS6-0007nY-VJ; Thu, 16 Jul 2020 04:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sYN5=A3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jvvS5-0007nE-Fl
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 04:24:57 +0000
X-Inumbo-ID: 4ae84940-c71c-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae84940-c71c-11ea-8496-bc764e2007e4;
 Thu, 16 Jul 2020 04:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AmuuirbdmCY47tLsTP9PXQs6SUOTQtK04uXmhHmYGS0=; b=YteSxArCe9vU8RbgFN5M2KHU/
 ToRvvO0pxuo0gXsdyA3bPkX1XMIXNuBriD4jZ+cD0XGdf38fucb1xJJPY4/gpfUHQKINZ1pYz00Mm
 NO3AR1KDrzjHz7IXRnGV/3VlQGzEeaDg22TpUFtlV6ZdhHodpy4BlWiz5G4/mgx4YnFqQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvvRz-0002nr-IY; Thu, 16 Jul 2020 04:24:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvvRz-0002jo-1p; Thu, 16 Jul 2020 04:24:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jvvRz-0008B6-1E; Thu, 16 Jul 2020 04:24:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151923-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151923: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e77966b341b993291ab2d95718b88a6a0d703d0c
X-Osstest-Versions-That: ovmf=c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jul 2020 04:24:51 +0000
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

flight 151923 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151923/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e77966b341b993291ab2d95718b88a6a0d703d0c
baseline version:
 ovmf                 c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc

Last test of basis   151907  2020-07-15 03:30:35 Z    1 days
Testing same since   151923  2020-07-15 16:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eric Dong <eric.dong@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Oleksiy Yakovlev <oleksiyy@ami.com>

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
   c7195b9ec3..e77966b341  e77966b341b993291ab2d95718b88a6a0d703d0c -> xen-tested-master

