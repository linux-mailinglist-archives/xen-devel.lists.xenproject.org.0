Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535456CCAE2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 21:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516022.799513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phFGL-0001B3-Q6; Tue, 28 Mar 2023 19:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516022.799513; Tue, 28 Mar 2023 19:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phFGL-00019I-NH; Tue, 28 Mar 2023 19:45:45 +0000
Received: by outflank-mailman (input) for mailman id 516022;
 Tue, 28 Mar 2023 19:45:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phFGK-000198-6C; Tue, 28 Mar 2023 19:45:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phFGK-0007Pd-2J; Tue, 28 Mar 2023 19:45:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phFGJ-0005c5-JE; Tue, 28 Mar 2023 19:45:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phFGJ-0001Rj-Io; Tue, 28 Mar 2023 19:45:43 +0000
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
	bh=dQR+ENI8iHiHUYpOAXcRTK+pjiKJyhLQ5frMUcnRCLQ=; b=A3J3D8seGOw3UPmijNELc9zYQ1
	ZxSUcPX3qMd81uMfXlSsSkYaAJDm5bnbrlyeM7n2SHZxqVM8bPXOQW7I78E9TXLiZXIA3T857htg/
	Y1PBgk1yHeiMlcjt/SWIx9u8mS4wviM2i4UJmo12iKNGFx9q7B899cwWEBcgFlLq+t2A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180044: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5eb3d1bcc16fb7dfd0c972bf71278e2c85dfc1ff
X-Osstest-Versions-That:
    ovmf=07e17188df9042d6a6af96f21b0fb7bc5595ec07
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Mar 2023 19:45:43 +0000

flight 180044 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180044/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5eb3d1bcc16fb7dfd0c972bf71278e2c85dfc1ff
baseline version:
 ovmf                 07e17188df9042d6a6af96f21b0fb7bc5595ec07

Last test of basis   180042  2023-03-28 15:13:44 Z    0 days
Testing same since   180044  2023-03-28 17:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jianyong Wu <jianyong.wu@arm.com>

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
   07e17188df..5eb3d1bcc1  5eb3d1bcc16fb7dfd0c972bf71278e2c85dfc1ff -> xen-tested-master

