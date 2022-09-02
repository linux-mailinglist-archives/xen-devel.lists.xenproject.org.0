Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DF5AA5BF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 04:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397185.637670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwQJ-000392-39; Fri, 02 Sep 2022 02:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397185.637670; Fri, 02 Sep 2022 02:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwQJ-00036m-0P; Fri, 02 Sep 2022 02:28:47 +0000
Received: by outflank-mailman (input) for mailman id 397185;
 Fri, 02 Sep 2022 02:28:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oTwQI-00036c-1H; Fri, 02 Sep 2022 02:28:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oTwQH-000342-VN; Fri, 02 Sep 2022 02:28:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oTwQH-0004vp-FJ; Fri, 02 Sep 2022 02:28:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oTwQH-0001WS-Et; Fri, 02 Sep 2022 02:28:45 +0000
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
	bh=C5daYvdMM9VYzzbScH6XTWaXIMeWBkgTTK1F3AJPXfI=; b=UbRRzlMs1/Tv/3+OQJ04DeoMPQ
	WK96GveM3JvcGRySGW2JFPpzBda1wUZv5aCTUmnoclEcMKbPoEg3/nBc3p9lYotV+6khdlXmCEAZY
	XE7YrFMbboVoU7nTahxp2Ejd2JQlpg9R4+BmATKG5PF2XcueM+FSW+7CCiQe3LLtrMVs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172923-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172923: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=6edd257861fd8ef44d23a6c1afb329efd95a9ae7
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Sep 2022 02:28:45 +0000

flight 172923 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172923/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 6edd257861fd8ef44d23a6c1afb329efd95a9ae7
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z   28 days
Failing since        172151  2022-08-05 02:40:28 Z   27 days  222 attempts
Testing same since   172923  2022-09-01 23:42:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdattar@amd.com>
  Abner Chang <abner.chang@amd.com>
  Ard Biesheuvel <ardb@kernel.org>
  Bob Feng <bob.c.feng@intel.com>
  Chasel Chiu <chasel.chiu@intel.com>
  Chen, Xiao X <xiao.x.chen@intel.com>
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Dimitrije Pavlov <Dimitrije.Pavlov@arm.com>
  Dun Tan <dun.tan@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Foster Nong <foster.nong@intel.com>
  Gregx Yeh <gregx.yeh@intel.com>
  Guo Dong <guo.dong@intel.com>
  Igor Kulchytskyy <igork@ami.com>
  James Lu <james.lu@intel.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jose Marinho <jose.marinho@arm.com>
  KasimX Liu <kasimx.liu@intel.com>
  Kavya <k.kavyax.sravanthi@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@quicinc.com>
  Sainadh Nagolu <sainadhn@ami.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Shengfengx Xue <shengfengx.xue@intel.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>
  Xiao X Chen <xiao.x.chen@intel.com>
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

(No revision log; it would be 1440 lines long.)

