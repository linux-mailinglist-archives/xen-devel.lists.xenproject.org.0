Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A53EDF1B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 23:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167500.305747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFjsv-00015M-6Q; Mon, 16 Aug 2021 21:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167500.305747; Mon, 16 Aug 2021 21:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFjsv-000131-2C; Mon, 16 Aug 2021 21:11:05 +0000
Received: by outflank-mailman (input) for mailman id 167500;
 Mon, 16 Aug 2021 21:11:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFjst-00012r-J8; Mon, 16 Aug 2021 21:11:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFjst-0006Bc-AX; Mon, 16 Aug 2021 21:11:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFjss-0004GH-TZ; Mon, 16 Aug 2021 21:11:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mFjss-0002WZ-T3; Mon, 16 Aug 2021 21:11:02 +0000
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
	bh=YJQ11HFV1eqYg0Zoq9hYJwFrVBvX9NRtLu2YcOgM4L0=; b=YHlMKHuk+CIekVdf/dzeUXvhk3
	vqQyCJa8Lf/74wx6md3ZJhYnwZU+AknAfEyKcQhnBpfXpw24kZWCqP+a1XxEQYwcB9D6vgvl1Nllr
	MFdRAdp72r1r50fsKb0rj6EGy8owlcJTmkH/Q8/LeaUHNPoygmfpyEtvh35dsLhiQ8Qs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164199-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 164199: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=80c9d104a10b1be410136471407dd7d5dba516a6
X-Osstest-Versions-That:
    qemuu=703e8cd6189cf699c8d5c094bc68b5f3afa6ad71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Aug 2021 21:11:02 +0000

flight 164199 qemu-mainline real [real]
flight 164208 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/164199/
http://logs.test-lab.xenproject.org/osstest/logs/164208/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-amd64-pvgrub 12 debian-di-install       fail REGR. vs. 164152
 test-amd64-amd64-i386-pvgrub 12 debian-di-install        fail REGR. vs. 164152

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 164152

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164152
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164152
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164152
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164152
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164152
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164152
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164152
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                80c9d104a10b1be410136471407dd7d5dba516a6
baseline version:
 qemuu                703e8cd6189cf699c8d5c094bc68b5f3afa6ad71

