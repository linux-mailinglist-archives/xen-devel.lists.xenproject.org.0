Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCD84C003
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 23:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677163.1053567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXTv7-0005ns-Lu; Tue, 06 Feb 2024 22:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677163.1053567; Tue, 06 Feb 2024 22:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXTv7-0005lK-J9; Tue, 06 Feb 2024 22:28:01 +0000
Received: by outflank-mailman (input) for mailman id 677163;
 Tue, 06 Feb 2024 22:27:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXTv5-0005ku-Hz; Tue, 06 Feb 2024 22:27:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXTv5-0006E9-4X; Tue, 06 Feb 2024 22:27:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXTv4-0002R2-QZ; Tue, 06 Feb 2024 22:27:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXTv4-0000bp-QB; Tue, 06 Feb 2024 22:27:58 +0000
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
	bh=h+fFBobaNqhpYBCEiAERX2l6oNHBrK69TJkuM5o9GbY=; b=WVA0BxldEoxTR7fHVF0zkw01cK
	CsfrHfLkZx/4X5ogYEEQMPML02jiqmBf+8Bd7WlwNevbor/8zhvWm7erHX/yiRkY4rDLbtZP9P0PI
	1j2dyAdL6oUXRLdo5/kY/iyclE2He7dAjiVFIVEeDbg8P3b/IaYV9eyWLOwIfje1Noh8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184609-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184609: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1d0b95f6457d225c5108302a9da74b4ed7aa5a38
X-Osstest-Versions-That:
    ovmf=62b43ec8960372abed59c1e1d596c2b324340a07
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Feb 2024 22:27:58 +0000

flight 184609 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184609/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1d0b95f6457d225c5108302a9da74b4ed7aa5a38
baseline version:
 ovmf                 62b43ec8960372abed59c1e1d596c2b324340a07

Last test of basis   184607  2024-02-06 16:14:43 Z    0 days
Testing same since   184609  2024-02-06 20:43:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Doug Flick <dougflick@microsoft.com>
  Doug Flick [MSFT] <doug.edk2@gmail.com>
  Doug Flick via groups.io <dougflick=microsoft.com@groups.io>
  Zhi Jin <zhi.jin@intel.com>

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
   62b43ec896..1d0b95f645  1d0b95f6457d225c5108302a9da74b4ed7aa5a38 -> xen-tested-master

