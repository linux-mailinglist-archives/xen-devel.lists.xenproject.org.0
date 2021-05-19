Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21536388CBD
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 13:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130000.243761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKJa-0006Py-El; Wed, 19 May 2021 11:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130000.243761; Wed, 19 May 2021 11:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljKJa-0006NR-At; Wed, 19 May 2021 11:24:38 +0000
Received: by outflank-mailman (input) for mailman id 130000;
 Wed, 19 May 2021 11:24:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKJY-0006NH-G1; Wed, 19 May 2021 11:24:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKJY-0000E5-91; Wed, 19 May 2021 11:24:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKJX-0002rK-VG; Wed, 19 May 2021 11:24:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ljKJX-0008Pw-Uo; Wed, 19 May 2021 11:24:35 +0000
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
	bh=Vqa5VLklcEcziQ8fy2Y7uLaCROAFd2aPoycvnlS3LQk=; b=WxrAAPmQRp+ibKgD5+MTDWr61g
	986xFfNhLZrBJBSUgi8SKFG9IhMAs+5kHQHQBP+ebtAubQR4Bk1KAxWkHf6o2l/yi6M7bQt44YdNI
	RhPJjyKa+XJaxgsu/0MxO5ZCxCY9epKoMbQG1nrpa5vJ4AJZv7cbZ4ejPpGn+osqnk9k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162087-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162087: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=01d84420fb4a9be2ec474a7c1910bb22c28b53c8
X-Osstest-Versions-That:
    xen=caa9c4471d1d74b2d236467aaf7e63a806ac11a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 May 2021 11:24:35 +0000

flight 162087 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162087/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 162023
 build-armhf                   6 xen-build                fail REGR. vs. 162023

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  01d84420fb4a9be2ec474a7c1910bb22c28b53c8
baseline version:
 xen                  caa9c4471d1d74b2d236467aaf7e63a806ac11a4

Last test of basis   162023  2021-05-18 13:00:27 Z    0 days
Testing same since   162036  2021-05-18 16:00:26 Z    0 days   10 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:51:48 2021 +0100

    tools/xenmon: xenbaked: Mark const the field text in stat_map_t
    
    The field text in stat_map_t will point to string literals. So mark it
    as const to allow the compiler to catch any modified of the string.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 4b7702727a8d89fea0a239adcbeb18aa2c85ede0
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:51:28 2021 +0100

    tools/top: The string parameter in set_prompt() and set_delay() should be const
    
    Neither string parameter in set_prompt() and set_delay() are meant to
    be modified. In particular, new_prompt can point to a literal string.
    
    So mark the two parameters as const and propagate it.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 5605cfd49a18df41a21fb50cd81528312a39d7c9
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:50:32 2021 +0100

    tools/misc: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    char * rather than char * when we we to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 89aae4ad8f495b647de33f2df5046b3ce68225f8
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:35:07 2021 +0100

    tools/libs: stat: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    char * rather than char * when we want to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:34:22 2021 +0100

    tools/libs: guest: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    *char rather than char * when we want to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
(qemu changes not included)

