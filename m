Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14E326C3A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 09:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90717.171718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFuwR-0002ka-U1; Sat, 27 Feb 2021 08:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90717.171718; Sat, 27 Feb 2021 08:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFuwR-0002k6-Q4; Sat, 27 Feb 2021 08:27:11 +0000
Received: by outflank-mailman (input) for mailman id 90717;
 Sat, 27 Feb 2021 08:27:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuwP-0002jy-Sf; Sat, 27 Feb 2021 08:27:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuwP-0001lv-Ml; Sat, 27 Feb 2021 08:27:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuwP-00079d-G2; Sat, 27 Feb 2021 08:27:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuwP-0006Wj-FZ; Sat, 27 Feb 2021 08:27:09 +0000
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
	bh=GCNbpwN5rAPct8ZPBvqI9M2yw1JLqvvvbH4IdmDFQzo=; b=4l1MZ3XSXTPMWt3Dct+vUjRuA/
	RHWpaRS5/Wb+2b4+bhVvp7b+57F1KIyw7eoZw+LdBk5Qz3lwNfmphMdRUopu+OfnxdhzIIfRL/q02
	vY8n653K9+a2y2h7cFqe/DSLrqsn5wglp/WZWl72JjgsA6ygHLGmbUGWHghjiFG2NsVU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159721: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cd14150c1594d8deeee6ecf80feb5751dcd7f315
X-Osstest-Versions-That:
    ovmf=62f2cf57840e3b08122b6326b0ed9f4b25ce15d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Feb 2021 08:27:09 +0000

flight 159721 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159721/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cd14150c1594d8deeee6ecf80feb5751dcd7f315
baseline version:
 ovmf                 62f2cf57840e3b08122b6326b0ed9f4b25ce15d9

Last test of basis   159708  2021-02-26 12:45:22 Z    0 days
Testing same since   159721  2021-02-26 23:39:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Laszlo Ersek <lersek@redhat.com>
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
   62f2cf5784..cd14150c15  cd14150c1594d8deeee6ecf80feb5751dcd7f315 -> xen-tested-master

