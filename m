Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241AF1CC9BD
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2020 11:47:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXiXE-0003SO-Tw; Sun, 10 May 2020 09:46:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3Yd=6Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jXiXC-0003SJ-Fn
 for xen-devel@lists.xenproject.org; Sun, 10 May 2020 09:46:10 +0000
X-Inumbo-ID: 138d4386-92a3-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 138d4386-92a3-11ea-b07b-bc764e2007e4;
 Sun, 10 May 2020 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t4YVXObO3dHoBiVBBG88BtwK3y23h0k1jKKPBdFMiNc=; b=ku6y+9kYc5mAuUM7VtC0KDn4W
 Ha+7hTTYbLV8R0AXRqqfR/umwO4bU68CZLSUa95SME+K6ZTktb9E9bDn/tmoWBlgCCDSFMK+YEhvx
 wb/ORoxdFTD6kOtD0XPoJF9uNHM0j2izGL7LAifm0gXfqb26H2Mp4oJ5X0YMWtG5+n6VE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXiXB-0005SS-67; Sun, 10 May 2020 09:46:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXiXA-00069w-US; Sun, 10 May 2020 09:46:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jXiXA-0007I7-Tt; Sun, 10 May 2020 09:46:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150123: all pass - PUSHED
X-Osstest-Versions-This: xen=e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
X-Osstest-Versions-That: xen=779efdbb502b38c66b774b124fa0ceed254875bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 May 2020 09:46:08 +0000
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

flight 150123 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150123/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
baseline version:
 xen                  779efdbb502b38c66b774b124fa0ceed254875bd

Last test of basis   150055  2020-05-06 09:19:00 Z    4 days
Testing same since   150123  2020-05-10 09:19:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Wei Liu <liuwe@microsoft.com>
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
   779efdbb50..e0d92d9bd7  e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9 -> coverity-tested/smoke

