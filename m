Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0761B8CE0
	for <lists+xen-devel@lfdr.de>; Sun, 26 Apr 2020 08:16:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSaZO-0000mm-0k; Sun, 26 Apr 2020 06:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wn3c=6K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSaZN-0000me-67
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2020 06:15:13 +0000
X-Inumbo-ID: 466f090c-8785-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 466f090c-8785-11ea-ae69-bc764e2007e4;
 Sun, 26 Apr 2020 06:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6NcfLfhllQRvMvRSZ03XpX1iA8UF7avvG/Po3CH2nbk=; b=EKHIyCM3ZLwMZorUmJH2GdmSo
 g6pzt7d1UqG0k9apO0STrLbmbBjJjbMKGTA130QycmKzm6fXe6Hd9xBDbjO38/F3dH3FRj3qawaRi
 Y9QNrFFJ4luS9niZoDef0DdrkRbb0bXyHqeHcYEl+rwaB6OkVIvFu82rwwHAXRumnQESI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSaZG-0001RX-RO; Sun, 26 Apr 2020 06:15:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSaZG-0006u6-JC; Sun, 26 Apr 2020 06:15:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSaZG-000532-IN; Sun, 26 Apr 2020 06:15:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149825-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149825: all pass - PUSHED
X-Osstest-Versions-This: ovmf=c5c5c980dbaadf32193ac5e4ed2a35b665e0c76e
X-Osstest-Versions-That: ovmf=d5339c04d7cd47c061ec146a7b062052e3dc56ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Apr 2020 06:15:06 +0000
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

flight 149825 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149825/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5c5c980dbaadf32193ac5e4ed2a35b665e0c76e
baseline version:
 ovmf                 d5339c04d7cd47c061ec146a7b062052e3dc56ca

Last test of basis   149766  2020-04-23 14:40:11 Z    2 days
Testing same since   149825  2020-04-26 01:40:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  kuqin <kuqin@microsoft.com>

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
   d5339c04d7..c5c5c980db  c5c5c980dbaadf32193ac5e4ed2a35b665e0c76e -> xen-tested-master

