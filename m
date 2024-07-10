Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAB492D9E8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 22:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757058.1165793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRdhj-0006vk-8p; Wed, 10 Jul 2024 20:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757058.1165793; Wed, 10 Jul 2024 20:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRdhj-0006uC-63; Wed, 10 Jul 2024 20:14:19 +0000
Received: by outflank-mailman (input) for mailman id 757058;
 Wed, 10 Jul 2024 20:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRdhh-0006u2-B1; Wed, 10 Jul 2024 20:14:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRdhh-00026O-6M; Wed, 10 Jul 2024 20:14:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRdhg-00021p-UT; Wed, 10 Jul 2024 20:14:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sRdhg-00077V-Tw; Wed, 10 Jul 2024 20:14:16 +0000
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
	bh=QJTGxyxGUD2PYQSs6i+u2f0NnFRudiTYQOYnbAVSS7g=; b=V17xqigQxAGCmJgNVR3GTjtTgy
	v5z3XIT4pNwQEmOyMtFRTCGFqmZKJdVk4e4JVbY8e+G8O5lDfzZDljJmcBrvo/TqcsAvea7Nvh2Ox
	jcWU+k0klfQtnexDsyjJftp0MbAA69fMcwe1bvykM07R5CrKk4kTLx2qzkWrpbHSis/U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186755-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186755: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0f45be16336035e69bb30761f8cd20ba3b0a3f39
X-Osstest-Versions-That:
    ovmf=6c061c4715325494b8b25453158166f9032e0335
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jul 2024 20:14:16 +0000

flight 186755 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186755/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0f45be16336035e69bb30761f8cd20ba3b0a3f39
baseline version:
 ovmf                 6c061c4715325494b8b25453158166f9032e0335

Last test of basis   186754  2024-07-10 15:43:05 Z    0 days
Testing same since   186755  2024-07-10 18:14:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   6c061c4715..0f45be1633  0f45be16336035e69bb30761f8cd20ba3b0a3f39 -> xen-tested-master

