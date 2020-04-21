Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87561B30B1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 21:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQywT-0002vh-DT; Tue, 21 Apr 2020 19:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mjY1=6F=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jQywR-0002vc-K1
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 19:52:23 +0000
X-Inumbo-ID: 9ae051d2-8409-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ae051d2-8409-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CWl64kH1K7aVNAktVVjNJgeS+LhtSUj9ObGplGDPBb8=; b=wIXeR/c0xn1j5RUFSGJub5KXH
 IbMTLBouW6s5o4WH2J9aXQukcThvDmI8BeA7MXTJqnu/HKo/Z0c/bZY8Cma9vXLPa0rHR1ub6xB+d
 DWynhgUbWmlSh+0TI1M7CIy1quaK3QtAjGaiibRp3cxXviFZr5c6VfqPfY6ySi16DVnOM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jQywL-0008Bb-Du; Tue, 21 Apr 2020 19:52:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jQywL-0004Gi-5C; Tue, 21 Apr 2020 19:52:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jQywL-00032k-4U; Tue, 21 Apr 2020 19:52:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149708-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149708: all pass - PUSHED
X-Osstest-Versions-This: ovmf=6e3c834ae47d1201c4ddcc6a6adc5e44718c7617
X-Osstest-Versions-That: ovmf=c884b23ac40a1b1f56e21ebbb1f602fa2e0f05c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Apr 2020 19:52:17 +0000
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

flight 149708 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149708/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6e3c834ae47d1201c4ddcc6a6adc5e44718c7617
baseline version:
 ovmf                 c884b23ac40a1b1f56e21ebbb1f602fa2e0f05c9

Last test of basis   149698  2020-04-17 07:50:32 Z    4 days
Testing same since   149708  2020-04-21 10:39:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Keysound Chang <Keysound_Chang@phoenix.com>
  Maciej Rabeda <maciej.rabeda@linux.intel.com>
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
   c884b23ac4..6e3c834ae4  6e3c834ae47d1201c4ddcc6a6adc5e44718c7617 -> xen-tested-master

