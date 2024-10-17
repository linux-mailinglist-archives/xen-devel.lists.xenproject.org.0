Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA29A1D50
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 10:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820449.1233946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1LyJ-00074q-V6; Thu, 17 Oct 2024 08:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820449.1233946; Thu, 17 Oct 2024 08:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1LyJ-00072N-R6; Thu, 17 Oct 2024 08:35:03 +0000
Received: by outflank-mailman (input) for mailman id 820449;
 Thu, 17 Oct 2024 08:35:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1LyI-00072D-BX; Thu, 17 Oct 2024 08:35:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1LyI-0006Wd-8s; Thu, 17 Oct 2024 08:35:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1LyI-00075T-1x; Thu, 17 Oct 2024 08:35:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1LyI-00060r-1M; Thu, 17 Oct 2024 08:35:02 +0000
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
	bh=5ZD4eVgFQfT32b7NwYrvBE3hBT5NI1W0/yQDCwJzsSk=; b=giAf5l6UcJ9KbCJec+7Dm+HPZw
	uq1FCHwBlHZXvH2a2/XXbmj+6wUoCB4p/kVjZkKDeKUg31k7hbXDpHkjklBn1OHbKdGvUWERQ8h5Q
	9VlwM6f1t7vZlGIP5sMmfSE5YJ3/wO5tkwp9Dfwgrp7X6HcmgluxjP4dSWLis0BmV/4w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188152: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e19cc32bce466fb1c175f7d44708c2ebb45802a7
X-Osstest-Versions-That:
    ovmf=b7342074a649599078553e33acd6d7a79e950683
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Oct 2024 08:35:02 +0000

flight 188152 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188152/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e19cc32bce466fb1c175f7d44708c2ebb45802a7
baseline version:
 ovmf                 b7342074a649599078553e33acd6d7a79e950683

Last test of basis   188131  2024-10-16 20:12:30 Z    0 days
Testing same since   188152  2024-10-17 07:11:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   b7342074a6..e19cc32bce  e19cc32bce466fb1c175f7d44708c2ebb45802a7 -> xen-tested-master

