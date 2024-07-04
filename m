Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B4927E3B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 22:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754004.1162298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPSjR-0004pz-2q; Thu, 04 Jul 2024 20:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754004.1162298; Thu, 04 Jul 2024 20:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPSjQ-0004nl-VA; Thu, 04 Jul 2024 20:07:04 +0000
Received: by outflank-mailman (input) for mailman id 754004;
 Thu, 04 Jul 2024 20:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPSjP-0004nb-W5; Thu, 04 Jul 2024 20:07:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPSjP-0002ZO-Tp; Thu, 04 Jul 2024 20:07:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPSjP-0001sT-HM; Thu, 04 Jul 2024 20:07:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPSjP-0007H8-Gl; Thu, 04 Jul 2024 20:07:03 +0000
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
	bh=XWTDEBY2Gjl5Rz8wP8Iot+Q+Y4nqMb2ZTCtCvdVI6dY=; b=ptMwngCMgyCFloFscvS0u9AZwR
	SvPmSehUo6DSuqklEXc0mCZYK1X5BiobFKgeIFvzVNEfuYXolXe+lKmhuvaeHstXixM8pgqzE5K5M
	uEZhTNfjgCypjndsf4v1CLVANbc5NGfefwHF+blRH5tyZ33L4bRq/GB4bxdUpDEYjFkE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186660-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186660: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdffb638c85da87f6b9d61194513a24cd6a73c6a
X-Osstest-Versions-That:
    ovmf=4e36bed8128f67fc73f41acb1beaffd77ef76e90
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jul 2024 20:07:03 +0000

flight 186660 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186660/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdffb638c85da87f6b9d61194513a24cd6a73c6a
baseline version:
 ovmf                 4e36bed8128f67fc73f41acb1beaffd77ef76e90

Last test of basis   186658  2024-07-04 15:15:09 Z    0 days
Testing same since   186660  2024-07-04 17:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

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
   4e36bed812..cdffb638c8  cdffb638c85da87f6b9d61194513a24cd6a73c6a -> xen-tested-master

