Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D44251F1D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 20:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAdlY-0000gC-Bx; Tue, 25 Aug 2020 18:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWsn=CD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAdlX-0000fs-3y
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 18:33:51 +0000
X-Inumbo-ID: e70be8f0-8db5-4385-8c78-dd2563bd61cd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e70be8f0-8db5-4385-8c78-dd2563bd61cd;
 Tue, 25 Aug 2020 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=8eNCG/mqnJ8qXnVg/F5uKZlMzZzpV6chn1/ZBvdRPDo=; b=QY8FH84hgw+lR+HieXc/UXuqDU
 ajAIyoMIOEE38xTxZa7ag5sDbwJpVLK6KqMJu4iTDQ7VWofqBBO7k++dkreyBUEApR/k20RThlTVI
 YyLaomujbEevoSvQrJLVdhZshQP+T05glSsE0IsezoxbviElydRV+wezFNBflXMkSH7I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAdlP-0005hE-BF; Tue, 25 Aug 2020 18:33:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAdlP-0006lk-2G; Tue, 25 Aug 2020 18:33:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAdlP-0006kX-1m; Tue, 25 Aug 2020 18:33:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152788-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 152788: regressions - FAIL
X-Osstest-Failures: linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-examine:reboot:fail:regression
 linux-linus:test-amd64-i386-libvirt:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-coresched-i386-xl:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-raw:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-examine:reboot:fail:regression
 linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=6a9dc5fd6170d0a41c8a14eb19e63d94bea5705a
X-Osstest-Versions-That: linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Aug 2020 18:33:43 +0000
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

flight 152788 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152788/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
 test-amd64-i386-xl-xsm        7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
 test-amd64-i386-pair         10 xen-boot/src_host        fail REGR. vs. 152332
 test-amd64-i386-pair         11 xen-boot/dst_host        fail REGR. vs. 152332
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-boot     fail REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-boot               fail REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-boot          fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-boot/src_host        fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-boot/dst_host        fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332
 test-amd64-i386-xl            7 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1   7 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-multivcpu  7 xen-boot                fail REGR. vs. 152332
 test-armhf-armhf-libvirt-raw  7 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 152332
 test-armhf-armhf-xl           7 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152332
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152332
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 linux                6a9dc5fd6170d0a41c8a14eb19e63d94bea5705a
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z   24 days
Failing since        152366  2020-08-01 20:49:34 Z   23 days   26 attempts
Testing same since   152788  2020-08-25 05:34:56 Z    0 days    1 attempts

------------------------------------------------------------
2218 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
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

(No revision log; it would be 292953 lines long.)

