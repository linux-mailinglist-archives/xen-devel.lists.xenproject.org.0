Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA984193AAC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 09:17:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHNeT-0008Nj-NF; Thu, 26 Mar 2020 08:14:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RiB7=5L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jHNeS-0008Ne-42
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 08:14:08 +0000
X-Inumbo-ID: bfb2d19a-6f39-11ea-876b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfb2d19a-6f39-11ea-876b-12813bfff9fa;
 Thu, 26 Mar 2020 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7wySDIzmIvEYt7y4dLtdfuEUy4s2a3rLkuK7lMTdfQ=; b=31RhBpJ3XCS4tOJIp7nQsQD4F
 kM+/b2j82yA7dRyHCWiJuj1EgELRzpZvhswnCrd2DYzq9wXl3ldSIebYoy13Wl2RUr05DaCGCa2m8
 lHhEjp31dD8Vc5NjB+sHNaedPLyyP3+DraBiV42kwcx2nq6X/IeS360MfPozo1BRrLgqQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHNeK-0001p8-Ky; Thu, 26 Mar 2020 08:14:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHNeK-0006Al-7d; Thu, 26 Mar 2020 08:14:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jHNeK-0007EX-6z; Thu, 26 Mar 2020 08:14:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149012-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=e24529a5c324b07dd0e555206b35d1a56be834a6
X-Osstest-Versions-That: ovmf=2f524a745e23e1b4c73ea22b058492bfe4af84c2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Mar 2020 08:14:00 +0000
Subject: [Xen-devel] [ovmf test] 149012: all pass - PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149012 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149012/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e24529a5c324b07dd0e555206b35d1a56be834a6
baseline version:
 ovmf                 2f524a745e23e1b4c73ea22b058492bfe4af84c2

Last test of basis   148946  2020-03-24 02:46:56 Z    2 days
Testing same since   149012  2020-03-25 10:14:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   2f524a745e..e24529a5c3  e24529a5c324b07dd0e555206b35d1a56be834a6 -> xen-tested-master

