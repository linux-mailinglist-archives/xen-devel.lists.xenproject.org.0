Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960047D3FE9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 21:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621595.968200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv0K4-0003Ui-UM; Mon, 23 Oct 2023 19:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621595.968200; Mon, 23 Oct 2023 19:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv0K4-0003TR-Px; Mon, 23 Oct 2023 19:10:44 +0000
Received: by outflank-mailman (input) for mailman id 621595;
 Mon, 23 Oct 2023 19:10:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qv0K3-0003TH-Ry; Mon, 23 Oct 2023 19:10:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qv0K3-0000VB-On; Mon, 23 Oct 2023 19:10:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qv0K3-0004W4-7J; Mon, 23 Oct 2023 19:10:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qv0K3-00070F-6j; Mon, 23 Oct 2023 19:10:43 +0000
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
	bh=XZA2FMQBPF8fG7LGJTc+5Gtgeb2ife1DVnu3+I533iE=; b=fv2GBItlnG6q12bSJPGbLAPYmj
	84upAs1cHDPKQyBk61aWxTmXQVYA9kECHA2Uib4/tb/GZXfhV7wncVg795xIQRCDtNmCtvAwS/Ibt
	O9BXuFZvsFzI9DFY7M4f2aRKPoSsFB+QxHHPGh1xiQnfaKh/3Qa+qDmxgkZBKIx8Mqeo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183498-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183498: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ec7f73436646a9232c6494d1ce23fb38000e10d3
X-Osstest-Versions-That:
    ovmf=c591395f4ab5359c14e783481473685cf432fe75
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Oct 2023 19:10:43 +0000

flight 183498 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183498/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ec7f73436646a9232c6494d1ce23fb38000e10d3
baseline version:
 ovmf                 c591395f4ab5359c14e783481473685cf432fe75

Last test of basis   183445  2023-10-20 13:10:42 Z    3 days
Testing same since   183498  2023-10-23 17:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeshua Smith <jeshuas@nvidia.com>

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
   c591395f4a..ec7f734366  ec7f73436646a9232c6494d1ce23fb38000e10d3 -> xen-tested-master

