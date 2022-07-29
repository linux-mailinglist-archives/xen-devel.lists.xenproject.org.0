Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9925856B1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 23:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377881.611180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXz0-0002pB-0l; Fri, 29 Jul 2022 21:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377881.611180; Fri, 29 Jul 2022 21:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXyz-0002lg-U1; Fri, 29 Jul 2022 21:57:21 +0000
Received: by outflank-mailman (input) for mailman id 377881;
 Fri, 29 Jul 2022 21:57:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHXyy-0002lW-3P; Fri, 29 Jul 2022 21:57:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHXyy-0004Am-2U; Fri, 29 Jul 2022 21:57:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHXyx-00042j-Ls; Fri, 29 Jul 2022 21:57:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHXyx-0007Ij-LM; Fri, 29 Jul 2022 21:57:19 +0000
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
	bh=1ur2yIiNNACfKUxxZtzfU8wlsxaJy5e1MgczKg5BRu4=; b=RKOpAxDQZ2tZEtuuezT0OTbWjl
	UqFOR//tAfsOzDWejvIz/WWwGKoDGv3aIumn4wjex2mAjdku9Vz2CmuZnZDm5xrygu7YNRi31gKON
	G0bxQlyFS0qc+/uQjncWFyFTRa/WWdbd2gN0nFEAJKgNSxLPR/qmDTlheQYxWU7j4NbU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171929-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171929: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e9150618ec91f79e70a1719ac8c198bee34a99be
X-Osstest-Versions-That:
    ovmf=0d0bfcb4571caa65b7875003f38e67e2ac7e5560
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jul 2022 21:57:19 +0000

flight 171929 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171929/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e9150618ec91f79e70a1719ac8c198bee34a99be
baseline version:
 ovmf                 0d0bfcb4571caa65b7875003f38e67e2ac7e5560

Last test of basis   171913  2022-07-29 03:12:41 Z    0 days
Testing same since   171929  2022-07-29 19:42:00 Z    0 days    1 attempts

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
   0d0bfcb457..e9150618ec  e9150618ec91f79e70a1719ac8c198bee34a99be -> xen-tested-master

