Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA5907B12
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 20:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740172.1147192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHp2g-0006UR-1i; Thu, 13 Jun 2024 18:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740172.1147192; Thu, 13 Jun 2024 18:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHp2f-0006RF-Ug; Thu, 13 Jun 2024 18:19:21 +0000
Received: by outflank-mailman (input) for mailman id 740172;
 Thu, 13 Jun 2024 18:19:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHp2e-0006R0-N6; Thu, 13 Jun 2024 18:19:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHp2e-0007HE-BT; Thu, 13 Jun 2024 18:19:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHp2d-00010Q-RU; Thu, 13 Jun 2024 18:19:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sHp2d-0004mW-R7; Thu, 13 Jun 2024 18:19:19 +0000
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
	bh=SqqJO0muW4uiSAvfMl67iOu2FjZorNj8PyVAn96iRc0=; b=NkON85QsauEl3azy98CwbvEEqQ
	aYsZ1hbhLKrl1T5FXhrMMweVQ4FWYc/tXiLfjgepMpgb1ApK7es3NwvVBux3mez9iuktVeYl7p6Qv
	rXrmz39guwohDM9TYvSVQyydUeSqHVOhD9zBQSjAFMEerATpXqj3arM1GoIa/Ew/tKzg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186338-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186338: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=712797cf19acd292bf203522a79e40e7e13d268b
X-Osstest-Versions-That:
    ovmf=d3b32dca06b987d7214637f3952c2ce1ce69f308
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Jun 2024 18:19:19 +0000

flight 186338 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186338/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 712797cf19acd292bf203522a79e40e7e13d268b
baseline version:
 ovmf                 d3b32dca06b987d7214637f3952c2ce1ce69f308

Last test of basis   186318  2024-06-12 07:41:12 Z    1 days
Testing same since   186338  2024-06-13 16:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Pedro Falcato <pedro.falcato@gmail.com>

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
   d3b32dca06..712797cf19  712797cf19acd292bf203522a79e40e7e13d268b -> xen-tested-master

