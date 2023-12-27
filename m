Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A781EB67
	for <lists+xen-devel@lfdr.de>; Wed, 27 Dec 2023 03:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660056.1029660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIJCp-0005uF-Uv; Wed, 27 Dec 2023 01:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660056.1029660; Wed, 27 Dec 2023 01:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIJCp-0005rd-SD; Wed, 27 Dec 2023 01:59:35 +0000
Received: by outflank-mailman (input) for mailman id 660056;
 Wed, 27 Dec 2023 01:59:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rIJCo-0005r4-9j; Wed, 27 Dec 2023 01:59:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rIJCo-0008WS-3o; Wed, 27 Dec 2023 01:59:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rIJCn-0005de-He; Wed, 27 Dec 2023 01:59:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rIJCn-0000X9-HC; Wed, 27 Dec 2023 01:59:33 +0000
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
	bh=m8C0P6+bxsXLEfuTfugS+5TFD20cUqUqUJRJmEXmcOQ=; b=6eqwelI4rvGJ1Hja1bl/XRsLzY
	21kQKLEjuJpdfAQDfmbVBGHlkBq1v2PqTBv8kRXj5Jb+RONbka2mBI/rkeOScxiR6lVYgRAWoQRm1
	cktC12DeCk+Y7BdeU1MaKSq9zP5cQ+/UO7oA02zmcfiAiq6l3JSUTGuf3qOYtaZKAtlk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184228-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184228: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d7d4f09ff815794761f84d06e307001afe6376c4
X-Osstest-Versions-That:
    ovmf=58d94639390803e375a7d16c94a5a527ec158474
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Dec 2023 01:59:33 +0000

flight 184228 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184228/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d7d4f09ff815794761f84d06e307001afe6376c4
baseline version:
 ovmf                 58d94639390803e375a7d16c94a5a527ec158474

Last test of basis   184227  2023-12-26 07:41:11 Z    0 days
Testing same since   184228  2023-12-27 00:12:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   58d9463939..d7d4f09ff8  d7d4f09ff815794761f84d06e307001afe6376c4 -> xen-tested-master

