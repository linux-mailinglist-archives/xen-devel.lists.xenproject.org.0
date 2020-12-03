Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142632CD580
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43396.77998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknjQ-000459-ST; Thu, 03 Dec 2020 12:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43396.77998; Thu, 03 Dec 2020 12:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknjQ-00044d-OF; Thu, 03 Dec 2020 12:29:08 +0000
Received: by outflank-mailman (input) for mailman id 43396;
 Thu, 03 Dec 2020 12:29:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kknjP-00044V-FE; Thu, 03 Dec 2020 12:29:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kknjP-0003pW-7R; Thu, 03 Dec 2020 12:29:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kknjO-0003jh-Vl; Thu, 03 Dec 2020 12:29:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kknjO-0006BM-VL; Thu, 03 Dec 2020 12:29:06 +0000
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
	bh=MsKBq3r6Rne1lS5f2tV14ccGvGLO0ZFMEFVBN+U5AnM=; b=klQwEaHyZGwIw3Jow4A2kzS+PC
	va16s39KDpy4w8N33dvbV5D+e6+OU3Nygs3sv4QgWwxpuBYuFcjntksNvk3sjEY68nflEFUfQc4f3
	bIKe3nDdguiM+HSJH7i6clki6w5lRO81XdMS80eklEdaoJvCnoANSOTLNj/vh48U+jDk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157167-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157167: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7c4ab1c2ef60a4690177d2361f8dd44d7d7df7f8
X-Osstest-Versions-That:
    ovmf=9fb629edd75e1ae1e7f4e85b0876107a7180899b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Dec 2020 12:29:06 +0000

flight 157167 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157167/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7c4ab1c2ef60a4690177d2361f8dd44d7d7df7f8
baseline version:
 ovmf                 9fb629edd75e1ae1e7f4e85b0876107a7180899b

Last test of basis   157117  2020-11-30 18:12:47 Z    2 days
Testing same since   157167  2020-12-02 23:40:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   9fb629edd7..7c4ab1c2ef  7c4ab1c2ef60a4690177d2361f8dd44d7d7df7f8 -> xen-tested-master

