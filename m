Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA556C1386
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511923.791374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFg8-0006S7-ML; Mon, 20 Mar 2023 13:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511923.791374; Mon, 20 Mar 2023 13:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFg8-0006Pg-II; Mon, 20 Mar 2023 13:36:00 +0000
Received: by outflank-mailman (input) for mailman id 511923;
 Mon, 20 Mar 2023 13:35:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peFg7-0006PB-Aw; Mon, 20 Mar 2023 13:35:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peFg7-0004AI-8t; Mon, 20 Mar 2023 13:35:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peFg6-0005XL-VQ; Mon, 20 Mar 2023 13:35:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1peFg6-0002T6-Uv; Mon, 20 Mar 2023 13:35:58 +0000
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
	bh=GbKNROGYAKlxQ2l4gAwrNRiUUJgji61SG9W8CybnHK8=; b=oJ7E6wI86NdwkiTVAlETLK0AJa
	igc2dUTbHB2SaB//Duw/anwGW9fqPQVWJHemmwZVyOVL0aWg18/cAqH9/9KticjdomFqIIYClKhOo
	1egyJC7IkZ968Mv7Ss2lTVlb2ZIHjp66R5REJcHFpXLz5IFOnB2wd4BefjLDMoUz6Bcg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179808-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179808: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b7a8264ae4704f781e70cc44dafdf07e4e5e690a
X-Osstest-Versions-That:
    ovmf=b17a3a133b18fb41493fba7d86e9b5804ea6a8cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Mar 2023 13:35:58 +0000

flight 179808 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179808/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b7a8264ae4704f781e70cc44dafdf07e4e5e690a
baseline version:
 ovmf                 b17a3a133b18fb41493fba7d86e9b5804ea6a8cf

Last test of basis   179730  2023-03-17 18:22:13 Z    2 days
Testing same since   179808  2023-03-20 11:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>

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
   b17a3a133b..b7a8264ae4  b7a8264ae4704f781e70cc44dafdf07e4e5e690a -> xen-tested-master

