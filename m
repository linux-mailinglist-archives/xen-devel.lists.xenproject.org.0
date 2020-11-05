Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05292A7A65
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 10:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19669.44923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kabVp-00039p-PQ; Thu, 05 Nov 2020 09:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19669.44923; Thu, 05 Nov 2020 09:24:57 +0000
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
	id 1kabVp-00039Q-MK; Thu, 05 Nov 2020 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 19669;
 Thu, 05 Nov 2020 09:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kabVo-00038s-BX
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 09:24:56 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72582182-07c5-43d6-8afc-28c065756f32;
 Thu, 05 Nov 2020 09:24:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kabVh-0003et-7E; Thu, 05 Nov 2020 09:24:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kabVg-0006bB-Vu; Thu, 05 Nov 2020 09:24:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kabVg-0006iI-QO; Thu, 05 Nov 2020 09:24:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kabVo-00038s-BX
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 09:24:56 +0000
X-Inumbo-ID: 72582182-07c5-43d6-8afc-28c065756f32
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 72582182-07c5-43d6-8afc-28c065756f32;
	Thu, 05 Nov 2020 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ow6uMQ/x8lKkxKZowkXVkBLiCWRNKPixiKWZm3gRc9g=; b=HMKSyJyeySbCxEAtSheh3tc+B2
	Z2P4K+a0RCgQSsgjN926jvys/NrANPs6V8n4mY3CcUTPZAKo92qdBjR5rbzDIs5KEaITc7A8/9u6j
	9iifvx/DRTXa538p8mNpT8UuD34hK+kIBbymZgXXRMCfdo1Qag3fwSKKzpfkNM43S80k=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kabVh-0003et-7E; Thu, 05 Nov 2020 09:24:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kabVg-0006bB-Vu; Thu, 05 Nov 2020 09:24:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kabVg-0006iI-QO; Thu, 05 Nov 2020 09:24:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156400-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156400: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8d5708833509ece6ac63084dc07c8ac53c4d4c1a
X-Osstest-Versions-That:
    ovmf=375683654d46380e4e557502141e9823f6b68445
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Nov 2020 09:24:48 +0000

flight 156400 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156400/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8d5708833509ece6ac63084dc07c8ac53c4d4c1a
baseline version:
 ovmf                 375683654d46380e4e557502141e9823f6b68445

Last test of basis   156380  2020-11-03 10:11:49 Z    1 days
Testing same since   156400  2020-11-04 12:10:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   375683654d..8d57088335  8d5708833509ece6ac63084dc07c8ac53c4d4c1a -> xen-tested-master

