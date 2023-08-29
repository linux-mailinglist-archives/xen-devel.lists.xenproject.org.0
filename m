Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66078C164
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 11:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592089.924699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauzs-0007we-4o; Tue, 29 Aug 2023 09:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592089.924699; Tue, 29 Aug 2023 09:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauzs-0007vD-1h; Tue, 29 Aug 2023 09:26:52 +0000
Received: by outflank-mailman (input) for mailman id 592089;
 Tue, 29 Aug 2023 09:26:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauzr-0007v3-8n; Tue, 29 Aug 2023 09:26:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauzr-0006AZ-0O; Tue, 29 Aug 2023 09:26:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauzq-000629-GD; Tue, 29 Aug 2023 09:26:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qauzq-0003mY-Fl; Tue, 29 Aug 2023 09:26:50 +0000
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
	bh=vkL6kYCjAtDWD2Ni7HWjiyI4Mrvg/0VQFe5fsmAKnE8=; b=62MnVoh6RT1P5YQCI1KGoY/Gkc
	Ce3atAvroI82Z6Bf46Aa5ERGXdKxOCh7yTlt93kYLxNLgHnDJPhwqGKE8+Y1cPhCoEXcH6aigpchk
	OhbJyA/qmDHhE3ImYwmlwkV06njbm2q9frqGQH4Q4QNa7lwYRP/ETqpZOolrpCZaE5U4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182551-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182551: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=020cc9e2e7053bb62247b0babbbe80cb855592e5
X-Osstest-Versions-That:
    ovmf=a107fcb618934ae18f29660ecf066f3c49dd875f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 09:26:50 +0000

flight 182551 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182551/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 020cc9e2e7053bb62247b0babbbe80cb855592e5
baseline version:
 ovmf                 a107fcb618934ae18f29660ecf066f3c49dd875f

Last test of basis   182549  2023-08-29 03:42:40 Z    0 days
Testing same since   182551  2023-08-29 07:13:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  YuanhaoXie <yuanhao.xie@intel.com>

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
   a107fcb618..020cc9e2e7  020cc9e2e7053bb62247b0babbbe80cb855592e5 -> xen-tested-master

