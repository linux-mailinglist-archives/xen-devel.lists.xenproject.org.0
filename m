Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17EB6D1198
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516907.801797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi0Ig-0000RC-Kt; Thu, 30 Mar 2023 21:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516907.801797; Thu, 30 Mar 2023 21:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi0Ig-0000PT-FK; Thu, 30 Mar 2023 21:59:18 +0000
Received: by outflank-mailman (input) for mailman id 516907;
 Thu, 30 Mar 2023 21:59:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi0If-0000PJ-5J; Thu, 30 Mar 2023 21:59:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi0Ie-00049X-Ua; Thu, 30 Mar 2023 21:59:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi0Ie-00065u-El; Thu, 30 Mar 2023 21:59:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pi0Ie-0001Ft-BT; Thu, 30 Mar 2023 21:59:16 +0000
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
	bh=MggUPg63SzWgXPK0wgxAlI6STB47rLtBS3TUjXPeLpw=; b=s0Hz/4sfLvWw2BeVKHdHOLytgc
	wd4T2SPVfMwyjtqmz6PHSaGhll7OpR3y116bXvF9RrFRl9SRPJx+OKZfdOMp4J2OPAU0oEKu0T4vv
	xrMMkFAsmczsNxpA57JqBVS+RXt5IgRZG1YtX651dpCA1tGAoHBX4ywFBTE9pkTteeVo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180072: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:xen-boot:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=64c21916167e6269280929fab1202537b54b13cf
X-Osstest-Versions-That:
    xen=12c5eea3ca6fa2674726d62cc9f369f81861d23f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Mar 2023 21:59:16 +0000

flight 180072 xen-unstable-smoke real [real]
flight 180075 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180072/
http://logs.test-lab.xenproject.org/osstest/logs/180075/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 180068

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  64c21916167e6269280929fab1202537b54b13cf
baseline version:
 xen                  12c5eea3ca6fa2674726d62cc9f369f81861d23f

Last test of basis   180068  2023-03-30 16:01:56 Z    0 days
Testing same since   180072  2023-03-30 20:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     fail    


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
commit 64c21916167e6269280929fab1202537b54b13cf
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Tue Mar 21 14:03:47 2023 +0000

    xen/arm: Use the correct format specifier
    
    1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
    while creating nodes in fdt, the address (if present in the node name)
    should be represented using 'PRIx64'. This is to be in conformance
    with the following rule present in https://elinux.org/Device_Tree_Linux
    
    . node names
    "unit-address does not have leading zeros"
    
    As 'PRIpaddr' introduces leading zeros, we cannot use it.
    
    So, we have introduced a wrapper ie domain_fdt_begin_node() which will
    represent physical address using 'PRIx64'.
    
    2. One should use 'PRIx64' to display 'u64' in hex format. The current
    use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
    address.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

