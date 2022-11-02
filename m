Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0DF616246
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435837.689667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCN9-0000xY-K5; Wed, 02 Nov 2022 11:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435837.689667; Wed, 02 Nov 2022 11:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCN9-0000ur-GO; Wed, 02 Nov 2022 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 435837;
 Wed, 02 Nov 2022 11:57:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqCN7-0000uh-Oh; Wed, 02 Nov 2022 11:57:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqCN7-0000aD-Ms; Wed, 02 Nov 2022 11:57:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqCN7-00006E-7h; Wed, 02 Nov 2022 11:57:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oqCN7-0005ze-79; Wed, 02 Nov 2022 11:57:29 +0000
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
	bh=lexQ80W3E+PQ7d7GDkpqcX+Wlmy1xXyr99s99d5IAw0=; b=PmYvQSqqFQAhLUzy5ji4/b8C6u
	cPIWmbs7yh9fB1FQ8LoogtmjQEIxW67O0YMyR0gCu+EASeXtu+0vYNoiPZfKsinP8ghPcmI9Da3Jq
	S+6SzTT3iiqN6sk1F6LOi6c2Sgy8uadByx7/qIxa8Kp39S+BI8RRK3daVP/EZIjNXtrA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174577-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174577: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b5dbf8267b2596f4a28cdb30d1f533b958ddd4ed
X-Osstest-Versions-That:
    ovmf=85dba961c761021755cd2aa6bc98b8e789f751ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Nov 2022 11:57:29 +0000

flight 174577 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174577/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b5dbf8267b2596f4a28cdb30d1f533b958ddd4ed
baseline version:
 ovmf                 85dba961c761021755cd2aa6bc98b8e789f751ef

Last test of basis   174569  2022-11-01 15:10:52 Z    0 days
Testing same since   174577  2022-11-02 02:43:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   85dba961c7..b5dbf8267b  b5dbf8267b2596f4a28cdb30d1f533b958ddd4ed -> xen-tested-master

