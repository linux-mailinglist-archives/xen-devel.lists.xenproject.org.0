Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3C9516127
	for <lists+xen-devel@lfdr.de>; Sun,  1 May 2022 03:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318270.537957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkyVy-0006um-5N; Sun, 01 May 2022 01:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318270.537957; Sun, 01 May 2022 01:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkyVy-0006rq-2P; Sun, 01 May 2022 01:36:46 +0000
Received: by outflank-mailman (input) for mailman id 318270;
 Sun, 01 May 2022 01:36:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkyVw-0006rg-LF; Sun, 01 May 2022 01:36:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkyVw-0004UT-JY; Sun, 01 May 2022 01:36:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkyVv-00062B-Hl; Sun, 01 May 2022 01:36:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkyVv-0005Ob-HI; Sun, 01 May 2022 01:36:43 +0000
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
	bh=7obYahCfoIwfGwDAzOuhyCkW4g2YABLuHe8lTnznrXs=; b=YH9gEGMTBpNJwQKjyHOQkx06Qv
	xlCdYWH8dKVnPdCnBHRy1jrTf+V1S5k/49hXGqSmvEM15/GYDOUqCco+4NLD3OSDCnyOIvs4j82Hq
	ufxRPH06fy/weOGLgH63TTT4oTRCXlTz9V6Y7XgiMJzSIlKaDOpesQoKjPogeM+vm5RA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169927-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 169927: regressions - FAIL
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
    ovmf=cabd96ad03603a63a97e701fb30a03341ca0e2ec
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 01 May 2022 01:36:43 +0000

flight 169927 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169927/

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
 ovmf                 cabd96ad03603a63a97e701fb30a03341ca0e2ec
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z   61 days
Failing since        168258  2022-03-01 01:55:31 Z   60 days  726 attempts
Testing same since   169904  2022-04-30 08:10:33 Z    0 days   18 attempts

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
  Jake Garver <jake@nvidia.com>
  Jake Garver via groups.io <jake=nvidia.com@groups.io>
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
  Li, Yi1 <yi1.li@intel.com>
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
  Tan, Dun <dun.tan@intel.com>
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

(No revision log; it would be 5855 lines long.)

