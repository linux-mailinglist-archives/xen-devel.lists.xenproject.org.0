Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F409A7A8FE2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 01:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606024.943684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj6jx-0003KS-2D; Wed, 20 Sep 2023 23:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606024.943684; Wed, 20 Sep 2023 23:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj6jw-0003Hg-VR; Wed, 20 Sep 2023 23:36:16 +0000
Received: by outflank-mailman (input) for mailman id 606024;
 Wed, 20 Sep 2023 23:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qj6jv-0003HW-Bd; Wed, 20 Sep 2023 23:36:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qj6jv-0004fu-0F; Wed, 20 Sep 2023 23:36:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qj6ju-0008IT-L0; Wed, 20 Sep 2023 23:36:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qj6ju-0000BM-KT; Wed, 20 Sep 2023 23:36:14 +0000
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
	bh=TPCPRFAf3DM+chjowNiTSZ4G4LzrH4fofKmW09ua6IY=; b=Q6xNarmbbr/FP4iX/GE/nJAs8R
	CuMrmMj0LPEGUT3UJnpXXur6gUBcPkJDY3n7x787R4ULnKbu/Im0mUWKug24hRiEmsxO4mlZwuC4s
	9Y0dgaoPtGpI8+zHelaqlOOE8VvYQo3hM+aQbYwILEzzbgZeLyzYkWvD39Jy6Q4zFjb4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183087-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183087: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=89dad77cfbffda0303383a11026d854008c1b731
X-Osstest-Versions-That:
    ovmf=4317b4824bc881fe6079d04b7ee5b0f6bddf62ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Sep 2023 23:36:14 +0000

flight 183087 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183087/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 89dad77cfbffda0303383a11026d854008c1b731
baseline version:
 ovmf                 4317b4824bc881fe6079d04b7ee5b0f6bddf62ca

Last test of basis   183079  2023-09-20 09:11:11 Z    0 days
Testing same since   183087  2023-09-20 15:10:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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
   4317b4824b..89dad77cfb  89dad77cfbffda0303383a11026d854008c1b731 -> xen-tested-master

