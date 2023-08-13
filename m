Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBED77A4BF
	for <lists+xen-devel@lfdr.de>; Sun, 13 Aug 2023 04:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582952.912956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qV10e-0001Vj-IQ; Sun, 13 Aug 2023 02:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582952.912956; Sun, 13 Aug 2023 02:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qV10e-0001TY-Bd; Sun, 13 Aug 2023 02:39:16 +0000
Received: by outflank-mailman (input) for mailman id 582952;
 Sun, 13 Aug 2023 02:39:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qV10c-0001TO-Ss; Sun, 13 Aug 2023 02:39:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qV10c-0003Ac-JH; Sun, 13 Aug 2023 02:39:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qV10c-0003AT-16; Sun, 13 Aug 2023 02:39:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qV10b-0003zf-Vf; Sun, 13 Aug 2023 02:39:13 +0000
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
	bh=zFfubH8WT4LxNBvnPRdr/fqsnfFy5tgNJ6M6El4Hj40=; b=3TzelDIdSF15E68YwuvbdW8hGx
	0ghXyb/Kra/qpDh6nHK0LxkwL/tawcdKy1tgQLy83y8c8mJjQQHE3jY94Q7bIrvWlfDYp4wDrXxyr
	eqyC4pzP6gPtVVt5qGAvQ9OPkjl9McdFnuzNkXoL2kMI4lKz1SRZKiKP/k0lw7pAiVK0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182298-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 182298: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:guest-start:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=bb5f142cb320d45d3d8dee2c82dae003cad39da8
X-Osstest-Versions-That:
    qemuu=3944e93af06f06eb07316e0bef46b007573e0309
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Aug 2023 02:39:13 +0000

flight 182298 qemu-mainline real [real]
flight 182307 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182298/
http://logs.test-lab.xenproject.org/osstest/logs/182307/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-qcow2 13 guest-start            fail REGR. vs. 182276

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182276
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182276
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182276
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182276
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182276
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182276
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182276
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                bb5f142cb320d45d3d8dee2c82dae003cad39da8
baseline version:
 qemuu                3944e93af06f06eb07316e0bef46b007573e0309

Last test of basis   182276  2023-08-11 13:06:05 Z    1 days
Testing same since   182298  2023-08-12 10:18:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>
  Guoyi Tu <tugy@chinatelecom.cn>
  Jason Chien &lt;<a href="mailto:jason.chien@sifive.com" target="_blank">jason.chien@sifive.com</a>&gt;<br>
  Jason Chien <jason.chien@sifive.com>
  Michael S. Tsirkin <mst@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>
  yuanminghao <yuanmh12@chinatelecom.cn>

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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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


Not pushing.

