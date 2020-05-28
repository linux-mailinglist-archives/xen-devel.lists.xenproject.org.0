Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D015B1E551B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 06:29:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeA8z-0002To-Ps; Thu, 28 May 2020 04:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1kI=7K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jeA8y-0002Tj-9J
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 04:27:48 +0000
X-Inumbo-ID: 93c61e3c-a09b-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c61e3c-a09b-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 04:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FoDuPcIaelc/D9n2tgCEnnCiUxuSuwieAjaWSb4FPUE=; b=qF0XFzSkVO8gw7sWaRyCfO5AQ
 wQndlgjPn8fVJZKTn0QdXSt5bFpAFCP68/suM2wmR6tXzR/9neeaRPrirvh0UHNwfE06hPzGg2YWZ
 1GkrgQwtAEl5pKFGFy1qwCX3FR4+3DBmDUqMJgYqPw2Zos0/N0cANwvjNAWOuZvGrA/wE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeA8t-0000Q6-Lf; Thu, 28 May 2020 04:27:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeA8t-0007yf-AI; Thu, 28 May 2020 04:27:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jeA8t-0004E6-9U; Thu, 28 May 2020 04:27:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150406-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150406: regressions - trouble: fail/pass/starved
X-Osstest-Failures: qemu-mainline:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: qemuu=06539ebc76b8625587aa78d646a9d8d5fddf84f3
X-Osstest-Versions-That: qemuu=ddc760832fa8cf5e93b9d9e6e854a5114ac63510
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 May 2020 04:27:43 +0000
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

flight 150406 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150406/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-credit2   7 xen-boot                 fail REGR. vs. 150391

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150391
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150391
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150391
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150391
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150391
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150391
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                06539ebc76b8625587aa78d646a9d8d5fddf84f3
baseline version:
 qemuu                ddc760832fa8cf5e93b9d9e6e854a5114ac63510

