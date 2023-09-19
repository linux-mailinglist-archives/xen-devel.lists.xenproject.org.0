Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97E7A6AA9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 20:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604968.942546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qifOU-0008Lo-TU; Tue, 19 Sep 2023 18:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604968.942546; Tue, 19 Sep 2023 18:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qifOU-0008Iq-QY; Tue, 19 Sep 2023 18:24:18 +0000
Received: by outflank-mailman (input) for mailman id 604968;
 Tue, 19 Sep 2023 18:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qifOT-0008Ig-Bl; Tue, 19 Sep 2023 18:24:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qifOT-0003PM-9R; Tue, 19 Sep 2023 18:24:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qifOT-0006fw-1U; Tue, 19 Sep 2023 18:24:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qifOT-0007M9-14; Tue, 19 Sep 2023 18:24:17 +0000
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
	bh=zlLOfZwGwls+lSx8NANYeqMXhHpRJkngmLwRsOZ0sjc=; b=uBWxtOsm+zBUmkjQ+cOccMDV3s
	/ttrvD7uFJDvuqQe1gH97OEUpJs6oxnmq8C9ej01GVJzerjEOkv0yf7GG9axFzm0ebv5O3WHJTLRO
	6XTRpwHto1Ew+lc9X5tJIGplb1U4pja+97t6CDPHaVzayw4WoVPsCD0ZU0FTJwzRwTHo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183063-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183063: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7275993dc64481b1c21d7d70af434bfaafe86e81
X-Osstest-Versions-That:
    ovmf=cbcf0428e83bbe8314de47207072b3b4f1557dc6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Sep 2023 18:24:17 +0000

flight 183063 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183063/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7275993dc64481b1c21d7d70af434bfaafe86e81
baseline version:
 ovmf                 cbcf0428e83bbe8314de47207072b3b4f1557dc6

Last test of basis   183041  2023-09-19 01:40:54 Z    0 days
Testing same since   183063  2023-09-19 16:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>
  Nickle Wang <nicklew@nvidia.com>

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
   cbcf0428e8..7275993dc6  7275993dc64481b1c21d7d70af434bfaafe86e81 -> xen-tested-master

