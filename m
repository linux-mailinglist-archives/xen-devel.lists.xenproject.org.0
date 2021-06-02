Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8739899A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 14:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136031.252422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loQ3V-00008i-HS; Wed, 02 Jun 2021 12:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136031.252422; Wed, 02 Jun 2021 12:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loQ3V-00004s-Bp; Wed, 02 Jun 2021 12:33:05 +0000
Received: by outflank-mailman (input) for mailman id 136031;
 Wed, 02 Jun 2021 12:33:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loQ3U-0008W5-55; Wed, 02 Jun 2021 12:33:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loQ3U-0006f5-0J; Wed, 02 Jun 2021 12:33:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loQ3T-0006wx-NN; Wed, 02 Jun 2021 12:33:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1loQ3T-0003X2-Mt; Wed, 02 Jun 2021 12:33:03 +0000
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
	bh=CYahFAxuSyCqoeGUef+KXV5VJNRn4eFtFqsq/s1rcVk=; b=raMGMRiD8HAXV+tqvt6GoHf7r9
	mD5BvSioFCzu5RAj017StO5dB41H1tl2Aw+s+t31GV3RIeeTZ91ioIRTdpDgHRgn6reEYNoCnAdav
	kiUh6admdoIB8lLzL3luhKFFhfklpZm3k5vneGeq9mpVE2hv+D2gnLGXKgL1fhF+0v04=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162334-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162334: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b233eb1849ac01bdd5b24ea84460a2e481a4c5a9
X-Osstest-Versions-That:
    ovmf=fdf3666f01a2dd02d83a808f609b9c744a74c652
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Jun 2021 12:33:03 +0000

flight 162334 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162334/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b233eb1849ac01bdd5b24ea84460a2e481a4c5a9
baseline version:
 ovmf                 fdf3666f01a2dd02d83a808f609b9c744a74c652

Last test of basis   162326  2021-06-01 11:41:13 Z    1 days
Testing same since   162334  2021-06-02 07:41:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marcin Wojtas <mw@semihalf.com>

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
   fdf3666f01..b233eb1849  b233eb1849ac01bdd5b24ea84460a2e481a4c5a9 -> xen-tested-master

