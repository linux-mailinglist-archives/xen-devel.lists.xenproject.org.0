Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46335B8AC9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 16:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406995.649418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYTWp-0003Hi-4S; Wed, 14 Sep 2022 14:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406995.649418; Wed, 14 Sep 2022 14:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYTWp-0003Ex-1P; Wed, 14 Sep 2022 14:38:15 +0000
Received: by outflank-mailman (input) for mailman id 406995;
 Wed, 14 Sep 2022 14:38:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYTWo-0003En-6h; Wed, 14 Sep 2022 14:38:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYTWo-00082R-3p; Wed, 14 Sep 2022 14:38:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYTWn-00068l-Ma; Wed, 14 Sep 2022 14:38:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oYTWn-000755-M9; Wed, 14 Sep 2022 14:38:13 +0000
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
	bh=Afn/CXuqXRe8CiD5ZK/PoN3P7mKltxIYHwXvZkGVbn8=; b=SJHbiP4n2d6MFRamOEecXV7crp
	VEW1XrSq2JbuI48Ie+1HRx80F4mqUeHBxM1XrEXzgFyzm++U5HTYOZbX2pzGjE7DJzbiZ8qhbvfXA
	oBav9EZ5hbF23WdeiBaYLgbkJ+HcW1Tk1rGD1w3wpmjEPkdeJ4CJoDt2i8f9BMuR4r90=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173190-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173190: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=838c730fe61578847823da1b815e4c9c5ee1bed4
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Sep 2022 14:38:13 +0000

flight 173190 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173190/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 838c730fe61578847823da1b815e4c9c5ee1bed4
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z   41 days
Failing since        172151  2022-08-05 02:40:28 Z   40 days  307 attempts
Testing same since   173186  2022-09-14 04:09:03 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Lee, Chun-Yi" <jlee@suse.com>
  Abdul Lateef Attar <abdattar@amd.com>
  Abner Chang <abner.chang@amd.com>
  Annie Li <annie.li@oracle.com>
  Ard Biesheuvel <ardb@kernel.org>
  Baraneedharan Anbazhagan <anbazhagan@hp.com>
  Bob Feng <bob.c.feng@intel.com>
  Chasel Chiu <chasel.chiu@intel.com>
  Chen, Xiao X <xiao.x.chen@intel.com>
  Corvin Köhne <c.koehne@beckhoff.com>
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Dimitrije Pavlov <Dimitrije.Pavlov@arm.com>
  Dun Tan <dun.tan@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Feng, Bob C <bob.c.feng@intel.com>
  Foster Nong <foster.nong@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gregx Yeh <gregx.yeh@intel.com>
  Guo Dong <guo.dong@intel.com>
  Heng Luo <heng.luo@intel.com>
  Igor Kulchytskyy <igork@ami.com>
  James Lu <james.lu@intel.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Jianyong Wu <jianyong.wu@arm.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jose Marinho <jose.marinho@arm.com>
  KasimX Liu <kasimx.liu@intel.com>
  Kavya <k.kavyax.sravanthi@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Lee, Chun-Yi <joeyli.kernel@gmail.com>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Oliver Steffen <osteffen@redhat.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Pranav Madhu <pranav.madhu@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@quicinc.com>
  Rohit Mathew <rohit.mathew@arm.com>
  Sainadh Nagolu <sainadhn@ami.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Shengfengx Xue <shengfengx.xue@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>
  Xiao X Chen <xiao.x.chen@intel.com>
  Yuan Yu <yuanyu@google.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-i386-libvirt                                           fail    
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


Not pushing.

(No revision log; it would be 2507 lines long.)

