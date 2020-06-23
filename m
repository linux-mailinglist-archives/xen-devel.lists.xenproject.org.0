Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61601206555
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 23:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnqjG-0007GT-5l; Tue, 23 Jun 2020 21:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ps9c=AE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jnqjE-0007G7-CZ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 21:45:16 +0000
X-Inumbo-ID: cfd25206-b59a-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfd25206-b59a-11ea-bca7-bc764e2007e4;
 Tue, 23 Jun 2020 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/YI22NJpL2tV0QxO2pUEimfW+NZ+YOIwloLd77lMeV0=; b=nfhViENgoH5EylO2dSrfv3CYc
 faZpXwm9vTIyL2rKlns9vumtR3jrmSqsHUdX8jRFlJ0pDm1I5I0JMwJ57mlvYX/bwOMW9jyAQifFR
 0MuNV9FcnW1MX0ZrVRA+61QHeFPMBOJqRxAK3gJ8Sv7A6/obLwbvmwLM3OuA7/pSVpJOc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnqj8-0006PP-6g; Tue, 23 Jun 2020 21:45:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnqj7-0006Qa-V7; Tue, 23 Jun 2020 21:45:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jnqj7-0007ah-UV; Tue, 23 Jun 2020 21:45:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151303-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151303: all pass - PUSHED
X-Osstest-Versions-This: ovmf=00b8bf7eda00fb6f0197d3968b6078cfdb4870fa
X-Osstest-Versions-That: ovmf=322969adf1fb3d6cfbd613f35121315715aff2ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jun 2020 21:45:09 +0000
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

flight 151303 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151303/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa
baseline version:
 ovmf                 322969adf1fb3d6cfbd613f35121315715aff2ed

Last test of basis   151249  2020-06-20 09:21:45 Z    3 days
Testing same since   151303  2020-06-23 01:55:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cole, Deric <deric.cole@intel.com>
  Deric Cole <deric.cole@intel.com>

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
   322969adf1..00b8bf7eda  00b8bf7eda00fb6f0197d3968b6078cfdb4870fa -> xen-tested-master

