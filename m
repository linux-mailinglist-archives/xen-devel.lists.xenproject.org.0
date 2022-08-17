Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F65974B7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 19:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389132.625960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOMR2-0005wK-69; Wed, 17 Aug 2022 17:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389132.625960; Wed, 17 Aug 2022 17:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOMR2-0005tw-3E; Wed, 17 Aug 2022 17:02:28 +0000
Received: by outflank-mailman (input) for mailman id 389132;
 Wed, 17 Aug 2022 17:02:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOMR1-0005tm-5R; Wed, 17 Aug 2022 17:02:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOMR1-0003Fv-20; Wed, 17 Aug 2022 17:02:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOMR0-0001uq-At; Wed, 17 Aug 2022 17:02:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oOMR0-0000Ii-AN; Wed, 17 Aug 2022 17:02:26 +0000
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
	bh=rykibj5rZKUYWoTvaPt/RrraA0HVUc1A2U4qoNLeC84=; b=JJSK8yPam8YFp/SSwDxqUyuibo
	H+ZfOn4I6T6qN/zN4zJE43c94+8X3mYQs/00U4PVF9vFowiOq5Djo5EnJ7kvQbXoleZzxUMzb0Veu
	Hjyir+0yZcWaV7Mpnyz2OBkniqMFFe+16PKDolWEPShy4ajkM4OtSZjL1p2OCj31wvkc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172602-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172602: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=64a20bea97e6a19651e639a9c24e5f4e37b70f81
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Aug 2022 17:02:26 +0000

flight 172602 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172602/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail pass in 172597

version targeted for testing:
 ovmf                 64a20bea97e6a19651e639a9c24e5f4e37b70f81
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z   13 days
Failing since        172151  2022-08-05 02:40:28 Z   12 days  111 attempts
Testing same since   172595  2022-08-17 09:11:46 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Dimitrije Pavlov <Dimitrije.Pavlov@arm.com>
  Dun Tan <dun.tan@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Foster Nong <foster.nong@intel.com>
  Jose Marinho <jose.marinho@arm.com>
  KasimX Liu <kasimx.liu@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Ray Ni <ray.ni@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Shengfengx Xue <shengfengx.xue@intel.com>
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
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
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

(No revision log; it would be 735 lines long.)

