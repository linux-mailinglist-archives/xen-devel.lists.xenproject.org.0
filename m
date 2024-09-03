Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E096941A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788633.1198066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNKF-000889-HK; Tue, 03 Sep 2024 06:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788633.1198066; Tue, 03 Sep 2024 06:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNKF-000868-El; Tue, 03 Sep 2024 06:47:39 +0000
Received: by outflank-mailman (input) for mailman id 788633;
 Tue, 03 Sep 2024 06:47:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slNKD-00085y-M6; Tue, 03 Sep 2024 06:47:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slNKD-0006AG-HV; Tue, 03 Sep 2024 06:47:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slNKD-0004ZN-12; Tue, 03 Sep 2024 06:47:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slNKD-00058U-0V; Tue, 03 Sep 2024 06:47:37 +0000
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
	bh=VfQ4dEYLwaz/WKTSdYS6loz7QI0dtUu1C3egv4fpiMc=; b=wbRdfgmDYoRHEUcDghhvackrAz
	RTPcr5rTlEqGRGBmkSqyntLmJl8Xv9Uu7M3R3I2ZUQo09XUp6ZSBMJvsYbt7w1g7+PIv1rUE0Mcro
	h5570FhGtpljPiziLBX/ByhlfQSlB4FkUFwGQLK54qPShdun41/JhXj4TSAt822dW3aM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187464-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187464: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=a859f4fc0397ec4a9d1af016b7e1f03ccf14b605
X-Osstest-Versions-That:
    ovmf=909849be87a7f931f9fb627522cc664c06987712
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 06:47:37 +0000

flight 187464 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187464/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 187463
 build-i386                    6 xen-build                fail REGR. vs. 187463

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 ovmf                 a859f4fc0397ec4a9d1af016b7e1f03ccf14b605
baseline version:
 ovmf                 909849be87a7f931f9fb627522cc664c06987712

Last test of basis   187463  2024-09-03 02:42:49 Z    0 days
Testing same since   187464  2024-09-03 04:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  John Baldwin <jhb@FreeBSD.org>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
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


Not pushing.

------------------------------------------------------------
commit a859f4fc0397ec4a9d1af016b7e1f03ccf14b605
Author: John Baldwin <jhb@FreeBSD.org>
Date:   Mon Oct 3 15:47:08 2022 -0700

    MdePkg: Fix a buffer overread.
    
    DevPathToTextUsbWWID allocates a separate copy of the SerialNumber
    string to append a null terminator if the original string is not null
    terminated.  However, by using AllocateCopyPool, it tries to copy
    'Length + 1' words from the existing string containing 'Length'
    characters into the target string.  Split the copy out to only copy
    'Length' characters instead.
    
    This was reported by GCC's -Wstringop-overread when compiling a copy
    of this routine included in a library on FreeBSD.
    
    Signed-off-by: John Baldwin <jhb@FreeBSD.org>

