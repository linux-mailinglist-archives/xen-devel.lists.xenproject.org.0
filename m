Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558621C42A
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 14:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juEXB-0001Ym-Mz; Sat, 11 Jul 2020 12:23:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oRR=AW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1juEXA-0001Yh-1J
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 12:23:12 +0000
X-Inumbo-ID: 48fa04f6-c371-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48fa04f6-c371-11ea-b7bb-bc764e2007e4;
 Sat, 11 Jul 2020 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ubHWDZ09bX3Bj0JS2nhjC15y0APnhYXwuiAi/5enjkU=; b=N/mpGFVweV87ks1t3ko5OIvVr
 ov6wxkllpwc0Psey2RFZA6Sx4qlecnEtOgnI9ukldKCJuMIQsq6OxLumy+Teb9Nqx2l8pPoFkEe8R
 TgT2n7biZMBrLQklf42AfywGG+xFxVA0QdMrOdN4tXTv1shwyoevhlRko7/cfoS4auzAc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1juEX8-0008Iw-ON; Sat, 11 Jul 2020 12:23:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1juEX8-0005ho-Gt; Sat, 11 Jul 2020 12:23:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1juEX8-0001nT-Dn; Sat, 11 Jul 2020 12:23:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151821-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151821: all pass - PUSHED
X-Osstest-Versions-This: ovmf=f45e3a4afa65a45ea1a956a7c5e7410ff40190d1
X-Osstest-Versions-That: ovmf=f7f1b33282b7dc52a0c77860d3f4523b231a750f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Jul 2020 12:23:10 +0000
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

flight 151821 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151821/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1
baseline version:
 ovmf                 f7f1b33282b7dc52a0c77860d3f4523b231a750f

Last test of basis   151812  2020-07-10 22:11:49 Z    0 days
Testing same since   151821  2020-07-11 06:33:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>

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
   f7f1b33282..f45e3a4afa  f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 -> xen-tested-master

