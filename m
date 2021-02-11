Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1D318814
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83812.156900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9Bv-0003Os-Bx; Thu, 11 Feb 2021 10:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83812.156900; Thu, 11 Feb 2021 10:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9Bv-0003OJ-6u; Thu, 11 Feb 2021 10:27:19 +0000
Received: by outflank-mailman (input) for mailman id 83812;
 Thu, 11 Feb 2021 10:27:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lA9Bt-0003OB-Q3; Thu, 11 Feb 2021 10:27:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lA9Bt-0001S8-Ln; Thu, 11 Feb 2021 10:27:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lA9Bt-0000Wl-Fq; Thu, 11 Feb 2021 10:27:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lA9Bt-0000IX-FM; Thu, 11 Feb 2021 10:27:17 +0000
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
	bh=Zp0FmVY7X8XvTaBKe9vj2kb1oY8UgMp2n21C36Xfqic=; b=TvTPWQI78DPTHNd25ry02XFsoE
	gUDy6r9c4HfuiZKSgrzj+S6IcgGZ4c6GYHPw3Cd0pdn2Us0mFZbTtJ7UNLNRRrUC8bybwWg5lMzsu
	Dn206Pzj1LG6VftLquEgV4QNCLoZCKmg+86ZvFtmTpC5N0NVYtuUORGljkJTSPcttQWY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159198-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159198: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=124f1dd1ee1140b441151043aacbe5d33bb5ab79
X-Osstest-Versions-That:
    ovmf=472276f59bba2b22bb882c5c6f5479754e68d467
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Feb 2021 10:27:17 +0000

flight 159198 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159198/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 124f1dd1ee1140b441151043aacbe5d33bb5ab79
baseline version:
 ovmf                 472276f59bba2b22bb882c5c6f5479754e68d467

Last test of basis   159143  2021-02-08 16:09:49 Z    2 days
Testing same since   159198  2021-02-10 11:26:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Bob Feng <bob.c.feng@intel.com>
  Leif Lindholm <leif@nuviainc.com>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Matthew Carlson <matthewfcarlson@gmail.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   472276f59b..124f1dd1ee  124f1dd1ee1140b441151043aacbe5d33bb5ab79 -> xen-tested-master

