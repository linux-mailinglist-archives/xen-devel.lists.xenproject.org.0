Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074F449EC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 23:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223645.386424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkDUi-0007CP-CR; Mon, 08 Nov 2021 22:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223645.386424; Mon, 08 Nov 2021 22:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkDUi-0007AH-9M; Mon, 08 Nov 2021 22:52:04 +0000
Received: by outflank-mailman (input) for mailman id 223645;
 Mon, 08 Nov 2021 22:52:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkDUg-0007A7-Uh; Mon, 08 Nov 2021 22:52:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkDUg-0006Vn-Lp; Mon, 08 Nov 2021 22:52:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkDUg-00027W-6W; Mon, 08 Nov 2021 22:52:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkDUg-0008M4-5z; Mon, 08 Nov 2021 22:52:02 +0000
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
	bh=I8kwN4AArCDiFyjIBPt+7FRbOO6Sd5o2+zJwKKSJQAQ=; b=34Qy5EjoG0zI4NGWzm/vWTLWUR
	aLsn8hU1UlhJXINPOO1O/c8o7MP0RgJe0rCZjrZIeFU6HPysVFzr1WdDIFabyXI7V8FR2ujqDE9NK
	WlpKz0gOGGuEMpl9ZbH9gIFZ9R4BSLPgTQeAA9D/5FQa3C1aiAcFQnRsrMUHI+Bqk9HQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166087-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166087: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fd42dcb1fc416b85bbbee1d546abfb7ac758b5c1
X-Osstest-Versions-That:
    ovmf=b5d4a35d90771ec86ce9cf28727f471ee589fb78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Nov 2021 22:52:02 +0000

flight 166087 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166087/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fd42dcb1fc416b85bbbee1d546abfb7ac758b5c1
baseline version:
 ovmf                 b5d4a35d90771ec86ce9cf28727f471ee589fb78

Last test of basis   166083  2021-11-08 09:12:22 Z    0 days
Testing same since   166087  2021-11-08 18:10:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   b5d4a35d90..fd42dcb1fc  fd42dcb1fc416b85bbbee1d546abfb7ac758b5c1 -> xen-tested-master

