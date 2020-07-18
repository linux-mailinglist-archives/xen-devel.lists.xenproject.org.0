Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A8224C8F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 17:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwoqj-00056a-7R; Sat, 18 Jul 2020 15:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OolH=A5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jwoqi-00056V-B3
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 15:34:04 +0000
X-Inumbo-ID: 1c06397e-c90c-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c06397e-c90c-11ea-b7bb-bc764e2007e4;
 Sat, 18 Jul 2020 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lO34XNcHggXHlIFLwysBX3g8kSgUxskgXLfbdncN/UM=; b=jsg5OeOhaC2Tt2oLee/ATLTqX
 ifhyMs1uFWH93J+hrQt1sd7k+9u5AOOtomE453SR16bY3lhGoEb1F1ks8j1a7Du+A9J9jWMxgmm8y
 bPizsXAKFWhlFWtludbz46dewacjRn7p6kIDoqy7YrlyIzmfiKIFjqn/dmfn6uXWyUu3Y=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwoqh-0000Yk-8S; Sat, 18 Jul 2020 15:34:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwoqg-0005ua-MQ; Sat, 18 Jul 2020 15:34:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jwoqg-00049q-L3; Sat, 18 Jul 2020 15:34:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151982-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151982: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3d8327496762b4f2a54c9bafd7a214314ec28e9e
X-Osstest-Versions-That: ovmf=6ff53d2a13740e39dea110d6b3509c156c659586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Jul 2020 15:34:02 +0000
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

flight 151982 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151982/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3d8327496762b4f2a54c9bafd7a214314ec28e9e
baseline version:
 ovmf                 6ff53d2a13740e39dea110d6b3509c156c659586

Last test of basis   151972  2020-07-17 16:51:16 Z    0 days
Testing same since   151982  2020-07-18 02:36:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gary Lin <glin@suse.com>

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
   6ff53d2a13..3d83274967  3d8327496762b4f2a54c9bafd7a214314ec28e9e -> xen-tested-master

