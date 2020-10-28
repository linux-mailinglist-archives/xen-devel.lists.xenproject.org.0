Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6E29CEEF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13356.33934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgeF-0006t5-TN; Wed, 28 Oct 2020 08:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13356.33934; Wed, 28 Oct 2020 08:17:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgeF-0006sg-Q6; Wed, 28 Oct 2020 08:17:35 +0000
Received: by outflank-mailman (input) for mailman id 13356;
 Wed, 28 Oct 2020 08:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6N/=ED=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kXgeE-0006s5-2y
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:17:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0615ba2-1103-4d64-9103-891c8fb9940d;
 Wed, 28 Oct 2020 08:17:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXge4-00041d-Oh; Wed, 28 Oct 2020 08:17:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXge4-0000As-Ez; Wed, 28 Oct 2020 08:17:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kXge4-0004S1-E2; Wed, 28 Oct 2020 08:17:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u6N/=ED=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kXgeE-0006s5-2y
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:17:34 +0000
X-Inumbo-ID: c0615ba2-1103-4d64-9103-891c8fb9940d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c0615ba2-1103-4d64-9103-891c8fb9940d;
	Wed, 28 Oct 2020 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=nMt8gWczwQY9W3TKxinp0YpzNgJaPIws1nX3AGbyYL0=; b=bAwG3KZa5sbh4WkF4Wxdz+6Fx4
	LSRJUFQwpKp7r6kccNi9/a/9UO8kicC+RFNPUgRnNeeq0VkEmGubpNpKB/kYCYfkDsHIeta0nQlrO
	PvqNWqO1gTHa5y6w6aVEw6GD4bSgcfV4QyekxgE0HRNl9mKPkZ82xNXyHptFJfDH9II8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXge4-00041d-Oh; Wed, 28 Oct 2020 08:17:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXge4-0000As-Ez; Wed, 28 Oct 2020 08:17:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXge4-0004S1-E2; Wed, 28 Oct 2020 08:17:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156261-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.10-testing test] 156261: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-4.10-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.10-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=78d903e95efc5b0166b393d289a687c64016e8ef
X-Osstest-Versions-That:
    xen=71da63bbb83af8c8c537f3731dda7dc2d2fd31ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Oct 2020 08:17:24 +0000

flight 156261 xen-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156261/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               fail  like 156033
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 156033
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 156033
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156033
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156033
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156033
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156033
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156033
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156033
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156033
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156033
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156033
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156033
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156033
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  78d903e95efc5b0166b393d289a687c64016e8ef
baseline version:
 xen                  71da63bbb83af8c8c537f3731dda7dc2d2fd31ac

Last test of basis   156033  2020-10-20 13:35:44 Z    7 days
Testing same since   156261  2020-10-27 18:36:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
   71da63bbb8..78d903e95e  78d903e95efc5b0166b393d289a687c64016e8ef -> stable-4.10

