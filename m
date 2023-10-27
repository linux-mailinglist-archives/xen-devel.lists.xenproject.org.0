Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA67D8ED8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 08:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624210.972579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGTU-0002g7-PA; Fri, 27 Oct 2023 06:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624210.972579; Fri, 27 Oct 2023 06:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGTU-0002d2-JT; Fri, 27 Oct 2023 06:37:40 +0000
Received: by outflank-mailman (input) for mailman id 624210;
 Fri, 27 Oct 2023 06:37:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwGTS-0002aS-Ti; Fri, 27 Oct 2023 06:37:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwGTS-0003WS-MV; Fri, 27 Oct 2023 06:37:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwGTS-000080-7J; Fri, 27 Oct 2023 06:37:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwGTS-0007r2-6r; Fri, 27 Oct 2023 06:37:38 +0000
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
	bh=jxD6UPj9k5pYJW8QE0OGGL2CKswHjkDSnUhxr51+Lqw=; b=TcSkexsEtPPwfZRu6lssVKzrIw
	YUFQME+HRzUD6A3TLJmtBshrdfaQ91S1t9Q6GGkhp7D0dYqE1vQuS6CMJvRwMujT/4CXNttIltCbB
	/bF+oPZTR+OHgg49o+bZeZ1K839zweA2TVP9UsD9niFO5q+N+Vd7f8q7z/MQzYIcbSbE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183548-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183548: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad
X-Osstest-Versions-That:
    ovmf=ca32f75fc6ba4a41a65b5ea83eaa21d209bae570
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Oct 2023 06:37:38 +0000

flight 183548 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183548/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad
baseline version:
 ovmf                 ca32f75fc6ba4a41a65b5ea83eaa21d209bae570

Last test of basis   183546  2023-10-27 01:13:59 Z    0 days
Testing same since   183548  2023-10-27 03:17:33 Z    0 days    1 attempts

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
   ca32f75fc6..7e08d17a4a  7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad -> xen-tested-master