Last test of basis   150391  2020-05-27 01:37:34 Z    1 days
Testing same since   150406  2020-05-27 15:36:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
  Huacai Chen <chenhc@lemote.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>

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
 test-arm64-arm64-xl-credit2                                  fail    
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
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
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
commit 06539ebc76b8625587aa78d646a9d8d5fddf84f3
Merge: ddc760832f 97d8974620
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Tue May 26 20:25:06 2020 +0100

    Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-hw-next-20200526' into staging
    
    MIPS hardware updates
    
    - MAINTAINERS updated to welcome Huacai Chen and Jiaxun Yang,
      and update Aleksandar Rikalo's email address,
    - Trivial improvements in the Bonito64 North Bridge and the
      Fuloong 2e machine,
    - MIPS Machines names unified without 'mips_' prefix.
    
    CI: https://travis-ci.org/github/philmd/qemu/builds/691247975
    
    # gpg: Signature made Tue 26 May 2020 14:32:08 BST
    # gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE
    # gpg: Good signature from "Philippe Mathieu-Daudé (F4BUG) <f4bug@amsat.org>" [full]
    # Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD C0DE
    
    * remotes/philmd-gitlab/tags/mips-hw-next-20200526:
      MAINTAINERS: Change Aleksandar Rikalo's email address
      hw/mips/mips_int: De-duplicate KVM interrupt delivery
      hw/mips/malta: Add some logging for bad register offset cases
      hw/mips: Rename malta/mipssim/r4k/jazz files
      hw/mips/fuloong2e: Fix typo in Fuloong machine name
      hw/mips/fuloong2e: Move code and update a comment
      hw/pci-host/bonito: Set the Config register reset value with FIELD_DP32
      hw/pci-host/bonito: Better describe the I/O CS regions
      hw/pci-host/bonito: Map the different PCI ranges more detailed
      hw/pci-host/bonito: Map all the Bonito64 I/O range
      hw/pci-host/bonito: Map peripheral using physical address
      hw/pci-host/bonito: Fix DPRINTF() format strings
      hw/pci-host: Use CONFIG_PCI_BONITO to select the Bonito North Bridge
      MAINTAINERS: Add Huacai Chen as fuloong2e co-maintainer
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 97d8974620053db5754af808583de70380f73a10
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Mon May 18 22:09:16 2020 +0200

    MAINTAINERS: Change Aleksandar Rikalo's email address
    
    Aleksandar Rikalo wants to use a different email address from
    now on.
    
    Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200518200920.17344-18-aleksandar.qemu.devel@gmail.com>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 56b92eeeac8074501858e15b7658ec6099456f04
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Wed Apr 29 10:21:05 2020 +0200

    hw/mips/mips_int: De-duplicate KVM interrupt delivery
    
    Refactor duplicated code in a single place.
    
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Message-Id: <20200429082916.10669-2-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit c707f06fb1d9b09e5d442e72f6f3dcd021671a90
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Mon May 18 22:09:19 2020 +0200

    hw/mips/malta: Add some logging for bad register offset cases
    
    Log the cases where a guest attempts read or write using bad
    register offset.
    
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200518200920.17344-21-aleksandar.qemu.devel@gmail.com>
    [PMD: Replaced TARGET_FMT_lx by HWADDR_PRIX]
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 5298722edad2d40baac9c2326c6d492ad2b0211a
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Mon May 18 22:09:20 2020 +0200

    hw/mips: Rename malta/mipssim/r4k/jazz files
    
    Machine file names should not have prefix "mips_".
    
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200518200920.17344-22-aleksandar.qemu.devel@gmail.com>
    [PMD: Fixed Fuloong line conflict due to rebase]
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit c3a09ff68ddffd1efd57612706484aa386826518
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun Apr 26 12:16:37 2020 +0200

    hw/mips/fuloong2e: Fix typo in Fuloong machine name
    
    We always miswrote the Fuloong machine... Fix its name.
    Add an machine alias to the previous name for backward
    compatibility.
    
    Suggested-by: Aleksandar Markovic <amarkovic@wavecomp.com>
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200526104726.11273-11-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 3e5fe8dd1fcb6aa3acd3e5b719bd0b9e69ddee6b
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun Apr 26 12:19:16 2020 +0200

    hw/mips/fuloong2e: Move code and update a comment
    
    Move the RAM-related call closer to the RAM creation block,
    rename the ROM comment.
    
    Reviewed-by: Huacai Chen <chenhc@lemote.com>
    Message-id: <20200510210128.18343-4-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 1f8a6c8b3c3a9c6ea0b215a764a1c4f1d6141078
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 21:36:37 2020 +0200

    hw/pci-host/bonito: Set the Config register reset value with FIELD_DP32
    
    Describe some bits of the Config registers fields with the
    registerfields API. Use the FIELD_DP32() macro to set the
    BONGENCFG register bits at reset.
    
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200510210128.18343-12-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 7a296990af3ae3a63e5397c9c1a9f26981815c1c
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 21:46:43 2020 +0200

    hw/pci-host/bonito: Better describe the I/O CS regions
    
    Better describe the I/O CS regions, add the ROMCS region.
    
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200510210128.18343-11-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit a0b544c1c95df240629964636479fc113086d57b
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 21:42:11 2020 +0200

    hw/pci-host/bonito: Map the different PCI ranges more detailed
    
    Better describe the Bonito64 MEM HI/LO and I/O PCI ranges,
    add more PCI regions as unimplemented.
    
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200526104726.11273-7-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 25cca0a9b789244f89b24ed628b0dd6b0a169acc
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 19:26:36 2020 +0200

    hw/pci-host/bonito: Map all the Bonito64 I/O range
    
    To ease following guest accesses to the Bonito64 chipset,
    map its I/O range as UnimplementedDevice.
    We can now see the accesses to unimplemented peripheral
    using the '-d unimp' command line option.
    
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200510210128.18343-9-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 86313bdc85a3ebc4817ffb29edd1c108c50afbe6
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 19:25:18 2020 +0200

    hw/pci-host/bonito: Map peripheral using physical address
    
    Peripherals are mapped at physical address on busses.
    Only CPU/IOMMU can use virtual addresses.
    
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-id: <20200510210128.18343-8-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 3d14264cceb005e6b2131082bfa202c701e7ffb6
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun May 10 21:34:11 2020 +0200

    hw/pci-host/bonito: Fix DPRINTF() format strings
    
    Reviewed-by: Huacai Chen <chenhc@lemote.com>
    Message-id: <20200510210128.18343-7-f4bug@amsat.org>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit abc82de356f636d70ac36e202c989a5e978dbae3
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Sun Feb 3 22:37:26 2019 +0100

    hw/pci-host: Use CONFIG_PCI_BONITO to select the Bonito North Bridge
    
    Ease the kconfig selection by introducing CONFIG_PCI_BONITO to select
    the Bonito North Bridge.
    
    Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-id: <20200510210128.18343-6-f4bug@amsat.org>
    Reviewed-by: Huacai Chen <chenhc@lemote.com>
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 97eeef8aeeac1c5fb64f6785bbcef2e57f7c62ce
Author: Huacai Chen <chenhc@lemote.com>
Date:   Wed Apr 8 17:16:20 2020 +0800

    MAINTAINERS: Add Huacai Chen as fuloong2e co-maintainer
    
    I submitted the MIPS/fuloong2e support about ten years ago, and
    after that I became a MIPS kernel developer. Last year, Philippe
    Mathieu- Daudé asked me that whether I can be a reviewer of
    MIPS/fuloong2e, and I promised that I will do some QEMU work in
    the next year (i.e., 2020 and later). I think now (and also in
    future) I can have some spare time, so I can finally do some real
    work on QEMU/MIPS. And if possible, I hope I can be a co-maintainer
    of MIPS/fuloong2e.
    
    Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Signed-off-by: Huacai Chen <chenhc@lemote.com>
    Message-Id: <1586337380-25217-3-git-send-email-chenhc@lemote.com>
    [PMD: Added Jiaxun Yang as reviewer]
    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
    Message-Id: <20200510210128.18343-2-f4bug@amsat.org>

