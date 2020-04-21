Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6BF1B2FC6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 21:07:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQyF6-0006rg-8m; Tue, 21 Apr 2020 19:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mjY1=6F=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jQyF5-0006ra-3t
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 19:07:35 +0000
X-Inumbo-ID: 5632dd81-8403-11ea-9191-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5632dd81-8403-11ea-9191-12813bfff9fa;
 Tue, 21 Apr 2020 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uiIMugXv12UuGnA3+wib3QV49FgeAd2Hi5DMOHuHHbY=; b=w3aMRQMGoPasSEPUWH0I8iTg/
 v2ljuODgGHeKwY2O3wSiBE316j2ZJ6VE9rVDShSIcrSJ6PLOhvRJZpjAQjYVCcK10DhBe5p7MD9ty
 7pC8NDXtGki13db5u/1+9I0yY6DflNgzsPGk78FtxEn+JVBLl18IBDEwWQs3nTdVDdxw4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jQyEv-0007KP-Us; Tue, 21 Apr 2020 19:07:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jQyEv-00023S-Ij; Tue, 21 Apr 2020 19:07:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jQyEv-0007aj-Hw; Tue, 21 Apr 2020 19:07:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149706-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 149706: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:allowable
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=3119154db04890fdf57022a43cf2ee594fd4da5a
X-Osstest-Versions-That: qemuu=20038cd7a8412feeb49c01f6ede89e36c8995472
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Apr 2020 19:07:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149706 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149706/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw  7 xen-boot                 fail REGR. vs. 149681

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     16 guest-localmigrate       fail REGR. vs. 149681

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149681
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149681
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149681
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149681
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                3119154db04890fdf57022a43cf2ee594fd4da5a
baseline version:
 qemuu                20038cd7a8412feeb49c01f6ede89e36c8995472

