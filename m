Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C100312BE1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 09:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82637.152571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9211-0007If-05; Mon, 08 Feb 2021 08:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82637.152571; Mon, 08 Feb 2021 08:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9210-0007ID-Sk; Mon, 08 Feb 2021 08:35:26 +0000
Received: by outflank-mailman (input) for mailman id 82637;
 Mon, 08 Feb 2021 08:35:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l920z-0007Hp-AV; Mon, 08 Feb 2021 08:35:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l920z-0003X9-59; Mon, 08 Feb 2021 08:35:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l920y-00040J-Qr; Mon, 08 Feb 2021 08:35:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l920y-0006eG-QP; Mon, 08 Feb 2021 08:35:24 +0000
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
	bh=0HlGQY86TvNHeDXlFy88XLGGSHeAyTXi/JuUvefe2MM=; b=Vz3VZKWivl3rC/Qh3qCkkdYuLm
	/fZfnG5HQ78fw6qD58x75gq60wTkWXcP7jkEgDMK97Qy1d8/UN5WCRqGWRWd24MolDFWZMHwWw2Kw
	Z9Wa5Z2JLvmVEe5VJVUuudMLVFg5lKW01WoPOJTm7BHgyvtS8h6B9boBwSEcD2uyI9Q8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159110-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159110: trouble: blocked/broken
X-Osstest-Failures:
    ovmf:build-amd64:<job status>:broken:regression
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-xsm:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-amd64:host-install(4):broken:regression
    ovmf:build-amd64-xsm:host-install(4):broken:regression
    ovmf:build-amd64-pvops:host-install(4):broken:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=43a113385e370530eb52cf2e55b3019d8d4f6558
X-Osstest-Versions-That:
    ovmf=0d96664df322d50e0ac54130e129c0bf4f2b72df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 08:35:24 +0000

flight 159110 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159110/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 159040
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 159040
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 159040
 build-amd64                   4 host-install(4)        broken REGR. vs. 159040
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 159040
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 159040

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 43a113385e370530eb52cf2e55b3019d8d4f6558
baseline version:
 ovmf                 0d96664df322d50e0ac54130e129c0bf4f2b72df

Last test of basis   159040  2021-02-05 11:11:01 Z    2 days
Testing same since   159088  2021-02-07 01:54:46 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Liming Gao <gaoliming@byosoft.com.cn>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit 43a113385e370530eb52cf2e55b3019d8d4f6558
Author: Bob Feng <bob.c.feng@intel.com>
Date:   Mon Feb 1 18:28:58 2021 +0800

    BaseTools: fix the split output files root dir
    
    If the output file path is a relative path, the split
    tool will create the output file under the input file path.
    But the expected behavior for this case is the output file
    should be relative to the current directory. This patch will
    fix this bug.
    
    If the output file path is not specified and output prefix is not
    specified, the output file should be under the input file path
    
    Signed-off-by: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    Acked-by: Liming Gao <gaoliming@byosoft.com.cn>
    Reviewed-by: Yuwei Chen <yuwei.chen@intel.com>

