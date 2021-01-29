Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918223089A6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78217.142200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VIc-0006Jq-Gt; Fri, 29 Jan 2021 15:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78217.142200; Fri, 29 Jan 2021 15:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VIc-0006JM-Bk; Fri, 29 Jan 2021 15:03:02 +0000
Received: by outflank-mailman (input) for mailman id 78217;
 Fri, 29 Jan 2021 15:03:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5VIb-0006JE-Ah; Fri, 29 Jan 2021 15:03:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5VIb-00088R-6y; Fri, 29 Jan 2021 15:03:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5VIa-0001Ld-VG; Fri, 29 Jan 2021 15:03:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l5VIa-0006A2-Up; Fri, 29 Jan 2021 15:03:00 +0000
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
	bh=SMGQ+zA+yxctqUSS05+XHbmEOVFzdyCuwMhjkrNm+iM=; b=HSfWARua5G6HmNhyN6Qsb9Op/4
	9/4Mbpfi/muYNwQ0yi83gyNgkFZaIMGnNRrP57nqpoStgZ7911GULBbGDjoBFFoJFSOCZP3cr8X9F
	Qi8+ySOrQNsS/71Pd3X5pxhV7/Cf2Ignh87KUgKKVkxrxFGssxEcrWQixtBuDOEZ8JbE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158757-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158757: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c6be6dab9c4bdf135bc02b61ecc304d5511c3588
X-Osstest-Versions-That:
    ovmf=2d6fc9d36fd5ff15972bedab919f37bb4ee951d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jan 2021 15:03:00 +0000

flight 158757 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158757/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c6be6dab9c4bdf135bc02b61ecc304d5511c3588
baseline version:
 ovmf                 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0

Last test of basis   158626  2021-01-26 10:52:49 Z    3 days
Testing same since   158757  2021-01-29 03:10:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>

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
   2d6fc9d36f..c6be6dab9c  c6be6dab9c4bdf135bc02b61ecc304d5511c3588 -> xen-tested-master

