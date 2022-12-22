Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A1653C34
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 07:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468231.727290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8FAs-0001R9-Vy; Thu, 22 Dec 2022 06:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468231.727290; Thu, 22 Dec 2022 06:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8FAs-0001Ng-T5; Thu, 22 Dec 2022 06:35:26 +0000
Received: by outflank-mailman (input) for mailman id 468231;
 Thu, 22 Dec 2022 06:35:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8FAq-0001ND-SX; Thu, 22 Dec 2022 06:35:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8FAq-000346-NU; Thu, 22 Dec 2022 06:35:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8FAq-0008Id-6m; Thu, 22 Dec 2022 06:35:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8FAq-0005JE-6D; Thu, 22 Dec 2022 06:35:24 +0000
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
	bh=VfsmaumqncwU00h+v3a9PvWN24Y2C6aBP7xYzH+RZ4s=; b=k5j4BHCvgZJWMhxQrSrA01/49I
	nvxY8iiRfiREb+1WXr2rEm1qQyVOyqc04wMekVk8HqoPRrfe/KeIuAdanNFtOIMwVAUuX1WrLG6Ff
	q/NvgYaUbKe++Fkc1CMM/4kepSu9rzdHNZirIZ6T37Y1A69sb7jmcwZImVf9UICYpRns=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175448-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175448: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=129404f6e4395008ac0045e7e627edbba2a1e064
X-Osstest-Versions-That:
    ovmf=62031335bdbacc68253d43481477b9a468e0644e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 06:35:24 +0000

flight 175448 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175448/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 129404f6e4395008ac0045e7e627edbba2a1e064
baseline version:
 ovmf                 62031335bdbacc68253d43481477b9a468e0644e

Last test of basis   175444  2022-12-21 16:12:30 Z    0 days
Testing same since   175448  2022-12-22 01:42:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   62031335bd..129404f6e4  129404f6e4395008ac0045e7e627edbba2a1e064 -> xen-tested-master

