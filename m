Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D492A1906
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 18:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17007.41787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYurK-0003OV-DB; Sat, 31 Oct 2020 17:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17007.41787; Sat, 31 Oct 2020 17:40:10 +0000
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
	id 1kYurK-0003O6-9Y; Sat, 31 Oct 2020 17:40:10 +0000
Received: by outflank-mailman (input) for mailman id 17007;
 Sat, 31 Oct 2020 17:40:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyv3=EG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYurJ-0003Na-Ga
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 17:40:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77a58fb8-55db-46d8-8930-3e17f2c15c9f;
 Sat, 31 Oct 2020 17:40:06 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYurG-0001mB-D2; Sat, 31 Oct 2020 17:40:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYurG-0006Nf-3z; Sat, 31 Oct 2020 17:40:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYurG-000277-3U; Sat, 31 Oct 2020 17:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nyv3=EG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYurJ-0003Na-Ga
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 17:40:09 +0000
X-Inumbo-ID: 77a58fb8-55db-46d8-8930-3e17f2c15c9f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 77a58fb8-55db-46d8-8930-3e17f2c15c9f;
	Sat, 31 Oct 2020 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=FgddYQzErSGA2rXGqBcPh4psbY9W2FXqGINipaUeXIo=; b=lIBJeJXELGUfk7Zk2e0r5YQWMY
	X+4e/f4HBVsjHczYw8M5mhRnWCAbJd1LXz61BjJIaK+6N91LR+5DDpYfX2Y4rbwX20gBPSwaGIC3x
	nKghdtgzcabgVB3gtdkZk254tAd3SIo/eF8xUXjjSaYddiN+ZpMA+p4axPfcJus2qBy4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYurG-0001mB-D2; Sat, 31 Oct 2020 17:40:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYurG-0006Nf-3z; Sat, 31 Oct 2020 17:40:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYurG-000277-3U; Sat, 31 Oct 2020 17:40:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156324-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 156324: regressions - FAIL
X-Osstest-Failures:
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-saverestore.2:fail:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4100d463dbdd95d85fabe387dd5676bed75f65f7
X-Osstest-Versions-That:
    xen=0108b011e133915a8ebd33636811d8c141b6e9f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Oct 2020 17:40:06 +0000

flight 156324 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156324/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    18 guest-saverestore.2      fail REGR. vs. 156035

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-nested-intel 20 debian-hvm-install/l1/l2 fail pass in 156309

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156035
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156035
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156035
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156035
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156035
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156035
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156035
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156035
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156035
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156035
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156035
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  4100d463dbdd95d85fabe387dd5676bed75f65f7
baseline version:
 xen                  0108b011e133915a8ebd33636811d8c141b6e9f3

Last test of basis   156035  2020-10-20 13:36:02 Z   11 days
Testing same since   156263  2020-10-27 18:36:53 Z    3 days    4 attempts

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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    fail    
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
commit 4100d463dbdd95d85fabe387dd5676bed75f65f7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 19 15:51:22 2020 +0100

    x86/pv: Flush TLB in response to paging structure changes
    
    With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
    is safe from Xen's point of view (as the update only affects guest mappings),
    and the guest is required to flush (if necessary) after making updates.
    
    However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
    writeable pagetables, etc.) is an implementation detail outside of the
    API/ABI.
    
    Changes in the paging structure require invalidations in the linear pagetable
    range for subsequent accesses into the linear pagetables to access non-stale
    mappings.  Xen must provide suitable flushing to prevent intermixed guest
    actions from accidentally accessing/modifying the wrong pagetable.
    
    For all L2 and higher modifications, flush the TLB.  PV guests cannot create
    L2 or higher entries with the Global bit set, so no mappings established in
    the linear range can be global.  (This could in principle be an order 39 flush
    starting at LINEAR_PT_VIRT_START, but no such mechanism exists in practice.)
    
    Express the necessary flushes as a set of booleans which accumulate across the
    operation.  Comment the flushing logic extensively.
    
    This is XSA-286.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 16a20963b3209788f2c0d3a3eebb7d92f03f5883)

commit b1d6f37aa5aa9f3fc5a269b9dd21b7feb7444be0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Oct 22 11:28:58 2020 +0100

    x86/pv: Drop FLUSH_TLB_GLOBAL in do_mmu_update() for XPTI
    
    c/s 9d1d31ad9498 "x86: slightly reduce Meltdown band-aid overhead" removed the
    use of Global TLB flushes on the Xen entry path, but added a FLUSH_TLB_GLOBAL
    to the L4 path in do_mmu_update().
    
    However, this was unnecessary.
    
    It is the guests responsibility to perform appropriate TLB flushing if the L4
    modification altered an established mapping in a flush-relevant way.  In this
    case, an MMUEXT_OP hypercall will follow.  The case which Xen needs to cover
    is when new mappings are created, and the resync on the exit-to-guest path
    covers this correctly.
    
    There is a corner case with multiple vCPUs in hypercalls at the same time,
    which 9d1d31ad9498 changed, and this patch changes back to its original XPTI
    behaviour.
    
    Architecturally, established TLB entries can continue to be used until the
    broadcast flush has completed.  Therefore, even with concurrent hypercalls,
    the guest cannot depend on older mappings not being used until an MMUEXT_OP
    hypercall completes.  Xen's implementation of guest-initiated flushes will
    take correct effect on top of an in-progress hypercall, picking up new mapping
    setting before the other vCPU's MMUEXT_OP completes.
    
    Note: The correctness of this change is not impacted by whether XPTI uses
    global mappings or not.  Correctness there depends on the behaviour of Xen on
    the entry/exit paths when switching two/from the XPTI "shadow" pagetables.
    
    This is (not really) XSA-286 (but necessary to simplify the logic).
    
    Fixes: 9d1d31ad9498 ("x86: slightly reduce Meltdown band-aid overhead")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 055e1c3a3d95b1e753148369fbc4ba48782dd602)
(qemu changes not included)

