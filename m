Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CD688192
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 16:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488835.757100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNbLe-0000IO-Cy; Thu, 02 Feb 2023 15:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488835.757100; Thu, 02 Feb 2023 15:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNbLe-0000GT-7f; Thu, 02 Feb 2023 15:18:02 +0000
Received: by outflank-mailman (input) for mailman id 488835;
 Thu, 02 Feb 2023 15:18:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNbLc-0000GI-LQ; Thu, 02 Feb 2023 15:18:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNbLc-0006Ki-Gd; Thu, 02 Feb 2023 15:18:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNbLc-0003PC-3s; Thu, 02 Feb 2023 15:18:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNbLc-0005Wo-3B; Thu, 02 Feb 2023 15:18:00 +0000
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
	bh=Ke525gWmgUiqbRu/CeXxDSJMPrh08YMED6NgAJ4cRL8=; b=fOIBqvuHcTq1SFuDxAYm6lHeQ0
	m0472FhT+8gf18QrGJe//9WjaXmiP2hIHmCXSs1NNm6qnlDKOvLFKVY1klthb7rcXo8si0n2M/1gS
	cuYTS6LggcaucPYkYRu+HajLGsgY75hNwK/MbOnT5DpQRO7dEsIbV3EQqCSoz8nHCp2s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176332-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 176332: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:build-armhf:<job status>:broken:regression
    qemu-mainline:build-armhf:host-install(4):broken:regression
    qemu-mainline:build-arm64-pvops:kernel-build:fail:regression
    qemu-mainline:build-armhf:syslog-server:running:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:build-armhf:capture-logs:broken:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=026817fb69414c9d3909d8b1a209f90180d777d6
X-Osstest-Versions-That:
    qemuu=13356edb87506c148b163b8c7eb0695647d00c2a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Feb 2023 15:18:00 +0000

flight 176332 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176332/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 176096
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 176096
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 build-armhf                   5 capture-logs          broken blocked in 176096
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-install    fail like 176096
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176096
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176096
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat    fail  like 176096
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176096
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176096
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176096
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                026817fb69414c9d3909d8b1a209f90180d777d6
baseline version:
 qemuu                13356edb87506c148b163b8c7eb0695647d00c2a

Last test of basis   176096  2023-01-24 12:38:02 Z    9 days
Testing same since   176332  2023-02-02 10:37:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dongdong Zhang <zhangdongdong@eswincomputing.com>
  John Snow <jsnow@redhat.com>
  Maksim Davydov <davydov-max@yandex-team.ru>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Peter Delevoryas <peter@pjd.dev>
  Peter Maydell <peter.maydell@linaro.org>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      blocked 
 test-amd64-i386-xl-vhd                                       pass    


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

broken-job build-armhf broken
broken-step build-armhf capture-logs
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 026817fb69414c9d3909d8b1a209f90180d777d6
Merge: 13356edb87 bd4c0ef409
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed Feb 1 16:15:55 2023 +0000

    Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging
    
    Python
    
    Bits and pieces, kibbles'n'bits
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQIzBAABCAAdFiEE+ber27ys35W+dsvQfe+BBqr8OQ4FAmPQlMIACgkQfe+BBqr8
    # OQ5RIxAAqaG8Dx63CXa8WHMsGWc0CKTOcwTcRDw92GT3qhVkebZiNmNlZwckaU/c
    # CkVunJnU5T6T2qkploysUXwdlQ+XsY4fQlACNciZeffmT2E4siNQ/4H1uPB4xca6
    # 8Sgmg2VH7OF+EWwuBihY1pbe7g+sOJg9w9isRduBnLGrLbOrewGIJBNbiVzFlz5W
    # 30RdvfLoUUak5qTlMT/6yl98r6fkkDmfPX653iYmpA/H/Ah+17ZJXB2XNigkqBdD
    # Cp8OxtFceKQdZOqNiADJRzT3Gore4lBkPnULKwct/5U0B/tUiBdZ2YDJW8EObUMY
    # zFE7giE5mCnyFSmfBmjKu8yS8zJm9NooYEjunTcodop/FDb96c3sh8376ZLamTii
    # /p5WSwfo4a6DXPUTx0aiCkqpeCdPncRgwKc5TvqyKLKxQHbfjt6UZrcL6iYbe6O6
    # ltBcdvfdzL41TNjS678QqiGuYkADVa/nhig3ano4msx/Tf5e0O8eMoK9bDbVS9KF
    # QuONtOcut1YhnAHJp4oYN2Nimtr0t8j07iOOfc4X3+WwdbMCfR+toDM4wWVJ3u/O
    # 8Phy8hinfndMXdP9Q4eeFAiJ1zuD/XkpaKoDe0gHcEvp3zMEXmHiEOdv4hFeWTQB
    # ivU3oM/j2uVcHU4CSxra3B54vfLc1gudJ2yLPvhwPKoIRbJ/kbc=
    # =36NA
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 25 Jan 2023 02:32:34 GMT
    # gpg:                using RSA key F9B7ABDBBCACDF95BE76CBD07DEF8106AAFC390E
    # gpg: Good signature from "John Snow (John Huston) <jsnow@redhat.com>" [full]
    # Primary key fingerprint: FAEB 9711 A12C F475 812F  18F2 88A9 064D 1835 61EB
    #      Subkey fingerprint: F9B7 ABDB BCAC DF95 BE76  CBD0 7DEF 8106 AAFC 390E
    
    * tag 'python-pull-request' of https://gitlab.com/jsnow/qemu:
      python/qemu/machine: use socketpair() for QMP by default
      python/qmp/legacy: make QEMUMonitorProtocol accept a socket
      python/qmp/protocol: add open_with_socket()
      python/qmp: increase read buffer size
      python/machine: Fix AF_UNIX path too long on macOS
      python: QEMUMachine: enable qmp accept timeout by default
      Fix some typos
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit bd4c0ef409140bd1be393407c04005ac077d4574
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Jan 11 12:01:01 2023 +0400

    python/qemu/machine: use socketpair() for QMP by default
    
    When no monitor address is given, establish the QMP communication through
    a socketpair() (API is also supported on Windows since Python 3.5)
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-id: 20230111080101.969151-4-marcandre.lureau@redhat.com
    [Resolved conflicts, fixed typing error. --js]
    Signed-off-by: John Snow <jsnow@redhat.com>

