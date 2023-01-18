Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43741671C86
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 13:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480571.745051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI7r9-0005Uk-0P; Wed, 18 Jan 2023 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480571.745051; Wed, 18 Jan 2023 12:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI7r8-0005RX-TW; Wed, 18 Jan 2023 12:47:54 +0000
Received: by outflank-mailman (input) for mailman id 480571;
 Wed, 18 Jan 2023 12:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI7r7-0005RN-F2; Wed, 18 Jan 2023 12:47:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI7r7-0000WU-07; Wed, 18 Jan 2023 12:47:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI7r6-00028W-Lx; Wed, 18 Jan 2023 12:47:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pI7r6-0006bJ-LW; Wed, 18 Jan 2023 12:47:52 +0000
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
	bh=Yt0GNRs+l2ha8gtIFVpnjO5dD2JvdOpc9Z9Zi/FIPYs=; b=aQzy0QVr/nL+wzEaECnJyw/07U
	NHjCfl3BnFUlGobm9UvJPf0uG3NrcGd6gtih/DNn4XAU28A+pOIo0Wn7HmE4y3XhEOtb5TWDMyHIk
	bWwRpg7ZjF9Rwu3zgf46t3Dd7AbmtOv+/q2hHxhWAh5Ve5m0UGq3bbn8phNtXFEz1Jb8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175959-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175959: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=998ebe5ca0ae5c449e83ede533bee872f97d63af
X-Osstest-Versions-That:
    ovmf=9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Jan 2023 12:47:52 +0000

flight 175959 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175959/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                    6 xen-build                fail REGR. vs. 175747
 build-amd64                   6 xen-build                fail REGR. vs. 175747
 build-amd64-xsm               6 xen-build                fail REGR. vs. 175747

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 998ebe5ca0ae5c449e83ede533bee872f97d63af
baseline version:
 ovmf                 9d70d8f20d0feee1d232cbf86fc87147ce92c2cb

Last test of basis   175747  2023-01-12 16:10:44 Z    5 days
Failing since        175860  2023-01-15 07:11:07 Z    3 days   40 attempts
Testing same since   175955  2023-01-18 10:40:51 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Ard Biesheuvel <ardb+tianocore@kernel.org>
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiangang He <jiangang.he@amd.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Oliver Steffen <osteffen@redhat.com>
  Prakash K <prakashk@ami.com>
  Prakash.K <prakashk@ami.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               pass    
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

(No revision log; it would be 939 lines long.)

