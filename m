Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29F90093E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 17:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736567.1142671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFbbx-0000lk-8Z; Fri, 07 Jun 2024 15:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736567.1142671; Fri, 07 Jun 2024 15:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFbbx-0000kB-5k; Fri, 07 Jun 2024 15:34:37 +0000
Received: by outflank-mailman (input) for mailman id 736567;
 Fri, 07 Jun 2024 15:34:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFbbv-0000jz-IC; Fri, 07 Jun 2024 15:34:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFbbv-0007Vr-G0; Fri, 07 Jun 2024 15:34:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFbbv-0000Ua-3n; Fri, 07 Jun 2024 15:34:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFbbv-0000pQ-3F; Fri, 07 Jun 2024 15:34:35 +0000
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
	bh=x3KbdluITuhFmCZk4cBzmY0POdm8Dc0mhwytOqHk3zA=; b=bUUt/E3w9XESkDREfYdoT6orJi
	bwGwhiKqvv3yO9I8/sBgMoz1AG23uqNE7kcNV7YJPS8Z5YxzFvsHuBiuG+g86cgY+sICW7uKfFd2N
	EaZpp04UJrbtqTe1Rp7BNrDy8/cgUgHrd39gbpzjrTq8MrOxt1oEmXVM2RE6Ut8Lzs5Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186280-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186280: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=948f23417010309a5557d46195eae258f6105025
X-Osstest-Versions-That:
    ovmf=8c826be35c736f4b718c8f927853aa957a1973d8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 15:34:35 +0000

flight 186280 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186280/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 948f23417010309a5557d46195eae258f6105025
baseline version:
 ovmf                 8c826be35c736f4b718c8f927853aa957a1973d8

Last test of basis   186277  2024-06-07 11:42:56 Z    0 days
Testing same since   186280  2024-06-07 13:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sebastian Witt <sebastian.witt@siemens.com>

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
   8c826be35c..948f234170  948f23417010309a5557d46195eae258f6105025 -> xen-tested-master

