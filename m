Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93409051A9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739253.1146240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMX3-0008FV-Nk; Wed, 12 Jun 2024 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739253.1146240; Wed, 12 Jun 2024 11:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMX3-0008Df-Ky; Wed, 12 Jun 2024 11:52:49 +0000
Received: by outflank-mailman (input) for mailman id 739253;
 Wed, 12 Jun 2024 11:52:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHMX1-0008DP-Ch; Wed, 12 Jun 2024 11:52:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHMX1-0005No-Ac; Wed, 12 Jun 2024 11:52:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHMX0-0000H1-VX; Wed, 12 Jun 2024 11:52:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sHMX0-00088S-V3; Wed, 12 Jun 2024 11:52:46 +0000
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
	bh=tyRcWju6xGKMNuJ71D6oVlr2FtElMrz+lDenL4m13Ts=; b=yWagQq7oYG8cP1oVU2vCijsvFi
	r07s53DLxpGRojRaTv77q4x+FAEyfn/Nl3a4b02+hkvKgIkctAnW+fYY7QndZNibc19ArpVpZoxoT
	qSB0E2y5ZDe+wFsv9GHSIjgrUKZdTSnP6p6bMIcw6RjFUKCce4vnnMJxm2mflfHplfQE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186319-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186319: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b0e5352c600ce42f109ddb43a4233ac2c9e0abbd
X-Osstest-Versions-That:
    xen=5ea7f2c9d7a1334b3b2bd5f67fab4d447b60613d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Jun 2024 11:52:46 +0000

flight 186319 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186319/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b0e5352c600ce42f109ddb43a4233ac2c9e0abbd
baseline version:
 xen                  5ea7f2c9d7a1334b3b2bd5f67fab4d447b60613d

Last test of basis   186312  2024-06-11 17:02:07 Z    0 days
Testing same since   186319  2024-06-12 09:02:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski <marmarek@invisiblethingslab.com>

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
   5ea7f2c9d7..b0e5352c60  b0e5352c600ce42f109ddb43a4233ac2c9e0abbd -> smoke

