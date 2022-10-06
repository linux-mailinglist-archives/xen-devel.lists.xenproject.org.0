Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5F5F60FF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 08:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416605.661241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogKDi-0005gV-T6; Thu, 06 Oct 2022 06:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416605.661241; Thu, 06 Oct 2022 06:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogKDi-0005dY-PV; Thu, 06 Oct 2022 06:18:58 +0000
Received: by outflank-mailman (input) for mailman id 416605;
 Thu, 06 Oct 2022 06:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ogKDh-0005dO-G5; Thu, 06 Oct 2022 06:18:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ogKDh-00064V-DW; Thu, 06 Oct 2022 06:18:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ogKDh-0002j9-1Z; Thu, 06 Oct 2022 06:18:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ogKDh-0005nk-0u; Thu, 06 Oct 2022 06:18:57 +0000
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
	bh=jzi9fiVZfcvSl2l2alIYYAjJFZ5wOIY0yrPpy0+6jvU=; b=nzp/e09Zg4E02vNxnkaPEPIDWV
	lbf+gvSOnNVtVZsvzLDpRqFJ8M+heCVDkUHhRxhN6CZd1KGltSFtbLIZUuh0CDzTRbDhYXYgbXvLO
	YJYrT+NEkDssoyoFJkpeoAM/O0lPfxOZ6f7ZdV3221LwW4G3bIcSakPPyMqH/UsrgHZ4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173437-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173437: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=710f83b79d6eab641401c054b2f40f6c630f8cd5
X-Osstest-Versions-That:
    ovmf=1bd2ff18664b9564a5802d0ac153b5023f2fa41e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Oct 2022 06:18:57 +0000

flight 173437 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173437/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 710f83b79d6eab641401c054b2f40f6c630f8cd5
baseline version:
 ovmf                 1bd2ff18664b9564a5802d0ac153b5023f2fa41e

Last test of basis   173424  2022-10-05 04:40:32 Z    1 days
Testing same since   173437  2022-10-06 02:10:29 Z    0 days    1 attempts

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
   1bd2ff1866..710f83b79d  710f83b79d6eab641401c054b2f40f6c630f8cd5 -> xen-tested-master

