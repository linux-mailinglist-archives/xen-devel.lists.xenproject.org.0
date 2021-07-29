Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DD3D9B1D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 03:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161803.296939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8uz9-0006cd-Em; Thu, 29 Jul 2021 01:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161803.296939; Thu, 29 Jul 2021 01:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8uz9-0006ad-8S; Thu, 29 Jul 2021 01:37:19 +0000
Received: by outflank-mailman (input) for mailman id 161803;
 Thu, 29 Jul 2021 01:37:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8uz7-0006aT-K9; Thu, 29 Jul 2021 01:37:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8uz7-0003Wj-CM; Thu, 29 Jul 2021 01:37:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m8uz6-0007Q5-TX; Thu, 29 Jul 2021 01:37:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m8uz6-0006Xi-Re; Thu, 29 Jul 2021 01:37:16 +0000
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
	bh=hJHc7vM7fcaxfG1sc7hkoPWAyGTWb8jUExX4tNTlduE=; b=P9F7mec0+0NxgoU8cLw0kq9if9
	2I7qc/VAjrAI65ymTjCIdOenM13BpzupdRDbmbfCIPxrdFctHeVzRuUs3GHwerqYys/ovAdQa7NOS
	tjyuOCAfGIa7nauqWi4VS3UUXVItaJCGSpu/+qbnP3o2MXTXDDat6+OSvcDCaulhd5gA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164025-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164025: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ab796d3e2ab41bde3a0bdd932cdcd09fd641e00c
X-Osstest-Versions-That:
    ovmf=147f34b56ce0e2e18285ef7d0695753ac0aa5085
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Jul 2021 01:37:16 +0000

flight 164025 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164025/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ab796d3e2ab41bde3a0bdd932cdcd09fd641e00c
baseline version:
 ovmf                 147f34b56ce0e2e18285ef7d0695753ac0aa5085

Last test of basis   164020  2021-07-28 07:01:53 Z    0 days
Testing same since   164025  2021-07-28 16:42:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Zachary Clark-Williams <zachary.clark-williams@intel.com>

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
   147f34b56c..ab796d3e2a  ab796d3e2ab41bde3a0bdd932cdcd09fd641e00c -> xen-tested-master

