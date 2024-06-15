Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA7909894
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2024 16:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741326.1148100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIU1U-00060B-9W; Sat, 15 Jun 2024 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741326.1148100; Sat, 15 Jun 2024 14:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIU1U-0005xM-6m; Sat, 15 Jun 2024 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 741326;
 Sat, 15 Jun 2024 14:04:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIU1S-0005xA-HW; Sat, 15 Jun 2024 14:04:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIU1S-0002c8-Gf; Sat, 15 Jun 2024 14:04:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIU1S-0007zP-AA; Sat, 15 Jun 2024 14:04:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sIU1S-00067k-9l; Sat, 15 Jun 2024 14:04:50 +0000
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
	bh=fPDC4eftMxjn4Uc9v9aqVwHbIkl8abeqvvRznbQCb6U=; b=MvKYbgIZedghF47YNbRvnkH0cI
	6uohOkRrXWsDV+O8NAPc5k75IuBgR4dglCNLA7fk3Txqfql1/hC18IsipLMvRk+BrFHsOM9ScYAdD
	pmhPU/ukSIoVAuubyQY5Wj2fNZ2hkRN41DHWoXxSBp+HnTD/tYo1uFfl61jm0zoRT9OM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186362-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186362: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aa99d36be9ad68d8d0a99896332a9b5da10cf343
X-Osstest-Versions-That:
    ovmf=d8095b36abc521970dd930449a8ae8ddc431314c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jun 2024 14:04:50 +0000

flight 186362 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186362/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aa99d36be9ad68d8d0a99896332a9b5da10cf343
baseline version:
 ovmf                 d8095b36abc521970dd930449a8ae8ddc431314c

Last test of basis   186361  2024-06-15 09:42:56 Z    0 days
Testing same since   186362  2024-06-15 11:42:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   d8095b36ab..aa99d36be9  aa99d36be9ad68d8d0a99896332a9b5da10cf343 -> xen-tested-master

