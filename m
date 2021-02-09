Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDFB315848
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83434.155291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aGc-0001m2-Cg; Tue, 09 Feb 2021 21:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83434.155291; Tue, 09 Feb 2021 21:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aGc-0001lZ-8v; Tue, 09 Feb 2021 21:09:50 +0000
Received: by outflank-mailman (input) for mailman id 83434;
 Tue, 09 Feb 2021 21:09:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9aGa-0001lR-LI; Tue, 09 Feb 2021 21:09:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9aGa-0007Kg-DN; Tue, 09 Feb 2021 21:09:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9aGa-0001hR-76; Tue, 09 Feb 2021 21:09:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9aGa-0007tG-6H; Tue, 09 Feb 2021 21:09:48 +0000
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
	bh=MILKInN7CaBZYimuWpV83gWinSwTYDvm2jVXfxN/rgg=; b=CitjdBHdZuewsopg6HPxc71yCq
	gcZzRT4i9xtgnWPyxxa+4dSmuxNrbwSkyNMgk20b8YWXkXdlmfeXjq5367TzqYT5/f66cjOuB2erX
	Skaa6yoR1Z7bV4SiAH4Ae9L/ZBHcwYm4Nb1VX7Ls7yfeSZRsUquB73IzjONGTbdf760A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159143-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159143: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=472276f59bba2b22bb882c5c6f5479754e68d467
X-Osstest-Versions-That:
    ovmf=43a113385e370530eb52cf2e55b3019d8d4f6558
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Feb 2021 21:09:48 +0000

flight 159143 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159143/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 472276f59bba2b22bb882c5c6f5479754e68d467
baseline version:
 ovmf                 43a113385e370530eb52cf2e55b3019d8d4f6558

Last test of basis   159136  2021-02-08 10:53:57 Z    1 days
Testing same since   159143  2021-02-08 16:09:49 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Jordan Justen <jordan.l.justen@intel.com>

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
   43a113385e..472276f59b  472276f59bba2b22bb882c5c6f5479754e68d467 -> xen-tested-master

