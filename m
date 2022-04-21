Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0650AAD4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 23:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310474.527340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nheTA-0007xd-OF; Thu, 21 Apr 2022 21:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310474.527340; Thu, 21 Apr 2022 21:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nheTA-0007uu-KS; Thu, 21 Apr 2022 21:36:08 +0000
Received: by outflank-mailman (input) for mailman id 310474;
 Thu, 21 Apr 2022 21:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nheT9-0007uW-Dc; Thu, 21 Apr 2022 21:36:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nheT9-0002ie-Ce; Thu, 21 Apr 2022 21:36:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nheT8-0002Ls-W4; Thu, 21 Apr 2022 21:36:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nheT8-0007VO-VZ; Thu, 21 Apr 2022 21:36:06 +0000
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
	bh=t4vWgjUDHpefXYDFvKAsUeo/6oUM+fRL9YjZ0QTHlNM=; b=uUK0BCIO3BBWOIifo7eVXIS18h
	jhbVPhDtAPV9MXM1G6rbJ6cULFkSDvnRpdS4VkMTg0bSLWBlmiu5a8YED11zm3JhtHKpp95oqKLwj
	2JTOtci7hwqeDpcv/tsVrR3wGZmVmTKFWqTclzqU4wLfA9HW6tfsWMJWtDOmmECr03oo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169600-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 169600: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=b06a007b6471b6eba6d1c38ff1bcfff183b57488
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Apr 2022 21:36:06 +0000

flight 169600 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169600/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 168254
 build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
 build-i386-xsm                6 xen-build                fail REGR. vs. 168254
 build-i386                    6 xen-build                fail REGR. vs. 168254

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 b06a007b6471b6eba6d1c38ff1bcfff183b57488
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z   52 days
Failing since        168258  2022-03-01 01:55:31 Z   51 days  544 attempts
Testing same since   169582  2022-04-21 05:41:38 Z    0 days   16 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdattar@amd.com>
  Abdul Lateef Attar via groups.io <abdattar=amd.com@groups.io>
  Abner Chang <abner.chang@hpe.com>
  Akihiko Odaki <akihiko.odaki@gmail.com>
  Anthony PERARD <anthony.perard@citrix.com
  Bandaru, Purna Chandra Rao <Purna.Chandra.Rao.Bandaru@intel.com>
  Bo Chang Ke <bo-changx.ke@intel.com>
  Bob Feng <bob.c.feng@intel.com>
  Chen Lin Z <lin.z.chen@intel.com>
  Chen, Lin Z <lin.z.chen@intel.com>
  Dandan Bi <dandan.bi@intel.com>
  Dun Tan <dun.tan@intel.com>
  Feng, Bob C <bob.c.feng@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Guo Dong <guo.dong@intel.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Heng Luo <heng.luo@intel.com>
  Hua Ma <hua.ma@intel.com>
  Huang, Li-Xia <lisa.huang@intel.com>
  Jagadeesh Ujja <Jagadeesh.Ujja@arm.com>
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>
  Ke, Bo-ChangX <bo-changx.ke@intel.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kuo, Ted <ted.kuo@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Lean Sheng Tan <sheng.tan@9elements.com>
  Leif Lindholm <quic_llindhol@quicinc.com
  Leif Lindholm <quic_llindhol@quicinc.com>
  Li, Zhihao <zhihao.li@intel.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liu <yun.y.liu@intel.com>
  Liu Yun <yun.y.liu@intel.com>
  Liu Yun Y <yun.y.liu@intel.com>
  Lixia Huang <lisa.huang@intel.com>
  Lou, Yun <Yun.Lou@intel.com>
  Ma, Hua <Hua.Ma@intel.com>
  Mara Sophie Grosch <littlefox@lf-net.org>
  Mara Sophie Grosch via groups.io <littlefox=lf-net.org@groups.io>
  Matt DeVillier <matt.devillier@gmail.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Michael Kubacki <mikuback@microsoft.com>
  Min Xu <min.m.xu@intel.com>
  Oliver Steffen <osteffen@redhat.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Purna Chandra Rao Bandaru <purna.chandra.rao.bandaru@intel.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <quic_rcran@quicinc.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Rhodes <sean@starlabs.systems>
  Sean Rhodes sean@starlabs.systems
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Sunny Wang <sunny.wang@arm.com>
  Ted Kuo <ted.kuo@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>
  Xiaolu.Jiang <xiaolu.jiang@intel.com>
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yi Li <yi1.li@intel.com>
  yi1 li <yi1.li@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
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

(No revision log; it would be 5572 lines long.)

