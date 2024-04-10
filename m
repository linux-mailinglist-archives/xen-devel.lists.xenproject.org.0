Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197F89E8CA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 06:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702905.1098564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruPV8-0001K9-KS; Wed, 10 Apr 2024 04:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702905.1098564; Wed, 10 Apr 2024 04:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruPV8-0001Ic-Hf; Wed, 10 Apr 2024 04:23:58 +0000
Received: by outflank-mailman (input) for mailman id 702905;
 Wed, 10 Apr 2024 04:23:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruPV7-0001I9-C6; Wed, 10 Apr 2024 04:23:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruPV7-000875-6U; Wed, 10 Apr 2024 04:23:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruPV6-0003tH-Tf; Wed, 10 Apr 2024 04:23:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ruPV6-00043i-T9; Wed, 10 Apr 2024 04:23:56 +0000
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
	bh=7qQvjfbnliNP0xg8FjcO45I5ilJuQF9Mod00EAEWm90=; b=E6hhi2OXLyBdSXvwpBM0b/bkDY
	WQ3Vgwi8lc5i1Zt9MOqd9LRVL55QXL+2UvTKVxbsQiBBHUN0sZymNVJkIL3DW+FTPlInUf1x7GRGw
	Tagi31iSsKa5/Ga7VFy67Kk1E1NOl1AEqiAWgs+OAI1u+F50ThRLAe0SwAiz31AD1euY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185293-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185293: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=963671d3801a6992d1aa06f05d86e32efa6b205e
X-Osstest-Versions-That:
    ovmf=665789b61bc39de67d3f17288bacb4662434e251
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Apr 2024 04:23:56 +0000

flight 185293 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185293/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 963671d3801a6992d1aa06f05d86e32efa6b205e
baseline version:
 ovmf                 665789b61bc39de67d3f17288bacb4662434e251

Last test of basis   185288  2024-04-09 17:45:00 Z    0 days
Testing same since   185293  2024-04-10 02:11:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  HoraceX Lien <horacex.lien@intel.com>

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
   665789b61b..963671d380  963671d3801a6992d1aa06f05d86e32efa6b205e -> xen-tested-master

