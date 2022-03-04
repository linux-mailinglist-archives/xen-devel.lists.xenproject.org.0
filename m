Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEA4CD574
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 14:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284315.483530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ8J5-0005PL-Eb; Fri, 04 Mar 2022 13:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284315.483530; Fri, 04 Mar 2022 13:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ8J5-0005MI-Aa; Fri, 04 Mar 2022 13:49:19 +0000
Received: by outflank-mailman (input) for mailman id 284315;
 Fri, 04 Mar 2022 13:49:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nQ8J4-0005M2-FW; Fri, 04 Mar 2022 13:49:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nQ8J4-0002uN-EO; Fri, 04 Mar 2022 13:49:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nQ8J4-00036S-7G; Fri, 04 Mar 2022 13:49:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nQ8J4-0006qS-6v; Fri, 04 Mar 2022 13:49:18 +0000
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
	bh=5jxWc199DGFabkbzYIpFOwGojNCJ8UxrALZpDvobAak=; b=htgVmFgBqtVTj1rA0+KaSq0Snq
	T/W9n2p7916AZQoe/2TIJTOnvBqkY/r3l5dyydvdK4CQApQ53vehCmSvIDWEX9LkLOsPsX+dxaXbA
	yY7ij39NMlBwZ9dcRJEeRzoGViPkxkh7DfkxSvOo7YFlILkSDxvEKlaPjoRxGIvFfHwM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168397-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168397: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-i386:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=4a68176cb548902cad93e6ebb5957d0cac94d297
X-Osstest-Versions-That:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Mar 2022 13:49:18 +0000

flight 168397 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168397/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 168254
 build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
 build-i386                    6 xen-build                fail REGR. vs. 168254
 build-i386-xsm                6 xen-build                fail REGR. vs. 168254

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 4a68176cb548902cad93e6ebb5957d0cac94d297
baseline version:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70

Last test of basis   168254  2022-02-28 10:41:46 Z    4 days
Failing since        168258  2022-03-01 01:55:31 Z    3 days   32 attempts
Testing same since   168397  2022-03-04 09:41:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>
  Li, Zhihao <zhihao.li@intel.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Sean Rhodes <sean@starlabs.systems>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
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

(No revision log; it would be 351 lines long.)

