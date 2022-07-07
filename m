Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2B569AA8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 08:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362753.592952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9LGm-0002l0-WF; Thu, 07 Jul 2022 06:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362753.592952; Thu, 07 Jul 2022 06:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9LGm-0002ie-Sq; Thu, 07 Jul 2022 06:45:48 +0000
Received: by outflank-mailman (input) for mailman id 362753;
 Thu, 07 Jul 2022 06:45:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9LGl-0002iU-Em; Thu, 07 Jul 2022 06:45:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9LGl-00079i-AD; Thu, 07 Jul 2022 06:45:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9LGk-00064V-N5; Thu, 07 Jul 2022 06:45:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o9LGk-0007YA-Mc; Thu, 07 Jul 2022 06:45:46 +0000
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
	bh=eDOj9DKlurmPw0cLvUQryba9TBJOjeJJR5+R39aen+I=; b=ZFZmiZWgTDS0dFD3qBpSofRuRa
	sh9Aaap4w7E8L6PVnLdwWdh+YNHYQtb7TgqGzFZUh5g276BPyNk3RXdL20CF7KhdiX87Wgrj9ymSb
	hK/ocRUBs0tHK9su3Fzw9kQHN2ZcQcI0vI3MyCvEPdi3TD1iS5gEpfkCgFv/XZ0vaBuc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171540-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171540: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f193b945eac58ca379d3d21c77d5550b063580d6
X-Osstest-Versions-That:
    ovmf=e1eef3a8b01a25e75abf63d15bdc90157a74cba9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jul 2022 06:45:46 +0000

flight 171540 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171540/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f193b945eac58ca379d3d21c77d5550b063580d6
baseline version:
 ovmf                 e1eef3a8b01a25e75abf63d15bdc90157a74cba9

Last test of basis   171446  2022-07-01 17:40:26 Z    5 days
Testing same since   171540  2022-07-07 01:10:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kun.qin@microsoft.com>
  Kun Qin <kuqin12@gmail.com>
  Kun Qin <kuqin@microsoft.com>
  kuqin <kuqin@microsoft.com>
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
   e1eef3a8b0..f193b945ea  f193b945eac58ca379d3d21c77d5550b063580d6 -> xen-tested-master

