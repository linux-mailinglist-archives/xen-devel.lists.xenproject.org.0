Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392822E1CBB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 14:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58369.102562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Ro-0007Qc-PM; Wed, 23 Dec 2020 13:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58369.102562; Wed, 23 Dec 2020 13:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Ro-0007QB-KD; Wed, 23 Dec 2020 13:45:00 +0000
Received: by outflank-mailman (input) for mailman id 58369;
 Wed, 23 Dec 2020 13:44:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks4Rm-0007Q2-QD; Wed, 23 Dec 2020 13:44:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks4Rm-0007St-JQ; Wed, 23 Dec 2020 13:44:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks4Rm-0001nE-CS; Wed, 23 Dec 2020 13:44:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ks4Rm-0000du-Bz; Wed, 23 Dec 2020 13:44:58 +0000
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
	bh=mDpyedJtM8glQu93LSIQkpra6kkzmgeGfeE5fUHpEFc=; b=laUCozbI62S5ukILQOSB22S0Ai
	ISpszq5ySpvCytur+VXhTbJ1Wch9OPgjOkoPRnSCpr/BVS6+JB9Oo7t08y6V9Jer+UlHn+kERzdUw
	D5zoJ8PhS879RZcBdtZ7xlHuX95u+UgcRGF27G+wJUlVQ5muPtg8fExDaGm1fuDIKYHE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157848-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157848: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d15d0d3d8aee1c7d5dab7b636601370061b32612
X-Osstest-Versions-That:
    ovmf=d21d2706761bede7db38929abc5613f3e71c64ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Dec 2020 13:44:58 +0000

flight 157848 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157848/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d15d0d3d8aee1c7d5dab7b636601370061b32612
baseline version:
 ovmf                 d21d2706761bede7db38929abc5613f3e71c64ba

Last test of basis   157840  2020-12-22 22:40:48 Z    0 days
Testing same since   157848  2020-12-23 07:52:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   d21d270676..d15d0d3d8a  d15d0d3d8aee1c7d5dab7b636601370061b32612 -> xen-tested-master

