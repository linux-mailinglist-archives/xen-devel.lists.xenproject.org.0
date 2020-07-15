Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8072202F0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 05:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvY7a-0003qn-0E; Wed, 15 Jul 2020 03:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzA3=A2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jvY7Y-0003qT-TT
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 03:30:12 +0000
X-Inumbo-ID: 7a8c2832-c64b-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a8c2832-c64b-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMZP34yYKCmiLNSy4nhz/0OZLpJwUpfd9FY1kwRboRg=; b=Kfi6Jcugd+BDs4/HbOpl2D0Mu
 ISgXuBI7L2zhawG6JR9LcMC3uDEAugNC/zLPxEJpG+EqHhahcVXclUk++gYviLwFb8c1BUCzpG5F3
 F6btho/TpbfP9aq/wd3SvYwSyKAYp7avLLshT/Z5vCExtwnxVipcAJ7yHcGwJf7t4Y7EE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvY7S-00013t-8a; Wed, 15 Jul 2020 03:30:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvY7R-0002YV-PE; Wed, 15 Jul 2020 03:30:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jvY7R-0003TH-OS; Wed, 15 Jul 2020 03:30:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151898-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151898: all pass - PUSHED
X-Osstest-Versions-This: ovmf=256c4470f86e53661c070f8c64a1052e975f9ef0
X-Osstest-Versions-That: ovmf=9c6f3545aee0808b78a0ad4480b6eb9d24989dc1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Jul 2020 03:30:05 +0000
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

flight 151898 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151898/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 256c4470f86e53661c070f8c64a1052e975f9ef0
baseline version:
 ovmf                 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1

Last test of basis   151881  2020-07-14 03:39:27 Z    0 days
Testing same since   151898  2020-07-14 17:42:39 Z    0 days    1 attempts

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
   9c6f3545ae..256c4470f8  256c4470f86e53661c070f8c64a1052e975f9ef0 -> xen-tested-master

