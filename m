Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87514D7521
	for <lists+xen-devel@lfdr.de>; Sun, 13 Mar 2022 13:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289703.491307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTN7d-000410-NK; Sun, 13 Mar 2022 12:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289703.491307; Sun, 13 Mar 2022 12:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTN7d-0003yL-JY; Sun, 13 Mar 2022 12:14:53 +0000
Received: by outflank-mailman (input) for mailman id 289703;
 Sun, 13 Mar 2022 12:14:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTN7c-0003yB-3g; Sun, 13 Mar 2022 12:14:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTN7c-0000d1-1O; Sun, 13 Mar 2022 12:14:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nTN7b-00066T-Np; Sun, 13 Mar 2022 12:14:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nTN7b-0000Bx-NM; Sun, 13 Mar 2022 12:14:51 +0000
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
	bh=6JkQm0TMkdKTelYYadvquJZrV0Hxm3Pm4nCDi7IOl+0=; b=sH6dFyWPNoOtn9w+xsR0sLZsrW
	rsYvtTnrCQVKdkWpbhXaQFY7KQUkkcUR0Y7lRYFUjM5fSBC7D36MY9ItwbyIp0qZHaypIEJeRgsAC
	44WVm74f05Unb9fBicRSXg97xduxUJjRkC3FQemCfQ7oEVLI1XbpuqYSt2hCVPMiUNnE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168555-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168555: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Mar 2022 12:14:51 +0000

flight 168555 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168555/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
 build-amd64                   6 xen-build                fail REGR. vs. 168254
 build-i386                    6 xen-build                fail REGR. vs. 168254
 build-i386-xsm                6 xen-build                fail REGR. vs. 168254

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z   13 days
Failing since        168258  2022-03-01 01:55:31 Z   12 days  111 attempts
Testing same since   168519  2022-03-11 17:11:41 Z    1 days   25 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bandaru, Purna Chandra Rao <Purna.Chandra.Rao.Bandaru@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Guo Dong <guo.dong@intel.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Hua Ma <hua.ma@intel.com>
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Li, Zhihao <zhihao.li@intel.com>
  Ma, Hua <Hua.Ma@intel.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Purna Chandra Rao Bandaru <purna.chandra.rao.bandaru@intel.com>
  Sean Rhodes <sean@starlabs.systems>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Xiaolu.Jiang <xiaolu.jiang@intel.com>
  Zhihao Li <zhihao.li@intel.com>

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

(No revision log; it would be 569 lines long.)

