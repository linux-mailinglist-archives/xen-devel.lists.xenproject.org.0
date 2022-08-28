Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFD5A3D94
	for <lists+xen-devel@lfdr.de>; Sun, 28 Aug 2022 14:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394343.633704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSHjY-0004Z4-PI; Sun, 28 Aug 2022 12:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394343.633704; Sun, 28 Aug 2022 12:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSHjY-0004Wh-M2; Sun, 28 Aug 2022 12:49:48 +0000
Received: by outflank-mailman (input) for mailman id 394343;
 Sun, 28 Aug 2022 12:49:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oSHjW-0004WX-QA; Sun, 28 Aug 2022 12:49:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oSHjW-0003lF-Ng; Sun, 28 Aug 2022 12:49:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oSHjW-00037Z-GM; Sun, 28 Aug 2022 12:49:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oSHjW-000336-Fv; Sun, 28 Aug 2022 12:49:46 +0000
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
	bh=6yzi8IX35ABvMTkzv/Uzp5WlZzHAg5rvxW6IeXGh5TU=; b=5lK7tymUtTMhhz5gsN2GEumOmF
	Rl9hkA2sOA3p/tAOx2TdhP/rTPY7souit2L90UlEa9mmEEyU9VaYG7PLoiu0PGNOu+kx6U5xmR+Pa
	/M9MwWklNV2SOQJwva73VaTY9sfIm8DK/eh2M7xGoswrU4AJIWwi7Y5c3u9MFbbAmJBw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172829: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=ba0e0e4c6a174b71b18ccd6e47319cc45878893c
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Aug 2022 12:49:46 +0000

flight 172829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172829/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 ba0e0e4c6a174b71b18ccd6e47319cc45878893c
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z   24 days
Failing since        172151  2022-08-05 02:40:28 Z   23 days  189 attempts
Testing same since   172829  2022-08-28 09:13:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdattar@amd.com>
  Abner Chang <abner.chang@amd.com>
  Ard Biesheuvel <ardb@kernel.org>
  Bob Feng <bob.c.feng@intel.com>
  Chasel Chiu <chasel.chiu@intel.com>
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Dimitrije Pavlov <Dimitrije.Pavlov@arm.com>
  Dun Tan <dun.tan@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Foster Nong <foster.nong@intel.com>
  Gregx Yeh <gregx.yeh@intel.com>
  Igor Kulchytskyy <igork@ami.com>
  James Lu <james.lu@intel.com>
  Jose Marinho <jose.marinho@arm.com>
  KasimX Liu <kasimx.liu@intel.com>
  Kavya <k.kavyax.sravanthi@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Sainadh Nagolu <sainadhn@ami.com>
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

(No revision log; it would be 1015 lines long.)

