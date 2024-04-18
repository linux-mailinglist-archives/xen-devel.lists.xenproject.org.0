Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D658A8EE0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 00:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707788.1106046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDot-00070q-15; Wed, 17 Apr 2024 22:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707788.1106046; Wed, 17 Apr 2024 22:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDos-0006xv-Tt; Wed, 17 Apr 2024 22:31:58 +0000
Received: by outflank-mailman (input) for mailman id 707788;
 Wed, 17 Apr 2024 22:31:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxDor-0006xg-Qj; Wed, 17 Apr 2024 22:31:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxDor-0007sd-E1; Wed, 17 Apr 2024 22:31:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxDor-0003hk-56; Wed, 17 Apr 2024 22:31:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rxDor-0000ur-4Y; Wed, 17 Apr 2024 22:31:57 +0000
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
	bh=9GDs8A5xJwqX0+VnzgUp181bv+khM3njUN9JgGMs/KA=; b=BwTyZPJA0KLAYb4pVv3AlQ+jOB
	9stUcYNjMnLEbG4pQ2TwF5+1+OBRtHFqevQ2+dGX3S5pVe6vjJYAHxk3cR6RHQbXhoISwpXeaCsYU
	SSChpUL6KZa5tb+VV83Rs4uoX2uVZyEaWx6/9bA5aSmcmM12vvvOcgapK47jQrGjNCRc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185726-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185726: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0afb8743493853e30171f6000de51242e22a1eb8
X-Osstest-Versions-That:
    ovmf=6ced1e91eff13dae1bfba95734e2b34a73601db2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Apr 2024 22:31:57 +0000

flight 185726 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185726/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0afb8743493853e30171f6000de51242e22a1eb8
baseline version:
 ovmf                 6ced1e91eff13dae1bfba95734e2b34a73601db2

Last test of basis   185725  2024-04-17 18:43:01 Z    0 days
Testing same since   185726  2024-04-17 21:14:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   6ced1e91ef..0afb874349  0afb8743493853e30171f6000de51242e22a1eb8 -> xen-tested-master

