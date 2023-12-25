Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834081DEC0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Dec 2023 08:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659861.1029568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rHf1F-0003m1-EY; Mon, 25 Dec 2023 07:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659861.1029568; Mon, 25 Dec 2023 07:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rHf1F-0003j5-Bk; Mon, 25 Dec 2023 07:04:57 +0000
Received: by outflank-mailman (input) for mailman id 659861;
 Mon, 25 Dec 2023 07:04:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rHf1E-0003iv-H0; Mon, 25 Dec 2023 07:04:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rHf1E-0002bZ-7F; Mon, 25 Dec 2023 07:04:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rHf1D-0003sP-OA; Mon, 25 Dec 2023 07:04:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rHf1D-0005hB-NX; Mon, 25 Dec 2023 07:04:55 +0000
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
	bh=CLZnhn0XeY7rBcpj/4ETxjgaBCsA2D+sS1NFrkFuNYw=; b=jvMCDRmw+qBbEtaP/ZwOYmOTjR
	ZchACRKOarAz9eInKw45p3yOvQHxtEtqkBRjQW3a9BmiMZ1FMfGG5WYdRLmaXtQS33/25K/60h1GD
	4Dh2Mx9pdzq0snSHDeoKPU9hKDDQERN7DuxH5uF5R15RJiVf0/nWVuw6zZLX4OB6qEIg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184222-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184222: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1065536c64ab919ad5c207e50b82d4a88ac29ed8
X-Osstest-Versions-That:
    ovmf=d01defe06b35eb3fe9c94e7b2e08a8762873f924
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Dec 2023 07:04:55 +0000

flight 184222 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184222/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1065536c64ab919ad5c207e50b82d4a88ac29ed8
baseline version:
 ovmf                 d01defe06b35eb3fe9c94e7b2e08a8762873f924

Last test of basis   184210  2023-12-22 09:12:48 Z    2 days
Testing same since   184222  2023-12-25 05:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cheng Sun <chengx.sun@intel.com>

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
   d01defe06b..1065536c64  1065536c64ab919ad5c207e50b82d4a88ac29ed8 -> xen-tested-master

