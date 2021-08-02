Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF73DD220
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 10:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162909.298583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mATQk-0001iU-87; Mon, 02 Aug 2021 08:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162909.298583; Mon, 02 Aug 2021 08:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mATQk-0001gf-3p; Mon, 02 Aug 2021 08:36:14 +0000
Received: by outflank-mailman (input) for mailman id 162909;
 Mon, 02 Aug 2021 08:36:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mATQi-0001gV-Na; Mon, 02 Aug 2021 08:36:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mATQi-0003M5-Eb; Mon, 02 Aug 2021 08:36:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mATQi-0000Yc-5t; Mon, 02 Aug 2021 08:36:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mATQi-0006zL-5L; Mon, 02 Aug 2021 08:36:12 +0000
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
	bh=DQlI/1FMSni5uj0nAKCkmhoQrvzWk0Oyyt4mvuDnWAg=; b=r3Utgv1wkfHyNcIjO7QPBI23Ix
	hg1AvgLLn05F/y//q7lvcJWPB86um1jHmHJpRN1xCOt3zGlcQmlgg1cwEZKfBCIlao+R7glZ2hZol
	mU1zuROwRPdhESJbR8xWBQNvS+vpMa7T7sj1e1YrniK3N4Ef695N3TzEWNJth3svG+dQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164078-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164078: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3445058aea4f64a994e4ec040135258a135d36ce
X-Osstest-Versions-That:
    ovmf=610bcc69ed3d1e8c016332a1862465d41d95dd6c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Aug 2021 08:36:12 +0000

flight 164078 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164078/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3445058aea4f64a994e4ec040135258a135d36ce
baseline version:
 ovmf                 610bcc69ed3d1e8c016332a1862465d41d95dd6c

Last test of basis   164047  2021-07-29 23:10:04 Z    3 days
Testing same since   164078  2021-08-02 02:10:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Seonghyun Park <shpark.zilla@gmail.com>
  Seonghyun Park <shpark1@protonmail.com>

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
   610bcc69ed..3445058aea  3445058aea4f64a994e4ec040135258a135d36ce -> xen-tested-master

