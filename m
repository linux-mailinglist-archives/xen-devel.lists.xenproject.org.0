Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387273B137A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 07:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146123.268809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvvm7-0004he-Qk; Wed, 23 Jun 2021 05:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146123.268809; Wed, 23 Jun 2021 05:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvvm7-0004f2-MD; Wed, 23 Jun 2021 05:50:11 +0000
Received: by outflank-mailman (input) for mailman id 146123;
 Wed, 23 Jun 2021 05:50:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvvm6-0004es-7U; Wed, 23 Jun 2021 05:50:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvvm5-0005lo-H3; Wed, 23 Jun 2021 05:50:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvvm5-0002cI-9M; Wed, 23 Jun 2021 05:50:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lvvm5-0007AJ-8r; Wed, 23 Jun 2021 05:50:09 +0000
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
	bh=Om7bOXf0oo+hIc0+AJ7A5Acz1ZfUWGa2GrwqHT2+MT8=; b=X3Fxe1gL+l5BYDkhdnpqAaaVdr
	x8xLxJ9DAg/cBlFR5dzEHu4UEEUfkaL33zjpJMd47TwpZS32/a+IVveqTfWZpWAOjI095VjhxjWFB
	hfHM9YfgeKWTOzN99JfUuQCvck2HOMl4CPQUUgDfncg0cyGlvxRbefTpzhDZMJ4LN+w8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162972-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162972: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=d9a7612f8d1da197883bd1cb9f91f229522d39b1
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Jun 2021 05:50:09 +0000

flight 162972 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162972/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359

version targeted for testing:
 ovmf                 d9a7612f8d1da197883bd1cb9f91f229522d39b1
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   19 days
Failing since        162368  2021-06-04 15:42:59 Z   18 days   39 attempts
Testing same since   162972  2021-06-22 11:39:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Daoxiang Li <daoxiang.li@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Ken Lautner <klautner@microsoft.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Maurice Ma <maurice.ma@intel.com>
  Ni, Ray <ray.ni@intel.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sumana Venur <sumana.venur@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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

(No revision log; it would be 2211 lines long.)

