Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A82AA84B
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 23:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21495.47812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbWoT-00069k-Oi; Sat, 07 Nov 2020 22:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21495.47812; Sat, 07 Nov 2020 22:36:01 +0000
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
	id 1kbWoT-00069L-Le; Sat, 07 Nov 2020 22:36:01 +0000
Received: by outflank-mailman (input) for mailman id 21495;
 Sat, 07 Nov 2020 22:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbWoR-00068g-Ob
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 22:35:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76540e6e-0f16-453d-937e-5856f4d1e763;
 Sat, 07 Nov 2020 22:35:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbWoK-000139-2e; Sat, 07 Nov 2020 22:35:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbWoJ-0008RY-MW; Sat, 07 Nov 2020 22:35:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbWoJ-0004nn-M3; Sat, 07 Nov 2020 22:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbWoR-00068g-Ob
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 22:35:59 +0000
X-Inumbo-ID: 76540e6e-0f16-453d-937e-5856f4d1e763
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 76540e6e-0f16-453d-937e-5856f4d1e763;
	Sat, 07 Nov 2020 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=NpDTSKt1CPLqmYcGPF9U6eRsIeRyzBRlikkvSdPioeA=; b=woRgjawIoMiKyVB92fpMFXPcAK
	zmmcQ2UPgGRj8zBlP0nugutCOzzEUpgBJnL3Mukfqzs+HF9qUmSNqZrlYw1wfKP0u4gYgjQJB+YIU
	7qqWE/RyaPyzD3aHxAKFleunqgyt/q2q4Mi1/iGFqA13p7fOLz90u6S2C9P0tTH2TA2g=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbWoK-000139-2e; Sat, 07 Nov 2020 22:35:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbWoJ-0008RY-MW; Sat, 07 Nov 2020 22:35:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbWoJ-0004nn-M3; Sat, 07 Nov 2020 22:35:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156530-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.10-testing test] 156530: tolerable FAIL - PUSHED
X-Osstest-Failures:
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.10-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=e6ade47b1e1c4b9f2e49384c68c4edff783433af
X-Osstest-Versions-That:
    qemuu=8acabec966263f90ad493e4af2642947c0c43d23
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Nov 2020 22:35:51 +0000

flight 156530 qemu-upstream-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156530/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx  3 hosts-allocate          fail baseline untested
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 137539
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 137539
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 137539
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 137539
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 137539
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 137539
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 137539
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 137539
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 137539
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                e6ade47b1e1c4b9f2e49384c68c4edff783433af
baseline version:
 qemuu                8acabec966263f90ad493e4af2642947c0c43d23

Last test of basis   137539  2019-06-09 13:54:31 Z  517 days
Testing same since   156530  2020-11-06 16:09:38 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Gonglei <arei.gonglei@huawei.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   8acabec966..e6ade47b1e  e6ade47b1e1c4b9f2e49384c68c4edff783433af -> stable-4.10

