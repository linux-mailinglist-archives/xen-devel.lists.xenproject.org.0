Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23D6D3539
	for <lists+xen-devel@lfdr.de>; Sun,  2 Apr 2023 04:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517214.802335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pinEv-0000Hk-DI; Sun, 02 Apr 2023 02:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517214.802335; Sun, 02 Apr 2023 02:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pinEv-0000Fp-5I; Sun, 02 Apr 2023 02:14:41 +0000
Received: by outflank-mailman (input) for mailman id 517214;
 Sun, 02 Apr 2023 02:14:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pinEu-0000Ff-0z; Sun, 02 Apr 2023 02:14:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pinEt-0007lI-VA; Sun, 02 Apr 2023 02:14:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pinEs-0004MT-F4; Sun, 02 Apr 2023 02:14:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pinEs-0005Jp-Ec; Sun, 02 Apr 2023 02:14:38 +0000
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
	bh=i8Wpk8p17rn95gd+WONfEn5dMxOgMOWe7FZT2WMcxAc=; b=NG9KiuJwO+azkk3QNFLkvFNPLj
	6eu3VCATJIVP7zhOkRBYPzKFm9BNnWABH/sz5esOSRwk0yHgo+Pwca1e0UL7uqmABTNzft/RabNGY
	HikzGaVM+KYEyRFQUU4rwS2vySjkJtfPhgHNbVZM5NogZIKs/dMNY+AnY4FE/3t/QXDk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180108: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ca4d2b9df27f9c58009d623678ac911c544d36c
X-Osstest-Versions-That:
    ovmf=67a6f414aa0e2a9cac965fcc6d83b6cbd6e893c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Apr 2023 02:14:38 +0000

flight 180108 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ca4d2b9df27f9c58009d623678ac911c544d36c
baseline version:
 ovmf                 67a6f414aa0e2a9cac965fcc6d83b6cbd6e893c0

Last test of basis   180101  2023-04-01 03:35:21 Z    0 days
Testing same since   180108  2023-04-01 23:42:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Marvin Häuser <mhaeuser@posteo.de>
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
   67a6f414aa..4ca4d2b9df  4ca4d2b9df27f9c58009d623678ac911c544d36c -> xen-tested-master