Last test of basis   149681  2020-04-16 02:09:07 Z    5 days
Testing same since   149706  2020-04-21 10:39:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen Qun <kuhn.chenqun@huawei.com>
  Cédric Le Goater <clg@kaod.org>
  David Gibson <david@gibson.dropbear.id.au>
  Ganesh Goudar <ganeshgr@linux.ibm.com>
  Laurent Vivier <laurent@vivier.eu>
  Nathan Chancellor <natechancellor@gmail.com>
  Nicholas Piggin <npiggin@gmail.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Richard Henderson <richard.henderson@linaro.org>
  Sergei Trofimovich <slyfox@gentoo.org>

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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
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
commit 3119154db04890fdf57022a43cf2ee594fd4da5a
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Fri Apr 17 11:07:49 2020 +0200

    target/ppc: Fix TCG temporary leaks in gen_slbia()
    
    This fixes:
    
      $ qemu-system-ppc64 \$
      -machine pseries-4.1 -cpu power9 \$
      -smp 4 -m 12G -accel tcg ...
      ...
      Quiescing Open Firmware ...
      Booting Linux via __start() @ 0x0000000002000000 ...
      Opcode 1f 12 0f 00 (7ce003e4) leaked temporaries
      Opcode 1f 12 0f 00 (7ce003e4) leaked temporaries
      Opcode 1f 12 0f 00 (7ce003e4) leaked temporaries
    
    [*] https://www.mail-archive.com/qemu-discuss@nongnu.org/msg05400.html
    
    Fixes: 0418bf78fe8 ("Fix ISA v3.0 (POWER9) slbia implementation")
    Reported-by: Dennis Clarke <dclarke@blastwave.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
    Reviewed-by: Cédric Le Goater <clg@kaod.org>
    Message-id: 20200417090749.14310-1-f4bug@amsat.org
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 5b4273e462515ae2f14cb57954d99416ae1778d9
Merge: d5232d8b06 5ed195065c
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Apr 20 19:57:18 2020 +0100

    Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200417' into staging
    
    ppc patch queue for 2020-04-17
    
    Here are a few late bugfixes for qemu-5.0 in the ppc target code.
    Unless some really nasty last minute bug shows up, I expect this to be
    the last ppc pull request for qemu-5.0.
    
    # gpg: Signature made Fri 17 Apr 2020 06:02:13 BST
    # gpg:                using RSA key 75F46586AE61A66CC44E87DC6C38CACA20D9B392
    # gpg: Good signature from "David Gibson <david@gibson.dropbear.id.au>" [full]
    # gpg:                 aka "David Gibson (Red Hat) <dgibson@redhat.com>" [full]
    # gpg:                 aka "David Gibson (ozlabs.org) <dgibson@ozlabs.org>" [full]
    # gpg:                 aka "David Gibson (kernel.org) <dwg@kernel.org>" [unknown]
    # Primary key fingerprint: 75F4 6586 AE61 A66C C44E  87DC 6C38 CACA 20D9 B392
    
    * remotes/dgibson/tags/ppc-for-5.0-20200417:
      target/ppc: Fix mtmsr(d) L=1 variant that loses interrupts
      target/ppc: Fix wrong interpretation of the disposition flag.
      linux-user/ppc: Fix padding in mcontext_t for ppc64
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit d5232d8b06003246b00b2001160beae4d8036dd2
Merge: ff0507c239 386d386568
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Apr 20 14:43:10 2020 +0100

    Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-pull-request' into staging
    
    Fix epoll_create1() for qemu-alpha
    
    # gpg: Signature made Thu 16 Apr 2020 16:28:15 BST
    # gpg:                using RSA key CD2F75DDC8E3A4DC2E4F5173F30C38BD3F2FBE3C
    # gpg:                issuer "laurent@vivier.eu"
    # gpg: Good signature from "Laurent Vivier <lvivier@redhat.com>" [full]
    # gpg:                 aka "Laurent Vivier <laurent@vivier.eu>" [full]
    # gpg:                 aka "Laurent Vivier (Red Hat) <lvivier@redhat.com>" [full]
    # Primary key fingerprint: CD2F 75DD C8E3 A4DC 2E4F  5173 F30C 38BD 3F2F BE3C
    
    * remotes/vivier2/tags/linux-user-for-5.0-pull-request:
      linux-user/syscall.c: add target-to-host mapping for epoll_create1()
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit ff0507c239a246fd7215b31c5658fc6a3ee1e4c5
Author: Chen Qun <kuhn.chenqun@huawei.com>
Date:   Sat Apr 18 14:26:02 2020 +0800

    block/iscsi:fix heap-buffer-overflow in iscsi_aio_ioctl_cb
    
    There is an overflow, the source 'datain.data[2]' is 100 bytes,
     but the 'ss' is 252 bytes.This may cause a security issue because
     we can access a lot of unrelated memory data.
    
    The len for sbp copy data should take the minimum of mx_sb_len and
     sb_len_wr, not the maximum.
    
    If we use iscsi device for VM backend storage, ASAN show stack:
    
    READ of size 252 at 0xfffd149dcfc4 thread T0
        #0 0xaaad433d0d34 in __asan_memcpy (aarch64-softmmu/qemu-system-aarch64+0x2cb0d34)
        #1 0xaaad45f9d6d0 in iscsi_aio_ioctl_cb /qemu/block/iscsi.c:996:9
        #2 0xfffd1af0e2dc  (/usr/lib64/iscsi/libiscsi.so.8+0xe2dc)
        #3 0xfffd1af0d174  (/usr/lib64/iscsi/libiscsi.so.8+0xd174)
        #4 0xfffd1af19fac  (/usr/lib64/iscsi/libiscsi.so.8+0x19fac)
        #5 0xaaad45f9acc8 in iscsi_process_read /qemu/block/iscsi.c:403:5
        #6 0xaaad4623733c in aio_dispatch_handler /qemu/util/aio-posix.c:467:9
        #7 0xaaad4622f350 in aio_dispatch_handlers /qemu/util/aio-posix.c:510:20
        #8 0xaaad4622f350 in aio_dispatch /qemu/util/aio-posix.c:520
        #9 0xaaad46215944 in aio_ctx_dispatch /qemu/util/async.c:298:5
        #10 0xfffd1bed12f4 in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x512f4)
        #11 0xaaad46227de0 in glib_pollfds_poll /qemu/util/main-loop.c:219:9
        #12 0xaaad46227de0 in os_host_main_loop_wait /qemu/util/main-loop.c:242
        #13 0xaaad46227de0 in main_loop_wait /qemu/util/main-loop.c:518
        #14 0xaaad43d9d60c in qemu_main_loop /qemu/softmmu/vl.c:1662:9
        #15 0xaaad4607a5b0 in main /qemu/softmmu/main.c:49:5
        #16 0xfffd1a460b9c in __libc_start_main (/lib64/libc.so.6+0x20b9c)
        #17 0xaaad43320740 in _start (aarch64-softmmu/qemu-system-aarch64+0x2c00740)
    
    0xfffd149dcfc4 is located 0 bytes to the right of 100-byte region [0xfffd149dcf60,0xfffd149dcfc4)
    allocated by thread T0 here:
        #0 0xaaad433d1e70 in __interceptor_malloc (aarch64-softmmu/qemu-system-aarch64+0x2cb1e70)
        #1 0xfffd1af0e254  (/usr/lib64/iscsi/libiscsi.so.8+0xe254)
        #2 0xfffd1af0d174  (/usr/lib64/iscsi/libiscsi.so.8+0xd174)
        #3 0xfffd1af19fac  (/usr/lib64/iscsi/libiscsi.so.8+0x19fac)
        #4 0xaaad45f9acc8 in iscsi_process_read /qemu/block/iscsi.c:403:5
        #5 0xaaad4623733c in aio_dispatch_handler /qemu/util/aio-posix.c:467:9
        #6 0xaaad4622f350 in aio_dispatch_handlers /qemu/util/aio-posix.c:510:20
        #7 0xaaad4622f350 in aio_dispatch /qemu/util/aio-posix.c:520
        #8 0xaaad46215944 in aio_ctx_dispatch /qemu/util/async.c:298:5
        #9 0xfffd1bed12f4 in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x512f4)
        #10 0xaaad46227de0 in glib_pollfds_poll /qemu/util/main-loop.c:219:9
        #11 0xaaad46227de0 in os_host_main_loop_wait /qemu/util/main-loop.c:242
        #12 0xaaad46227de0 in main_loop_wait /qemu/util/main-loop.c:518
        #13 0xaaad43d9d60c in qemu_main_loop /qemu/softmmu/vl.c:1662:9
        #14 0xaaad4607a5b0 in main /qemu/softmmu/main.c:49:5
        #15 0xfffd1a460b9c in __libc_start_main (/lib64/libc.so.6+0x20b9c)
        #16 0xaaad43320740 in _start (aarch64-softmmu/qemu-system-aarch64+0x2c00740)
    
    Reported-by: Euler Robot <euler.robot@huawei.com>
    Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Message-id: 20200418062602.10776-1-kuhn.chenqun@huawei.com
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 5ed195065cc6895f61b9d59bfa0a0536ed5ed51e
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Tue Apr 14 21:11:31 2020 +1000

    target/ppc: Fix mtmsr(d) L=1 variant that loses interrupts
    
    If mtmsr L=1 sets MSR[EE] while there is a maskable exception pending,
    it does not cause an interrupt. This causes the test case to hang:
    
    https://lists.gnu.org/archive/html/qemu-ppc/2019-10/msg00826.html
    
    More recently, Linux reduced the occurance of operations (e.g., rfi)
    which stop translation and allow pending interrupts to be processed.
    This started causing hangs in Linux boot in long-running kernel tests,
    running with '-d int' shows the decrementer stops firing despite DEC
    wrapping and MSR[EE]=1.
    
    https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208301.html
    
    The cause is the broken mtmsr L=1 behaviour, which is contrary to the
    architecture. From Power ISA v3.0B, p.977, Move To Machine State Register,
    Programming Note states:
    
        If MSR[EE]=0 and an External, Decrementer, or Performance Monitor
        exception is pending, executing an mtmsrd instruction that sets
        MSR[EE] to 1 will cause the interrupt to occur before the next
        instruction is executed, if no higher priority exception exists
    
    Fix this by handling L=1 exactly the same way as L=0, modulo the MSR
    bits altered.
    
    The confusion arises from L=0 being "context synchronizing" whereas L=1
    is "execution synchronizing", which is a weaker semantic. However this
    is not a relaxation of the requirement that these exceptions cause
    interrupts when MSR[EE]=1 (e.g., when mtmsr executes to completion as
    TCG is doing here), rather it specifies how a pipelined processor can
    have multiple instructions in flight where one may influence how another
    behaves.
    
    Cc: qemu-stable@nongnu.org
    Reported-by: Anton Blanchard <anton@ozlabs.org>
    Reported-by: Nathan Chancellor <natechancellor@gmail.com>
    Tested-by: Nathan Chancellor <natechancellor@gmail.com>
    Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
    Message-Id: <20200414111131.465560-1-npiggin@gmail.com>
    Reviewed-by: Cédric Le Goater <clg@kaod.org>
    Tested-by: Cédric Le Goater <clg@kaod.org>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

