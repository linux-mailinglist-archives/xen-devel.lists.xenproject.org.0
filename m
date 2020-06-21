Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C2202AA6
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2020 15:01:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmzZV-0000El-TU; Sun, 21 Jun 2020 12:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iz7/=AC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jmzZU-0000EQ-HN
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2020 12:59:40 +0000
X-Inumbo-ID: 0e417306-b3bf-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e417306-b3bf-11ea-8496-bc764e2007e4;
 Sun, 21 Jun 2020 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WMm/7BkJOzyXdnNmCRjSdN0pgm141Z2bOCqathVLvfE=; b=vNovUdI5kwmjO0eBS9xhaGBJK
 52W9MeoaOj6ofxOEKeF9wi6bEsGdzGQe/p3wZSsjWmxSI/oCzbFHu4FL3xZ0JTTNRER1RLxmCaT8j
 uwM229BMlXziMR23U0dLlApuWhxqiuQWlEcgw5f271Jnvp+D8qKMrmCCb6925sm/d1heE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmzZO-0001GA-8O; Sun, 21 Jun 2020 12:59:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmzZN-0006uL-VV; Sun, 21 Jun 2020 12:59:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jmzZN-00084G-Uu; Sun, 21 Jun 2020 12:59:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151249: all pass - PUSHED
X-Osstest-Versions-This: ovmf=322969adf1fb3d6cfbd613f35121315715aff2ed
X-Osstest-Versions-That: ovmf=239b50a863704f7960525799eda82de061c7c458
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Jun 2020 12:59:33 +0000
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

flight 151249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 322969adf1fb3d6cfbd613f35121315715aff2ed
baseline version:
 ovmf                 239b50a863704f7960525799eda82de061c7c458

Last test of basis   151228  2020-06-18 19:18:56 Z    2 days
Testing same since   151249  2020-06-20 09:21:45 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wasim Khan <wasim.khan@nxp.com>

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
   239b50a863..322969adf1  322969adf1fb3d6cfbd613f35121315715aff2ed -> xen-tested-master

