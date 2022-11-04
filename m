Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903506194D6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437522.691965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquIS-0001de-SX; Fri, 04 Nov 2022 10:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437522.691965; Fri, 04 Nov 2022 10:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquIS-0001cl-OH; Fri, 04 Nov 2022 10:51:36 +0000
Received: by outflank-mailman (input) for mailman id 437522;
 Fri, 04 Nov 2022 10:51:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oquIR-0001cI-9l; Fri, 04 Nov 2022 10:51:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oquIR-00068O-7y; Fri, 04 Nov 2022 10:51:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oquIQ-0005mR-Sv; Fri, 04 Nov 2022 10:51:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oquIQ-0004iS-QS; Fri, 04 Nov 2022 10:51:34 +0000
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
	bh=usZOHmuv4Dvb1WJkAHlLzmyPrlx05f+6RhGQEDmJy44=; b=OZ/KaTbCm4dbOUU/1Mj3TVSVt3
	4eVFnVy5pSj/aZPm60p9Vwvkk88OCQL1hJjM0SNonrmfot+p0Q18bQoBopT5uO440PRBQG/I9IY6z
	m0WGz3kexkLE2OIVDYiENsmA/te2U7OpkkjmDpcorVtpS18jC8mKCCSyxDHCh58RpzM0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174621-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 174621: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9f3e585ff5ecc606e386057f5cfa66b22fea2b93
X-Osstest-Versions-That:
    xen=2d9b3699136d20e354a94daefebbeefa9ceec7b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Nov 2022 10:51:34 +0000

flight 174621 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174621/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9f3e585ff5ecc606e386057f5cfa66b22fea2b93
baseline version:
 xen                  2d9b3699136d20e354a94daefebbeefa9ceec7b6

Last test of basis   174601  2022-11-03 09:00:31 Z    1 days
Testing same since   174621  2022-11-04 08:03:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
   2d9b369913..9f3e585ff5  9f3e585ff5ecc606e386057f5cfa66b22fea2b93 -> smoke

