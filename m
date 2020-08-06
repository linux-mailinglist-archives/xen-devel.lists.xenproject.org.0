Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919AD23DA33
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 14:11:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eje-00023K-KB; Thu, 06 Aug 2020 12:11:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G/J/=BQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k3ejd-00023B-NZ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:11:01 +0000
X-Inumbo-ID: 01b64f45-19c1-44cb-bab2-4cc82b867c99
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01b64f45-19c1-44cb-bab2-4cc82b867c99;
 Thu, 06 Aug 2020 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HNFqvZLzS58u0UKm2xWeUoUfW2F4SICvBOP5dfa7F7k=; b=PbbHVKDvDNpmk/26bAkyqCSYF
 OKFrihFwQWsSoxEA9abVrJp3zJKgQ1fhwSM4l3X8tUXPr/heTcn0PMSe3i/kwH1K8k7/+lp8qOIgw
 K/OHM+AWfE56pDfPkZ1P9nBr9huNyTIenKvkii+/9A1uCfFGYFmaimYy/a/Fp6A8Z22as=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3eja-0001gq-RR; Thu, 06 Aug 2020 12:10:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3eja-0008Qv-Dg; Thu, 06 Aug 2020 12:10:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k3eja-00053u-Cz; Thu, 06 Aug 2020 12:10:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152495-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152495: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e188ecc8b4aed8fdd26b731d43883861f5e5e7b4
X-Osstest-Versions-That: ovmf=aa211bb6ef8edc70d2e6dfdab01a7d29e53f1ee2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Aug 2020 12:10:58 +0000
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

flight 152495 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152495/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e188ecc8b4aed8fdd26b731d43883861f5e5e7b4
baseline version:
 ovmf                 aa211bb6ef8edc70d2e6dfdab01a7d29e53f1ee2

Last test of basis   152459  2020-08-04 07:31:47 Z    2 days
Testing same since   152495  2020-08-05 17:41:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   aa211bb6ef..e188ecc8b4  e188ecc8b4aed8fdd26b731d43883861f5e5e7b4 -> xen-tested-master

