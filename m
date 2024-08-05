Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4B947856
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:33:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771889.1182323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau5k-0006EL-Gf; Mon, 05 Aug 2024 09:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771889.1182323; Mon, 05 Aug 2024 09:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau5k-0006Cr-Dj; Mon, 05 Aug 2024 09:33:24 +0000
Received: by outflank-mailman (input) for mailman id 771889;
 Mon, 05 Aug 2024 09:33:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sau5i-0006Ch-LG; Mon, 05 Aug 2024 09:33:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sau5i-0004SV-KR; Mon, 05 Aug 2024 09:33:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sau5i-0000s6-4k; Mon, 05 Aug 2024 09:33:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sau5i-0007es-49; Mon, 05 Aug 2024 09:33:22 +0000
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
	bh=lgp9qejkhbN6RJFU09scK1CJclhtBXcQcfiYrfWFKJs=; b=Gq6zR/2ACKf5ZyH4du9wBtKp+M
	EPE/ukGVdf9uf2UAFPB/7iSMbmcX5yvIrKKw16tbv+JZQ0y2dN/GHO2lOq2CCLaEhpafDMcjLQ8+w
	CKBlbYg6+rcPjXfd1TiM3X3nFiHauYTv+CZShfjW7197Jyli9Vhv0pyYvkctdxClHrtk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187152: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5d43165ff8596c2fa07b7d4de3c482d64338ca99
X-Osstest-Versions-That:
    ovmf=68b4c4b481f3129132cd90c45d241990445f4a3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Aug 2024 09:33:22 +0000

flight 187152 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187152/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5d43165ff8596c2fa07b7d4de3c482d64338ca99
baseline version:
 ovmf                 68b4c4b481f3129132cd90c45d241990445f4a3a

Last test of basis   187151  2024-08-05 06:13:31 Z    0 days
Testing same since   187152  2024-08-05 08:15:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   68b4c4b481..5d43165ff8  5d43165ff8596c2fa07b7d4de3c482d64338ca99 -> xen-tested-master

