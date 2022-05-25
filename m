Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE7533D81
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 15:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337228.561763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntqsE-0008E9-N4; Wed, 25 May 2022 13:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337228.561763; Wed, 25 May 2022 13:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntqsE-0008Bn-Ia; Wed, 25 May 2022 13:16:26 +0000
Received: by outflank-mailman (input) for mailman id 337228;
 Wed, 25 May 2022 13:16:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntqsC-0008Bd-Ou; Wed, 25 May 2022 13:16:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntqsC-0000oF-LW; Wed, 25 May 2022 13:16:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntqsC-00041Z-5b; Wed, 25 May 2022 13:16:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntqsC-0007oG-5B; Wed, 25 May 2022 13:16:24 +0000
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
	bh=2XGzYoC4w2HeQK0cMSBA4/uyTBhE1pSDcTzb0OX0zb0=; b=k/fG0vBhxiSEShEiiV+26qpF0U
	rHTeeRT86nXZR7GSAv6tzhxKXTpJHcQ5QJdfLJ5zyOJm2jz1VUwEeTbUIkySxy2IwJk1QHYtmz6Zv
	lAo8NtCneoemlzxPi9W/TjmGuwkLCiNJ+3YyciIwRL9s9E4zNoC31VHfL9efTrGZM2gY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170725-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 170725: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b22db3fcba1a5b4f9e563b58d402f1d5c434209f
X-Osstest-Versions-That:
    xen=49399b101e38fb2c11478c849ffdaaace8e318a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 May 2022 13:16:24 +0000

flight 170725 xen-unstable-smoke real [real]
flight 170727 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/170725/
http://logs.test-lab.xenproject.org/osstest/logs/170727/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 170719

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b22db3fcba1a5b4f9e563b58d402f1d5c434209f
baseline version:
 xen                  49399b101e38fb2c11478c849ffdaaace8e318a8

Last test of basis   170719  2022-05-25 00:00:26 Z    0 days
Testing same since   170725  2022-05-25 09:01:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     fail    


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
commit b22db3fcba1a5b4f9e563b58d402f1d5c434209f
Author: Julien Grall <jgrall@amazon.com>
Date:   Wed May 25 09:52:38 2022 +0100

    xen/iommu: dt: Check the return value of xsm_deassign_dtdevice()
    
    xsm_deassign_dtdevice() will indicate whether the caller is allowed
    to issue the operation. So the return value has to be checked.
    
    Spotted by clang static analyzer.
    
    Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device to support DT device")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
(qemu changes not included)

