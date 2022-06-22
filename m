Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193E556EA3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 00:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354366.581449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o493i-0005Si-0E; Wed, 22 Jun 2022 22:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354366.581449; Wed, 22 Jun 2022 22:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o493h-0005Qp-Sm; Wed, 22 Jun 2022 22:42:49 +0000
Received: by outflank-mailman (input) for mailman id 354366;
 Wed, 22 Jun 2022 22:42:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o493g-0005Qf-8q; Wed, 22 Jun 2022 22:42:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o493g-0006wz-4P; Wed, 22 Jun 2022 22:42:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o493f-0002gK-SK; Wed, 22 Jun 2022 22:42:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o493f-00039y-Rt; Wed, 22 Jun 2022 22:42:47 +0000
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
	bh=Igj+Zjr3bavBS5CZvftaFCeEB2YSdKyUTIMdE0tmweM=; b=LXAJvveu+iyaVwb5v+39f0/Rxc
	IVWp9UmrkjnjdKLJqjSVm2PawL57qkzeNVu3yMDA8J3euKmyd1IguikMj6aQKB9xzntakB55JQDxQ
	HOBSMpyFHM9nIlOjI8bHViUyWMC00nDoHmBvIhqOHSfWKTNaMxD7nfXbpTb6NBpDMgZs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171315-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171315: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c
X-Osstest-Versions-That:
    ovmf=3930d1791a0657a422d50f4d2e2d2683c36e34b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jun 2022 22:42:47 +0000

flight 171315 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171315/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c
baseline version:
 ovmf                 3930d1791a0657a422d50f4d2e2d2683c36e34b8

Last test of basis   171311  2022-06-22 15:11:57 Z    0 days
Testing same since   171315  2022-06-22 20:13:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Nicolas Ojeda Leon <ncoleon@amazon.com>
  Thomas Abraham <thomas.abraham@arm.com>

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
   3930d1791a..f304308e1c  f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c -> xen-tested-master

