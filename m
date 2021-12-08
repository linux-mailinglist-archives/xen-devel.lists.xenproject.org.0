Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910946CD69
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 06:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242031.418675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mupvJ-0001uO-Kh; Wed, 08 Dec 2021 05:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242031.418675; Wed, 08 Dec 2021 05:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mupvJ-0001rq-Gv; Wed, 08 Dec 2021 05:55:25 +0000
Received: by outflank-mailman (input) for mailman id 242031;
 Wed, 08 Dec 2021 05:55:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mupvI-0001rg-JM; Wed, 08 Dec 2021 05:55:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mupvI-0006E1-8U; Wed, 08 Dec 2021 05:55:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mupvH-0003y5-UF; Wed, 08 Dec 2021 05:55:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mupvH-0002aX-Tk; Wed, 08 Dec 2021 05:55:23 +0000
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
	bh=Pcd5to23q0SdtC6XDDAVNyswszhAjSQR+SqAY9fM6bQ=; b=ePksDO9XrqJrR3mXchKBkWZ6mI
	+LUhNDF1u/ankfBfM5NSRfZ24cEsqfYqMrdHRFd+RaIlH+nNQazeJew6+KjeHliCNJcL8LKfW+xFY
	oYW8hsAfIMwluVcVk8O94Fpgc2ekRk3xSPJHwdohiXwx5Pn7p//WbQ53BBpzHcc+phTQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167222-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167222: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-credit1:guest-start.2:fail:regression
    linux-linus:test-amd64-amd64-examine:memdisk-try-append:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f80ef9e49fdfbfbc4197711230098b90e6b05a7e
X-Osstest-Versions-That:
    linux=0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Dec 2021 05:55:23 +0000

flight 167222 linux-linus real [real]
flight 167227 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167222/
http://logs.test-lab.xenproject.org/osstest/logs/167227/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit1  23 guest-start.2            fail REGR. vs. 167179

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 167179

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167179
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167179
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167179
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167179
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167179
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167179
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167179
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167179
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                f80ef9e49fdfbfbc4197711230098b90e6b05a7e
baseline version:
 linux                0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1

Last test of basis   167179  2021-12-06 04:55:24 Z    2 days
Testing same since   167222  2021-12-06 19:43:33 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akira Yokosawa <akiyks@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Erik Ekman <erik@kryo.se>
  Hans Verkuil <hverkuil@xs4all.nl>
  Joel Colledge <joel.colledge@linbit.com>
  Jonathan Corbet <corbet@lwn.net>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mark Brown <broonie@kernel.org>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
commit f80ef9e49fdfbfbc4197711230098b90e6b05a7e
Merge: 9d6cf4720203 333b11e541fe
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Dec 6 10:46:20 2021 -0800

    Merge tag 'docs-5.16-3' of git://git.lwn.net/linux
    
    Pull documentation fixes from Jonathan Corbet:
     "A few important documentation fixes, including breakage that comes
      with v1.0 of the ReadTheDocs theme"
    
    * tag 'docs-5.16-3' of git://git.lwn.net/linux:
      Documentation: Add minimum pahole version
      Documentation/process: fix self reference
      docs: admin-guide/blockdev: Remove digraph of node-states
      docs: conf.py: fix support for Readthedocs v 1.0.0

commit 9d6cf4720203ed4db30855c01876ab4e5be61fd8
Merge: b806bec53881 07fb78a78de4
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Dec 6 10:22:12 2021 -0800

    Merge tag 'spi-fix-v5.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
    
    Pull spi fix from Mark Brown:
     "Just one trivial update adding a device ID to the DT bindings"
    
    * tag 'spi-fix-v5.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi:
      spi: spi-rockchip: Add rk3568-spi compatible

commit b806bec53881f493c550107b8455afc7b7900009
Merge: 55a677b256c3 6966df483d7b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Dec 6 10:14:12 2021 -0800

    Merge tag 'regulator-fix-v5.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
    
    Pull regulator fix from Mark Brown:
     "Documentation fix for v5.17.
    
      A fix for bitrot in the documentation for protection interrupts that
      crept in as the code was revised during review"
    
    * tag 'regulator-fix-v5.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator:
      regulator: Update protection IRQ helper docs

commit 55a677b256c363a0cdcd00781d392abeb6e1c0d1
Merge: 0fcfb00b28c0 1ff2fc02862d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Dec 6 10:09:00 2021 -0800

    Merge tag 'efi-urgent-for-v5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
    
    Pull EFI fix from Ard Biesheuvel:
     "Ensure that the EFI memory map resides in encrypted memory even after
      it has been reallocated"
    
    * tag 'efi-urgent-for-v5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi:
      x86/sme: Explicitly map new EFI memmap table as encrypted

commit 1ff2fc02862d52e18fd3daabcfe840ec27e920a8
Author: Tom Lendacky <thomas.lendacky@amd.com>
Date:   Wed Oct 20 13:02:11 2021 -0500

    x86/sme: Explicitly map new EFI memmap table as encrypted
    
    Reserving memory using efi_mem_reserve() calls into the x86
    efi_arch_mem_reserve() function. This function will insert a new EFI
    memory descriptor into the EFI memory map representing the area of
    memory to be reserved and marking it as EFI runtime memory. As part
    of adding this new entry, a new EFI memory map is allocated and mapped.
    The mapping is where a problem can occur. This new memory map is mapped
    using early_memremap() and generally mapped encrypted, unless the new
    memory for the mapping happens to come from an area of memory that is
    marked as EFI_BOOT_SERVICES_DATA memory. In this case, the new memory will
    be mapped unencrypted. However, during replacement of the old memory map,
    efi_mem_type() is disabled, so the new memory map will now be long-term
    mapped encrypted (in efi.memmap), resulting in the map containing invalid
    data and causing the kernel boot to crash.
    
    Since it is known that the area will be mapped encrypted going forward,
    explicitly map the new memory map as encrypted using early_memremap_prot().
    
    Cc: <stable@vger.kernel.org> # 4.14.x
    Fixes: 8f716c9b5feb ("x86/mm: Add support to access boot related data in the clear")
    Link: https://lore.kernel.org/all/ebf1eb2940405438a09d51d121ec0d02c8755558.1634752931.git.thomas.lendacky@amd.com/
    Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
    [ardb: incorporate Kconfig fix by Arnd]
    Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

