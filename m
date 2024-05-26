Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E951C8CF25C
	for <lists+xen-devel@lfdr.de>; Sun, 26 May 2024 03:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730388.1135623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sB2Tc-0008In-6W; Sun, 26 May 2024 01:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730388.1135623; Sun, 26 May 2024 01:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sB2Tc-0008Fj-35; Sun, 26 May 2024 01:15:08 +0000
Received: by outflank-mailman (input) for mailman id 730388;
 Sun, 26 May 2024 01:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sB2Ta-0008FZ-Kv; Sun, 26 May 2024 01:15:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sB2Ta-0004xS-Gk; Sun, 26 May 2024 01:15:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sB2Ta-0005iQ-2P; Sun, 26 May 2024 01:15:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sB2Ta-0007RD-1x; Sun, 26 May 2024 01:15:06 +0000
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
	bh=X1SPTlD5YlMqKFS98RH+9IFWMqAlS7hMdBsDO/s6FKc=; b=fE711h+shgnkrEjnXzeuwv/3zP
	WmuOADc9zh2JdHb3TiwrKXvMZlRlMLT8jHRkJG0sE/KvRVXyYbLQgeXj46qMQfLwjjMnJLt+mtVuS
	V0+waHftCLRhic0VgtCa/htS1dCiE6tSYhBoMQLY5BSlZLbkRHEc09HvW23qPq8LYyt4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186146-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186146: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-6.1:build-armhf:<job status>:broken:regression
    linux-6.1:build-armhf:host-build-prep:fail:regression
    linux-6.1:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=88690811da69826fdb59d908a6e5e9d0c63b581a
X-Osstest-Versions-That:
    linux=4078fa637fcd80c8487680ec2e4ef7c58308e9aa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 May 2024 01:15:06 +0000

flight 186146 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186146/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   5 host-build-prep          fail REGR. vs. 186028

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186028
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186028
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186028
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186028
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186028
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                88690811da69826fdb59d908a6e5e9d0c63b581a
baseline version:
 linux                4078fa637fcd80c8487680ec2e4ef7c58308e9aa

Last test of basis   186028  2024-05-17 10:16:47 Z    8 days
Testing same since   186146  2024-05-25 14:44:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Ajay Kaher <ajay.kaher@broadcom.com>
  Akira Yokosawa <akiyks@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Carlos Llamas <cmllamas@google.com>
  Chandan Babu R <chandanbabu@kernel.org>
  Chuck Lever <chuck.lever@oracle.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David S. Miller <davem@davemloft.net>
  Eric Sandeen <sandeen@redhat.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guo Xuenan <guoxuenan@huawei.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Hironori Shiina <shiina.hironori@fujitsu.com>
  Hironori Shiina <shiina.hironori@gmail.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jarkko Sakkinen <jarkko@kernel.org>
  Javier Carrasco <javier.carrasco@wolfvision.net>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Corbet <corbet@lwn.net>
  Jose Fernandez <josef@netflix.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  Leah Rumancik <leah.rumancik@gmail.com>
  Lee Jones <lee@kernel.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Long Li <leo.lilong@huawei.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Mengqi Zhang <mengqi.zhang@mediatek.com>
  NeilBrown <neilb@suse.de>
  Oleksandr Tymoshenko <ovt@google.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Prashanth K <quic_prashk@quicinc.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Ron Economos <re@w6rz.net>
  Ronald Wahl <ronald.wahl@raritan.com>
  Salvatore Bonaccorso <carnil@debian.org>
  SeongJae Park <sj@kernel.org>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shuah Khan <skhan@linuxfoundation.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Will Deacon <will@kernel.org>

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
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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

Not pushing.

(No revision log; it would be 1940 lines long.)

