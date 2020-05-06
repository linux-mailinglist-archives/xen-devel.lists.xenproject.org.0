Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA71C6E29
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 12:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWH5E-0003Uf-NV; Wed, 06 May 2020 10:15:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LxRp=6U=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jWH5D-0003Ua-3U
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 10:15:19 +0000
X-Inumbo-ID: 7b8683ea-8f82-11ea-9e31-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b8683ea-8f82-11ea-9e31-12813bfff9fa;
 Wed, 06 May 2020 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cg9bnIiB+c2pIaHpzub87FSIrF1dLWCeFXH6eHPUunU=; b=OVIrvXuWz4FMeLJTMjgR/k3d8
 d8gO8pfdgfOjr82Ku5WqUbF/C9H9Yw1y02wbzGET/0+MrOHmyQauOM6+0q7kL2+hiZYZz9/blA3TE
 DE/qZGl9L5QRbdJ9c3pujwJVb8sWhB7+4rUOoMh7JyQ+UBIKW+J2GoaGdTTZMO7ECDIBI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWH5A-0001gF-Pc; Wed, 06 May 2020 10:15:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWH5A-0006Nf-GZ; Wed, 06 May 2020 10:15:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jWH5A-0004x2-G3; Wed, 06 May 2020 10:15:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150055-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150055: all pass - PUSHED
X-Osstest-Versions-This: xen=779efdbb502b38c66b774b124fa0ceed254875bd
X-Osstest-Versions-That: xen=0135be8bd8cd60090298f02310691b688d95c3a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 May 2020 10:15:16 +0000
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

flight 150055 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150055/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  779efdbb502b38c66b774b124fa0ceed254875bd
baseline version:
 xen                  0135be8bd8cd60090298f02310691b688d95c3a8

Last test of basis   149910  2020-05-03 09:19:24 Z    3 days
Testing same since   150055  2020-05-06 09:19:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ashok Raj <ashok.raj@intel.com>
  Borislav Petkov <bp@suse.de>
  Hongyan Xia <hongyxia@amazon.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Thomas Gleixner <tglx@linutronix.de>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   0135be8bd8..779efdbb50  779efdbb502b38c66b774b124fa0ceed254875bd -> coverity-tested/smoke

