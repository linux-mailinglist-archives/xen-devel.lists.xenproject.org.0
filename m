Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8F3A2DE5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139930.258636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLVH-0005j4-Oz; Thu, 10 Jun 2021 14:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139930.258636; Thu, 10 Jun 2021 14:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLVH-0005gF-L7; Thu, 10 Jun 2021 14:17:51 +0000
Received: by outflank-mailman (input) for mailman id 139930;
 Thu, 10 Jun 2021 14:17:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrLVF-0005g1-QC; Thu, 10 Jun 2021 14:17:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrLVF-0008Bp-Lm; Thu, 10 Jun 2021 14:17:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrLVF-0005rp-Dc; Thu, 10 Jun 2021 14:17:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lrLVF-0004cO-B0; Thu, 10 Jun 2021 14:17:49 +0000
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
	bh=rpA398pAYPja9XJALLFQyCqzp+8wu4zY6N+hRC1+Bbc=; b=4AiUnnq8JJa0IbQQp755kZlLqH
	PQo+WFcBPbomknYGrQV5m3tTVevbla15V2+loGvs2qQKi6zSLC9akywhLI4AgHroAYuO3LkRnpo9e
	jtRqVY79hh3327X9dfRR0/A3ZU2DvFgqv3qvcNBwTaXDiRggWzX04fyM85VAQSA7Z4o8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162603-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162603: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:heisenbug
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=dfcffb128be46a3e413eaa941744536fe53c94b6
X-Osstest-Versions-That:
    xen=3e09045991cde360432bc7437103f8f8a6699359
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Jun 2021 14:17:49 +0000

flight 162603 xen-unstable-smoke real [real]
flight 162606 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/162603/
http://logs.test-lab.xenproject.org/osstest/logs/162606/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl 18 guest-start/debian.repeat fail in 162597 REGR. vs. 162574

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl          14 guest-start                fail pass in 162597

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 162597 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 162597 never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  dfcffb128be46a3e413eaa941744536fe53c94b6
baseline version:
 xen                  3e09045991cde360432bc7437103f8f8a6699359

Last test of basis   162574  2021-06-09 14:00:34 Z    1 days
Testing same since   162584  2021-06-10 00:00:27 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

------------------------------------------------------------
commit dfcffb128be46a3e413eaa941744536fe53c94b6
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Wed Jun 9 10:37:59 2021 -0700

    xen/arm32: SPSR_hyp/SPSR
    
    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
    See: ARM DDI 0487D.b page G8-5993.
    
    This fixes booting Xen/arm32 on QEMU.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
(qemu changes not included)

