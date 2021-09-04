Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A387400CD7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 21:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178816.324919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMblG-0002ZA-6n; Sat, 04 Sep 2021 19:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178816.324919; Sat, 04 Sep 2021 19:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMblG-0002WF-1N; Sat, 04 Sep 2021 19:55:34 +0000
Received: by outflank-mailman (input) for mailman id 178816;
 Sat, 04 Sep 2021 19:55:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMblE-0002W5-Gi; Sat, 04 Sep 2021 19:55:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMblE-0003Mm-Bu; Sat, 04 Sep 2021 19:55:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMblE-0007YM-3c; Sat, 04 Sep 2021 19:55:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mMblE-0007pU-32; Sat, 04 Sep 2021 19:55:32 +0000
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
	bh=NKiU4iFKWN+jJqM36rnU6s02nGmpDXUAt9myllV5FdI=; b=28YSqCtezJ6SehNdpYh9D6xyrK
	E2w7Klo1kyFt7uUBJeAzbMl0NLVP0bIphgMdIgB10Y8TUfjNYXX4Rr4I4t+XveH8XnjFFpX7ugsGP
	ItuOEEx2advRe2lJ3OiJ7dJPzWmAE4uYfkK6QZ6hS1KkMTZD00Lv0jrybppLopYplQYo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164813-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164813: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=edf8bc6d24c6f490c27de3144eee88f1ca40ce6a
X-Osstest-Versions-That:
    ovmf=cae735f61328d64e2e8991036707b9e78c0f5f63
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Sep 2021 19:55:32 +0000

flight 164813 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164813/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 164674
 build-amd64                   6 xen-build                fail REGR. vs. 164674
 build-i386-xsm                6 xen-build                fail REGR. vs. 164674
 build-i386                    6 xen-build                fail REGR. vs. 164674

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 edf8bc6d24c6f490c27de3144eee88f1ca40ce6a
baseline version:
 ovmf                 cae735f61328d64e2e8991036707b9e78c0f5f63

Last test of basis   164674  2021-08-31 02:56:52 Z    4 days
Failing since        164686  2021-09-01 03:03:43 Z    3 days   32 attempts
Testing same since   164806  2021-09-04 09:41:21 Z    0 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  DunTan <dun.tan@intel.com>
  Gary Lin <gary.lin@hpe.com>
  Hao A Wu <hao.a.wu@intel.com>
  Jim Fehlig <jfehlig@suse.com>
  Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Mark Wilson <Mark.Wilson@amd.com>
  Marvin H?user <mhaeuser@posteo.de>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Rebecca Cran <rebecca@bsdio.com>
  Wenxing Hou <wenxing.hou@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
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


Not pushing.

(No revision log; it would be 302 lines long.)

