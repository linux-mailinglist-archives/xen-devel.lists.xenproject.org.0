Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F91C0A71
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 00:34:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUHlL-0005L3-C3; Thu, 30 Apr 2020 22:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLrL=6O=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jUHlJ-0005Ky-9O
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 22:34:33 +0000
X-Inumbo-ID: bd84e362-8b32-11ea-9ac1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd84e362-8b32-11ea-9ac1-12813bfff9fa;
 Thu, 30 Apr 2020 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9j0BF2JgExta+2a9BjXYPeYNAI7fyAVCR8W70/G6pKI=; b=5JkXErMtSwus+REqA29iQ3sDY
 bMDTRFxv6rV0TYABEvYd4W+ytS2i6pJrd2xss8G5YGXY3fljTQfqx1OTRwndj3FmtU4ye6BM4Bhkq
 r3yg2C3K693s4g1jwvUYAEKbECFNEHcda5b/07AEOTLI40QVvM06pMrRaZIDODsicr28U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jUHl9-0006SC-2U; Thu, 30 Apr 2020 22:34:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jUHl8-000475-PL; Thu, 30 Apr 2020 22:34:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jUHl8-0001CU-Oc; Thu, 30 Apr 2020 22:34:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149891-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149891: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6
X-Osstest-Versions-That: ovmf=f07fb43b2d3f92a15d6992205b72ba5df0e74fe2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Apr 2020 22:34:22 +0000
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

flight 149891 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149891/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6
baseline version:
 ovmf                 f07fb43b2d3f92a15d6992205b72ba5df0e74fe2

Last test of basis   149887  2020-04-30 04:39:28 Z    0 days
Testing same since   149891  2020-04-30 16:10:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   f07fb43b2d..e54310451f  e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6 -> xen-tested-master

