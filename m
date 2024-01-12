Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F282B920
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 02:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666604.1037355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO6PS-0007mU-9L; Fri, 12 Jan 2024 01:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666604.1037355; Fri, 12 Jan 2024 01:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO6PS-0007kr-5X; Fri, 12 Jan 2024 01:32:34 +0000
Received: by outflank-mailman (input) for mailman id 666604;
 Fri, 12 Jan 2024 01:32:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rO6PQ-0007kf-M9; Fri, 12 Jan 2024 01:32:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rO6PQ-0002Af-LK; Fri, 12 Jan 2024 01:32:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rO6PQ-0003KC-2X; Fri, 12 Jan 2024 01:32:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rO6PQ-0002dT-2B; Fri, 12 Jan 2024 01:32:32 +0000
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
	bh=oTidrFx+9ojomYlPQ87NxiyBuy8l9mNF7IkiCy5Rof8=; b=abz6U3A/PMAMSwDohbntapvgWN
	h+LMO4X+frfy0lp2lECLFOMao8GTLH/pBEpwqwRNpNhVjLxqjKRXyfcCbGz1202VrromE3AAN0yzu
	DEfWUv28pieP4+3cMFVpN7NOl7UTqrZYSjvia5uvhpIjeESBRJu0B2KyHKtMlOVeWBis=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184325-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184325: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=58355ec1926563efc954821a2851365182a4ebd4
X-Osstest-Versions-That:
    ovmf=0765ee6cd36aef02236ae431a7097624d17762d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jan 2024 01:32:32 +0000

flight 184325 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184325/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 58355ec1926563efc954821a2851365182a4ebd4
baseline version:
 ovmf                 0765ee6cd36aef02236ae431a7097624d17762d9

Last test of basis   184322  2024-01-11 15:41:27 Z    0 days
Testing same since   184325  2024-01-11 23:11:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   0765ee6cd3..58355ec192  58355ec1926563efc954821a2851365182a4ebd4 -> xen-tested-master

