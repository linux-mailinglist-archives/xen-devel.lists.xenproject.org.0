Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D378A6A07
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 13:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706914.1104359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwhQm-0004An-JE; Tue, 16 Apr 2024 11:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706914.1104359; Tue, 16 Apr 2024 11:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwhQm-00048U-Fv; Tue, 16 Apr 2024 11:56:56 +0000
Received: by outflank-mailman (input) for mailman id 706914;
 Tue, 16 Apr 2024 11:56:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwhQk-00048I-RZ; Tue, 16 Apr 2024 11:56:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwhQk-0000Av-KH; Tue, 16 Apr 2024 11:56:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwhQk-0004Su-BL; Tue, 16 Apr 2024 11:56:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwhQk-0001cl-As; Tue, 16 Apr 2024 11:56:54 +0000
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
	bh=wUT+rwkY2sjHWhJ5VJ8PIa+beJxFniVYHNMiuoP1mwM=; b=SduzRzE/WHl9CMKN0UbcLAK8ue
	I2Uoirl1+ZDwmmJF/lcFcITsZ498rzo9VxahSoGVsCN3WDFGc3hndNmaC2qKAOSIqV6VseH09h1sR
	xDVPS/GW+rkSywo/JzzzKO7h2YZqUEMsDkW0oVqyvw8W62xIp9yj9p8/D/k30IlVztqE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185658-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185658: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b6cd5ddce9ade43e4215836f12b43ebbb90eecf2
X-Osstest-Versions-That:
    ovmf=6363872629cd58636128824977e56eea15b97a15
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2024 11:56:54 +0000

flight 185658 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185658/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b6cd5ddce9ade43e4215836f12b43ebbb90eecf2
baseline version:
 ovmf                 6363872629cd58636128824977e56eea15b97a15

Last test of basis   185649  2024-04-16 07:49:16 Z    0 days
Testing same since   185658  2024-04-16 09:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cindy Kuo <cindyx.kuo@intel.com>
  CindyX Kuo <cindyx.kuo@intel.com>
  Jason Lou <yun.lou@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>

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
   6363872629..b6cd5ddce9  b6cd5ddce9ade43e4215836f12b43ebbb90eecf2 -> xen-tested-master

