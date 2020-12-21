Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612942E027F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 23:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57581.100825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krTeX-00066l-4e; Mon, 21 Dec 2020 22:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57581.100825; Mon, 21 Dec 2020 22:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krTeW-00066F-V5; Mon, 21 Dec 2020 22:27:40 +0000
Received: by outflank-mailman (input) for mailman id 57581;
 Mon, 21 Dec 2020 22:27:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krTeU-000667-Uu; Mon, 21 Dec 2020 22:27:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krTeU-00076E-Lp; Mon, 21 Dec 2020 22:27:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krTeU-0005gc-Bq; Mon, 21 Dec 2020 22:27:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krTeU-0008P1-BJ; Mon, 21 Dec 2020 22:27:38 +0000
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
	bh=WogjTN0CG6GYMgpMQV5MhJzCZRHiWRChsrFrt/jebco=; b=INj/bgdgPbxKSIS+L4243HfrIE
	ZXpVLoB/oSqRI5ctk71tWiowO0oigIQlnOWDmrNko+MCdvQ9sF7orrWlxZF+0PiZ/N/6OEQ2YF6Gx
	gzTPmDTf3GQXHCKwXBp0HLezTTR8EUnCvj6XHJ/JOdY7Su7PG6tm21UgaaPSv49ZoNa4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157759-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157759: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3ce3274a5ea41134fafb983c0198de89007d471e
X-Osstest-Versions-That:
    ovmf=6932f4bfe552c1704c5715430de6045c78a5b62f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Dec 2020 22:27:38 +0000

flight 157759 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157759/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3ce3274a5ea41134fafb983c0198de89007d471e
baseline version:
 ovmf                 6932f4bfe552c1704c5715430de6045c78a5b62f

Last test of basis   157726  2020-12-19 17:23:18 Z    2 days
Testing same since   157759  2020-12-21 14:39:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   6932f4bfe5..3ce3274a5e  3ce3274a5ea41134fafb983c0198de89007d471e -> xen-tested-master