Last test of basis   164152  2021-08-10 21:08:02 Z    5 days
Failing since        164194  2021-08-15 10:38:08 Z    1 days    2 attempts
Testing same since   164199  2021-08-16 03:03:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Lara Lazier <laramglazier@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Taylor Simpson <tsimpson@quicinc.com>

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
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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
commit 80c9d104a10b1be410136471407dd7d5dba516a6
Merge: f1a1a93646 a4de5e8a06
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Sun Aug 15 13:23:20 2021 +0100

    Merge remote-tracking branch 'remotes/kraxel/tags/maintainers-20210811-pull-request' into staging
    
    MAINTAINERS: update kraxel's entries.
    
    # gpg: Signature made Wed 11 Aug 2021 07:41:07 BST
    # gpg:                using RSA key A0328CFFB93A17A79901FE7D4CB6D8EED3E87138
    # gpg: Good signature from "Gerd Hoffmann (work) <kraxel@redhat.com>" [full]
    # gpg:                 aka "Gerd Hoffmann <gerd@kraxel.org>" [full]
    # gpg:                 aka "Gerd Hoffmann (private) <kraxel@gmail.com>" [full]
    # Primary key fingerprint: A032 8CFF B93A 17A7 9901  FE7D 4CB6 D8EE D3E8 7138
    
    * remotes/kraxel/tags/maintainers-20210811-pull-request:
      MAINTAINERS: update virtio-gpu entry.
      MAINTAINERS: update virtio-input entry.
      MAINTAINERS: update usb entries.
      MAINTAINERS: update spice entry.
      MAINTAINERS: update audio entry.
      MAINTAINERS: update sockets entry.
      MAINTAINERS: update edk2 entry.
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit f1a1a93646f49d710bc3937dd72e7a53b4a2fc6a
Merge: 2edf8ac5bd a7686d5d85
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Sun Aug 15 11:14:23 2021 +0100

    Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20210812' into staging
    
    Hexagon (disas/hexagon.c) fix memory leak for early exit
    
    Don't allocate the string until error conditions have been checked
    
    Fixes: a00cfed0e ("Hexagon (disas) disassembler")
    Eliminate Coverity CID 1460121 (Resource leak)
    
    # gpg: Signature made Fri 13 Aug 2021 04:03:00 BST
    # gpg:                using RSA key 7B0244FB12DE4422
    # gpg: Good signature from "Taylor Simpson (Rock on) <tsimpson@quicinc.com>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 3635 C788 CE62 B91F D4C5  9AB4 7B02 44FB 12DE 4422
    
    * remotes/quic/tags/pull-hex-20210812:
      Hexagon (disas/hexagon.c) fix memory leak for early exit cases
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 2edf8ac5bdd0ae1624dea2a8d5784f7a33745901
Merge: 703e8cd618 ea0aa1752c
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Aug 13 17:52:19 2021 +0100

    Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging
    
    Fixes for -smp, and for x86 TCG on Windows.
    
    # gpg: Signature made Fri 13 Aug 2021 13:43:46 BST
    # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
    # gpg:                issuer "pbonzini@redhat.com"
    # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
    # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
    # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
    #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
    
    * remotes/bonzini-gitlab/tags/for-upstream:
      hw/core: fix error checking in smp_parse
      hw/core: Add missing return on error
      target/i386: Fixed size of constant for Windows
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit ea0aa1752ca88f7856cbf40eef0db62f90f28dcd
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Thu Aug 12 18:53:53 2021 +0100

    hw/core: fix error checking in smp_parse
    
    machine_set_smp() mistakenly checks 'errp' not '*errp',
    and so thinks there is an error every single time it runs.
    This causes it to jump to the end of the method, skipping
    the max CPUs checks. The caller meanwhile sees no error
    and so carries on execution. The result of all this is:
    
     $ qemu-system-x86_64 -smp -1
     qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes
    
    instead of
    
     $ qemu-system-x86_64 -smp -1
     qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255
    
    This is a regression from
    
      commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
      Author: Paolo Bonzini <pbonzini@redhat.com>
      Date:   Thu May 13 09:03:48 2021 -0400
    
        machine: add smp compound property
    
    Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20210812175353.4128471-1-berrange@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit 0b46318170bf2782564e1c444e01a47cda308c7f
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Fri Aug 13 13:26:06 2021 +0200

    hw/core: Add missing return on error
    
    If dies is not supported by this machine's CPU topology, don't
    keep processing options and return directly.
    
    Fixes: 0aebebb561c ("machine: reject -smp dies!=1 for non-PC machines")
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-Id: <20210813112608.1452541-2-philmd@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit 24d84c7e4806da0c362edd2ee76678f15becd17d
Author: Lara Lazier <laramglazier@gmail.com>
Date:   Thu Aug 12 13:10:56 2021 +0200

    target/i386: Fixed size of constant for Windows
    
    ~0UL has 64 bits on Linux and 32 bits on Windows.
    
    Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512
    Reported-by: Volker Rümelin <vr_qemu@t-online.de>
    Signed-off-by: Lara Lazier <laramglazier@gmail.com>
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Message-Id: <20210812111056.26926-1-laramglazier@gmail.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit a7686d5d8528469b596e98eff098a5d3f8328fb3
Author: Taylor Simpson <tsimpson@quicinc.com>
Date:   Thu Aug 12 06:53:09 2021 -0500

    Hexagon (disas/hexagon.c) fix memory leak for early exit cases
    
    Don't allocate the string until error conditions have been checked
    
    Fixes: a00cfed0e ("Hexagon (disas) disassembler")
    Eliminate Coverity CID 1460121 (Resource leak)
    
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Reviewed-by: Philippe Mathieu-Daud? <f4bug@amsat.org>
    Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>

commit a4de5e8a0667e3ee43ca9953ec7fd11ff19f2c92
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:50 2021 +0200

    MAINTAINERS: update virtio-gpu entry.
    
    New maintainer wanted. Downgrade status to "Odd Fixes" for now.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-8-kraxel@redhat.com>

commit 1e2edb986608a35e874a77c5e8e71f056c1681b6
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:49 2021 +0200

    MAINTAINERS: update virtio-input entry.
    
    New maintainer wanted. Downgrade status to "Odd Fixes" for now.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-7-kraxel@redhat.com>

commit cd02c965c4b65a488af44f1bf52d466f5c858cc2
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:48 2021 +0200

    MAINTAINERS: update usb entries.
    
    New maintainer wanted.  Switch role to "Reviewer" for usb-serial,
    downgrade status to "Odd Fixes" for everything else.
    
    Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-6-kraxel@redhat.com>

commit 227b1638ba39b7b3dedf0d9ad6ae2c4908688a8c
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:47 2021 +0200

    MAINTAINERS: update spice entry.
    
    New maintainer wanted. Downgrade status to "Odd Fixes" for now.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-5-kraxel@redhat.com>

commit 6bc915f31a436a44119b8e1ef7413518eb8865d1
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:46 2021 +0200

    MAINTAINERS: update audio entry.
    
    New maintainer wanted. Downgrade status to "Odd Fixes" for now.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-4-kraxel@redhat.com>

commit 8f6259055a1aac60663b4a853cf8e383e30d1de0
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:45 2021 +0200

    MAINTAINERS: update sockets entry.
    
    I have not touched the code for years.
    Make the entry match reality and drop my name.
    
    Cc: Daniel P. Berrange <berrange@redhat.com>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-3-kraxel@redhat.com>

commit f492bdf4abeb593f95eb9026d5bce54afb65d575
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Aug 10 10:34:44 2021 +0200

    MAINTAINERS: update edk2 entry.
    
    I want keep an eye on the edk2 things happening in qemu.
    
    Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20210810083450.2377374-2-kraxel@redhat.com>

