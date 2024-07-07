Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A19297F7
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 14:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754926.1163200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQRRM-0008AG-BJ; Sun, 07 Jul 2024 12:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754926.1163200; Sun, 07 Jul 2024 12:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQRRM-000879-7v; Sun, 07 Jul 2024 12:56:28 +0000
Received: by outflank-mailman (input) for mailman id 754926;
 Sun, 07 Jul 2024 12:56:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQRRK-00086w-Eu; Sun, 07 Jul 2024 12:56:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQRRK-0002Vi-4g; Sun, 07 Jul 2024 12:56:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQRRJ-0007pM-RZ; Sun, 07 Jul 2024 12:56:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sQRRJ-0006G0-R4; Sun, 07 Jul 2024 12:56:25 +0000
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
	bh=uVVbSijdRsrB2z7PDUJUOt7V63NomULkNs536Lljgsc=; b=AWZkjXotDrYQBp5J7NdWPl/OdL
	u8kvL7QhT8Itkg8XKTWzxlDzKAUWNAP/MDpazqCqu1uzglZhob8czhr8KoY/W5tMefzMxE8HxfAb5
	3kp51Sc95GwfglTeVSWJbE1FMmgHnbydRCqRzUW1Yg6+vwGlcEbuleL80N/9cyNIWrwk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186722-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186722: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=049e12c03d27f0a6bf57f4f1835cab5e205661a7
X-Osstest-Versions-That:
    ovmf=d5fad2176cb14283922e07ff1758118d16b17383
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Jul 2024 12:56:25 +0000

flight 186722 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186722/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 049e12c03d27f0a6bf57f4f1835cab5e205661a7
baseline version:
 ovmf                 d5fad2176cb14283922e07ff1758118d16b17383

Last test of basis   186721  2024-07-07 08:43:06 Z    0 days
Testing same since   186722  2024-07-07 11:14:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wei6 Xu <wei6.xu@intel.com>

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
   d5fad2176c..049e12c03d  049e12c03d27f0a6bf57f4f1835cab5e205661a7 -> xen-tested-master