commit 211a7784b9a80e42841223d8ea5252567ebe0e9e
Author: Ganesh Goudar <ganeshgr@linux.ibm.com>
Date:   Wed Apr 8 22:39:44 2020 +0530

    target/ppc: Fix wrong interpretation of the disposition flag.
    
    Bitwise AND with kvm_run->flags to evaluate if we recovered from
    MCE or not is not correct, As disposition in kvm_run->flags is a
    two-bit integer value and not a bit map, So check for equality
    instead of bitwise AND.
    
    Without the fix qemu treats any unrecoverable mce error as recoverable
    and ends up in a mce loop inside the guest, Below are the MCE logs before
    and after the fix.
    
    Before fix:
    
    [   66.775757] MCE: CPU0: Initiator CPU
    [   66.775891] MCE: CPU0: Unknown
    [   66.776587] MCE: CPU0: machine check (Harmless) Host UE Indeterminate [Recovered]
    [   66.776857] MCE: CPU0: NIP: [c0080000000e00b8] mcetest_tlbie+0xb0/0x128 [mcetest_tlbie]
    
    After fix:
    
    [ 20.650577] CPU: 0 PID: 1415 Comm: insmod Tainted: G M O 5.6.0-fwnmi-arv+ #11
    [ 20.650618] NIP: c0080000023a00e8 LR: c0080000023a00d8 CTR: c000000000021fe0
    [ 20.650660] REGS: c0000001fffd3d70 TRAP: 0200 Tainted: G M O (5.6.0-fwnmi-arv+)
    [ 20.650708] MSR: 8000000002a0b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 42000222 XER: 20040000
    [ 20.650758] CFAR: c00000000000b940 DAR: c0080000025e00e0 DSISR: 00000200 IRQMASK: 0
    [ 20.650758] GPR00: c0080000023a00d8 c0000001fddd79a0 c0080000023a8500 0000000000000039
    [ 20.650758] GPR04: 0000000000000001 0000000000000000 0000000000000000 0000000000000007
    [ 20.650758] GPR08: 0000000000000007 c0080000025e00e0 0000000000000000 00000000000000f7
    [ 20.650758] GPR12: 0000000000000000 c000000001900000 c00000000101f398 c0080000025c052f
    [ 20.650758] GPR16: 00000000000003a8 c0080000025c0000 c0000001fddd7d70 c0000000015b7940
    [ 20.650758] GPR20: 000000000000fff1 c000000000f72c28 c0080000025a0988 0000000000000000
    [ 20.650758] GPR24: 0000000000000100 c0080000023a05d0 c0000000001f1d70 0000000000000000
    [ 20.650758] GPR28: c0000001fde20000 c0000001fd02b2e0 c0080000023a0000 c0080000025e0000
    [ 20.651178] NIP [c0080000023a00e8] mcetest_tlbie+0xe8/0xf0 [mcetest_tlbie]
    [ 20.651220] LR [c0080000023a00d8] mcetest_tlbie+0xd8/0xf0 [mcetest_tlbie]
    [ 20.651262] Call Trace:
    [ 20.651280] [c0000001fddd79a0] [c0080000023a00d8] mcetest_tlbie+0xd8/0xf0 [mcetest_tlbie] (unreliable)
    [ 20.651340] [c0000001fddd7a10] [c00000000001091c] do_one_initcall+0x6c/0x2c0
    [ 20.651390] [c0000001fddd7af0] [c0000000001f7998] do_init_module+0x90/0x298
    [ 20.651433] [c0000001fddd7b80] [c0000000001f61a8] load_module+0x1f58/0x27a0
    [ 20.651476] [c0000001fddd7d40] [c0000000001f6c70] __do_sys_finit_module+0xe0/0x100
    [ 20.651526] [c0000001fddd7e20] [c00000000000b9d0] system_call+0x5c/0x68
    [ 20.651567] Instruction dump:
    [ 20.651594] e8410018 3c620000 e8638020 480000cd e8410018 3c620000 e8638028 480000bd
    [ 20.651646] e8410018 7be904e4 39400000 612900e0 <7d434a64> 4bffff74 3c4c0001 38428410
    [ 20.651699] ---[ end trace 4c40897f016b4340 ]---
    [ 20.653310]
    Bus error
    [ 20.655575] MCE: CPU0: machine check (Harmless) Host UE Indeterminate [Not recovered]
    [ 20.655575] MCE: CPU0: NIP: [c0080000023a00e8] mcetest_tlbie+0xe8/0xf0 [mcetest_tlbie]
    [ 20.655576] MCE: CPU0: Initiator CPU
    [ 20.655576] MCE: CPU0: Unknown
    
    Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
    Message-Id: <20200408170944.16003-1-ganeshgr@linux.ibm.com>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

