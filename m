Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E0695792
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 04:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494947.765169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRmGl-0005xV-SB; Tue, 14 Feb 2023 03:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494947.765169; Tue, 14 Feb 2023 03:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRmGl-0005v1-PG; Tue, 14 Feb 2023 03:46:15 +0000
Received: by outflank-mailman (input) for mailman id 494947;
 Tue, 14 Feb 2023 03:46:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRmGk-0005ur-6W; Tue, 14 Feb 2023 03:46:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRmGk-00026Z-4F; Tue, 14 Feb 2023 03:46:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRmGj-0008WL-Cg; Tue, 14 Feb 2023 03:46:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pRmGj-00070q-CF; Tue, 14 Feb 2023 03:46:13 +0000
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
	bh=n1/gV9f91HlswBmcf2Jow+gJnOyXTSc+h1fjQ2ZWmFo=; b=7GDsnjGcujGsugBspeOxqasB29
	N4LDLNsRRXbN1u9+JLX58BItpyKWW2/7xyyzkLIAcc+VbLheQJXDf+22hMxJT18fXbKqfLoIIkFAx
	33i1f6XdcDJdIIXIEargTN41DdRZXX1M0vNn5UumNV2A7/jzxm4bQ+R+l3qi9C9C3gkU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177223-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177223: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b3f321f2d7871868951cf73edb8fa4d5a88854a5
X-Osstest-Versions-That:
    ovmf=93a21b465bda44cecdd6347ad481ca6f55286547
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Feb 2023 03:46:13 +0000

flight 177223 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177223/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b3f321f2d7871868951cf73edb8fa4d5a88854a5
baseline version:
 ovmf                 93a21b465bda44cecdd6347ad481ca6f55286547

Last test of basis   176815  2023-02-10 04:16:45 Z    3 days
Testing same since   177223  2023-02-14 00:11:46 Z    0 days    1 attempts

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
   93a21b465b..b3f321f2d7  b3f321f2d7871868951cf73edb8fa4d5a88854a5 -> xen-tested-master

