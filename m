Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69CC43845C
	for <lists+xen-devel@lfdr.de>; Sat, 23 Oct 2021 18:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215404.374565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meK9W-00025q-52; Sat, 23 Oct 2021 16:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215404.374565; Sat, 23 Oct 2021 16:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meK9W-00023n-1A; Sat, 23 Oct 2021 16:45:50 +0000
Received: by outflank-mailman (input) for mailman id 215404;
 Sat, 23 Oct 2021 16:45:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meK9V-00023d-4K; Sat, 23 Oct 2021 16:45:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meK9U-00039h-N4; Sat, 23 Oct 2021 16:45:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meK9U-0001k0-EU; Sat, 23 Oct 2021 16:45:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1meK9U-0003CV-E1; Sat, 23 Oct 2021 16:45:48 +0000
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
	bh=mauexZe821d7vK2UhzkS34IZ8IS6vM2t+j0LUA6k3ko=; b=vY6Be0nNpvCrMqfJkLViGmj/eP
	qVr26iPRK0mtuzxRWAYX5Jiq3fSrE8qJ7LXdnLciaMX/kDnqO6UyKm4SmR1v+bheDsimgeeUSIBMm
	wEAoJuQxXe3JHob44plAetba5LiLoe/7snaY6PmMJ+P2uJXYJrSOrtdHg24xyzALj5H0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165808-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165808: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=62540372230ecb5318a9c8a40580a14beeb9ded0
X-Osstest-Versions-That:
    ovmf=bd5ec03d87cacc5be2de4284b092aafd4ac4eb31
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Oct 2021 16:45:48 +0000

flight 165808 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165808/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 62540372230ecb5318a9c8a40580a14beeb9ded0
baseline version:
 ovmf                 bd5ec03d87cacc5be2de4284b092aafd4ac4eb31

Last test of basis   165767  2021-10-22 10:10:33 Z    1 days
Testing same since   165808  2021-10-23 08:42:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Moritz Fischer <moritzf@google.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>

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
   bd5ec03d87..6254037223  62540372230ecb5318a9c8a40580a14beeb9ded0 -> xen-tested-master

