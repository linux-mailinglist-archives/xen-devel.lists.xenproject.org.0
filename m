Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B49C2E085C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 10:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57703.101047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krePr-0006Z7-4B; Tue, 22 Dec 2020 09:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57703.101047; Tue, 22 Dec 2020 09:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krePq-0006YV-VZ; Tue, 22 Dec 2020 09:57:14 +0000
Received: by outflank-mailman (input) for mailman id 57703;
 Tue, 22 Dec 2020 09:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krePp-0006YN-2V; Tue, 22 Dec 2020 09:57:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krePo-0001ZR-U6; Tue, 22 Dec 2020 09:57:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krePo-0001Mu-OE; Tue, 22 Dec 2020 09:57:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krePo-00034T-Nj; Tue, 22 Dec 2020 09:57:12 +0000
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
	bh=4Pk2lWbzSWg4LUgsO1rISuEHtYzThJ7wuTiRPl0OkS8=; b=0jCRfcaF0AE3P0UoDXWMei6dyg
	uvQnsI7TQSCbSF4XwU1faPanssTMPvUB0g1dlGme+8WwlNyvd/dIDhCfzyL13+ImjjWagTZ8nUpfm
	YAHFA0txh1LKBlr7E7gB/nMNcSrHkYLY8aMZ9FvgiAqML4miXdRKyKv04BTOxOX6lnRY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157778-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157778: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=35ed29f207fd9c3683cfee5492c5c4e96ee0a0eb
X-Osstest-Versions-That:
    ovmf=3ce3274a5ea41134fafb983c0198de89007d471e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Dec 2020 09:57:12 +0000

flight 157778 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157778/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 35ed29f207fd9c3683cfee5492c5c4e96ee0a0eb
baseline version:
 ovmf                 3ce3274a5ea41134fafb983c0198de89007d471e

Last test of basis   157759  2020-12-21 14:39:51 Z    0 days
Testing same since   157778  2020-12-21 22:42:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>

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
   3ce3274a5e..35ed29f207  35ed29f207fd9c3683cfee5492c5c4e96ee0a0eb -> xen-tested-master