commit 5da5f47e6c65eda83e5433bd905c4df03be98596
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Apr 6 20:21:05 2020 -0700

    linux-user/ppc: Fix padding in mcontext_t for ppc64
    
    The padding that was added in 95cda4c44ee was added to a union,
    and so it had no effect.  This fixes misalignment errors detected
    by clang sanitizers for ppc64 and ppc64le.
    
    In addition, only ppc64 allocates space for VSX registers, so do
    not save them for ppc32.  The kernel only has references to
    CONFIG_SPE in signal_32.c, so do not attempt to save them for ppc64.
    
    Fixes: 95cda4c44ee
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20200407032105.26711-1-richard.henderson@linaro.org>
    Acked-by: Laurent Vivier <laurent@vivier.eu>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

commit 386d38656889a40d29b514ee6f34997ca18f741e
Author: Sergei Trofimovich <slyfox@gentoo.org>
Date:   Wed Apr 15 23:05:08 2020 +0100

    linux-user/syscall.c: add target-to-host mapping for epoll_create1()
    
    Noticed by Barnabás Virágh as a python-3.7 failue on qemu-alpha.
    
    The bug shows up on alpha as it's one of the targets where
    EPOLL_CLOEXEC differs from other targets:
        sysdeps/unix/sysv/linux/alpha/bits/epoll.h: EPOLL_CLOEXEC  = 01000000
        sysdeps/unix/sysv/linux/bits/epoll.h:        EPOLL_CLOEXEC = 02000000
    
    Bug: https://bugs.gentoo.org/717548
    Reported-by: Barnabás Virágh
    Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
    CC: Riku Voipio <riku.voipio@iki.fi>
    CC: Laurent Vivier <laurent@vivier.eu>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    Message-Id: <20200415220508.5044-1-slyfox@gentoo.org>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

