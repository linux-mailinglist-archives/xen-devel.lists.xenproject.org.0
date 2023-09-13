Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755A79E8B3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601283.937277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPbx-0008TU-QZ; Wed, 13 Sep 2023 13:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601283.937277; Wed, 13 Sep 2023 13:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPbx-0008Rg-Mp; Wed, 13 Sep 2023 13:08:53 +0000
Received: by outflank-mailman (input) for mailman id 601283;
 Wed, 13 Sep 2023 13:08:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgPbw-0008RV-2R; Wed, 13 Sep 2023 13:08:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgPbw-0006YZ-1f; Wed, 13 Sep 2023 13:08:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgPbv-0000WD-M5; Wed, 13 Sep 2023 13:08:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qgPbv-000282-LY; Wed, 13 Sep 2023 13:08:51 +0000
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
	bh=L/fEBm7l25kp74z9AUixbhHsRKukWAFXxs5iPoZk55w=; b=Mzossz6mJKfmSmggtPzXieSvDP
	B5ZS2VWJbKi8GCZ2WaIhtXyk5DnF6pRiIoS60SIZ6PQm739f/H38dyMUfdi7Dy6vrFIZH8QX9Do9r
	7w7QTcC/cSscIO/oqLkTUc14WsbY8X0yBsI1EmzT0AnyUtRz5r4wEWGivtVqarqvijzA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182996-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182996: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdfe4310dda2a30b0ca05c8ede6896edce37a656
X-Osstest-Versions-That:
    ovmf=b844b106e2a20c709ece1b2b89b2ae0e84a0e401
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Sep 2023 13:08:51 +0000

flight 182996 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182996/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdfe4310dda2a30b0ca05c8ede6896edce37a656
baseline version:
 ovmf                 b844b106e2a20c709ece1b2b89b2ae0e84a0e401

Last test of basis   182988  2023-09-13 02:42:26 Z    0 days
Failing since        182990  2023-09-13 06:12:22 Z    0 days    3 attempts
Testing same since   182993  2023-09-13 08:10:41 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Liu <linus.liu@intel.com>
  Nickle Wang <nicklew@nvidia.com>

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
   b844b106e2..cdfe4310dd  cdfe4310dda2a30b0ca05c8ede6896edce37a656 -> xen-tested-master

