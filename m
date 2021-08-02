Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41793DD668
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163030.298761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXcf-0007ai-8s; Mon, 02 Aug 2021 13:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163030.298761; Mon, 02 Aug 2021 13:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXcf-0007Y4-54; Mon, 02 Aug 2021 13:04:49 +0000
Received: by outflank-mailman (input) for mailman id 163030;
 Mon, 02 Aug 2021 13:04:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAXcd-0007Xu-6i; Mon, 02 Aug 2021 13:04:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAXcc-0007ID-UO; Mon, 02 Aug 2021 13:04:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAXcc-0001yJ-Kb; Mon, 02 Aug 2021 13:04:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mAXcc-0005Ha-K5; Mon, 02 Aug 2021 13:04:46 +0000
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
	bh=wAQvF2F+5x5SxM6rxoIXQAeBQD5hKmSvmwDublS04Nc=; b=lDqf00paEHletFcrypD9xFJzNq
	5k1ivgw/DOfciCbfYFgGqFYICUm0TviC6HDbOrK8CSiykbfwgx60kaAnW/67t1Ss5oCOdzSM0vsKW
	xSw5f7hsqkB8JT8/HyhOyaH82cfTP6iecIBuOmaWhSyl7RWpXujLUXuYE32HsN3yD5LI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164081: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=03e77558d4939b9c21e94f03072360e9b00bb559
X-Osstest-Versions-That:
    ovmf=3445058aea4f64a994e4ec040135258a135d36ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Aug 2021 13:04:46 +0000

flight 164081 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164081/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 03e77558d4939b9c21e94f03072360e9b00bb559
baseline version:
 ovmf                 3445058aea4f64a994e4ec040135258a135d36ce

Last test of basis   164078  2021-08-02 02:10:07 Z    0 days
Testing same since   164081  2021-08-02 08:41:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Cole <crobinso@redhat.com>
  Cole Robinson <crobinso@redhat.com>

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
   3445058aea..03e77558d4  03e77558d4939b9c21e94f03072360e9b00bb559 -> xen-tested-master

