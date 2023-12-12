Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66880ED41
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653128.1019405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2fF-0000Bw-AY; Tue, 12 Dec 2023 13:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653128.1019405; Tue, 12 Dec 2023 13:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2fF-00008M-7f; Tue, 12 Dec 2023 13:19:09 +0000
Received: by outflank-mailman (input) for mailman id 653128;
 Tue, 12 Dec 2023 13:19:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD2fE-000089-99; Tue, 12 Dec 2023 13:19:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD2fE-0007Ie-7M; Tue, 12 Dec 2023 13:19:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD2fD-0006eL-PB; Tue, 12 Dec 2023 13:19:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rD2fD-0007ZF-Ok; Tue, 12 Dec 2023 13:19:07 +0000
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
	bh=Hgi2dN2fnnIete59dRSuF3L2DUXqX7SuWFuBV0SbKTs=; b=3w+2mqA1NL/i00g9+sZP2xalNR
	ZPv+poFieOGg5/O4oGVsad0li9eQW+lyKd+D8eDtC8vhtSKYMwQ74DOb54b2rbBBTNXq3/UmRgX9v
	f4vf83siCFFFMpTgZ9vKWfaHQhd5ACqb4cKbi8wlOruOAWuVlb3fwfKOo2710rbSdID4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184103-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184103: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cee7ba349c0c1ce489001a338a4e28555728b573
X-Osstest-Versions-That:
    ovmf=725acd0b9cc047b20a1b9379e46f05d3ebcf485e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Dec 2023 13:19:07 +0000

flight 184103 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184103/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cee7ba349c0c1ce489001a338a4e28555728b573
baseline version:
 ovmf                 725acd0b9cc047b20a1b9379e46f05d3ebcf485e

Last test of basis   184097  2023-12-12 01:43:01 Z    0 days
Testing same since   184103  2023-12-12 11:11:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
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
   725acd0b9c..cee7ba349c  cee7ba349c0c1ce489001a338a4e28555728b573 -> xen-tested-master

