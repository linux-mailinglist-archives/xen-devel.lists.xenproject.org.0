Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308854DD387
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 04:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291845.495651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV3B5-0004bB-EX; Fri, 18 Mar 2022 03:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291845.495651; Fri, 18 Mar 2022 03:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV3B5-0004YH-As; Fri, 18 Mar 2022 03:21:23 +0000
Received: by outflank-mailman (input) for mailman id 291845;
 Fri, 18 Mar 2022 03:21:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV3B4-0004Y7-04; Fri, 18 Mar 2022 03:21:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV3B3-0007cG-RJ; Fri, 18 Mar 2022 03:21:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nV3B3-0006sJ-GP; Fri, 18 Mar 2022 03:21:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nV3B3-0007iS-Fx; Fri, 18 Mar 2022 03:21:21 +0000
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
	bh=zaxWIJfGU+mZZJsnQIB64NuffZMNBV77UwcThz+FdK0=; b=bk2FS/paEW8c13cmwNRGmalfGh
	llz3KQV5wLw29RLu0xHGRBz15+BJ8Ps+hI99+2yz5KHCO9xu9EcdWiuxhkI7Vovoa1QwSuf+a0RyC
	vMvYoScMjvqJDlAu2l9+00IM9Ssq/iKZJdjo7jnIHjoDC3mFSLRxSbI7lvSzp2eJ+QEU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168668-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168668: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=79a705fbaf8fb817330b513b4cf6e63d3e2e7f21
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Mar 2022 03:21:21 +0000

flight 168668 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168668/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
 build-amd64                   6 xen-build                fail REGR. vs. 168254
 build-i386-xsm                6 xen-build                fail REGR. vs. 168254
 build-i386                    6 xen-build                fail REGR. vs. 168254

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 79a705fbaf8fb817330b513b4cf6e63d3e2e7f21
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z   17 days
Failing since        168258  2022-03-01 01:55:31 Z   17 days  161 attempts
Testing same since   168668  2022-03-17 22:46:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Bandaru, Purna Chandra Rao <Purna.Chandra.Rao.Bandaru@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Guo Dong <guo.dong@intel.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Hua Ma <hua.ma@intel.com>
  Huang, Li-Xia <lisa.huang@intel.com>
  Jagadeesh Ujja <Jagadeesh.Ujja@arm.com>
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kuo, Ted <ted.kuo@intel.com>
  Li, Zhihao <zhihao.li@intel.com>
  Lixia Huang <lisa.huang@intel.com>
  Lou, Yun <Yun.Lou@intel.com>
  Ma, Hua <Hua.Ma@intel.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Purna Chandra Rao Bandaru <purna.chandra.rao.bandaru@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Rhodes <sean@starlabs.systems>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Sunny Wang <sunny.wang@arm.com>
  Ted Kuo <ted.kuo@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>
  Xiaolu.Jiang <xiaolu.jiang@intel.com>
  Zhihao Li <zhihao.li@intel.com>

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

(No revision log; it would be 780 lines long.)

