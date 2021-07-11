Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C515C3C3AD6
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jul 2021 08:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154170.284895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Sez-0003ZV-U5; Sun, 11 Jul 2021 06:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154170.284895; Sun, 11 Jul 2021 06:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2Sez-0003XS-On; Sun, 11 Jul 2021 06:09:49 +0000
Received: by outflank-mailman (input) for mailman id 154170;
 Sun, 11 Jul 2021 06:09:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Sey-0003XI-Ah; Sun, 11 Jul 2021 06:09:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Sey-0005hk-6G; Sun, 11 Jul 2021 06:09:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Sex-00083p-VU; Sun, 11 Jul 2021 06:09:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m2Sex-0005qS-Rq; Sun, 11 Jul 2021 06:09:47 +0000
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
	bh=OmU+PLAahPAWMot5v1F4aWpIfmKbtQBhzfmbqwVIkZg=; b=Lawe+lCI8z4MWaGyL43Zkmjapx
	LRlhcpIliMLyGFe3H4duZv3REi1Y/uRIqcegiONYvAI0RxkAQ3vO4smMRJ8NZQAXADUrmfgRhkQiX
	SwIBB958bx4R7VAZFchzpVHBKPKYBcCLC2LkSmbmTV/F5M8p+yNGZW0z3O96uEd6fIKY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163547-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 163547: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=ad1009ec626bea7a718d595f98f0ad49a16c6e5b
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Jul 2021 06:09:47 +0000

flight 163547 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163547/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359

version targeted for testing:
 ovmf                 ad1009ec626bea7a718d595f98f0ad49a16c6e5b
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   37 days
Failing since        162368  2021-06-04 15:42:59 Z   36 days  103 attempts
Testing same since   163505  2021-07-10 02:21:50 Z    1 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Agrawal, Sachin <sachin.agrawal@intel.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ashraf Ali S <ashraf.ali.s@intel.com>
  Bret Barkelew <bret.barkelew@microsoft.com>
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

(No revision log; it would be 3576 lines long.)

