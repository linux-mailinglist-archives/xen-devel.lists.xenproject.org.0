Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63EE364D14
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 23:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113211.215722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYbSV-0006gP-Ut; Mon, 19 Apr 2021 21:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113211.215722; Mon, 19 Apr 2021 21:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYbSV-0006fy-RO; Mon, 19 Apr 2021 21:29:31 +0000
Received: by outflank-mailman (input) for mailman id 113211;
 Mon, 19 Apr 2021 21:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSV-0006fq-1Y; Mon, 19 Apr 2021 21:29:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0002Pj-Pu; Mon, 19 Apr 2021 21:29:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0000dr-Hv; Mon, 19 Apr 2021 21:29:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0008Ay-HO; Mon, 19 Apr 2021 21:29:30 +0000
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
	bh=3CQadhMXX+zrzfUplCoASAkPOW2QYcBB9lb0gGz5WpM=; b=Qbc5xM8rT4vGjRY0+M/POiAjkV
	4xkkRoR/Ql5MigFTs6Kco4nnXalCXE/6WnT6/JUYhw2AXim3zRViC3dW/79zAd2jne8GjQp/1gJ7C
	4wZ6agRvE7mjqZFDMANBLn1pf2/C0P6ElkNiAkkQ4+2vzA2Wn/04oL2kypH2qeLbbc98=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161291-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161291: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c75a0720800e934c29aae75e3fb1cb42c0d0728
X-Osstest-Versions-That:
    ovmf=99e7e48cc7117c37fc1c08a741872d0875595796
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Apr 2021 21:29:30 +0000

flight 161291 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161291/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c75a0720800e934c29aae75e3fb1cb42c0d0728
baseline version:
 ovmf                 99e7e48cc7117c37fc1c08a741872d0875595796

Last test of basis   161204  2021-04-16 12:04:01 Z    3 days
Testing same since   161291  2021-04-19 13:43:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Gouly <joey.gouly@arm.com>

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
   99e7e48cc7..8c75a07208  8c75a0720800e934c29aae75e3fb1cb42c0d0728 -> xen-tested-master

