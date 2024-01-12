Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DF882C342
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 17:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666928.1037881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOK09-0007Pr-39; Fri, 12 Jan 2024 16:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666928.1037881; Fri, 12 Jan 2024 16:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOK09-0007Ne-0X; Fri, 12 Jan 2024 16:03:21 +0000
Received: by outflank-mailman (input) for mailman id 666928;
 Fri, 12 Jan 2024 16:03:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOK08-0007NU-EZ; Fri, 12 Jan 2024 16:03:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOK08-0004om-2D; Fri, 12 Jan 2024 16:03:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOK07-0004CT-M0; Fri, 12 Jan 2024 16:03:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rOK07-0004zx-Lf; Fri, 12 Jan 2024 16:03:19 +0000
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
	bh=nh7oYgjVJkF54n3Kb4gOdm9bjOB9+oAVh91RSCV79XA=; b=quwZDtNTDz2qLZdlcXFyg253EK
	/PsUBU9wyGMJwhzTaz3z9Qgvpuh/9hTKyMmR5rSALhvGs/xXcCWPvim7y+jIHMmVKtiEzIvoautFQ
	rKV28/OU+Z+kaJI8TZwX8k9JdmlQCtmVzEkI62EXPwawZf2ETxmaVPipTlJgHwGd/Xw8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184333-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184333: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1ec3fe1f664fa837daf31e9fa8938f6109464f28
X-Osstest-Versions-That:
    xen=c27c8922f2c6995d688437b0758cec6a27d18320
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jan 2024 16:03:19 +0000

flight 184333 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184333/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1ec3fe1f664fa837daf31e9fa8938f6109464f28
baseline version:
 xen                  c27c8922f2c6995d688437b0758cec6a27d18320

Last test of basis   184295  2024-01-09 14:00:26 Z    3 days
Testing same since   184333  2024-01-12 12:03:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Javi Merino <javi.merino@cloud.com>
  Julien Grall <jgrall@amazon.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   c27c8922f2..1ec3fe1f66  1ec3fe1f664fa837daf31e9fa8938f6109464f28 -> smoke

