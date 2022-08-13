Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CB591B09
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 16:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386323.622273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMsFV-00060U-T7; Sat, 13 Aug 2022 14:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386323.622273; Sat, 13 Aug 2022 14:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMsFV-0005yE-Q7; Sat, 13 Aug 2022 14:36:25 +0000
Received: by outflank-mailman (input) for mailman id 386323;
 Sat, 13 Aug 2022 14:36:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMsFU-0005y4-Lb; Sat, 13 Aug 2022 14:36:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMsFU-0004St-Kk; Sat, 13 Aug 2022 14:36:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oMsFU-00042w-AM; Sat, 13 Aug 2022 14:36:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oMsFU-0004i2-9s; Sat, 13 Aug 2022 14:36:24 +0000
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
	bh=+PcK+R3gWBju9E2B4tgfWjSOFKF1Fh51fRWHk5+4MV8=; b=2t9LQqePI4xazk1VV0taLa39uC
	xHobLd2J/v5ySLxrTwCs8/fLcv2U08SPkWrTzYOMKV55Nxw8071HSGTSuw3ubEAhVCSSBAt+UUmSt
	mH7EuGTTugtJ2iZwx+Kr/+hyaddv7r7GobzhVHY98HQMlXjWXkXXWeTIIMKV7VeBECa0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172486-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172486: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=bd06717863ed6cba979fe5300433619aba340403
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Aug 2022 14:36:24 +0000

flight 172486 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172486/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 bd06717863ed6cba979fe5300433619aba340403
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z    9 days
Failing since        172151  2022-08-05 02:40:28 Z    8 days   80 attempts
Testing same since   172416  2022-08-12 07:10:43 Z    1 days   12 attempts

------------------------------------------------------------
People who touched revisions under test:
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Foster Nong <foster.nong@intel.com>
  Jose Marinho <jose.marinho@arm.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Ray Ni <ray.ni@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
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

(No revision log; it would be 531 lines long.)

