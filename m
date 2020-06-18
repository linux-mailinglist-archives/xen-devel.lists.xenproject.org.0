Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D291FFBA9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 21:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm03P-0003c2-Po; Thu, 18 Jun 2020 19:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmVc=77=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jm03N-0003bu-Ij
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 19:18:25 +0000
X-Inumbo-ID: 7af12916-b198-11ea-bae9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7af12916-b198-11ea-bae9-12813bfff9fa;
 Thu, 18 Jun 2020 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xnt5wAlsC8js/GY6TG3eLt1Ge2bgp9Kyfb2z8+rqfuc=; b=aLrZepfyEyR/GWvAbvsy5WXLj
 048foBuj5YUtKyVIz3s1odQolmraKUoo2UdFjrCEa7yGamS1w+jJD+YeTr/TIL9PlN2V3A5GtgiaR
 ntSJn4MUh2ioLv1r3Him7L7VEQpNQOi9hqa9EO550JomYmEAmKFjyHPFPsV0H08JCom8I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jm03L-00081y-UT; Thu, 18 Jun 2020 19:18:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jm03L-0003CJ-Et; Thu, 18 Jun 2020 19:18:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jm03L-0006TG-EC; Thu, 18 Jun 2020 19:18:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151187: all pass - PUSHED
X-Osstest-Versions-This: ovmf=58ae92a993687d913aa6dd00ef3497a1bc5f6c40
X-Osstest-Versions-That: ovmf=8927e2777786a43cddfaa328b0f4c41a09c629c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Jun 2020 19:18:23 +0000
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

flight 151187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 58ae92a993687d913aa6dd00ef3497a1bc5f6c40
baseline version:
 ovmf                 8927e2777786a43cddfaa328b0f4c41a09c629c9

Last test of basis   151162  2020-06-16 01:58:37 Z    2 days
Testing same since   151187  2020-06-17 09:28:29 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Ilias Apalodimas <ilias.apalodimas@linaro.org>
  Jiewen Yao <Jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Ming Tan <ming.tan@intel.com>
  Tan, Ming <ming.tan@intel.com>

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
   8927e27777..58ae92a993  58ae92a993687d913aa6dd00ef3497a1bc5f6c40 -> xen-tested-master

