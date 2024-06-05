Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E902E8FD15A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 17:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735788.1141906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsBW-0004iZ-Me; Wed, 05 Jun 2024 15:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735788.1141906; Wed, 05 Jun 2024 15:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsBW-0004gA-Im; Wed, 05 Jun 2024 15:04:18 +0000
Received: by outflank-mailman (input) for mailman id 735788;
 Wed, 05 Jun 2024 15:04:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEsBV-0004g0-Jw; Wed, 05 Jun 2024 15:04:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEsBV-00018I-Hx; Wed, 05 Jun 2024 15:04:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEsBV-0006nR-8E; Wed, 05 Jun 2024 15:04:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEsBV-0000Ta-7h; Wed, 05 Jun 2024 15:04:17 +0000
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
	bh=1602y+2XO99ixOcngECfS9OVdP+1o0b+JwbIw/lbzig=; b=IAb749DktGDGsNLMRwj5PkKsaL
	xVIp3PqmuBwiOCM9dU7NUN+IaomwL/mS4ymBTCnX0n+ApiT4VcrtkFvoc7Cddfyi367etM8dVZwuP
	IBl33XY8Xr42eGP2oVjvXH4gRLXLlUQEMZhTYRiasYvH190R2ymQ5qSmwzpBYYwCQ8gI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186256-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186256: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=10cd8b45ce36152996bcb1520ba36107a8cdc63f
X-Osstest-Versions-That:
    ovmf=e2e09d8512898709a3d076fdd36c8abee2734027
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jun 2024 15:04:17 +0000

flight 186256 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186256/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 10cd8b45ce36152996bcb1520ba36107a8cdc63f
baseline version:
 ovmf                 e2e09d8512898709a3d076fdd36c8abee2734027

Last test of basis   186254  2024-06-05 03:41:14 Z    0 days
Testing same since   186256  2024-06-05 12:44:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Neo Hsueh <Hong-Chih.Hsueh@amd.com>

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
   e2e09d8512..10cd8b45ce  10cd8b45ce36152996bcb1520ba36107a8cdc63f -> xen-tested-master

