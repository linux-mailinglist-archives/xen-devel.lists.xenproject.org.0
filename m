Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB899868814
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 04:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685866.1067272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reoVd-00005w-BO; Tue, 27 Feb 2024 03:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685866.1067272; Tue, 27 Feb 2024 03:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reoVd-0008Vy-8a; Tue, 27 Feb 2024 03:52:01 +0000
Received: by outflank-mailman (input) for mailman id 685866;
 Tue, 27 Feb 2024 03:51:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reoVb-0008Vo-8T; Tue, 27 Feb 2024 03:51:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reoVb-00056L-3Q; Tue, 27 Feb 2024 03:51:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reoVa-0007RX-QR; Tue, 27 Feb 2024 03:51:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1reoVa-0006Re-Py; Tue, 27 Feb 2024 03:51:58 +0000
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
	bh=vNonQWisEAKDprxHaSscN8OUaWN8WbOS7Noz/yA5CpU=; b=CsdoCZO3M6xZNisnbiJuP/LSVW
	nMYBFvubeRbCBnMxdLFLAOmqDQ1TY+Ad2Dy/UKUYrV8igMCwvAkPCxFDYKU2Ce/W+Ehn141Dvkq6m
	pQe1EFgCbEtCveXyOda0QeTit4rmT0xlFeKvi7GYv697bc/GpI1Qb8BrsDC/QvRvglOo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184777-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184777: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=33c81c25bbd55141ad395af89160b4ed4b703cdf
X-Osstest-Versions-That:
    ovmf=d25421d0d8cd2493b30215ef80d2424ecb19c870
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Feb 2024 03:51:58 +0000

flight 184777 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184777/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 33c81c25bbd55141ad395af89160b4ed4b703cdf
baseline version:
 ovmf                 d25421d0d8cd2493b30215ef80d2424ecb19c870

Last test of basis   184775  2024-02-26 22:43:02 Z    0 days
Testing same since   184777  2024-02-27 01:11:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   d25421d0d8..33c81c25bb  33c81c25bbd55141ad395af89160b4ed4b703cdf -> xen-tested-master

