Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2346FFE3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 12:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243779.421808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mve6e-0001Yw-MF; Fri, 10 Dec 2021 11:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243779.421808; Fri, 10 Dec 2021 11:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mve6e-0001X6-Ip; Fri, 10 Dec 2021 11:30:28 +0000
Received: by outflank-mailman (input) for mailman id 243779;
 Fri, 10 Dec 2021 11:30:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mve6c-0001Ww-R8; Fri, 10 Dec 2021 11:30:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mve6c-0004Kc-K0; Fri, 10 Dec 2021 11:30:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mve6c-0007vw-A0; Fri, 10 Dec 2021 11:30:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mve6c-0002a9-9X; Fri, 10 Dec 2021 11:30:26 +0000
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
	bh=z+2pSqdwEr40GCQMir+lu/47H/zcBZ1hyiXKYty//iY=; b=e5lGrxT5iZ+7DWHpxnpdEr4kr4
	IbUU88xW8NCzaYYOIgItjz+Ej9Jh37xzZRxZ1mSQDUtdSJXxILSx7w0F5RNaNN3A0YDMdXWoCuVj5
	fv7+YranWfdQoJ9WNjVjXw/tJxsro0AsDXS0m9KCVWXPfKbqxdrVDGR8T00c8SxcCMAM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167338-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167338: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=0f1d7477c0a86a31e2edede7d3a3c74087bb6e21
X-Osstest-Versions-That:
    ovmf=c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Dec 2021 11:30:26 +0000

flight 167338 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167338/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 167239
 build-i386-xsm                6 xen-build                fail REGR. vs. 167239
 build-i386                    6 xen-build                fail REGR. vs. 167239
 build-amd64-xsm               6 xen-build                fail REGR. vs. 167239

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 0f1d7477c0a86a31e2edede7d3a3c74087bb6e21
baseline version:
 ovmf                 c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d

Last test of basis   167239  2021-12-09 06:23:17 Z    1 days
Failing since        167240  2021-12-09 08:42:46 Z    1 days   27 attempts
Testing same since   167338  2021-12-10 10:40:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Brijesh Singh via groups.io <brijesh.singh=amd.com@groups.io>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Roth <michael.roth@amd.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
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

(No revision log; it would be 1070 lines long.)

