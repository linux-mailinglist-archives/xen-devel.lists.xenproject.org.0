Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8291D5E7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 03:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751220.1159099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO6H2-0004cE-8U; Mon, 01 Jul 2024 01:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751220.1159099; Mon, 01 Jul 2024 01:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO6H2-0004Za-5E; Mon, 01 Jul 2024 01:56:08 +0000
Received: by outflank-mailman (input) for mailman id 751220;
 Mon, 01 Jul 2024 01:56:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sO6H0-0004ZQ-2W; Mon, 01 Jul 2024 01:56:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sO6H0-0004uN-0t; Mon, 01 Jul 2024 01:56:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sO6Gz-0001Wp-F0; Mon, 01 Jul 2024 01:56:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sO6Gz-0005tg-ES; Mon, 01 Jul 2024 01:56:05 +0000
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
	bh=L83rrwp9UnwsoIgk1zaO1tDsvnACnFaaH2tCcBP7WzU=; b=0a5yYLO3SW6D3cSmfMR9J68wb+
	XA+1oDIddtZLHuq1St3muN0F0XBvY1+VG3XruDSF3ySCxt66YXd7ct0TMFA562025UzDfnxvLSZ+2
	q4umvuQ8LQvThaPId24W2ksWFJvunKQVnCh+nBKndDYUpoZYzOqHGHaeKENzKasUgc+0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186612-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186612: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c09d862bfb034e00b6b3bc37fe37243c866dd3a
X-Osstest-Versions-That:
    ovmf=3b2025969e6e8a2f6542996182cd4132868641c6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Jul 2024 01:56:05 +0000

flight 186612 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186612/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c09d862bfb034e00b6b3bc37fe37243c866dd3a
baseline version:
 ovmf                 3b2025969e6e8a2f6542996182cd4132868641c6

Last test of basis   186553  2024-06-28 15:11:18 Z    2 days
Testing same since   186612  2024-07-01 00:11:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>

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
   3b2025969e..8c09d862bf  8c09d862bfb034e00b6b3bc37fe37243c866dd3a -> xen-tested-master

