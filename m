Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B575460D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jul 2023 03:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563837.881278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKTs0-0006z3-B5; Sat, 15 Jul 2023 01:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563837.881278; Sat, 15 Jul 2023 01:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKTs0-0006xw-7N; Sat, 15 Jul 2023 01:14:48 +0000
Received: by outflank-mailman (input) for mailman id 563837;
 Sat, 15 Jul 2023 01:14:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKTrz-0006xm-Bu; Sat, 15 Jul 2023 01:14:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKTrz-0001zk-01; Sat, 15 Jul 2023 01:14:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKTry-00013S-4p; Sat, 15 Jul 2023 01:14:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qKTry-0006XG-4L; Sat, 15 Jul 2023 01:14:46 +0000
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
	bh=2mcDEyhoWKeFunZ6oKxux+tW1wtnhS+QiK4WWtnQhu8=; b=gwj6+xABOPdZXniIMUPYn/vm3j
	cSGy1BXWYzVJRatP2UrqTaLGelLfDYwfA+3w8O7Z/WSBBwTgcRoQnuOJ+UlMm4przhhW4SKydf+OA
	9iwgaS5BGPWsCiXP2J9E76VS4r73GqyWyaL6yPPkGZTDVLvq8m1U5o//iGMt0ZxFdc+w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181802-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181802: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
X-Osstest-Versions-This:
    ovmf=e674096accc8e57cd0dd84679905e1222423251e
X-Osstest-Versions-That:
    ovmf=ff3382a51ca726a90f49623a2b2d2e8ad8459ce2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jul 2023 01:14:46 +0000

flight 181802 ovmf real [real]
flight 181804 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181802/
http://logs.test-lab.xenproject.org/osstest/logs/181804/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 181786

version targeted for testing:
 ovmf                 e674096accc8e57cd0dd84679905e1222423251e
baseline version:
 ovmf                 ff3382a51ca726a90f49623a2b2d2e8ad8459ce2

Last test of basis   181786  2023-07-13 17:42:16 Z    1 days
Testing same since   181802  2023-07-14 23:12:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tom Lendacky <thomas.lendacky@amd.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


Not pushing.

------------------------------------------------------------
commit e674096accc8e57cd0dd84679905e1222423251e
Author: Tom Lendacky <thomas.lendacky@amd.com>
Date:   Fri Jul 14 15:28:26 2023 -0500

    OvmfPkg/ResetVector: Fix assembler bit test flag check
    
    Commit 63c50d3ff2854a76432b752af4f2a76f33ff1974 changed the check that is
    used to determine if SEV-ES is active. Originally, a CMP instruction with
    a supporting JZ instruction was used for the check. It was changed to use
    the BT instruction but not JZ instruction. The result of a BT instruction
    changes the the carry flag (CF) and not the zero flag (ZF). As a result,
    the wrong condition is being checked. Update the JZ to a JNC to properly
    detect if SEV-ES is active.
    
    Fixes: 63c50d3ff285 ("OvmfPkg/ResetVector: cache the SEV status MSR...")
    Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