commit 603a3bad4b9a95b524dc8d6a41b1be4d5c5cacdf
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Jan 11 12:01:00 2023 +0400

    python/qmp/legacy: make QEMUMonitorProtocol accept a socket
    
    Teach QEMUMonitorProtocol to accept an exisiting socket.
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-id: 20230111080101.969151-3-marcandre.lureau@redhat.com
    Signed-off-by: John Snow <jsnow@redhat.com>

commit a3cfea92e2030926e00a2519d299384ea648e36e
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Jan 11 12:00:59 2023 +0400

    python/qmp/protocol: add open_with_socket()
    
    Instead of listening for incoming connections with a SocketAddr, add a
    new method open_with_socket() that accepts an existing socket.
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-id: 20230111080101.969151-2-marcandre.lureau@redhat.com
    Signed-off-by: John Snow <jsnow@redhat.com>

commit 166464c6ce82f748e33b24361a72e9d310130fa0
Author: Maksim Davydov <davydov-max@yandex-team.ru>
Date:   Thu Jan 12 18:28:03 2023 +0300

    python/qmp: increase read buffer size
    
    Current 256KB is not enough for some real cases. As a possible solution
    limit can be chosen to be the same as libvirt (10MB)
    
    Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
    Reviewed-by: John Snow <jsnow@redhat.com>
    Message-id: 20230112152805.33109-3-davydov-max@yandex-team.ru
    Signed-off-by: John Snow <jsnow@redhat.com>

commit f9922937d173f50fe59fd1b20fadc445fb6b2564
Author: Peter Delevoryas <peter@pjd.dev>
Date:   Tue Jan 10 00:29:30 2023 -0800

    python/machine: Fix AF_UNIX path too long on macOS
    
    On macOS, private $TMPDIR's are the default. These $TMPDIR's are
    generated from a user's unix UID and UUID [1], which can create a
    relatively long path:
    
        /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
    
    QEMU's avocado tests create a temporary directory prefixed by
    "avo_qemu_sock_", and create QMP sockets within _that_ as well.
    The QMP socket is unnecessarily long, because a temporary directory
    is created for every QEMUMachine object.
    
        /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
    
    The path limit for unix sockets on macOS is 104: [2]
    
        /*
         * [XSI] Definitions for UNIX IPC domain.
         */
        struct  sockaddr_un {
            unsigned char   sun_len;        /* sockaddr len including null */
            sa_family_t     sun_family;     /* [XSI] AF_UNIX */
            char            sun_path[104];  /* [XSI] path name (gag) */
        };
    
    This results in avocado tests failing on macOS because the QMP unix
    socket can't be created, because the path is too long:
    
        ERROR| Failed to establish connection: OSError: AF_UNIX path too long
    
    This change resolves by reducing the size of the socket directory prefix
    and the suffix on the QMP and console socket names.
    
    The result is paths like this:
    
        pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
        $ tree qemu*
        qemu_df4evjeq
        qemu_jbxel3gy
        qemu_ml9s_gg7
        qemu_oc7h7f3u
        qemu_oqb1yf97
        ├── 10a004050.con
        └── 10a004050.qmp
    
    [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
    [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
    
    Signed-off-by: Peter Delevoryas <peter@pjd.dev>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Message-id: 20230110082930.42129-2-peter@pjd.dev
    Signed-off-by: John Snow <jsnow@redhat.com>

commit ada73a492cb29b9c3a9f88c5e6d3407fa0d999e7
Author: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Date:   Fri Jun 24 22:52:52 2022 +0300

    python: QEMUMachine: enable qmp accept timeout by default
    
    I've spent much time trying to debug hanging pipeline in gitlab. I
    started from and idea that I have problem in code in my series (which
    has some timeouts). Finally I found that the problem is that I've used
    QEMUMachine class directly to avoid qtest, and didn't add necessary
    arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
    it's just stopped by timeout (one hour) with no sign of what's going
    wrong.
    
    With timeout enabled, gitlab don't wait for an hour and prints all
    needed information.
    
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
    Reviewed-by: John Snow <jsnow@redhat.com>
    Message-Id: <20220624195252.175249-1-vsementsov@yandex-team.ru>
    [Fixed typing. --js]
    Signed-off-by: John Snow <jsnow@redhat.com>

commit af76484e54f6c5e20452c2b329378026b8f2c59d
Author: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Date:   Wed Nov 30 09:53:58 2022 +0800

    Fix some typos
    
    Fix some typos in 'python' directory.
    
    Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Message-id: 20221130015358.6998-2-zhangdongdong@eswincomputing.com
    [Fixed additional typo spotted by Max Filippov. --js]
    Reviewed-by: John Snow <jsnow@redhat.com>
    Signed-off-by: John Snow <jsnow@redhat.com>

