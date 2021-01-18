Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44472F987C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 05:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69386.124121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Lt1-0007Xm-74; Mon, 18 Jan 2021 04:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69386.124121; Mon, 18 Jan 2021 04:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Lt1-0007XM-38; Mon, 18 Jan 2021 04:11:27 +0000
Received: by outflank-mailman (input) for mailman id 69386;
 Mon, 18 Jan 2021 04:11:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Lsz-0007XE-CE; Mon, 18 Jan 2021 04:11:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Lsz-000071-6X; Mon, 18 Jan 2021 04:11:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Lsy-0007Ae-O3; Mon, 18 Jan 2021 04:11:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Lsy-00018o-NL; Mon, 18 Jan 2021 04:11:24 +0000
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
	bh=uzO6mB5+HyIO71TSLiN0FHlqKI5druQZmPeS4wrhfsk=; b=16InFBhlhiTcBCJIKZURDMddc6
	FVkWLAd14byMelOWOAmR6MibAXcdaZDGexUzTlQ2HhSeG4tfwr6NUUSZpwg1sv7jWXBH51ff3KBjK
	0gXFuPYq0apBcXcrtBY49y8t+7y3UFgVbWB1JtVrrHsGXvKEYwLd71IGyZf88nAR1xhY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158479-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158479: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=a7ef2a03b96c464c776a139c104471fb2b84e39b
X-Osstest-Versions-That:
    ovmf=c88736f8605eab3b0877d9301f8e845291c6fdd9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Jan 2021 04:11:24 +0000

flight 158479 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158479/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                    6 xen-build                fail REGR. vs. 158459

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 a7ef2a03b96c464c776a139c104471fb2b84e39b
baseline version:
 ovmf                 c88736f8605eab3b0877d9301f8e845291c6fdd9

Last test of basis   158459  2021-01-16 03:39:47 Z    2 days
Testing same since   158479  2021-01-18 01:39:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zarcd Zhong <zarcd.zhong@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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
commit a7ef2a03b96c464c776a139c104471fb2b84e39b
Author: Zarcd Zhong <zarcd.zhong@intel.com>
Date:   Fri Jan 15 17:34:00 2021 +0800

    MdeModulePkg/PciBusDxe: Handle BAR sizing fail in high 32bit of MEM64.
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3149
    
    Address MEM64 BAR in type unknown if sizing fail in high 32bit.
    
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Signed-off-by: Zarcd Zhong <zarcd.zhong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>