commit 333b11e541feeb79e7cce31dd5b280ceded388e4
Author: Arnaldo Carvalho de Melo <acme@kernel.org>
Date:   Fri Nov 19 15:56:03 2021 -0300

    Documentation: Add minimum pahole version
    
    A report was made in https://github.com/acmel/dwarves/issues/26 about
    pahole not being listed in the process/changes.rst file as being needed
    for building the kernel, address that.
    
    Link: https://github.com/acmel/dwarves/issues/26
    Acked-by: Andrii Nakryiko <andrii@kernel.org>
    Acked-by: Daniel Borkmann <daniel@iogearbox.net>
    Cc: Alexei Starovoitov <ast@kernel.org>
    Cc: Jiri Olsa <jolsa@redhat.com>
    Link: http://lore.kernel.org/lkml/YZPQ6+u2wTHRfR+W@kernel.org
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    Link: https://lore.kernel.org/r/YZfzQ0DvHD5o26Bt@kernel.org
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

commit aa9b5e0df226edbf1879cb8f17a409cc3fd89c9d
Author: Erik Ekman <erik@kryo.se>
Date:   Fri Nov 19 21:07:58 2021 +0100

    Documentation/process: fix self reference
    
    Instead link to the device tree document with the same name.
    
    Signed-off-by: Erik Ekman <erik@kryo.se>
    Link: https://lore.kernel.org/r/20211119200758.642474-1-erik@kryo.se
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

commit 5c81691bb6461a474ac9d6ad5737c12e8f558a8b
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Fri Nov 26 13:11:17 2021 +0900

    docs: admin-guide/blockdev: Remove digraph of node-states
    
    While node-states-8.dot has two digraphs, the dot(1) command can
    not properly handle multiple graphs in a DOT file and the
    kernel-doc page at
    
        https://www.kernel.org/doc/html/latest/admin-guide/blockdev/drbd/figures.html
    
    fails to render the graphs.
    
    It turned out that the digraph of node_states can be removed.
    
    Quote from Joel's reflection:
    
        On reflection, the digraph node_states can be removed entirely.
        It is too basic to contain any useful information. In addition
        it references "ioctl_set_state". The ioctl configuration
        interface for DRBD has long been removed. In fact, it was never
        in the upstream version of DRBD.
    
    Remove node_states and rename the DOT file peer_states-8.dot.
    
    Suggested-by: Joel Colledge <joel.colledge@linbit.com>
    Acked-by: Joel Colledge <joel.colledge@linbit.com>
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Cc: Philipp Reisner <philipp.reisner@linbit.com>
    Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
    Link: https://lore.kernel.org/r/7df04f45-8746-e666-1a9d-a998f1ab1f91@gmail.com
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

commit d69dab7de208748ddf79143b39d98db55eee9b4a
Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Sat Nov 27 10:14:49 2021 +0100

    docs: conf.py: fix support for Readthedocs v 1.0.0
    
    As described at:
            https://stackoverflow.com/questions/23211695/modifying-content-width-of-the-sphinx-theme-read-the-docs
    
    since Sphinx 1.8, the standard way to setup a custom theme is
    to use html_css_files. While using html_context is OK with RTD
    0.5.2, it doesn't work with 1.0.0, causing the theme to not load,
    producing a very weird html.
    
    Tested with:
            - Sphinx 1.7.9 + sphinx-rtd-theme 0.5.2
            - Sphinx 2.4.4 + sphinx-rtd-theme 0.5.2
            - Sphinx 2.4.4 + sphinx-rtd-theme 1.0.0
            - Sphinx 4.3.0 + sphinx-rtd-theme 1.0.0
    
    Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
    Tested-by: Hans Verkuil <hverkuil@xs4all.nl>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
    Tested-by: Akira Yokosawa <akiyks@gmail.com>
    Link: https://lore.kernel.org/r/80009f0d17ea0840d81e7e16fff6e7677919fdfc.1638004294.git.mchehab+huawei@kernel.org
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

commit 07fb78a78de4e67b5d6d5407aeee1250a327a698
Author: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Date:   Fri Nov 26 16:43:42 2021 +0100

    spi: spi-rockchip: Add rk3568-spi compatible
    
    This adds a compatible string for the SPI controller found on
    the RK3566 and RK3568 SoCs.
    
    Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
    Link: https://lore.kernel.org/r/20211126154344.724316-2-frattaroli.nicolas@gmail.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

commit 6966df483d7b5b218aeb0e13e7e334a8fc3c1744
Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Date:   Thu Nov 18 13:49:51 2021 +0200

    regulator: Update protection IRQ helper docs
    
    The documentation of IRQ notification helper had still references to
    first RFC implementation which called BUG() while trying to protect the
    hardware. Behaviour was improved as calling the BUG() was not a proper
    solution. Current implementation attempts to call poweroff if handling
    of potentially damaging error notification fails. Update the
    documentation to reflect the actual behaviour.
    
    Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
    Link: https://lore.kernel.org/r/0c9cc4bcf20c3da66fd5a85c97ee4288e5727538.1637233864.git.matti.vaittinen@fi.rohmeurope.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

