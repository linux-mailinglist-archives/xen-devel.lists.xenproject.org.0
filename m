Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1B3C717E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 15:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155384.286828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Iqr-000645-1E; Tue, 13 Jul 2021 13:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155384.286828; Tue, 13 Jul 2021 13:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Iqq-000624-TM; Tue, 13 Jul 2021 13:53:32 +0000
Received: by outflank-mailman (input) for mailman id 155384;
 Tue, 13 Jul 2021 13:53:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3Iqp-00061p-CP; Tue, 13 Jul 2021 13:53:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3Iqp-0006Qd-7d; Tue, 13 Jul 2021 13:53:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3Iqp-0005Q9-04; Tue, 13 Jul 2021 13:53:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m3Iqo-0002M5-Vm; Tue, 13 Jul 2021 13:53:30 +0000
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
	bh=2jMiI2P69z1wskGV4u06Rhwlka6cc55JzgUoIQw5PG0=; b=Me90Trwnkf5zzx3WqM6VMGr0QK
	RIfDqkinMUE1fWpPRuT/Ihu5xj48bMdT5TcEdMcmNFAFn4yA7b+06kzXsVJDkqS/4H3JZ0ScbCak8
	Mu+RMupFwNnhmi1Y+8rmDUiX1X3r4M31wjbGLgpCgL8mT05lmDQAhj9vF3jqI90l77HQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163638-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 163638: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=9bf4aee7340c331a47d3a60388d478461979a45d
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jul 2021 13:53:30 +0000

flight 163638 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163638/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359

version targeted for testing:
 ovmf                 9bf4aee7340c331a47d3a60388d478461979a45d
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   39 days
Failing since        162368  2021-06-04 15:42:59 Z   38 days  110 attempts
Testing same since   163638  2021-07-13 09:09:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Agrawal, Sachin <sachin.agrawal@intel.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ashraf Ali S <ashraf.ali.s@intel.com>
  Bob Feng <bob.c.feng@intel.com>
  Bret Barkelew <bret.barkelew@microsoft.com>
  Chen, Christine <Yuwei.Chen@intel.com>
  Corvin Köhne <c.koehne@beckhoff.com>
  Daniel Schaefer <daniel.schaefer@hpe.com>
  Daoxiang Li <daoxiang.li@intel.com>
  Dov Murik <dovmurik@linux.ibm.com>
  DunTan <dun.tan@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Guo Dong <guo.dong@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Jianyong Wu <jianyong.wu@arm.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Ken Lautner <klautner@microsoft.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Manickavasakam Karpagavinayagam <manickavasakamk@ami.com>
  Maurice Ma <maurice.ma@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Neal Gompa <ngompa@fedoraproject.org>
  Ni, Ray <ray.ni@intel.com>
  Nickle Wang <nickle.wang@hpe.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@nuviainc.com>
  S, Ashraf Ali <ashraf.ali.s@intel.com>
  Sachin Agrawal <sachin.agrawal@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sheng Wei <w.sheng@intel.com>
  Sumana Venur <sumana.venur@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>
  Tan, Dun <dun.tan@intel.com>
  Thiyagu Kesavan Balakrishnan <thiyagux.kesavan.balakrishnan@intel.com>
  xueshengfeng <xueshengfeng@byosoft.com.cn>
  Yuwei Chen <yuwei.chen@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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

(No revision log; it would be 3764 lines long.)

