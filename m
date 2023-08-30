Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07778D4FC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 11:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592818.925655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbHye-0000Cj-AO; Wed, 30 Aug 2023 09:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592818.925655; Wed, 30 Aug 2023 09:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbHye-00009m-6t; Wed, 30 Aug 2023 09:59:08 +0000
Received: by outflank-mailman (input) for mailman id 592818;
 Wed, 30 Aug 2023 09:59:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbHyd-00009c-59; Wed, 30 Aug 2023 09:59:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbHyc-0000A7-U1; Wed, 30 Aug 2023 09:59:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbHyc-0008Ow-Hn; Wed, 30 Aug 2023 09:59:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbHyc-0002r3-HG; Wed, 30 Aug 2023 09:59:06 +0000
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
	bh=EZnZ6XtrA/Ps7EP/MTRjubcFAiAHnj2iQIUrRfdYvJ8=; b=MQEeKwAvaMFwVudrnwtOzfClpS
	+Xz8xMG9YqFqf+kIUcJDaURU3sdt+S7M6YZVXO1pzdy0Iy4/JSVyRRu5jsEZwftqJMkTrPTW3S+tR
	2dVp1mo7ADNJQCaJu1Zs1BtaEh7weYrkpF/ZYQ4RXIpcXSTtI7g7Crlev0D1rv0urbv0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182564-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182564: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5f46eb2307dd6d4ea163b6899ded81e795780059
X-Osstest-Versions-That:
    ovmf=9896a9c61836a5afba72c47d7c64f4e24f0805ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 09:59:06 +0000

flight 182564 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182564/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5f46eb2307dd6d4ea163b6899ded81e795780059
baseline version:
 ovmf                 9896a9c61836a5afba72c47d7c64f4e24f0805ba

Last test of basis   182560  2023-08-30 00:13:12 Z    0 days
Testing same since   182564  2023-08-30 06:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   9896a9c618..5f46eb2307  5f46eb2307dd6d4ea163b6899ded81e795780059 -> xen-tested-master