------------------------------------------------------------
commit bb5f142cb320d45d3d8dee2c82dae003cad39da8
Merge: 44e13cb441 b274c2388e
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Aug 11 14:47:23 2023 -0700

    Merge tag 'pull-riscv-to-apply-20230811-3' of https://github.com/alistair23/qemu into staging
    
    Sixth RISC-V PR for 8.1
    
    This is a last minute PR for RISC-V.
    
    The main goal is to fix
    https://gitlab.com/qemu-project/qemu/-/issues/1823
    which is a regression that means the aclint option
    cannot be enabled.
    
    While we are here we also fixup KVM issue.
    
     * KVM: fix mvendorid size
     * Fixup aclint check
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQIzBAABCAAdFiEEaukCtqfKh31tZZKWr3yVEwxTgBMFAmTWfK0ACgkQr3yVEwxT
    # gBNDTw/9EnIjXKBCwSejcL3xYpwTDbUbwou3dkkSjnEkhmxvPPM3H0pWet+xYlPg
    # Lgt9b9clHZAjqGoHFxEdU8fS0MY4Jq5jDAinsS2TK6czLPBe5EEhyVjoDH5iRhTX
    # AymK1XgwQ2kAuw2lhcb74GDboajkC7hNhr2Km1hLtpYV7bCW/efAUSO7adG4KBlB
    # SCu06s9VdFtINW0mVN249JvRVQ1408HCQ5gwA0lLVdXhfHluVidwOjc//ELtdnQn
    # SeHdX1V+e+3fiYuqmr2UHaJXp9s0ZInOyLIDBPA97SOUdaO/oy+siZYRk25yV99h
    # Ec7tpNnYJjzppmc++GlzTNpUWVEBM6j+QyD7ioEj4yAGkMEjUlgLcImyGng1TT4i
    # uvABg91uzJyBoUga3GhZYt/sPW00Jft4VYH3QvGOOwjarIor8K0J7sox8eIOfEs4
    # JqCIYX4kas+DwK4+i8WyjMeuihWFJ5ipKR7Gwhbe5uQ5szTXFYIT4TZH/78BWozI
    # dMu5HOyu5+l9yCy39NP7FjNJ6VQKBYGvlkUr5rLRS0yQWGThaK8wIBMXcuZCW96p
    # hSy/pratHQYaIRr0ZiqRcNyFNsTMua/C2DMPcjQR1ci8xdj010DoriyS0Vsh88xq
    # pVgC6gYn59gDUdBx0gB/ZSMu4O+F/+Z5htnucoTxvwpKxUU48Lg=
    # =x8Fl
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Fri 11 Aug 2023 11:23:41 AM PDT
    # gpg:                using RSA key 6AE902B6A7CA877D6D659296AF7C95130C538013
    # gpg: Good signature from "Alistair Francis <alistair@alistair23.me>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 6AE9 02B6 A7CA 877D 6D65  9296 AF7C 9513 0C53 8013
    
    * tag 'pull-riscv-to-apply-20230811-3' of https://github.com/alistair23/qemu:
      hw/riscv/virt.c: change 'aclint' TCG check
      target/riscv/kvm.c: fix mvendorid size in vcpu_set_machine_ids()
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b274c2388e9fcde75d60c6e7c7d8f888874b61b7
Author: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date:   Fri Aug 11 13:02:24 2023 -0300

    hw/riscv/virt.c: change 'aclint' TCG check
    
    The 'aclint' property is being conditioned with tcg acceleration in
    virt_machine_class_init(). But acceleration code starts later than the
    class init of the board, meaning that tcg_enabled() will be always be
    false during class_init(), and the option is never being declared even
    when declaring TCG accel:
    
    $ ./build/qemu-system-riscv64 -M virt,accel=tcg,aclint=on
    qemu-system-riscv64: Property 'virt-machine.aclint' not found
    
    Fix it by moving the check from class_init() to machine_init(). Tune the
    description to mention that the option is TCG only.
    
    Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
    Fixes: c0716c81b ("hw/riscv/virt: Restrict ACLINT to TCG")
    Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1823
    Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Message-ID: <20230811160224.440697-2-dbarboza@ventanamicro.com>
    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

commit 136cb9cc03154615609d454db40e0b3dfbb4bbf3
Author: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date:   Wed Aug 2 15:00:58 2023 -0300

    target/riscv/kvm.c: fix mvendorid size in vcpu_set_machine_ids()
    
    cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
    a target_ulong val, i.e. a 64 bit field in a 64 bit host.
    
    Given that we're passing a pointer to the mvendorid field, the reg is
    reading 64 bits starting from mvendorid and going 32 bits in the next
    field, marchid. Here's an example:
    
    $ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \$
       -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)
    
    (inside the guest)
     # cat /proc/cpuinfo
    processor       : 0
    hart            : 0
    isa             : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
    mmu             : sv57
    mvendorid       : 0xab000000cd
    marchid         : 0xab
    mimpid          : 0xef
    
    'mvendorid' was written as a combination of 0xab (the value from the
    adjacent field, marchid) and its intended value 0xcd.
    
    Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
    use it as input for kvm_set_one_reg(). Here's the result with this patch
    applied and using the same QEMU command line:
    
     # cat /proc/cpuinfo
    processor       : 0
    hart            : 0
    isa             : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
    mmu             : sv57
    mvendorid       : 0xcd
    marchid         : 0xab
    mimpid          : 0xef
    
    This bug affects only the generic (rv64) CPUs when running with KVM in a
    64 bit env since the 'host' CPU does not allow the machine IDs to be
    changed via command line.
    
    Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
    Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>
    Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
    Message-ID: <20230802180058.281385-1-dbarboza@ventanamicro.com>
    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

