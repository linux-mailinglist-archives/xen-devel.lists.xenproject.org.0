Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991917D15FA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619963.965843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtuYZ-0004P6-8V; Fri, 20 Oct 2023 18:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619963.965843; Fri, 20 Oct 2023 18:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtuYZ-0004Mq-50; Fri, 20 Oct 2023 18:49:11 +0000
Received: by outflank-mailman (input) for mailman id 619963;
 Fri, 20 Oct 2023 18:49:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtuYX-0004MG-4R; Fri, 20 Oct 2023 18:49:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtuYX-0002n0-3V; Fri, 20 Oct 2023 18:49:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtuYW-0007X6-P2; Fri, 20 Oct 2023 18:49:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtuYW-0000qc-OW; Fri, 20 Oct 2023 18:49:08 +0000
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
	bh=lbZ7b94M5wVZltb/msPCBrVLXgYoH6jimPQY8jUuiIk=; b=HNn/JY4AFuiIiGgjLwCf8mSA+z
	dBXfgpuLp1YiDqXKTmYVmpGhruh8Z+iTWQU0b+Bfj3wubE4yzAzqJpGtD7b14PJHoSac7gQxIeG0u
	YKv0Tlnfzs1lEY4lhcBtn+lUPRJsQ8F+vl8guHOR8uXnHEig/4Br1LbPQSL5gsZif8bY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183445-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183445: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c591395f4ab5359c14e783481473685cf432fe75
X-Osstest-Versions-That:
    ovmf=bed477d9cf727c1061f1203c5cd61fe1af2e9c19
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Oct 2023 18:49:08 +0000

flight 183445 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183445/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c591395f4ab5359c14e783481473685cf432fe75
baseline version:
 ovmf                 bed477d9cf727c1061f1203c5cd61fe1af2e9c19

Last test of basis   183439  2023-10-20 03:42:29 Z    0 days
Testing same since   183445  2023-10-20 13:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
  John Chew <yuinyee.chew@starfivetech.com>

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
   bed477d9cf..c591395f4a  c591395f4ab5359c14e783481473685cf432fe75 -> xen-tested-master

