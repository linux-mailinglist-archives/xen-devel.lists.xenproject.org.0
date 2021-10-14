Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40F42DECC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 18:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209493.365970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3AM-0007xy-Gs; Thu, 14 Oct 2021 16:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209493.365970; Thu, 14 Oct 2021 16:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3AM-0007vc-D2; Thu, 14 Oct 2021 16:01:10 +0000
Received: by outflank-mailman (input) for mailman id 209493;
 Thu, 14 Oct 2021 16:01:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mb3AL-0007vS-3K; Thu, 14 Oct 2021 16:01:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mb3AK-0004AM-Uu; Thu, 14 Oct 2021 16:01:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mb3AK-0007Q7-ND; Thu, 14 Oct 2021 16:01:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mb3AK-0000Bx-MR; Thu, 14 Oct 2021 16:01:08 +0000
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
	bh=Tg/bXOR3Quy1WKtWhbgLdhOcYej3KuxggLuu/KQtfxg=; b=ttPFxejdE8Jg3KY8M6DGgCkrt7
	jgc7GSYcHlCORpE8qhqWl3LP17BGs3o2vBBRhYqv7FGDDpN4uROmd0xZwMiDXoTw6xnLlJhCTjObL
	3I7bue6Y4K4+oUaxEp3/V/PQQT75e1Kt9IlVxqt2Hmftuugulr562In/Cm/yXHDJQYqw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165508-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165508: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=785cfd33053f506d4a1c17100356a63f24e98f45
X-Osstest-Versions-That:
    ovmf=e0c23cba5eaeb6c934a10ecdabcb235ef5d63799
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Oct 2021 16:01:08 +0000

flight 165508 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165508/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 785cfd33053f506d4a1c17100356a63f24e98f45
baseline version:
 ovmf                 e0c23cba5eaeb6c934a10ecdabcb235ef5d63799

Last test of basis   165505  2021-10-14 07:10:13 Z    0 days
Testing same since   165508  2021-10-14 12:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   e0c23cba5e..785cfd3305  785cfd33053f506d4a1c17100356a63f24e98f45 -> xen-tested-master

