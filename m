Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE0653D2F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468300.727377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8HMr-0002Qz-BY; Thu, 22 Dec 2022 08:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468300.727377; Thu, 22 Dec 2022 08:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8HMr-0002NQ-8C; Thu, 22 Dec 2022 08:55:57 +0000
Received: by outflank-mailman (input) for mailman id 468300;
 Thu, 22 Dec 2022 08:55:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8HMp-0002N0-Gi; Thu, 22 Dec 2022 08:55:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8HMp-0006ue-F4; Thu, 22 Dec 2022 08:55:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8HMp-0004wH-51; Thu, 22 Dec 2022 08:55:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8HMp-0001R4-4d; Thu, 22 Dec 2022 08:55:55 +0000
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
	bh=9aFQdxW3yeNBrgutGZmSsk7j7Qm+LrUAXN1mA5l1q3E=; b=zkiahlI8X2G70XK1clwVwilSyI
	FH6IXEDWvOF4ilXlZCv2UD2KRzYHj2HRXDIIU/ZCS3xjvUV95Io5qXX4EV9ztP+VfUkSTk/MUJtIz
	b2iFrIATrsOjO+4GLfnRXjGs1M9nfNmwIuGInRhefz+01yzpJoPyaHL+BEgmxCGsnuEU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175452-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175452: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ec87305f90d90096aac2a4d91e3f6556e2ecd6b9
X-Osstest-Versions-That:
    ovmf=129404f6e4395008ac0045e7e627edbba2a1e064
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 08:55:55 +0000

flight 175452 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175452/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ec87305f90d90096aac2a4d91e3f6556e2ecd6b9
baseline version:
 ovmf                 129404f6e4395008ac0045e7e627edbba2a1e064

Last test of basis   175448  2022-12-22 01:42:28 Z    0 days
Testing same since   175452  2022-12-22 07:10:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

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
   129404f6e4..ec87305f90  ec87305f90d90096aac2a4d91e3f6556e2ecd6b9 -> xen-tested-master

