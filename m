Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462125E737
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 13:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEW7J-00009l-8t; Sat, 05 Sep 2020 11:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5tp=CO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kEW7I-00009R-2R
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 11:12:20 +0000
X-Inumbo-ID: 6e1c36e4-1e34-40f5-8b1b-f46fbd3e9491
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e1c36e4-1e34-40f5-8b1b-f46fbd3e9491;
 Sat, 05 Sep 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=IJkEiETpO0TdcL3/Ivq+BhY9T9kfuagDomEA7KbsXP0=; b=4cl5a4crWGgRy6O30i5XYMbrFq
 3y/ZUnzD4T40LKru4fV3i/OITRCUmLLJ23HHe9OoG1JCkY74amAIMN9Oo+55BkLFsAUEBkZz6NqsK
 msQWB0RFzvOFDPWe5+vREQ9kp49ClV1MVsSxQyCtBtS/k7QtsnhT9Sa8MUYYpaAg6R6A=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEW7B-0006Qt-EG; Sat, 05 Sep 2020 11:12:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEW7B-00053R-86; Sat, 05 Sep 2020 11:12:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kEW7B-0007dJ-7a; Sat, 05 Sep 2020 11:12:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 153746: trouble: blocked/broken
X-Osstest-Failures: ovmf:build-amd64:<job status>:broken:regression
 ovmf:build-amd64-pvops:<job status>:broken:regression
 ovmf:build-amd64-xsm:<job status>:broken:regression
 ovmf:build-i386:<job status>:broken:regression
 ovmf:build-i386-pvops:<job status>:broken:regression
 ovmf:build-i386-xsm:<job status>:broken:regression
 ovmf:build-amd64-pvops:hosts-allocate:broken:regression
 ovmf:build-i386-pvops:hosts-allocate:broken:regression
 ovmf:build-amd64:hosts-allocate:broken:regression
 ovmf:build-i386-xsm:hosts-allocate:broken:regression
 ovmf:build-amd64-xsm:hosts-allocate:broken:regression
 ovmf:build-i386:hosts-allocate:broken:regression
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=2ace920de1e91e22fb9bb2ec9e15ffd5e28e70ac
X-Osstest-Versions-That: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Sep 2020 11:12:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 153746 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153746/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-pvops             2 hosts-allocate         broken REGR. vs. 152863
 build-i386-pvops              2 hosts-allocate         broken REGR. vs. 152863
 build-amd64                   2 hosts-allocate         broken REGR. vs. 152863
 build-i386-xsm                2 hosts-allocate         broken REGR. vs. 152863
 build-amd64-xsm               2 hosts-allocate         broken REGR. vs. 152863
 build-i386                    2 hosts-allocate         broken REGR. vs. 152863

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 2ace920de1e91e22fb9bb2ec9e15ffd5e28e70ac
baseline version:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00

Last test of basis   152863  2020-08-26 16:09:47 Z    9 days
Failing since        152915  2020-08-27 18:09:42 Z    8 days  143 attempts
Testing same since   153709  2020-09-04 14:10:46 Z    0 days    8 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Bob Feng <bob.c.feng@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Paul <paul.grimes@amd.com>
  Paul G <paul.grimes@amd.com>
  Qi Zhang <qi1.zhang@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-amd64-pvops hosts-allocate
broken-step build-i386-pvops hosts-allocate
broken-step build-amd64 hosts-allocate
broken-step build-i386-xsm hosts-allocate
broken-step build-amd64-xsm hosts-allocate
broken-step build-i386 hosts-allocate

Not pushing.

(No revision log; it would be 321 lines long.)

