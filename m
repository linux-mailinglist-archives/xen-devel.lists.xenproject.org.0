Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F234023483B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 17:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WiW-0001OR-Uz; Fri, 31 Jul 2020 15:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OD0g=BK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k1WiW-0001OM-9O
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:13:04 +0000
X-Inumbo-ID: 5301964c-d340-11ea-abd1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5301964c-d340-11ea-abd1-12813bfff9fa;
 Fri, 31 Jul 2020 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IrLi+5Px2HB18wWvqXBckJFDGIUmwNnZbJhKZZfk/lc=; b=aDkbPeUgo1mqYm8nllN5guZaO
 YACkfmcOb75itdpi2v8j4RiyZ8H1OjI6H4g0O5UAPp7K2jJyrWKOa2JAexGVDOdE4cNvmV9yWgEp5
 ZPPX/aJkFDx5dw8vmS0s/WZIETcz4oRRgnoeZyDOEVRKn7xPoIwkCfqt2fMywLgWrn3CQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k1WiS-0004ez-Ra; Fri, 31 Jul 2020 15:13:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k1WiS-0007Ds-Gj; Fri, 31 Jul 2020 15:13:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k1WiS-0005bv-G3; Fri, 31 Jul 2020 15:13:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152315-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152315: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7f79b736b0a57da71d87c987357db0227cd16ac6
X-Osstest-Versions-That: ovmf=e848b58d7c85293cd4121287abcea2d22a4f0620
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 31 Jul 2020 15:13:00 +0000
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

flight 152315 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152315/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f79b736b0a57da71d87c987357db0227cd16ac6
baseline version:
 ovmf                 e848b58d7c85293cd4121287abcea2d22a4f0620

Last test of basis   152277  2020-07-29 04:16:17 Z    2 days
Testing same since   152315  2020-07-31 03:12:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shenglei Zhang <shenglei.zhang@intel.com>

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
   e848b58d7c..7f79b736b0  7f79b736b0a57da71d87c987357db0227cd16ac6 -> xen-tested-master

