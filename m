Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A7328B79
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 19:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91932.173542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGnRM-0000yv-7i; Mon, 01 Mar 2021 18:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91932.173542; Mon, 01 Mar 2021 18:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGnRM-0000yT-2O; Mon, 01 Mar 2021 18:38:44 +0000
Received: by outflank-mailman (input) for mailman id 91932;
 Mon, 01 Mar 2021 18:38:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGnRK-0000yL-EX; Mon, 01 Mar 2021 18:38:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGnRK-0006Og-8L; Mon, 01 Mar 2021 18:38:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGnRJ-00019e-TQ; Mon, 01 Mar 2021 18:38:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lGnRJ-0002H3-Ss; Mon, 01 Mar 2021 18:38:41 +0000
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
	bh=HG08BJ+xfeulYl+PULEa1W8ZXINwCOB9REeJ6E+hceM=; b=FOfMYnBXGTyizunCtaoJLFXkAf
	uVVz76sXNZWYwWlx4GIY2sNpYbeSrrgyVztv3TcJOWv0nX3xOyiCfC/ArzbHafAiHMD9CphiNR/5Z
	kVQZGGGimzP09QGnkCYLQ8fOzox3VfbVMoaxLIHvADycbkmXW81HWKOEltQvIFL5Hfvc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159792-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159792: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0996a7883c6dd939d6e769b1ce1fd2b2e250bcfb
X-Osstest-Versions-That:
    ovmf=31eaefd4df78d58ad4087a13f6fc7607b266d04e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Mar 2021 18:38:41 +0000

flight 159792 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159792/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0996a7883c6dd939d6e769b1ce1fd2b2e250bcfb
baseline version:
 ovmf                 31eaefd4df78d58ad4087a13f6fc7607b266d04e

Last test of basis   159741  2021-02-27 11:09:44 Z    2 days
Testing same since   159792  2021-03-01 13:39:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org> # QEMU/kvm guest on ThunderX2
  Ming Huang <huangming@linux.alibaba.com>
  Quan Nguyen <quan@os.amperecomputing.com>

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
   31eaefd4df..0996a7883c  0996a7883c6dd939d6e769b1ce1fd2b2e250bcfb -> xen-tested-master

