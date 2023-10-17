Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D17CC03B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618185.961540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh1J-0002Ql-8y; Tue, 17 Oct 2023 10:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618185.961540; Tue, 17 Oct 2023 10:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh1J-0002P1-6A; Tue, 17 Oct 2023 10:09:49 +0000
Received: by outflank-mailman (input) for mailman id 618185;
 Tue, 17 Oct 2023 10:09:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsh1H-0002OS-MF; Tue, 17 Oct 2023 10:09:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsh1H-0000Ws-KK; Tue, 17 Oct 2023 10:09:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsh1H-0006ZP-8N; Tue, 17 Oct 2023 10:09:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qsh1H-0002JH-7s; Tue, 17 Oct 2023 10:09:47 +0000
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
	bh=sMtfWElKLA2xRv/V9s7Msc/I0yn2yXVe2mIz6idZMPk=; b=VkP/RnwfC7frfno9iQLNCV/JlH
	7rp0NTKnoPtriv6f5V2NtcwbMCOWe6i/rKFiDayAE3yUD0Ttmbs6MXFloXKo7m+FdAMKTKtek59AZ
	Bz8YZbAHw2e5N26Geziy5iLjv+nha4lwLC6U7noCwHhrZBOG7KAmnuKWdJC4VbAQa/IA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183397-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183397: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=772ec92577a8c786b6c9f8643fa60f1cf893bcd9
X-Osstest-Versions-That:
    ovmf=a445e1a42ccf3cb9f70537c7cd80ece689bf4d9a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Oct 2023 10:09:47 +0000

flight 183397 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183397/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 772ec92577a8c786b6c9f8643fa60f1cf893bcd9
baseline version:
 ovmf                 a445e1a42ccf3cb9f70537c7cd80ece689bf4d9a

Last test of basis   183394  2023-10-17 03:11:04 Z    0 days
Testing same since   183397  2023-10-17 08:10:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tuan Phan <tphan@ventanamicro.com>

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
   a445e1a42c..772ec92577  772ec92577a8c786b6c9f8643fa60f1cf893bcd9 -> xen-tested-master

