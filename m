Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40A2D919E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 02:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51866.90738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kocsu-0005BT-C1; Mon, 14 Dec 2020 01:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51866.90738; Mon, 14 Dec 2020 01:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kocsu-0005An-2l; Mon, 14 Dec 2020 01:42:44 +0000
Received: by outflank-mailman (input) for mailman id 51866;
 Mon, 14 Dec 2020 01:42:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kocst-0005Af-03; Mon, 14 Dec 2020 01:42:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kocss-0001fi-Q7; Mon, 14 Dec 2020 01:42:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kocss-0004GA-Ep; Mon, 14 Dec 2020 01:42:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kocss-0003jO-EN; Mon, 14 Dec 2020 01:42:42 +0000
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
	bh=VLVyUEv3hzxKfXMOJUg1KwQZ9P8WX8IIrHG6ItjD0wY=; b=pPz08sZhHe2Ow/19ehgwv3aY6b
	vnJ3bgI8vpCg8p5o+gCixXZcOMAoA+rHRUbumwzAbjG1Vd40Bggg2Z5AlckEpzZUYFO0we+lvyHlI
	IpsdF6biWAG0Icr+uxOHU1ukeV1IgRySEXPlFYXjlR2qiRaaxsUau7h3/cU1O1pvdkfY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157510-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157510: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=d4633b36b94f7b4a1f41901657cbbff452173d35
X-Osstest-Versions-That:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Dec 2020 01:42:42 +0000

flight 157510 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157510/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345

version targeted for testing:
 ovmf                 d4633b36b94f7b4a1f41901657cbbff452173d35
baseline version:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e

Last test of basis   157345  2020-12-09 12:40:46 Z    4 days
Failing since        157348  2020-12-09 15:39:39 Z    4 days   34 attempts
Testing same since   157402  2020-12-11 03:39:45 Z    2 days   27 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Fan Wang <fan.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Ting Ye <ting.ye@intel.com>

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

(No revision log; it would be 360 lines long.)

