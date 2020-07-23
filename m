Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154822B2D4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:43:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydNN-0005hd-5Q; Thu, 23 Jul 2020 15:43:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/wE=BC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jydNM-0005go-5B
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:43:16 +0000
X-Inumbo-ID: 35d3f09c-ccfb-11ea-873e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35d3f09c-ccfb-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3Qyp/KqhMFonhh72qezywkX2ZbRZ+8bhOZb7/FrFAc=; b=fr/mFtYvhR+gUZYIofMQSn3gc
 FjkoaKXCOOsQAhMmWRdkUsVo3ADtz1I6iDSs1VG3+i9JlF7SQhuG+izno8+2Z3QEZrgWEgW2wRGeO
 ZBGNK6IELQq43tpqc+K3RzJqcmOmHMbiyFpMCWVK5iDddcU1NTafdMaHcelUeIrsuqSrM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jydNF-0002ng-Oq; Thu, 23 Jul 2020 15:43:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jydNF-0002Rn-BQ; Thu, 23 Jul 2020 15:43:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jydNF-0001QG-Al; Thu, 23 Jul 2020 15:43:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152131-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152131: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3d2f7953b2ba9d27b1905c864c369fe624c74a3f
X-Osstest-Versions-That: ovmf=9132a31b9c8381197eee75eb66c809182b264110
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Jul 2020 15:43:09 +0000
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

flight 152131 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152131/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3d2f7953b2ba9d27b1905c864c369fe624c74a3f
baseline version:
 ovmf                 9132a31b9c8381197eee75eb66c809182b264110

Last test of basis   152088  2020-07-21 23:41:49 Z    1 days
Testing same since   152131  2020-07-23 01:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   9132a31b9c..3d2f7953b2  3d2f7953b2ba9d27b1905c864c369fe624c74a3f -> xen-tested-master

