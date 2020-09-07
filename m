Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F725FBBB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 15:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFHep-0005RE-AM; Mon, 07 Sep 2020 13:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dHX=CQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFHen-0005R9-Ph
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 13:58:05 +0000
X-Inumbo-ID: 4bf6509d-a683-4b5b-93e4-1226ed3a7ca3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bf6509d-a683-4b5b-93e4-1226ed3a7ca3;
 Mon, 07 Sep 2020 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=EDlYNfHpaWr2W7ombMDBc80feRVpIjpS0FJLZJ9fTII=; b=VZoADTk8eEAAdUGHofULfmbm+p
 1a9t980d+9YZ/CmIU9lhJ6f1E2ouJB4fJou+u+pDqzyEWQC7wlNJVY3Py3duT5ZhbnCsf8OuWF8Km
 Rw9k8c8vHpjw/D9tceaZiHAi2ELpuQdT5HSrx4W8M4XuqasUWv/Uy7/hHV5KZ/Kx0fGc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFHeZ-0000zz-0W; Mon, 07 Sep 2020 13:57:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFHeY-0007et-Pu; Mon, 07 Sep 2020 13:57:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFHeY-0000zw-PT; Mon, 07 Sep 2020 13:57:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153880-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 153880: tolerable FAIL - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-localmigrate:fail:allowable
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=ad0fd291c5e79191c2e3c70e43dded569f11a450
X-Osstest-Versions-That: xen=f5b44269fc734474f3272a22ba9d426d234ed460
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Sep 2020 13:57:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 153880 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153880/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 14 guest-localmigrate fail REGR. vs. 153866

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ad0fd291c5e79191c2e3c70e43dded569f11a450
baseline version:
 xen                  f5b44269fc734474f3272a22ba9d426d234ed460

Last test of basis   153866  2020-09-07 09:00:23 Z    0 days
Testing same since   153880  2020-09-07 12:03:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
   f5b44269fc..ad0fd291c5  ad0fd291c5e79191c2e3c70e43dded569f11a450 -> smoke

