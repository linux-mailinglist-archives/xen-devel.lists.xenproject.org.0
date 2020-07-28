Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3094231227
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 21:06:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Uvd-0004sO-PH; Tue, 28 Jul 2020 19:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E6Nk=BH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0Uvc-0004ru-CY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:06:20 +0000
X-Inumbo-ID: 684c2450-d105-11ea-8bc5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 684c2450-d105-11ea-8bc5-bc764e2007e4;
 Tue, 28 Jul 2020 19:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SevM+Kb/9xdcYyv8Q9okAtHdHJzc6pVZHKi34+wU4To=; b=wgxpDfbarAnad4Zhq6rtVtVOW
 9yiogJicCcdRbQkRAii1SGMDGa9QXvKVwmE5C0aBi4MM1FvxRua/TGuCn0gbuzcOI9D5fpRnnnNOA
 Az8OB9RRLCHgwHP+7t96P4N0VEGZKXsIkkN9o66wEhXBk0N1XBFdTcOLnqyWCshJZTQgw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0UvV-00089n-T6; Tue, 28 Jul 2020 19:06:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0UvV-0004yI-Ib; Tue, 28 Jul 2020 19:06:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0UvV-0002EM-Ht; Tue, 28 Jul 2020 19:06:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152261-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152261: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3887820e5fecdb9e948f88eb4e92298f6c3dd86f
X-Osstest-Versions-That: ovmf=ffde22468e2f0e93b51f97b801e6c7a181088c61
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Jul 2020 19:06:13 +0000
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

flight 152261 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152261/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3887820e5fecdb9e948f88eb4e92298f6c3dd86f
baseline version:
 ovmf                 ffde22468e2f0e93b51f97b801e6c7a181088c61

Last test of basis   152249  2020-07-28 07:04:39 Z    0 days
Testing same since   152261  2020-07-28 12:10:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qi Zhang <qi1.zhang@intel.com>
  Zhang, Qi <qi1.zhang@intel.com>

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
   ffde22468e..3887820e5f  3887820e5fecdb9e948f88eb4e92298f6c3dd86f -> xen-tested-master

