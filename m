Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC930DA4E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 13:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80917.148435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HhY-0002ss-CJ; Wed, 03 Feb 2021 12:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80917.148435; Wed, 03 Feb 2021 12:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HhY-0002sP-8a; Wed, 03 Feb 2021 12:56:08 +0000
Received: by outflank-mailman (input) for mailman id 80917;
 Wed, 03 Feb 2021 12:56:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7HhW-0002s1-J9; Wed, 03 Feb 2021 12:56:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7HhW-00089K-0N; Wed, 03 Feb 2021 12:56:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7HhV-0004e6-M7; Wed, 03 Feb 2021 12:56:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7HhV-0004on-Li; Wed, 03 Feb 2021 12:56:05 +0000
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
	bh=t4C6iUzN+/Vu3LsMI5lE14X0Fgyj7RU43O73sUZ2xsw=; b=5GY1LzwXCPs3BV4kRcpEoPX2Yo
	2HxxxW43njSZJpddLjytCRTnXYgUnWv3Kb0z2cl9cZ0wK4tpmiYsDdTEIyrXXnxiP0FMFKWvST/SR
	CbP9qpWw+9H/bMfKKZVO8u5dRlshsqWekCdEh0bwOhnsQu9cGuliqWr4uWTVkypeFQjA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158975-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158975: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=618e6a1f21a11eaee0a92e19c753969eb4a1b198
X-Osstest-Versions-That:
    ovmf=3f90ac3ec03512e2374cd2968c047a7e856a8965
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Feb 2021 12:56:05 +0000

flight 158975 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158975/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 618e6a1f21a11eaee0a92e19c753969eb4a1b198
baseline version:
 ovmf                 3f90ac3ec03512e2374cd2968c047a7e856a8965

Last test of basis   158959  2021-02-02 16:40:59 Z    0 days
Testing same since   158975  2021-02-03 07:14:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  gechao <gechao@greatwall.com.cn>
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>

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
   3f90ac3ec0..618e6a1f21  618e6a1f21a11eaee0a92e19c753969eb4a1b198 -> xen-tested-master

