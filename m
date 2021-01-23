Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A4301731
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 18:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73483.132405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3MhX-0000WK-1l; Sat, 23 Jan 2021 17:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73483.132405; Sat, 23 Jan 2021 17:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3MhW-0000Vs-Sh; Sat, 23 Jan 2021 17:27:54 +0000
Received: by outflank-mailman (input) for mailman id 73483;
 Sat, 23 Jan 2021 17:27:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3MhV-0000Vk-Ku; Sat, 23 Jan 2021 17:27:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3MhV-0003I6-EQ; Sat, 23 Jan 2021 17:27:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3MhV-0001Kz-4Y; Sat, 23 Jan 2021 17:27:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l3MhV-000249-44; Sat, 23 Jan 2021 17:27:53 +0000
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
	bh=neWgyzDltIrxQMHqawQg+I3wOjI4hA3/tJQLQs7AOf4=; b=V/H+JizhB58Yo/f6037zjwb30t
	Jn4TMgHjAuoYv6AoZom130C/3V5By47FGU3YF0ub7Yp9uONrImlgkUlpUhW/E1yLHP0aczg0010Ft
	rQDMLE4FLfGqnElyvR0FOiktXYO/7E9MSwTqE09so1ozjvAZ2mec719RqFcmCiMFC5a0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158585-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158585: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b769c5110384fb33bcfeddced80f721ec7838cc
X-Osstest-Versions-That:
    ovmf=6c5801be6ef36e35f0b4ff906a4c99d68ca6f69a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Jan 2021 17:27:53 +0000

flight 158585 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158585/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b769c5110384fb33bcfeddced80f721ec7838cc
baseline version:
 ovmf                 6c5801be6ef36e35f0b4ff906a4c99d68ca6f69a

Last test of basis   158566  2021-01-21 23:10:45 Z    1 days
Testing same since   158585  2021-01-23 01:06:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   6c5801be6e..3b769c5110  3b769c5110384fb33bcfeddced80f721ec7838cc -> xen-tested-master

