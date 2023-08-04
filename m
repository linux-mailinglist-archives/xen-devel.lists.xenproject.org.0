Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262E76FA27
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576901.903571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoP2-0007Vb-2S; Fri, 04 Aug 2023 06:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576901.903571; Fri, 04 Aug 2023 06:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoP1-0007Th-Vw; Fri, 04 Aug 2023 06:35:11 +0000
Received: by outflank-mailman (input) for mailman id 576901;
 Fri, 04 Aug 2023 06:35:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRoP0-0007TW-TM; Fri, 04 Aug 2023 06:35:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRoP0-00021Q-SJ; Fri, 04 Aug 2023 06:35:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRoP0-0008CV-Dy; Fri, 04 Aug 2023 06:35:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qRoP0-0000Zl-DV; Fri, 04 Aug 2023 06:35:10 +0000
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
	bh=5PbYwu3sgetDo0FQzUj2s6Pd6GQZfaKxe4ylDAkuMGU=; b=r/uI3E5Sm28HkJ8wF6dBMWfnoo
	xj0SQe06rhD87IY85GgB4pxAIoIHFk8dtvDXH3kYncQ1xkmamcuIX+m0sULIFvltm/U0khG8H2biw
	XvFPWNgq9P0UoBosTBO32+woqARMO0rI6bcj91toYTY/FNDRlPhwDPD7E+JITOVSxTR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182176: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=01ad4134c3e6339ac53c85fccf62ed10d5b6d662
X-Osstest-Versions-That:
    ovmf=ef051451367fa5455d75b38c407ca352a43b4849
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Aug 2023 06:35:10 +0000

flight 182176 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182176/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 01ad4134c3e6339ac53c85fccf62ed10d5b6d662
baseline version:
 ovmf                 ef051451367fa5455d75b38c407ca352a43b4849

Last test of basis   182168  2023-08-03 15:12:09 Z    0 days
Testing same since   182176  2023-08-04 01:40:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>
  likun su <sulikun@loongson.cn>

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
   ef05145136..01ad4134c3  01ad4134c3e6339ac53c85fccf62ed10d5b6d662 -> xen-tested-master

