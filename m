Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95A37050A
	for <lists+xen-devel@lfdr.de>; Sat,  1 May 2021 04:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120835.228501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcfd1-0005ef-7C; Sat, 01 May 2021 02:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120835.228501; Sat, 01 May 2021 02:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcfd0-0005e5-WE; Sat, 01 May 2021 02:45:11 +0000
Received: by outflank-mailman (input) for mailman id 120835;
 Sat, 01 May 2021 02:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcfcz-0005dx-HZ; Sat, 01 May 2021 02:45:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcfcz-0002jC-AI; Sat, 01 May 2021 02:45:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lcfcz-0004DX-1u; Sat, 01 May 2021 02:45:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lcfcz-0004yV-1O; Sat, 01 May 2021 02:45:09 +0000
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
	bh=isxo26T2TxVneloRJfc6DCd5ki7MzZVkQxnJX8YPiYk=; b=5JIP7U3ySL/Cx1Ath3lWxxM6gp
	IVEVuWjzIL7zxiK31brT1SvGrnm1d1TzFX5rAMPaFSa6s8yeELxGxddLsDn8noRi5zidKfN55+igA
	NCzG1TLq2rutunEsN9tW76KCvKWqk1NNIFBkf+8Hjq707aBhMdDbccCxWnZgY4QkM7NU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161559-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161559: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1e6b0394d6c001802dc454ecff19076aaa80f51c
X-Osstest-Versions-That:
    ovmf=ab957f036f6711869283217227480b109aedc8ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 May 2021 02:45:09 +0000

flight 161559 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161559/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1e6b0394d6c001802dc454ecff19076aaa80f51c
baseline version:
 ovmf                 ab957f036f6711869283217227480b109aedc8ef

Last test of basis   161530  2021-04-29 20:10:02 Z    1 days
Testing same since   161559  2021-04-30 18:42:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Lendacky, Thomas <thomas.lendacky@amd.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   ab957f036f..1e6b0394d6  1e6b0394d6c001802dc454ecff19076aaa80f51c -> xen-tested-master

