Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0B7DBBD8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625159.974153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTKc-0007vj-NV; Mon, 30 Oct 2023 14:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625159.974153; Mon, 30 Oct 2023 14:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTKc-0007u5-JU; Mon, 30 Oct 2023 14:33:30 +0000
Received: by outflank-mailman (input) for mailman id 625159;
 Mon, 30 Oct 2023 14:33:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxTKa-0007t5-GW; Mon, 30 Oct 2023 14:33:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxTKa-00036h-CO; Mon, 30 Oct 2023 14:33:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxTKZ-0006m3-WE; Mon, 30 Oct 2023 14:33:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qxTKZ-0002FW-Vl; Mon, 30 Oct 2023 14:33:27 +0000
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
	bh=B0SmYC8VodLHDthOE2cCN8q54PDIX5eiCSkKCiIKdss=; b=pOTM/y6UES1ucvunrU0R9RWcyI
	5xA+7LrAEZ1mi8E86AiHPt6o7ZqQdtZx4lps6YCKD6SATz1/X1Am1Ic5O1Eh707phwaqe0Ji4PmwK
	3gg94GrXn6/Re1x79PqjnX+CWCgNCoPsRzmjrtni7NxMIvcYGCRyccuSerY/iPVpXRXE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183619-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183619: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a671a14e63fdaa9490e5c61cf11346416f1d1463
X-Osstest-Versions-That:
    ovmf=4f3ee7fbafc8e83c20f273f4db6c24fe240f6a94
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Oct 2023 14:33:27 +0000

flight 183619 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183619/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a671a14e63fdaa9490e5c61cf11346416f1d1463
baseline version:
 ovmf                 4f3ee7fbafc8e83c20f273f4db6c24fe240f6a94

Last test of basis   183582  2023-10-28 19:11:00 Z    1 days
Testing same since   183619  2023-10-30 12:41:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   4f3ee7fbaf..a671a14e63  a671a14e63fdaa9490e5c61cf11346416f1d1463 -> xen-tested-master

