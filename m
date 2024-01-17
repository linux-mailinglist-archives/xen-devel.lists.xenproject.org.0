Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433F82FEBF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 03:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668215.1040245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPvYO-0005Li-54; Wed, 17 Jan 2024 02:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668215.1040245; Wed, 17 Jan 2024 02:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPvYO-0005In-11; Wed, 17 Jan 2024 02:21:20 +0000
Received: by outflank-mailman (input) for mailman id 668215;
 Wed, 17 Jan 2024 02:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPvYM-0005Ib-S0; Wed, 17 Jan 2024 02:21:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPvYM-0003b3-IV; Wed, 17 Jan 2024 02:21:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPvYM-0003GV-5H; Wed, 17 Jan 2024 02:21:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPvYM-0000A2-4Y; Wed, 17 Jan 2024 02:21:18 +0000
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
	bh=jlqWPuO5y0GM2SgUAq+Ur1T4uZ5AiPi0gV0s6QDet28=; b=mw7c1YFg1b+GWKp23rNHiesyZc
	1FrEXYdJQ78DpidDmIw+9K6EJdiFCpmZlBH+RPoCtsnRRKCHRjGOgHbCHfWUqM8ZBe69n6mNxisWE
	r6xbH3Bdr4sh8hzdc4olsjBVpBWHgFzmO9IGgtFTt8O8NwsMcfn2Lf5nhgGBcQdCXhEY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184379-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184379: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=59f024c76ee57c2bec84794536302fc770cd6ec2
X-Osstest-Versions-That:
    ovmf=9971b99461e930008e3d35bc0a4a310b6afa57f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jan 2024 02:21:18 +0000

flight 184379 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184379/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 59f024c76ee57c2bec84794536302fc770cd6ec2
baseline version:
 ovmf                 9971b99461e930008e3d35bc0a4a310b6afa57f6

Last test of basis   184371  2024-01-16 09:42:46 Z    0 days
Testing same since   184379  2024-01-16 23:44:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   9971b99461..59f024c76e  59f024c76ee57c2bec84794536302fc770cd6ec2 -> xen-tested-master

