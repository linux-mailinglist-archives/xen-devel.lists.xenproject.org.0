Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B074045C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 22:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556267.868659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEF3x-0004cf-Pu; Tue, 27 Jun 2023 20:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556267.868659; Tue, 27 Jun 2023 20:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEF3x-0004a7-N7; Tue, 27 Jun 2023 20:13:21 +0000
Received: by outflank-mailman (input) for mailman id 556267;
 Tue, 27 Jun 2023 20:13:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEF3w-0004Zx-M9; Tue, 27 Jun 2023 20:13:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEF3w-0004ES-9d; Tue, 27 Jun 2023 20:13:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEF3v-0000gB-TP; Tue, 27 Jun 2023 20:13:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEF3v-0003rs-T0; Tue, 27 Jun 2023 20:13:19 +0000
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
	bh=15YVfNyArbRRL4HBIc7WhBXTJVK3FlPfw6B6XGXz3yg=; b=cnxGc+IRzvZYAAEp1PUGCw4lvJ
	ZfTHDVXLG9uU0o+QrOdgg2dTeopLLcrD4L6WLlQDmAlFlGh5cJMCgQ55v1P0Jge3cfRhIbDZxvYrM
	byBya3cmAnUkbYjakRv1NBsq8LxutU23jQeSEAH/9T5aOhLPyzgWTn4+UjxQArVASY0E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181616-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181616: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1a39bdf2c53858ebb39e6de1362203c65c163c63
X-Osstest-Versions-That:
    ovmf=ea7a3015a2404e1358218463dd25df5ae7615352
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Jun 2023 20:13:19 +0000

flight 181616 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181616/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1a39bdf2c53858ebb39e6de1362203c65c163c63
baseline version:
 ovmf                 ea7a3015a2404e1358218463dd25df5ae7615352

Last test of basis   181615  2023-06-27 16:42:22 Z    0 days
Testing same since   181616  2023-06-27 18:40:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunil V L <sunilvl@ventanamicro.com>

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
   ea7a3015a2..1a39bdf2c5  1a39bdf2c53858ebb39e6de1362203c65c163c63 -> xen-tested-master

