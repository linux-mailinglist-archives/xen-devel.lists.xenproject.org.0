Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256B966F57
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 07:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787098.1196747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skGHY-0007CE-ND; Sat, 31 Aug 2024 05:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787098.1196747; Sat, 31 Aug 2024 05:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skGHY-0007A8-Jo; Sat, 31 Aug 2024 05:04:16 +0000
Received: by outflank-mailman (input) for mailman id 787098;
 Sat, 31 Aug 2024 05:04:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skGHW-00079B-Hm; Sat, 31 Aug 2024 05:04:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skGHW-0008Ff-35; Sat, 31 Aug 2024 05:04:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skGHV-0006wX-Aa; Sat, 31 Aug 2024 05:04:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skGHV-0004yE-A1; Sat, 31 Aug 2024 05:04:13 +0000
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
	bh=Yb5n3s4Bz8Bt+UG5np0m1r+kzbvSaYQTTkRbHX+JVVI=; b=N/ktWrJ5CnDrFUF+MgljD7KEi0
	92L82Sat859Le51aXrhVagq3q2PinxwN+5JNQ8/4JHqRzq034kdm6FmvUpKEe21zyn0104UG8eyPi
	+D7T+coefZhKM6m4plbhtkWsDi+Cs2NGdY48BvCdbvVCDMCgk1K3uAGutaOh0YnIM5xw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187432-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187432: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=90d861f63d0fe467cec9659703f02d3d32969dc3
X-Osstest-Versions-That:
    ovmf=5c63e22a9fe268bdfa18d49419cbf43d4ec65b93
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 05:04:13 +0000

flight 187432 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187432/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 90d861f63d0fe467cec9659703f02d3d32969dc3
baseline version:
 ovmf                 5c63e22a9fe268bdfa18d49419cbf43d4ec65b93

Last test of basis   187430  2024-08-31 01:11:30 Z    0 days
Testing same since   187432  2024-08-31 03:19:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   5c63e22a9f..90d861f63d  90d861f63d0fe467cec9659703f02d3d32969dc3 -> xen-tested-master

