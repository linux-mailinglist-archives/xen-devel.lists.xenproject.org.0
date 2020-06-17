Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C91FC9D5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 11:28:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlUMc-0007q6-52; Wed, 17 Jun 2020 09:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDe+=76=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jlUMa-0007ob-FV
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 09:28:08 +0000
X-Inumbo-ID: d79497c4-b07c-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d79497c4-b07c-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=szpolumGaZTwyvpQJZDSSUINfbwfFLmAiJYjhDWeicc=; b=GG4x90l2CYV2GIHDKrmBwZeM3
 4dikHhOOYOPQppxw4dZIFT7SYnK6fijoxV2cSAoyOYLrHofOyjFVf+Eh0EU1/n3GP0u4ZGgmid8dW
 80kmb8sTOj0d9VTnx7h4td3ospWxLqecw+y8saeQN4qgtSSKSWrIiE9rAeYNCFdQdTY+Y=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUMU-0007Uo-52; Wed, 17 Jun 2020 09:28:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUMT-0002aD-QZ; Wed, 17 Jun 2020 09:28:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUMT-0008E8-Pp; Wed, 17 Jun 2020 09:28:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151162-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151162: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8927e2777786a43cddfaa328b0f4c41a09c629c9
X-Osstest-Versions-That: ovmf=b90beadfae8f1153697fbb87f923cfa14578ee3e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jun 2020 09:28:01 +0000
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

flight 151162 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151162/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8927e2777786a43cddfaa328b0f4c41a09c629c9
baseline version:
 ovmf                 b90beadfae8f1153697fbb87f923cfa14578ee3e

Last test of basis   151139  2020-06-15 00:09:55 Z    2 days
Testing same since   151162  2020-06-16 01:58:37 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   b90beadfae..8927e27777  8927e2777786a43cddfaa328b0f4c41a09c629c9 -> xen-tested-master

