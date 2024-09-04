Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4B96BE15
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790321.1200042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpsy-0008Oi-00; Wed, 04 Sep 2024 13:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790321.1200042; Wed, 04 Sep 2024 13:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpsx-0008Lr-T5; Wed, 04 Sep 2024 13:17:23 +0000
Received: by outflank-mailman (input) for mailman id 790321;
 Wed, 04 Sep 2024 13:17:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slpsx-0008Lh-BO; Wed, 04 Sep 2024 13:17:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slpsx-0007TR-1s; Wed, 04 Sep 2024 13:17:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slpsw-0003bl-Pu; Wed, 04 Sep 2024 13:17:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slpsw-0005Uf-Pd; Wed, 04 Sep 2024 13:17:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=WcU1jxylg5RZBFuHeS+LhgkriXYSA6Ckr9K5WNof/h4=; b=rhchnTLonpcwp+5JSiVB5fwsVc
	0NTHVV4xka0aFFoxxj0MJbaah0dVHyzWjip4EOiN1YrX+12D0aO3vmkDRpCZvO1zCDJeC+kWTEshV
	OZ3nczNIvfvAbvZKUWk3FJcFzSxrMEwetSorbHsNdp2jiGsO3gr6FTje7v9aOLCfrnmU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187491-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187491: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=99d60cbd3990fe8f5b86eaab40876fbbf9d99084
X-Osstest-Versions-That:
    ovmf=1240a722f8466930cced7f7d40a3fb6a29efb146
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Sep 2024 13:17:22 +0000

flight 187491 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187491/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 99d60cbd3990fe8f5b86eaab40876fbbf9d99084
baseline version:
 ovmf                 1240a722f8466930cced7f7d40a3fb6a29efb146

Last test of basis   187487  2024-09-04 03:18:56 Z    0 days
Testing same since   187491  2024-09-04 10:44:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   1240a722f8..99d60cbd39  99d60cbd3990fe8f5b86eaab40876fbbf9d99084 -> xen-tested-master

