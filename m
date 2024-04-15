Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A778A5939
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 19:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706419.1103566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwQFi-0004ry-RH; Mon, 15 Apr 2024 17:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706419.1103566; Mon, 15 Apr 2024 17:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwQFi-0004qH-Ny; Mon, 15 Apr 2024 17:36:22 +0000
Received: by outflank-mailman (input) for mailman id 706419;
 Mon, 15 Apr 2024 17:36:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQFh-0004q2-55; Mon, 15 Apr 2024 17:36:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQFh-0001vQ-2V; Mon, 15 Apr 2024 17:36:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQFg-00049J-Ri; Mon, 15 Apr 2024 17:36:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQFg-0005nf-RK; Mon, 15 Apr 2024 17:36:20 +0000
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
	bh=kto1ro+EkXbb5pv17dYDYdmfExLb0tpSaxbM4+r+aa4=; b=oKgKzK68RZh+2qwTZcLZy9RAKo
	zv+0YOQ28qADe4zIBiRp/zJb5ppxzwJ8h8RtBCDufBiH193tmpSTeQUHZ0xLHrd12FA7qCUsjU8GH
	yy6uUYmh+Z+rDySoiugspHArIgtuMUkp8w7CN6Qyl0L9MUF7dIr2khS+dw76Ee/z6Dmg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185603-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185603: regressions - trouble: blocked/broken
X-Osstest-Failures:
    ovmf:build-amd64:<job status>:broken:regression
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-xsm:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-amd64-xsm:host-build-prep:fail:regression
    ovmf:build-amd64-pvops:host-build-prep:fail:regression
    ovmf:build-i386:host-build-prep:fail:regression
    ovmf:build-amd64:host-build-prep:fail:regression
    ovmf:build-i386-xsm:host-build-prep:fail:regression
    ovmf:build-i386-pvops:host-build-prep:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=e25808f5018ea601d0adf1d6d10c1cb3cb6a050b
X-Osstest-Versions-That:
    ovmf=98f150a954b35cc74bd87ae355cf35d8c9e1580d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Apr 2024 17:36:20 +0000

flight 185603 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185603/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185309
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185309
 build-i386                    5 host-build-prep          fail REGR. vs. 185309
 build-amd64                   5 host-build-prep          fail REGR. vs. 185309
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185309
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185309

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 ovmf                 e25808f5018ea601d0adf1d6d10c1cb3cb6a050b
baseline version:
 ovmf                 98f150a954b35cc74bd87ae355cf35d8c9e1580d

Last test of basis   185309  2024-04-11 08:11:11 Z    4 days
Testing same since   185603  2024-04-15 13:42:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gahan Saraiya <gahan.saraiya@intel.com>
  Qingyu <qingyu.shang@intel.com>

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

Not pushing.

------------------------------------------------------------
commit e25808f5018ea601d0adf1d6d10c1cb3cb6a050b
Author: Qingyu <qingyu.shang@intel.com>
Date:   Mon Apr 8 16:56:47 2024 +0800

    MdePkg: Update the comments of GetInformation function
    
    Refer to Uefi spec 2.10 section 11.11.2, add a new retval
    EFI_NOT_FOUND to EFI_ADAPTER_INFORMATION_PROTOCOL.GetInformation().
    Reference: [mantis #1866] - GetInfo() of Adapter Information
    Protocol should have a provision for IHV to return no data.
    
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    Signed-off-by: Qingyu <qingyu.shang@intel.com>
    Signed-off-by: Gahan Saraiya <gahan.saraiya@intel.com>

