Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC601CE9B7
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 02:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYIsV-00046v-4B; Tue, 12 May 2020 00:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIy0=62=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYIsS-00046q-Qf
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 00:34:32 +0000
X-Inumbo-ID: 57bde9de-93e8-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57bde9de-93e8-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 00:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=huzX+P5NRKG69QsPmQmvU/b54RK6jFc6l+IoTAbPHjE=; b=cZeqwk8myr8z5DkUwqadKIS3T
 /1Mb+85HLTdYZj4jW4uizqHVmbFhAVBLt1C3jqLLme11lmx/ujIvxxDzDAlM463gAq2gpGbBuHX04
 x4nYEp1JTCCWne0eoO77zK6H8ujtYWy9FTTedZSFcDO/pxfdrimF/9tfcKxT288ENu+oc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYIsP-00059K-VL; Tue, 12 May 2020 00:34:30 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYIsP-0003ID-H4; Tue, 12 May 2020 00:34:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYIsP-0001xw-DN; Tue, 12 May 2020 00:34:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 150136: regressions - FAIL
X-Osstest-Failures: linux-5.4:build-arm64:xen-build:fail:regression
 linux-5.4:test-amd64-amd64-xl-multivcpu:guest-localmigrate/x10:fail:heisenbug
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start.2:fail:allowable
 linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 linux-5.4:build-arm64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=f015b86259a520ad886523d9ec6fdb0ed80edc38
X-Osstest-Versions-That: linux=592465e6a54ba8104969f3b73b58df262c5be5f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 May 2020 00:34:29 +0000
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

flight 150136 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150136/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build      fail in 150130 REGR. vs. 150104

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-multivcpu 18 guest-localmigrate/x10    fail pass in 150130

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     17 guest-start.2  fail in 150130 REGR. vs. 150104

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 150130 n/a
 build-arm64-libvirt           1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 150130 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 150130 n/a
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150086
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150104
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                f015b86259a520ad886523d9ec6fdb0ed80edc38
baseline version:
 linux                592465e6a54ba8104969f3b73b58df262c5be5f5

Last test of basis   150104  2020-05-09 09:48:15 Z    2 days
Testing same since   150122  2020-05-10 08:40:44 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Ma <aaron.ma@canonical.com>
  AceLan Kao <acelan.kao@canonical.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Elder <elder@linaro.org>
  Alexei Starovoitov <ast@kernel.org>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Andrzej Hajda <a.hajda@samsung.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Yan <andy.yan@rock-chips.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Brendan Higgins <brendanhiggins@google.com>
  Brian Cain <bcain@codeaurora.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Christoph Hellwig <hch@lst.de>
  David S. Miller <davem@davemloft.net>
  Doug Berger <opendmb@gmail.com>
  Felipe Balbi <balbi@kernel.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Jere Leppänen <jere.leppanen@nokia.com>
  Jeremie Francois (on alpha) <jeremie.francois@gmail.com>
  Jia He <justin.he@arm.com>
  Jiri Slaby <jslaby@suse.cz>
  Johannes Berg <johannes.berg@intel.com>
  Julien Beraud <julien.beraud@orolia.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Lee Jones <lee.jones@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luis Chamberlain <mcgrof@kernel.org>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Matt Roper <matthew.d.roper@intel.com>
  Matthias Blankertz <matthias.blankertz@cetitec.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Machek <pavel@denx.de>
  Qian Cai <cai@lca.pw>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roman Gilg <subdiff@gmail.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Pedersen <thomas@adapt-ip.com>
  Tuowen Zhao <ztuowen@gmail.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Zhan Liu <zhan.liu@amd.com>

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
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                fail    
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

(No revision log; it would be 1335 lines long.)

