Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B378BDF0D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 11:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717955.1120456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4HXe-0000Yt-C4; Tue, 07 May 2024 09:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717955.1120456; Tue, 07 May 2024 09:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4HXe-0000W2-8s; Tue, 07 May 2024 09:55:22 +0000
Received: by outflank-mailman (input) for mailman id 717955;
 Tue, 07 May 2024 09:55:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4HXc-0000Vs-AE; Tue, 07 May 2024 09:55:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4HXc-0002xk-0U; Tue, 07 May 2024 09:55:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4HXb-0006fL-JS; Tue, 07 May 2024 09:55:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s4HXb-00065a-Iu; Tue, 07 May 2024 09:55:19 +0000
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
	bh=c+mP6+gJUNEZM2XGvpaxqGKSllbgtdnCJ9UMpdx/0ug=; b=6mK+6B3vrIIio9bUeFgMqLjsvk
	b4nu9Ko23akuH9AyWeHVlyFotAzKNCfZuYgwLGB/FCuAtts2fuPo/lxDg0Iowk7i6OgeR5gnziXpI
	Dxzh0TFEdMrsciyxuhz3JTowdomfK8e6bOxWzjpuSUHbj+iyknOq1Uhq0nlwBZAqoSX4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185937-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185937: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=987bea6525d70cd01649472c93d19f89d41d83a2
X-Osstest-Versions-That:
    ovmf=1c0d4ae2c0fd24164873947c2e262c499ecf13b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 May 2024 09:55:19 +0000

flight 185937 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185937/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 987bea6525d70cd01649472c93d19f89d41d83a2
baseline version:
 ovmf                 1c0d4ae2c0fd24164873947c2e262c499ecf13b5

Last test of basis   185935  2024-05-07 05:12:56 Z    0 days
Testing same since   185937  2024-05-07 07:43:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>
  Ray Ni <ray.ni@intel.com>

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
   1c0d4ae2c0..987bea6525  987bea6525d70cd01649472c93d19f89d41d83a2 -> xen-tested-master

