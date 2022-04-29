Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C651416A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 06:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316945.536046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkIAy-0002VI-9m; Fri, 29 Apr 2022 04:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316945.536046; Fri, 29 Apr 2022 04:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkIAy-0002SO-6V; Fri, 29 Apr 2022 04:24:16 +0000
Received: by outflank-mailman (input) for mailman id 316945;
 Fri, 29 Apr 2022 04:24:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkIAw-0002SE-S3; Fri, 29 Apr 2022 04:24:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkIAw-0005sr-Pc; Fri, 29 Apr 2022 04:24:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkIAw-0007bD-By; Fri, 29 Apr 2022 04:24:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkIAw-0005FZ-BV; Fri, 29 Apr 2022 04:24:14 +0000
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
	bh=XOpWVPqqNVl4dE4nbJPTiUh0lQOnyvrU4/l8GlOuJtA=; b=5XNTJvpXxhw36bWBrjyQMqh4wh
	JYTvDEd9hkNbY00AHXueTsyRDwYO0oP4dxmZG1dWBWhm5VtABCzdH6TYCCOFlsBST/3K+uKb8TZ3G
	2hl65tz5zijlZ2MwMUbb2o9NB+vlh/x459oDjw8+GpXZhnKNzS1q8lnlOXdWc/kSliFU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169840-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169840: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e57477359071ab91429b0ebcbf7ff162242e2831
X-Osstest-Versions-That:
    xen=d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Apr 2022 04:24:14 +0000

flight 169840 xen-unstable-smoke real [real]
flight 169847 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169840/
http://logs.test-lab.xenproject.org/osstest/logs/169847/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169824

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e57477359071ab91429b0ebcbf7ff162242e2831
baseline version:
 xen                  d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed

Last test of basis   169824  2022-04-28 16:00:24 Z    0 days
Testing same since   169840  2022-04-29 00:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <julien@xen.org>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
commit e57477359071ab91429b0ebcbf7ff162242e2831
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Tue Apr 26 13:27:32 2022 -0700

    MAINTAINERS: add Rahul as SMMU maintainer
    
    Add Rahul as ARM SMMU maintainer. Create a new explicit entry for "ARM
    SMMU" also with Julien which is the original contributor of the code and
    continues to maintain it.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Rahul Singh <rahul.singh@arm.com>
    Acked-by: Julien Grall <julien@xen.org>
(qemu changes not included)

