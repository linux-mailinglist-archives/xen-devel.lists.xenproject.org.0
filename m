Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76193BB533
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 04:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149746.276985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0EWf-00042y-MC; Mon, 05 Jul 2021 02:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149746.276985; Mon, 05 Jul 2021 02:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0EWf-0003zs-Ge; Mon, 05 Jul 2021 02:40:01 +0000
Received: by outflank-mailman (input) for mailman id 149746;
 Mon, 05 Jul 2021 02:40:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0EWe-0003wk-ER; Mon, 05 Jul 2021 02:40:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0EWe-0003A5-6v; Mon, 05 Jul 2021 02:40:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0EWd-0002Vn-Sl; Mon, 05 Jul 2021 02:39:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m0EWd-0000li-SE; Mon, 05 Jul 2021 02:39:59 +0000
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
	bh=/OptFA5HxTTJ9k6r4ee3hkkWmACw8J1FQ7f2BqfFiZw=; b=1fkBV4UiocDOvt5sS5vgA6xIEi
	K91ekTQw/7SiuhTQ7s2JXT7XQ4nb70teDqHhquP90PSDGaOA3a4G4BTeq6EOKnHUGNI+p00QYd06E
	vr9BV9eX2g1TEE7roGvNlvOpibhI5Vzzib8hRLTtUXstg7iuSbrlYQBvrpcjc/BXZ6FU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163304-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 163304: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=fea7901dba72eeac526f3ef12a4ad4c539622373
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Jul 2021 02:39:59 +0000

flight 163304 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163304/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359

version targeted for testing:
 ovmf                 fea7901dba72eeac526f3ef12a4ad4c539622373
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   30 days
Failing since        162368  2021-06-04 15:42:59 Z   30 days   86 attempts
Testing same since   163216  2021-07-01 22:42:29 Z    3 days   16 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Agrawal, Sachin <sachin.agrawal@intel.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Daniel Schaefer <daniel.schaefer@hpe.com>
  Daoxiang Li <daoxiang.li@intel.com>
  Dov Murik <dovmurik@linux.ibm.com>
  DunTan <dun.tan@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Guo Dong <guo.dong@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Ken Lautner <klautner@microsoft.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Manickavasakam Karpagavinayagam <manickavasakamk@ami.com>
  Maurice Ma <maurice.ma@intel.com>
  Ni, Ray <ray.ni@intel.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sachin Agrawal <sachin.agrawal@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sumana Venur <sumana.venur@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>
  xueshengfeng <xueshengfeng@byosoft.com.cn>
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

(No revision log; it would be 3224 lines long.)

