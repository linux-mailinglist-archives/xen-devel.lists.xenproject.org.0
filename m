Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A65989A5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 19:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389720.626822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOj2f-00071R-AL; Thu, 18 Aug 2022 17:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389720.626822; Thu, 18 Aug 2022 17:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOj2f-0006z0-7H; Thu, 18 Aug 2022 17:10:49 +0000
Received: by outflank-mailman (input) for mailman id 389720;
 Thu, 18 Aug 2022 17:10:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOj2e-0006yq-CY; Thu, 18 Aug 2022 17:10:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOj2e-0004OI-Bg; Thu, 18 Aug 2022 17:10:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oOj2e-0001Lj-2F; Thu, 18 Aug 2022 17:10:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oOj2e-0001zK-1m; Thu, 18 Aug 2022 17:10:48 +0000
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
	bh=FXTQiIe2DsoOq2Uy68m4FNZ7pwggEDOOkkd/hX4CYjQ=; b=ehkXlVl9YZ9XFCvIePU7wgDQI9
	jiVEnv3XvrpKTI0o7EdbtbFar7WvwxHmrNBRBrKxdmhcva8rMsSDMg+rc4tPU9G7VbWwi6FYPJN2Z
	YILN/GAYMGFltv2sPecaL2Dwcl0YLzql5bf7yjDuVIVP9cnPrT4WRf76V0Ip4hOZubXk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172624-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172624: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=68bf712d4f5928af4c426dc82d27b9783e499d93
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Aug 2022 17:10:48 +0000

flight 172624 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172624/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 68bf712d4f5928af4c426dc82d27b9783e499d93
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z   14 days
Failing since        172151  2022-08-05 02:40:28 Z   13 days  117 attempts
Testing same since   172621  2022-08-18 09:12:57 Z    0 days    2 attempts

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

(No revision log; it would be 780 lines long.)

