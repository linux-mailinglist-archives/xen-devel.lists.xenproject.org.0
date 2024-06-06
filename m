Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB818FE4F3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 13:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736077.1142207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFB2Z-0004nJ-R1; Thu, 06 Jun 2024 11:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736077.1142207; Thu, 06 Jun 2024 11:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFB2Z-0004lS-Me; Thu, 06 Jun 2024 11:12:19 +0000
Received: by outflank-mailman (input) for mailman id 736077;
 Thu, 06 Jun 2024 11:12:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFB2Z-0004lI-6i; Thu, 06 Jun 2024 11:12:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFB2Z-0008Gx-3D; Thu, 06 Jun 2024 11:12:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFB2Y-0004dU-O5; Thu, 06 Jun 2024 11:12:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFB2Y-0002YC-NZ; Thu, 06 Jun 2024 11:12:18 +0000
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
	bh=cIzigwMwGtB//tvFGkmzIV3EMyDAstp4wsBhy3npHVI=; b=kFr6FW/wfhjgPhjXucDLtsKPE0
	NnrQv4F3fQls4nuX5vO3xSIbT1QFt343h6OhSe0WCoa/YxrzDldCjjfTgaU8D8v9SzrQVOPD/HTaB
	TxVsX40NryLo0ImWVBvMtJq9wC1axKEq5UqpIYiIBIqZoiykE4BYCdyBnl7H8R15V9pA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186266-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186266: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=90cb1ec33225a070e9fea1d94c72ff590bd38731
X-Osstest-Versions-That:
    ovmf=65b0d08786888284cd1bb705c58f53a65ae443b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Jun 2024 11:12:18 +0000

flight 186266 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186266/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 90cb1ec33225a070e9fea1d94c72ff590bd38731
baseline version:
 ovmf                 65b0d08786888284cd1bb705c58f53a65ae443b0

Last test of basis   186264  2024-06-06 06:12:55 Z    0 days
Testing same since   186266  2024-06-06 09:12:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   65b0d08786..90cb1ec332  90cb1ec33225a070e9fea1d94c72ff590bd38731 -> xen-tested-master