commit 44e13cb441e08cb4635914ca03d95a282fb70e5c
Merge: 3944e93af0 0f936247e8
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Aug 11 10:28:23 2023 -0700

    Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging
    
    pci: last minute bugfixes
    
    two fixes that seem very safe and important enough to sneak
    in before the release.
    
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQFDBAABCAAtFiEEXQn9CHHI+FuUyooNKB8NuNKNVGkFAmTWXvIPHG1zdEByZWRo
    # YXQuY29tAAoJECgfDbjSjVRpe7sH/0KteOBt324LUYZ+4NR6EQE5KDsCANGiySBK
    # r0B6lhcFHvNd2ej0g2hW7lL6nVVCQBkJLLzfNIR/aHkeCmOttfbhv4eF4S6Ho27d
    # DpkXCPZRT6F11gY7G1swFapNS/f0P7F5LGRjq4sbuw3FpyHBz0DqCQ0GOab2Qorq
    # VfuOfA01nYGNzHOKrEL7k9Io55oqPVcAe+5TaipNCQ4nW82i32ItTyFjQFdLIAay
    # qY4HEwP9vPuVwWNdQjXJNfirLMO5GQfEbyKDAjap2sL25zAV2w+mgn7xg/xkTfM6
    # iMX2m14lKRMy2hr8dEVh/XdLf7loAN1jSE8/Wdt+PEaexolqxCM=
    # =1GLE
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Fri 11 Aug 2023 09:16:50 AM PDT
    # gpg:                using RSA key 5D09FD0871C8F85B94CA8A0D281F0DB8D28D5469
    # gpg:                issuer "mst@redhat.com"
    # gpg: Good signature from "Michael S. Tsirkin <mst@kernel.org>" [undefined]
    # gpg:                 aka "Michael S. Tsirkin <mst@redhat.com>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 0270 606B 6F3C DF3D 0B17  0970 C350 3912 AFBE 8E67
    #      Subkey fingerprint: 5D09 FD08 71C8 F85B 94CA  8A0D 281F 0DB8 D28D 5469
    
    * tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu:
      pci: Fix the update of interrupt disable bit in PCI_COMMAND register
      hw/pci-host: Allow extended config space access for Designware PCIe host
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 0f936247e8ed0ab5fb7e75827dd8c8f73d5ef4b5
Author: Guoyi Tu <tugy@chinatelecom.cn>
Date:   Fri Aug 11 22:46:51 2023 +0800

    pci: Fix the update of interrupt disable bit in PCI_COMMAND register
    
    The PCI_COMMAND register is located at offset 4 within
    the PCI configuration space and occupies 2 bytes. The
    interrupt disable bit is at the 10th bit, which corresponds
    to the byte at offset 5 in the PCI configuration space.
    
    In our testing environment, the guest driver may directly
    updates the byte at offset 5 in the PCI configuration space.
    The backtrace looks like as following:
        at hw/pci/pci.c:1442
        at hw/virtio/virtio-pci.c:605
        val=5, len=1) at hw/pci/pci_host.c:81
    
    In this situation, the range_covers_byte function called
    by the pci_default_write_config function will return false,
    resulting in the inability to handle the interrupt disable
    update event.
    
    To fix this issue, we can use the ranges_overlap function
    instead of range_covers_byte to determine whether the interrupt
    bit has been updated.
    
    Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
    Signed-off-by: yuanminghao <yuanmh12@chinatelecom.cn>
    Message-Id: <ce2d0437-8faa-4d61-b536-4668f645a959@chinatelecom.cn>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    Fixes: b6981cb57be5 ("pci: interrupt disable bit support")

commit 3d449bc6030904ead784a4e4644c9640c2152796
Author: Jason Chien <jason.chien@sifive.com>
Date:   Wed Aug 9 10:22:50 2023 +0000

    hw/pci-host: Allow extended config space access for Designware PCIe host
    
    In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
    bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
    the child bus "dw-pcie" is realized before the parent bus "pcie" which is
    the root PCIe bus. Thus, the extended configuration space is not accessible
    on "dw-pcie". The issue can be resolved by adding the
    PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
    
    Signed-off-by: Jason Chien <jason.chien@sifive.com>
    Message-Id: <20230809102257.25121-1-jason.chien@sifive.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    Reviewed-by: Frank Chang <frank.chang@sifive.com>
    Signed-off-by: Jason Chien &lt;<a href="mailto:jason.chien@sifive.com" target="_blank">jason.chien@sifive.com</a>&gt;<br>

