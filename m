Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316A90CD76
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743076.1149969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYf7-0000De-2C; Tue, 18 Jun 2024 13:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743076.1149969; Tue, 18 Jun 2024 13:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYf6-0000Ar-VF; Tue, 18 Jun 2024 13:14:12 +0000
Received: by outflank-mailman (input) for mailman id 743076;
 Tue, 18 Jun 2024 13:14:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJYf5-0000Ag-HB; Tue, 18 Jun 2024 13:14:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJYf5-0001LH-GK; Tue, 18 Jun 2024 13:14:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJYf5-0003l2-9B; Tue, 18 Jun 2024 13:14:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJYf5-0002iW-8b; Tue, 18 Jun 2024 13:14:11 +0000
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
	bh=tKJfor7VtybYBktKn6/7mI11ujD8+KApXHwaPKq/I9Q=; b=Y9dyUWJDrl1I52a3CyZpswvg2a
	B6cdS3mZj5TXimE2fCqGxo3JrjWkyp8L9H08bal3d2xNl+e6jH4AK5FqMcmKVR83kKT5maElYIdKP
	MuCNZJcRvvoAM3QGBxYMi3EaSp1MP6SBHYT1Es3Bvyxp3GjE9KmH9Oc8pZ9foT+Jy6pA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186394-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186394: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b0c5781671f322472836ff25ee11242f59aa9945
X-Osstest-Versions-That:
    ovmf=176b9d41f8f71c7572dab615a8d5259dd2cbc02a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 13:14:11 +0000

flight 186394 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186394/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b0c5781671f322472836ff25ee11242f59aa9945
baseline version:
 ovmf                 176b9d41f8f71c7572dab615a8d5259dd2cbc02a

Last test of basis   186392  2024-06-18 07:42:57 Z    0 days
Testing same since   186394  2024-06-18 11:42:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   176b9d41f8..b0c5781671  b0c5781671f322472836ff25ee11242f59aa9945 -> xen-tested-master

