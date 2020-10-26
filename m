Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFE298987
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12156.31856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyyr-0000CU-8y; Mon, 26 Oct 2020 09:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12156.31856; Mon, 26 Oct 2020 09:39:57 +0000
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
	id 1kWyyr-0000C4-4Q; Mon, 26 Oct 2020 09:39:57 +0000
Received: by outflank-mailman (input) for mailman id 12156;
 Mon, 26 Oct 2020 09:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWyyq-0000BE-5Q
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:39:56 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afece48e-82b9-4a71-9bee-8054d14504ff;
 Mon, 26 Oct 2020 09:39:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWyyi-0007zM-St; Mon, 26 Oct 2020 09:39:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWyyi-00034H-Hw; Mon, 26 Oct 2020 09:39:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWyyi-0004wf-HR; Mon, 26 Oct 2020 09:39:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWyyq-0000BE-5Q
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:39:56 +0000
X-Inumbo-ID: afece48e-82b9-4a71-9bee-8054d14504ff
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id afece48e-82b9-4a71-9bee-8054d14504ff;
	Mon, 26 Oct 2020 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=zt4VhIFL0obV4DTR+SRZvJQBzC+hnDTlPDAldvp3nNo=; b=YsfNY+OuDszTg7BHnqdj8aNDOX
	aAZG8NmSuu8OIFtMa+bZudtNHiOgNsjax1MbwEyWF/RGqg638NHW9nDIZf0fISSndGObV+1wFm3N0
	xeaWEwF/kW7XNwyOl8rKWHz95iz2O6/b6Rwo4Y+84STYdVHR0V3P3ZCZ0ULEiTn7vXhw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWyyi-0007zM-St; Mon, 26 Oct 2020 09:39:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWyyi-00034H-Hw; Mon, 26 Oct 2020 09:39:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWyyi-0004wf-HR; Mon, 26 Oct 2020 09:39:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156225-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 156225: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-i386-xl-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-xsm:xen-install:fail:regression
    linux-linus:test-amd64-coresched-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-libvirt:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-examine:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-raw:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-pvshim:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-i386:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine:memdisk-try-append:fail:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:guest-stop:fail:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:guest-localmigrate/x10:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-arm64-arm64-xl-seattle:leak-check/basis(11):fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:leak-check/basis(11):fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=3650b228f83adda7e5ee532e2b90429c03f7b9ec
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Oct 2020 09:39:48 +0000

flight 156225 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156225/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-install              fail REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-xl            7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-examine       6 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-install            fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm      10 host-ping-check-xen      fail REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 152332
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 152332
 test-amd64-amd64-amd64-pvgrub 20 guest-stop              fail REGR. vs. 152332
 test-amd64-amd64-i386-pvgrub 19 guest-localmigrate/x10   fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 152332
 test-armhf-armhf-xl-cubietruck  8 xen-boot               fail REGR. vs. 152332
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 152332
 test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 152332

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     18 guest-localmigrate       fail REGR. vs. 152332
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle  11 leak-check/basis(11)    fail blocked in 152332
 test-arm64-arm64-xl-credit2  11 leak-check/basis(11)    fail blocked in 152332
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                3650b228f83adda7e5ee532e2b90429c03f7b9ec
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z   86 days
Failing since        152366  2020-08-01 20:49:34 Z   85 days  145 attempts
Testing same since   156225  2020-10-25 23:39:51 Z    0 days    1 attempts

------------------------------------------------------------
3376 people touched revisions under test,
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
 test-arm64-arm64-xl                                          fail    
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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     fail    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 640968 lines long.)

