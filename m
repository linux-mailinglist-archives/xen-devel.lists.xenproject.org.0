Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F466B023
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 10:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477816.740694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGzLN-00077Y-KQ; Sun, 15 Jan 2023 09:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477816.740694; Sun, 15 Jan 2023 09:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGzLN-00075S-Hi; Sun, 15 Jan 2023 09:30:25 +0000
Received: by outflank-mailman (input) for mailman id 477816;
 Sun, 15 Jan 2023 09:30:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGzLM-00075I-Fj; Sun, 15 Jan 2023 09:30:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGzLM-0000DF-8r; Sun, 15 Jan 2023 09:30:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGzLL-0000od-Tw; Sun, 15 Jan 2023 09:30:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pGzLL-0008JB-TQ; Sun, 15 Jan 2023 09:30:23 +0000
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
	bh=dEYspIBjmrW5rRQV/60UUAkBTDANfvTOCM4osArGWt8=; b=3pJa1NNCnnB0IxzppFktizRa4E
	His53q/Uo5SlsIzITohCfbTVuUFlvI1bWG7VZb4vQrsvJiqaDW47H3WUlzoU8ZAqpcyKFWEUdhIzx
	5MUV/GFy52lFxywb9fXsgyM3Cwxo6JZEHJmlK6p18Ouglh23MGowLhE/CThcOXdi6dAY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175868-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175868: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=ba08910df1071bf5ade987529d9becb38d14a14a
X-Osstest-Versions-That:
    ovmf=9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Jan 2023 09:30:23 +0000

flight 175868 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175868/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 175747
 build-i386                    6 xen-build                fail REGR. vs. 175747
 build-amd64                   6 xen-build                fail REGR. vs. 175747
 build-i386-xsm                6 xen-build                fail REGR. vs. 175747

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 ba08910df1071bf5ade987529d9becb38d14a14a
baseline version:
 ovmf                 9d70d8f20d0feee1d232cbf86fc87147ce92c2cb

Last test of basis   175747  2023-01-12 16:10:44 Z    2 days
Testing same since   175860  2023-01-15 07:11:07 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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

------------------------------------------------------------
commit ba08910df1071bf5ade987529d9becb38d14a14a
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Jan 12 23:41:02 2023 +0800

    OvmfPkg: fix OvmfTpmSecurityStub.dsc.inc include
    
    TPM support is independent from secure boot support.  Move the TPM
    include snipped out of the secure boot !if block.
    
    Fixes: b47575801e19 ("OvmfPkg: move tcg configuration to dsc and fdf include files")
    Bugzilla: https://bugzilla.tianocore.org//show_bug.cgi?id=4290
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

