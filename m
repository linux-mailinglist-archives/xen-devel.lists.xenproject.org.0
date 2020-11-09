Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220642AAF1C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 03:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21900.48244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbwdH-00029V-6a; Mon, 09 Nov 2020 02:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21900.48244; Mon, 09 Nov 2020 02:10:11 +0000
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
	id 1kbwdG-00029D-Uk; Mon, 09 Nov 2020 02:10:10 +0000
Received: by outflank-mailman (input) for mailman id 21900;
 Mon, 09 Nov 2020 02:10:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbwdF-0001y0-N6
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 02:10:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 235c7b97-a091-4e46-8252-78470a00654b;
 Mon, 09 Nov 2020 02:10:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbwd6-0004Vu-5k; Mon, 09 Nov 2020 02:10:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbwd5-0008Tn-TD; Mon, 09 Nov 2020 02:09:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbwd5-00064b-Mp; Mon, 09 Nov 2020 02:09:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbwdF-0001y0-N6
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 02:10:09 +0000
X-Inumbo-ID: 235c7b97-a091-4e46-8252-78470a00654b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 235c7b97-a091-4e46-8252-78470a00654b;
	Mon, 09 Nov 2020 02:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=wDpJVZyC6IVtPbaKkgxDrmPmSN2xmp17rObgmJFZBfc=; b=wbzPDpOirTg5jCaMSwDfAUJ9BT
	6sU+iqWzS+08qzkvBxOCIUL23+XV8cT+kOOQ3+yKrbEx7vjY6aZXdYNKqOYRRTHYNVDoPfeczT5H0
	D5opWe9TtWpk5BNvIi8ZyJmfDExC4prx61gEd5I73zo6bHSFtRNnuyNPCHSGHnkOQUlM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbwd6-0004Vu-5k; Mon, 09 Nov 2020 02:10:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbwd5-0008Tn-TD; Mon, 09 Nov 2020 02:09:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbwd5-00064b-Mp; Mon, 09 Nov 2020 02:09:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156556-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 156556: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-xsm:guest-start:fail:regression
    xen-unstable:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
X-Osstest-Versions-That:
    xen=9ff9705647646aa937b5f5c1426a64c69a62b3bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Nov 2020 02:09:59 +0000

flight 156556 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156556/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm       14 guest-start              fail REGR. vs. 156443
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 156443
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 156443
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 156443
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156443
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156443

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156443
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156443
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156443
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156443
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156443
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156443
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156443
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156443
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156443
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156443
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156443
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 xen                  0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
baseline version:
 xen                  9ff9705647646aa937b5f5c1426a64c69a62b3bd

Last test of basis   156443  2020-11-05 15:47:13 Z    3 days
Failing since        156524  2020-11-06 14:22:28 Z    2 days    3 attempts
Testing same since   156538  2020-11-07 06:32:07 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Wei Liu <wl@xen.org>

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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
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
 test-arm64-arm64-xl-thunderx                                 pass    
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


Not pushing.

------------------------------------------------------------
commit 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Thu Oct 29 15:03:32 2020 -0400

    libxl: Add suppress-vmdesc to QEMU machine
    
    The device model state saved by QMP xen-save-devices-state doesn't
    include the vmdesc json.  When restoring an HVM, xen-load-devices-state
    always triggers "Expected vmdescription section, but got 0".  This is
    not a problem when restore comes from a file.  However, when QEMU runs
    in a linux stubdom and comes over a console, EOF is not received.  This
    causes a delay restoring - though it does restore.
    
    Setting suppress-vmdesc skips looking for the vmdesc during restore and
    avoids the wait.
    
    QEMU 5.2 enables suppress-vmdesc by default for xenfv, but this change
    sets it manually for xenfv and xen_platform_pci=0 when -machine pc is
    use.
    
    QEMU commit 9850c6047b8b "migration: Allow to suppress vmdesc
    submission" added suppress-vmdesc in QEMU 2.3.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit cd800ce442eeba5bc0857ade70a075367c01c350
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Fri Nov 6 16:12:56 2020 +0000

    libxl: set vuart_gfn in libxl__build_hvm
    
    Setting vuart_gfn was missed when switching ARM guests to the PVH build.
    Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
    dom->vuart_gfn.
    
    Without this change, xl console cannot connect to the vuart console (-t
    vuart), see https://marc.info/?l=xen-devel&m=160402342101366.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 4196b1523aebe0ed929accba318d5e833d7ff6b3
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Nov 6 15:05:04 2020 +0100

    tools/libs/light: correct bitmap operations
    
    Libxl bitmap operations for single bits (test, set, reset) take the bit
    number as a signed integer without testing the value to be larger than
    0.
    
    Correct that by adding the appropriate tests.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 8aac8e0ef43a452d0b565d63e4943c275badba3f
Author: Olaf Hering <olaf@aepfle.de>
Date:   Fri Nov 6 14:05:17 2020 +0100

    docs/xl: fix cpupool-cpu-remove
    
    The cpu-pool must be specified.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Wei Liu <wl@xen.org>

commit 2a5f9f6a6932214fda76b9b3c03e024772882d34
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Nov 6 10:48:44 2020 +0100

    PCI: remove unused pcidevs_trylock()
    
    pcidevs_trylock() is used nowhere, so remove it.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Nov 6 10:48:07 2020 +0100

    xen/rwlock: add check_lock() handling to rwlocks
    
    Checking whether a lock is consistently used regarding interrupts on
    or off is beneficial for rwlocks, too.
    
    So add check_lock() calls to rwlock functions. For this purpose make
    check_lock() globally accessible.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c3453a23f7905d24f2404787543e26ec7d02301c
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Nov 6 10:47:09 2020 +0100

    xen/locking: harmonize spinlocks and rwlocks regarding preemption
    
    Spinlocks and rwlocks behave differently in the try variants regarding
    preemption: rwlocks are switching preemption off before testing the
    lock, while spinlocks do so only after the first check.
    
    Modify _spin_trylock() to disable preemption before testing the lock
    to be held in order to be preemption-ready.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 957708c2d1ae25d7375abd5e5e70c3043d64f1f1
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Nov 5 22:31:06 2020 +0000

    xen/arm: traps: Don't panic when receiving an unknown debug trap
    
    Even if debug trap are only meant for debugging purpose, it is quite
    harsh to crash Xen if one of the trap sent by the guest is not handled.
    
    So switch from a panic() to a printk().
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit e006b2e3be72e502b86bd9e1405417abd87bdfed
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Nov 5 16:48:55 2020 +0100

    libxl: fix libacpi dependency
    
    $(DSDT_FILES-y) depends on the recursive make to have run in libacpi/
    such that the file(s) itself/themselves were generated before
    compilation gets attempted. The same, however, is also necessary for
    generated headers, before source files including them would get
    attempted to be compiled.
    
    The dependency specified in libacpi's Makefile, otoh, is entirely
    pointless nowadays - no compilation happens there anymore (except for
    tools involved in building the generated files). Together with it, the
    rule generating acpi.a also can go away.
    
    Reported-by: Olaf Hering <olaf@aepfle.de>
    Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 2b8314a3c354d04545700c80ff5a5f86799b79c7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Nov 5 16:48:37 2020 +0100

    tools/python: pass more -rpath-link options to ld
    
    With the split of libraries, I've observed a number of warnings from
    (old?) ld.
    
    Instead of duplicating the additions in two places, introduce a setup.py
    make variable holding all the common parts of the invocations.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
(qemu changes not included)

