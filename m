Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF873C487
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 00:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554448.865630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCpiF-0002Qm-F1; Fri, 23 Jun 2023 22:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554448.865630; Fri, 23 Jun 2023 22:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCpiF-0002Nt-BU; Fri, 23 Jun 2023 22:57:07 +0000
Received: by outflank-mailman (input) for mailman id 554448;
 Fri, 23 Jun 2023 22:57:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCpiD-0002Nj-Va; Fri, 23 Jun 2023 22:57:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCpiD-0005rI-Ns; Fri, 23 Jun 2023 22:57:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCpiD-0007Kn-Ef; Fri, 23 Jun 2023 22:57:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qCpiD-00032w-EA; Fri, 23 Jun 2023 22:57:05 +0000
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
	bh=CnLyrFc+p/i9MqxEWapbXmKaeyBZ0qufPNAWErxR9Mw=; b=L8GfLj+OlChotlCoD06R2ovmMO
	weFsbS/N40X1TJ8RLgFq92gu4ZPlNP22YqMGFPNdwANwrA2rzJ3Mq8/rgcfN1f0MvfgtFr1XiS/LB
	ioKsj05gR8irFebztsR+JYvaCuTGTfClSTkOA/EXYt5lFkNq+vWzD9WI791hkKet6r1g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181569-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181569: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=57796711371d42d980d50bc9299972b109d09035
X-Osstest-Versions-That:
    ovmf=6ee981c858daeb08c8ab6d357a55c131875aae3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Jun 2023 22:57:05 +0000

flight 181569 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181569/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 57796711371d42d980d50bc9299972b109d09035
baseline version:
 ovmf                 6ee981c858daeb08c8ab6d357a55c131875aae3a

Last test of basis   181567  2023-06-23 16:40:52 Z    0 days
Testing same since   181569  2023-06-23 20:44:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Peter Grehan <grehan@freebsd.org>

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
   6ee981c858..5779671137  57796711371d42d980d50bc9299972b109d09035 -> xen-tested-master

