Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF7918DF2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 20:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749405.1157498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMX5C-0001Kk-QL; Wed, 26 Jun 2024 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749405.1157498; Wed, 26 Jun 2024 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMX5C-0001Ir-Mc; Wed, 26 Jun 2024 18:09:26 +0000
Received: by outflank-mailman (input) for mailman id 749405;
 Wed, 26 Jun 2024 18:09:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMX5A-0001IH-Vt; Wed, 26 Jun 2024 18:09:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMX5A-00054k-TP; Wed, 26 Jun 2024 18:09:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMX5A-0005xF-Km; Wed, 26 Jun 2024 18:09:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMX5A-00074d-KA; Wed, 26 Jun 2024 18:09:24 +0000
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
	bh=baDeLtgmACIMnD3Nw5qzBI09ph95imnx5YW2ryEE4Ac=; b=hrIiqsL6cJptR8g9Dvg6Z6IyLH
	WTqiSYaMErwyMmmcHj/y17YToRKw3kVneBc52BTBOhtnru7sERjqv6o5tzoCZUMUJ9YwKe7D4u27Z
	BPyMWIhi5hX5G37uGyW+8fLjHJcfAxGADuTEKrccZU3TTW1PEohteRX7LBE+pCntfIjE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186519-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186519: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-pvops:kernel-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=ae09721a65ab3294439f6fa233adaf3b897f702f
X-Osstest-Versions-That:
    ovmf=89377ece8f1c7243d25fd84488dcd03e37b9e661
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2024 18:09:24 +0000

flight 186519 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186519/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops             6 kernel-build             fail REGR. vs. 186516
 build-amd64-xsm               6 xen-build                fail REGR. vs. 186516
 build-amd64                   6 xen-build                fail REGR. vs. 186516

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 ovmf                 ae09721a65ab3294439f6fa233adaf3b897f702f
baseline version:
 ovmf                 89377ece8f1c7243d25fd84488dcd03e37b9e661

Last test of basis   186516  2024-06-26 12:41:06 Z    0 days
Testing same since   186519  2024-06-26 16:43:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gaurav Pandya <gaurav.pandya@amd.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            fail    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 


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
commit ae09721a65ab3294439f6fa233adaf3b897f702f
Author: Gaurav Pandya <gaurav.pandya@amd.com>
Date:   Wed Sep 20 20:37:49 2023 +0800

    MdeModulePkg/DisplayEngineDxe: Support "^" and "V" key on pop-up form
    
    BZ #4790
    Support "^" and "V" key stokes on the pop-up form. Align the
    implementation with key support on the regular HII form.
    
    Signed-off-by: Gaurav Pandya <gaurav.pandya@amd.com>

