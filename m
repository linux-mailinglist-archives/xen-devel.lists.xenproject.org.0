Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84E90FBCE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 05:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744133.1151149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK8wK-00009H-2x; Thu, 20 Jun 2024 03:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744133.1151149; Thu, 20 Jun 2024 03:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK8wK-00005w-0R; Thu, 20 Jun 2024 03:58:24 +0000
Received: by outflank-mailman (input) for mailman id 744133;
 Thu, 20 Jun 2024 03:58:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8wI-00005m-P5; Thu, 20 Jun 2024 03:58:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8wI-00055L-Hz; Thu, 20 Jun 2024 03:58:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8wI-00009q-7p; Thu, 20 Jun 2024 03:58:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8wI-0000pi-7D; Thu, 20 Jun 2024 03:58:22 +0000
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
	bh=GPUodwrxAPFHA3rS/HJkaiVIbV/ODpohGbPR7eg5qVM=; b=lgzxEEjOGYROipgYjeF6pu/ZI2
	QwYzyh0YJwfm8fg8cIdoFRVoHmBxkCrj1jjrixE9TtY/cGFJE/kIp2UXJ0vBYkYwSDgrnFboNnyYT
	3d60MdmSMfjL24XgcvmwTBLh2a4DwY5gW1oi4CMmq9Vg5DSXuDwriNZZ1qefzZA9NOCQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186422-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186422: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=57a890fd03356350a1b7a2a0064c8118f44e9958
X-Osstest-Versions-That:
    ovmf=95e220e95d6237e21f7c0b83fca02d56b9327c4a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jun 2024 03:58:22 +0000

flight 186422 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186422/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 57a890fd03356350a1b7a2a0064c8118f44e9958
baseline version:
 ovmf                 95e220e95d6237e21f7c0b83fca02d56b9327c4a

Last test of basis   186414  2024-06-19 17:42:49 Z    0 days
Testing same since   186422  2024-06-20 01:56:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   95e220e95d..57a890fd03  57a890fd03356350a1b7a2a0064c8118f44e9958 -> xen-tested-master

