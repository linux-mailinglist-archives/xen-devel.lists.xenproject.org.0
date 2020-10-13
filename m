Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2728D391
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 20:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6356.16903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSOxO-0007dC-SG; Tue, 13 Oct 2020 18:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6356.16903; Tue, 13 Oct 2020 18:23:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSOxO-0007cr-Ok; Tue, 13 Oct 2020 18:23:30 +0000
Received: by outflank-mailman (input) for mailman id 6356;
 Tue, 13 Oct 2020 18:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jd8M=DU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSOxN-0007cP-Q5
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:23:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d823fe4-774e-4117-ad0f-49c6244ac1a3;
 Tue, 13 Oct 2020 18:23:23 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSOxG-0004AK-U1; Tue, 13 Oct 2020 18:23:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSOxG-0003Py-MC; Tue, 13 Oct 2020 18:23:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSOxG-0002ic-Lk; Tue, 13 Oct 2020 18:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Jd8M=DU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSOxN-0007cP-Q5
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:23:29 +0000
X-Inumbo-ID: 2d823fe4-774e-4117-ad0f-49c6244ac1a3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2d823fe4-774e-4117-ad0f-49c6244ac1a3;
	Tue, 13 Oct 2020 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=50Zt0/KzVUd9ZS7yG52NlogseuEc0UEv+QWoJi56kI0=; b=pxGNgeTgi1X6uMEzE+2dr4ecpH
	G5KxkI1yI+RJGGfkf0sroGwODm8bv9nLfp5qTDV55DY1ahOA7GWQqXEBdSymG1J/VP9Cyo5P+78FC
	I4OG0inCJVnyqQ55mKZDAXdIaBPaUNvDRE2ZBHOUxSML4Z5vfTQZiG54HyRq3LMVQqjI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSOxG-0004AK-U1; Tue, 13 Oct 2020 18:23:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSOxG-0003Py-MC; Tue, 13 Oct 2020 18:23:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSOxG-0002ic-Lk; Tue, 13 Oct 2020 18:23:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155765-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155765: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9380177354387f03c8ff9eadb7ae94aa453b9469
X-Osstest-Versions-That:
    ovmf=5d1af380d3e4bd840fa324db33ca4f739136e654
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Oct 2020 18:23:22 +0000

flight 155765 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155765/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9380177354387f03c8ff9eadb7ae94aa453b9469
baseline version:
 ovmf                 5d1af380d3e4bd840fa324db33ca4f739136e654

Last test of basis   155757  2020-10-13 01:44:44 Z    0 days
Testing same since   155765  2020-10-13 06:07:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  fengyunhua <fengyunhua@byosoft.com.cn>
  Jan Bobek <jbobek@nvidia.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   5d1af380d3..9380177354  9380177354387f03c8ff9eadb7ae94aa453b9469 -> xen-tested-master

