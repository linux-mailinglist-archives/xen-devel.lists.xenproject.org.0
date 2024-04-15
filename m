Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9588A4C19
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705964.1102938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJ88-0000ti-NR; Mon, 15 Apr 2024 10:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705964.1102938; Mon, 15 Apr 2024 10:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJ88-0000qq-JH; Mon, 15 Apr 2024 10:00:04 +0000
Received: by outflank-mailman (input) for mailman id 705964;
 Mon, 15 Apr 2024 10:00:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwJ87-0000iQ-Ta; Mon, 15 Apr 2024 10:00:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwJ87-0001AQ-NX; Mon, 15 Apr 2024 10:00:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwJ87-0006iE-By; Mon, 15 Apr 2024 10:00:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwJ87-0007ms-BU; Mon, 15 Apr 2024 10:00:03 +0000
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
	bh=Gnp2WYkhfgALUbRMCQZHM9GlepJRn0J+VP9nS1SkKJo=; b=E84La6Yy6apJx+MkutkVNv7OHv
	nbbnt2eBuU88WxalZoOt/0QUAKB34Gg4lWr0DZu+FSkNApgLrwC8jNrmBgD3ZFoS4B5bcdLjNlNZ2
	L4yYLRBlYfkVbfUN2mw/pd8j3BfmJEF/+N0suyrZXBH3EKRezFPzi88GuDMfZFdUVKDU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185570-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 185570: regressions - trouble: blocked/broken
X-Osstest-Failures:
    libvirt:build-amd64:<job status>:broken:regression
    libvirt:build-amd64-pvops:<job status>:broken:regression
    libvirt:build-amd64-xsm:<job status>:broken:regression
    libvirt:build-arm64:<job status>:broken:regression
    libvirt:build-arm64-pvops:<job status>:broken:regression
    libvirt:build-arm64-xsm:<job status>:broken:regression
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-armhf-pvops:<job status>:broken:regression
    libvirt:build-i386:<job status>:broken:regression
    libvirt:build-i386-pvops:<job status>:broken:regression
    libvirt:build-i386-xsm:<job status>:broken:regression
    libvirt:build-i386-pvops:host-build-prep:fail:regression
    libvirt:build-amd64-pvops:host-build-prep:fail:regression
    libvirt:build-amd64-xsm:host-build-prep:fail:regression
    libvirt:build-armhf-pvops:host-build-prep:fail:regression
    libvirt:build-i386-xsm:host-build-prep:fail:regression
    libvirt:build-amd64:host-build-prep:fail:regression
    libvirt:build-i386:host-build-prep:fail:regression
    libvirt:build-arm64-xsm:host-build-prep:fail:regression
    libvirt:build-arm64-pvops:host-build-prep:fail:regression
    libvirt:build-arm64:host-build-prep:fail:regression
    libvirt:build-armhf:host-build-prep:fail:regression
    libvirt:build-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-i386-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    libvirt=a4972778f97ae667a02bbbecdeabb912506fa2cf
X-Osstest-Versions-That:
    libvirt=812a146dfe784315edece43d09f8d9e432f8230e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Apr 2024 10:00:03 +0000

flight 185570 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185570/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185412
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185412
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185412
 build-armhf-pvops             5 host-build-prep          fail REGR. vs. 185412
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185412
 build-amd64                   5 host-build-prep          fail REGR. vs. 185412
 build-i386                    5 host-build-prep          fail REGR. vs. 185412
 build-arm64-xsm               5 host-build-prep          fail REGR. vs. 185412
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 185412
 build-arm64                   5 host-build-prep          fail REGR. vs. 185412
 build-armhf                   5 host-build-prep          fail REGR. vs. 185412

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              a4972778f97ae667a02bbbecdeabb912506fa2cf
baseline version:
 libvirt              812a146dfe784315edece43d09f8d9e432f8230e

Last test of basis   185412  2024-04-13 04:19:07 Z    2 days
Testing same since   185482  2024-04-14 04:19:08 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Privoznik <mprivozn@redhat.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 blocked 


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
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken

Not pushing.

------------------------------------------------------------
commit a4972778f97ae667a02bbbecdeabb912506fa2cf
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Fri Apr 12 17:45:16 2024 +0200

    vbox: Drop needless g_new0(..., 0) in vbox_snapshot_conf.c
    
    clang on Fedora started to complain about some calls to g_new0()
    we're making in vbox_snapshot_conf.c. Specifically, we're passing
    zero as number of elements to allocate. And while usually SA
    tools are not clever, in this specific case clang is right.
    There are three cases where such call is made, but all of them
    later use VIR_EXPAND_N() to allocate more memory (if needed). But
    VIR_EXPAND_N() accepts a variable set to NULL happily.
    
    Therefore, just drop those three calls to g_new0(..., 0) and let
    VIR_EXPAND_N() allocate memory.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Pavel Hrdina <phrdina@redhat.com>

