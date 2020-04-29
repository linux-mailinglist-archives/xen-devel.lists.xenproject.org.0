Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D551BD344
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 05:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTdlB-0007gG-73; Wed, 29 Apr 2020 03:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=totz=6N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jTdlA-0007gB-7p
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 03:51:44 +0000
X-Inumbo-ID: bd4fe728-89cc-11ea-9905-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd4fe728-89cc-11ea-9905-12813bfff9fa;
 Wed, 29 Apr 2020 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pZ9+nsafYLa5GaRVImxPtxtKJjvqV2xqtDA+1w/U2ho=; b=6pp1QypGc/yDFq+i3lpCfrHOk
 4bB28r8WIlG0Kiw1+QauS8YIY/FTSIVKKcN/rHh/DAevZOVe6eXV/f9307Dut2TMzggk9PYTpsyrK
 g+HY18Ew9N/ojB0j+ZJphZAZWsXeRLAF9v53HW0VBKmeCDeelN9EQmk73i/MZ0q4nKimI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTdl8-0005br-UA; Wed, 29 Apr 2020 03:51:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTdl8-0005ty-KP; Wed, 29 Apr 2020 03:51:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jTdl8-0007AO-JE; Wed, 29 Apr 2020 03:51:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149867-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149867: all pass - PUSHED
X-Osstest-Versions-This: ovmf=099dfbb29d8bf0a30e397e3f5baf1da437b8f0ba
X-Osstest-Versions-That: ovmf=0f1946b6626e263c7f764c21cc241cc9faf8a1ae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Apr 2020 03:51:42 +0000
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

flight 149867 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149867/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 099dfbb29d8bf0a30e397e3f5baf1da437b8f0ba
baseline version:
 ovmf                 0f1946b6626e263c7f764c21cc241cc9faf8a1ae

Last test of basis   149827  2020-04-26 06:40:24 Z    2 days
Testing same since   149867  2020-04-28 18:09:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Ray Ni <ray.ni@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>

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
   0f1946b662..099dfbb29d  099dfbb29d8bf0a30e397e3f5baf1da437b8f0ba -> xen-tested-master

