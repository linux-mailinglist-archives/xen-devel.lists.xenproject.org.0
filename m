Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0E269761C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 07:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495725.766142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSAtp-0000Yc-33; Wed, 15 Feb 2023 06:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495725.766142; Wed, 15 Feb 2023 06:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSAto-0000Wg-WF; Wed, 15 Feb 2023 06:04:13 +0000
Received: by outflank-mailman (input) for mailman id 495725;
 Wed, 15 Feb 2023 06:04:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSAtn-0000WW-6Z; Wed, 15 Feb 2023 06:04:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSAtn-0008AS-4e; Wed, 15 Feb 2023 06:04:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSAtm-00068C-RM; Wed, 15 Feb 2023 06:04:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pSAtm-0002Vk-Qn; Wed, 15 Feb 2023 06:04:10 +0000
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
	bh=qxgppFVlJxuRlP7qVWR0osHDDJbm2/uDEOc/JYiNqOA=; b=tfS+VeLStBMCQ7J8RbTw04RVA1
	RIhLonjPGg10nzE3FrpR8UI6FMEBXEynKKS9aA8Zo/sC2czzrJ03YJKo3rPnEYPPYoyp1jv3kBxaC
	3zlpO0PllTWmxWp+w6kKoISLn2UhiucROiJZ7MU8vokIqKgPwHMoDdY5dPhuA4kQMaek=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177343-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177343: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=090642db7ac124c336da72e1954e1fb09e816fb0
X-Osstest-Versions-That:
    ovmf=1b5420e8071b4f9ba13136f19365542dfe66bf04
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Feb 2023 06:04:10 +0000

flight 177343 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177343/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 090642db7ac124c336da72e1954e1fb09e816fb0
baseline version:
 ovmf                 1b5420e8071b4f9ba13136f19365542dfe66bf04

Last test of basis   177328  2023-02-15 00:12:28 Z    0 days
Testing same since   177343  2023-02-15 03:35:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  devel@edk2.groups.io <devel@edk2.groups.io>
  Jeff Brasen <jbrasen@nvidia.com>
  Jiangang He <jiangang.he@amd.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   1b5420e807..090642db7a  090642db7ac124c336da72e1954e1fb09e816fb0 -> xen-tested-master

