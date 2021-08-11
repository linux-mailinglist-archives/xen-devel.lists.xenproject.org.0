Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C403E8E4D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165607.302613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlGV-0007DV-Hf; Wed, 11 Aug 2021 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165607.302613; Wed, 11 Aug 2021 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlGV-0007BJ-Cv; Wed, 11 Aug 2021 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 165607;
 Wed, 11 Aug 2021 10:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDlGU-0007B9-1U; Wed, 11 Aug 2021 10:15:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDlGT-0002zr-QY; Wed, 11 Aug 2021 10:15:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDlGT-0000ta-I7; Wed, 11 Aug 2021 10:15:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mDlGT-0000HK-Hh; Wed, 11 Aug 2021 10:15:13 +0000
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
	bh=lMIktWuBuSDLbkWFpbPWAqnUiKH84iwgGdWuNB++vyU=; b=wjNvEska+e1UYGZ2s4VJE8uw+e
	0E2zxBVknUuNvEFMpGJeyX6HLf5HmGKQ9D4RPelBs8mjQrZqSfTT0lyuYmXvdTbgT458q2lw1AQ5f
	t2tGgjjsoEp7B06yils6nhBW7D4iYun3yTyA5o/zSwhnWcBiUmoBnh/bu2rw9ijudyc8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164155-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164155: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3d359ff90571704b53f19bf95aa797337c041abc
X-Osstest-Versions-That:
    ovmf=a7ddc7847cb4afa3534da82222f296aafadb959d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Aug 2021 10:15:13 +0000

flight 164155 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164155/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3d359ff90571704b53f19bf95aa797337c041abc
baseline version:
 ovmf                 a7ddc7847cb4afa3534da82222f296aafadb959d

Last test of basis   164151  2021-08-10 17:11:15 Z    0 days
Testing same since   164155  2021-08-11 01:55:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Jones <christopher.jones@arm.com>

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
   a7ddc7847c..3d359ff905  3d359ff90571704b53f19bf95aa797337c041abc -> xen-tested-master

