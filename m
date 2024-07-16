Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3C9326DE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 14:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759608.1169277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sThcQ-0008UK-Il; Tue, 16 Jul 2024 12:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759608.1169277; Tue, 16 Jul 2024 12:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sThcQ-0008SM-Fe; Tue, 16 Jul 2024 12:49:22 +0000
Received: by outflank-mailman (input) for mailman id 759608;
 Tue, 16 Jul 2024 12:49:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sThcP-0008SC-I2; Tue, 16 Jul 2024 12:49:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sThcP-0005jj-Ej; Tue, 16 Jul 2024 12:49:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sThcP-0008Vu-0h; Tue, 16 Jul 2024 12:49:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sThcP-0006n4-0I; Tue, 16 Jul 2024 12:49:21 +0000
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
	bh=UELaYYHXfSN6wInGGsKHBegxDAGQVuG5edSCij851Ao=; b=TqxZqusmtpj9Hw6OXLKKZ8VXOa
	0w/TEiDL1JjB8Qqdhsnps/C0FNPmx2ojNo/Z4eYYxD46LmrwZ+Cn7XQQxeLf5HFDprIF3ZF7z47l9
	HLSjcnPMvX89MSlqB2saKpSnG5U/h+nZWnghs2aPPDCjYcqlX4dLPRaWWFNeRCVmzwV4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186817-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186817: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f9c373c8388f819166e57365197bc423d56209a6
X-Osstest-Versions-That:
    ovmf=1bb9f47739ae7993191a36bea76c5a2157fdd10f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jul 2024 12:49:21 +0000

flight 186817 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186817/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f9c373c8388f819166e57365197bc423d56209a6
baseline version:
 ovmf                 1bb9f47739ae7993191a36bea76c5a2157fdd10f

Last test of basis   186813  2024-07-16 04:13:00 Z    0 days
Testing same since   186817  2024-07-16 10:12:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mario Bălănică <mariobalanica02@gmail.com>

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
   1bb9f47739..f9c373c838  f9c373c8388f819166e57365197bc423d56209a6 -> xen-tested-master

