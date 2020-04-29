Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E633F1BD75A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:34:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTiAL-0003ZD-Oh; Wed, 29 Apr 2020 08:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=totz=6N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jTiAJ-0003Z7-Sa
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:33:59 +0000
X-Inumbo-ID: 281258b2-89f4-11ea-991b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 281258b2-89f4-11ea-991b-12813bfff9fa;
 Wed, 29 Apr 2020 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXaz4WsdYC1NZr0B5MfR11X2HSxyd4AtDUNA4U4i3W4=; b=sdVMf6m3Kmq0gOvsDID3jMh5S
 6Gr+asG0OR8D596svaXLoHihGNCnP1AmrGEMPjsLdBA5sqYVHcg9W8MituKl4mKPhthcO0Bkgi6+p
 icB9uMokEcP3cLq/AHi92l8A2jWaMB/Lw+kbfCjM4k9duiukdm8ntlVHu+jhyOERp/Kho=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTiAC-0004gC-EH; Wed, 29 Apr 2020 08:33:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTiAB-0003PI-To; Wed, 29 Apr 2020 08:33:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jTiAB-00034P-T9; Wed, 29 Apr 2020 08:33:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149869-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149869: all pass - PUSHED
X-Osstest-Versions-This: ovmf=b2034179e8feed9c7d3bc8f9d40a18fd236c5b57
X-Osstest-Versions-That: ovmf=099dfbb29d8bf0a30e397e3f5baf1da437b8f0ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Apr 2020 08:33:51 +0000
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

flight 149869 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149869/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b2034179e8feed9c7d3bc8f9d40a18fd236c5b57
baseline version:
 ovmf                 099dfbb29d8bf0a30e397e3f5baf1da437b8f0ba

Last test of basis   149867  2020-04-28 18:09:26 Z    0 days
Testing same since   149869  2020-04-29 03:52:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>

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
   099dfbb29d..b2034179e8  b2034179e8feed9c7d3bc8f9d40a18fd236c5b57 -> xen-tested-master

