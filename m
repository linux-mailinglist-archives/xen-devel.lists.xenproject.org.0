Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226F5315E8
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 22:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336086.560375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntENI-0005j7-Tp; Mon, 23 May 2022 20:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336086.560375; Mon, 23 May 2022 20:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntENI-0005g2-Qu; Mon, 23 May 2022 20:09:56 +0000
Received: by outflank-mailman (input) for mailman id 336086;
 Mon, 23 May 2022 20:09:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntENG-0005fs-Uu; Mon, 23 May 2022 20:09:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntENG-0007Zl-SO; Mon, 23 May 2022 20:09:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntENG-00041p-Al; Mon, 23 May 2022 20:09:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntENG-0003qk-AH; Mon, 23 May 2022 20:09:54 +0000
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
	bh=43RbAhRGkg4V4qm/wDSzj53iH3zDFhjnRqJeEAW/UCQ=; b=a5MtEB9V4bp7F3PrsqmlPg8lPQ
	keCiBYDjLllOXqLR7Qd9puhAEGAp3Xo9GU1BsYcCl9XLaXTzYnN+JdI4W0PuHym+tZyVvF13o737h
	tG67TiJ5RQDGICTUgUH+yz7pByUeGceBM6ytv1e/d7DL98OOyYZ08TI7HqjnVtZHvQhA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170710-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170710: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a21a3438f795deecb24e1843c1636f95c485017c
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 May 2022 20:09:54 +0000

flight 170710 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170710/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a21a3438f795deecb24e1843c1636f95c485017c
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z   84 days
Failing since        168258  2022-03-01 01:55:31 Z   83 days 1195 attempts
Testing same since   170593  2022-05-20 06:42:41 Z    3 days   83 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdattar@amd.com>
  Abdul Lateef Attar via groups.io <abdattar=amd.com@groups.io>
  Abner Chang <abner.chang@hpe.com>
  Akihiko Odaki <akihiko.odaki@gmail.com>
  Anthony PERARD <anthony.perard@citrix.com
  Ard Biesheuvel <ardb@kernel.org>
  Bandaru, Purna Chandra Rao <Purna.Chandra.Rao.Bandaru@intel.com>
  Bo Chang Ke <bo-changx.ke@intel.com>
  Bob Feng <bob.c.feng@intel.com>
  Chao Li <lichao@loongson.cn>
  Chao, Zhuoran <zhuoran.chao@intel.com>
  Chen Lin Z <lin.z.chen@intel.com>
  Chen, Christine <Yuwei.Chen@intel.com>
  Chen, Lin Z <lin.z.chen@intel.com>
  Corvin Köhne <c.koehne@beckhoff.com>
  Dandan Bi <dandan.bi@intel.com>
  dann frazier <dann.frazier@canonical.com>
  Dun Tan <dun.tan@intel.com>
  duntan <dun.tan@intel.com>
  Feng, Bob C <bob.c.feng@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gua Guo <gua.guo@intel.com>
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
  Jiewen Yao <jiewen.yao@intel.com>
  Ke, Bo-ChangX <bo-changx.ke@intel.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kun Qin <kuqin12@gmail.com>
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
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Lixia Huang <lisa.huang@intel.com>
  Lou, Yun <Yun.Lou@intel.com>
  Ma, Hua <Hua.Ma@intel.com>
  Mara Sophie Grosch <littlefox@lf-net.org>
  Mara Sophie Grosch via groups.io <littlefox=lf-net.org@groups.io>
  Matt DeVillier <matt.devillier@gmail.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Michael Kubacki <mikuback@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Oliver Steffen <osteffen@redhat.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Peter Grehan <grehan@freebsd.org>
  Purna Chandra Rao Bandaru <purna.chandra.rao.bandaru@intel.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <quic_rcran@quicinc.com>
  Rebecca Cran <rebecca@bsdio.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Rhodes <sean@starlabs.systems>
  Sean Rhodes sean@starlabs.systems
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Sunny Wang <sunny.wang@arm.com>
  Tan, Dun <dun.tan@intel.com>
  Ted Kuo <ted.kuo@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>
  Xiaolu.Jiang <xiaolu.jiang@intel.com>
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yi Li <yi1.li@intel.com>
  yi1 li <yi1.li@intel.com>
  Yu Pu <yu.pu@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>
  Zhihao Li <zhihao.li@intel.com>
  Zhuoran Chao <zhuoran.chao@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   b1b89f9009..a21a3438f7  a21a3438f795deecb24e1843c1636f95c485017c -> xen-tested-master

