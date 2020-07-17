Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8892240AB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 18:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwTJt-0003ck-1T; Fri, 17 Jul 2020 16:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKPa=A4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jwTJr-0003bp-DF
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 16:34:43 +0000
X-Inumbo-ID: 67b9f700-c84b-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67b9f700-c84b-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VjPjn8qfXMtSsoqX73HwKkuKt3VtGVlqW/8L0ivwZg=; b=uK1xhcm048AcHI0nJ3iJ2jRMj
 yWsByFJba+lMOgAI7L1yDH90f5ABkhNdXdQZIc1eIU+erSVBniycBbRo8+WShXs6OMqcaWzGUslSI
 +Fr30r/gdhtxSsGv4Pjdhi2HVlm7Co3Y79dEy52u7x2za4KQFhEE6TQbsu+E0nKOQzlnM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwTJl-0002cp-6Y; Fri, 17 Jul 2020 16:34:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwTJk-0001Kl-MG; Fri, 17 Jul 2020 16:34:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jwTJk-0006sI-Lk; Fri, 17 Jul 2020 16:34:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151959-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151959: all pass - PUSHED
X-Osstest-Versions-This: ovmf=21a23e6966c2eb597a8db98d6837a4c01b3cad4a
X-Osstest-Versions-That: ovmf=d9269d69138860edb1ec9796ed48549dc6ba5735
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Jul 2020 16:34:36 +0000
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

flight 151959 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151959/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21a23e6966c2eb597a8db98d6837a4c01b3cad4a
baseline version:
 ovmf                 d9269d69138860edb1ec9796ed48549dc6ba5735

Last test of basis   151937  2020-07-16 04:25:27 Z    1 days
Testing same since   151946  2020-07-16 17:27:21 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dandan Bi <dandan.bi@intel.com>
  Vin Xue <vinxue@outlook.com>

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
   d9269d6913..21a23e6966  21a23e6966c2eb597a8db98d6837a4c01b3cad4a -> xen-tested-master

