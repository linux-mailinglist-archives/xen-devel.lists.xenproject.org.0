Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28B2F54D2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 23:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66776.118750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzoK5-0006VW-0z; Wed, 13 Jan 2021 22:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66776.118750; Wed, 13 Jan 2021 22:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzoK4-0006V7-TQ; Wed, 13 Jan 2021 22:09:00 +0000
Received: by outflank-mailman (input) for mailman id 66776;
 Wed, 13 Jan 2021 22:09:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzoK3-0006Uz-Vv; Wed, 13 Jan 2021 22:08:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzoK3-0005ip-OM; Wed, 13 Jan 2021 22:08:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzoK3-0008Dd-1Y; Wed, 13 Jan 2021 22:08:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kzoK3-0004X2-0x; Wed, 13 Jan 2021 22:08:59 +0000
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
	bh=oXxql0nVhoCj0O7n9QGq0Dzb94hAFG3zEJXa1/Bu2mc=; b=N8R8obMDOI52Ha8uuFVrsih48l
	NeqkprXTTf8xSQtQvW8H0goCPK+C4EEQR7KchYZ/FwM6EAMHjZUdCZs+7jAzVSgL5JbydE7lail8N
	rAsO3IEfg8Lik02umwIu7F0ViRo7UFOcDhP8R2jRaQwNPSG52V1PAZOeb17fiqMzqr9k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158408-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158408: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=896128e9352327c4ff2b5c0c6cfa3856e45e2ca3
X-Osstest-Versions-That:
    xen=414be7b66349e7dca42bc1fd47c2b2f5b2d27432
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Jan 2021 22:08:59 +0000

flight 158408 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158408/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  896128e9352327c4ff2b5c0c6cfa3856e45e2ca3
baseline version:
 xen                  414be7b66349e7dca42bc1fd47c2b2f5b2d27432

Last test of basis   158388  2021-01-12 20:00:26 Z    1 days
Testing same since   158408  2021-01-13 20:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Julien Grall <jgrall@amazon.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Chen <wei.chen@arm.com>

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
   414be7b663..896128e935  896128e9352327c4ff2b5c0c6cfa3856e45e2ca3 -> smoke

