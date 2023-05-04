Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BC6F66D6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529604.824156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU0I-0007oR-UG; Thu, 04 May 2023 08:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529604.824156; Thu, 04 May 2023 08:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU0I-0007ln-RL; Thu, 04 May 2023 08:07:54 +0000
Received: by outflank-mailman (input) for mailman id 529604;
 Thu, 04 May 2023 08:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1puU0H-0007ld-9X; Thu, 04 May 2023 08:07:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1puU0G-0007yx-W7; Thu, 04 May 2023 08:07:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1puU0G-0001It-EE; Thu, 04 May 2023 08:07:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1puU0G-0006JM-De; Thu, 04 May 2023 08:07:52 +0000
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
	bh=sBWiGdTjO6+aD21Q2L1qj43QH/HzVELulFslG71XckQ=; b=6qTldF87GIH4LXRvQTRJxUnz5S
	r6Rn5PGSqZuP3E6fbv6yIncIAk7hT/QRQMcymiyvd3a6Q83VVJhlM1NY5COAkRFBqfmUTfB7WvTx/
	kfmHfKdgAJ3IvMZ4yYmAXb/1yVnj1+hiafKOi7PhwS6vN06tvwcoCC4lidBa+o+li9zs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180519-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180519: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-freebsd10-amd64:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0956aa2219745a198bb6a0a99e2108a3c09b280e
X-Osstest-Versions-That:
    xen=b033eddc9779109c06a26936321d27a2ef4e088b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 May 2023 08:07:52 +0000

flight 180519 xen-unstable real [real]
flight 180526 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180519/
http://logs.test-lab.xenproject.org/osstest/logs/180526/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. vs. 180511

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180511
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180511
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180511
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180511
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180511
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180511
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180511
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180511
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180511
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180511
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180511
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180511
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  0956aa2219745a198bb6a0a99e2108a3c09b280e
baseline version:
 xen                  b033eddc9779109c06a26936321d27a2ef4e088b

Last test of basis   180511  2023-05-03 01:53:22 Z    1 days
Testing same since   180519  2023-05-03 15:38:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com> # CHANGELOG
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Viresh Kumar <viresh.kumar@linaro.org>

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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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
commit 0956aa2219745a198bb6a0a99e2108a3c09b280e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 3 13:38:30 2023 +0200

    x86/mm: replace bogus assertion in paging_log_dirty_op()
    
    While I was the one to introduce it, I don't think it is correct: A
    bogus continuation call issued by a tool stack domain may find another
    continuation in progress. IOW we've been asserting caller controlled
    state (which is reachable only via a domctl), and the early (lock-less)
    check in paging_domctl() helps in a limited way only.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit eaa324bfebcf17333d993b74024901701e0e2162
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed May 3 13:37:19 2023 +0200

    x86/trampoline: load the GDT located in the trampoline page
    
    When booting the BSP the portion of the code executed from the
    trampoline page will be using the GDT located in the hypervisor
    .text.head section rather than the GDT located in the relocated
    trampoline page.
    
    If skip_realmode is not set the GDT located in the trampoline page
    will be loaded after having executed the BIOS call, otherwise the GDT
    from .text.head will be used for all the protected mode trampoline
    code execution.
    
    Note that both gdt_boot_descr and gdt_48 contain the same entries, but
    the former is located inside the hypervisor .text section, while the
    later lives in the relocated trampoline page.
    
    This is not harmful as-is, as both GDTs contain the same entries, but
    for consistency with the APs switch the BSP trampoline code to also
    use the GDT on the relocated trampoline page.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 0946068e7faea22868c577d7afa54ba4970ff520
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed May 3 13:36:25 2023 +0200

    x86/head: check base address alignment
    
    Ensure that the base address is 2M aligned, or else the page table
    entries created would be corrupt as reserved bits on the PDE end up
    set.
    
    We have encountered a broken firmware where grub2 would end up loading
    Xen at a non 2M aligned region when using the multiboot2 protocol, and
    that caused a very difficult to debug triple fault.
    
    If the alignment is not as required by the page tables print an error
    message and stop the boot.  Also add a build time check that the
    calculation of symbol offsets don't break alignment of passed
    addresses.
    
    The check could be performed earlier, but so far the alignment is
    required by the page tables, and hence feels more natural that the
    check lives near to the piece of code that requires it.
    
    Note that when booted as an EFI application from the PE entry point
    the alignment check is already performed by
    efi_arch_load_addr_check(), and hence there's no need to add another
    check at the point where page tables get built in
    efi_arch_memory_setup().
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 19c6cbd90965b1440bd551069373d6fa3f2f365d
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed May 3 13:36:05 2023 +0200

    xen/vcpu: ignore VCPU_SSHOTTMR_future
    
    The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
    When the hypervisor returns -ETIME (timeout in the past) Linux keeps
    retrying to setup the timer with a higher timeout instead of
    self-injecting a timer interrupt.
    
    On boxes without any hardware assistance for logdirty we have seen HVM
    Linux guests < 4.7 with 32vCPUs give up trying to setup the timer when
    logdirty is enabled:
    
    CE: Reprogramming failure. Giving up
    CE: xen increased min_delta_ns to 1000000 nsec
    CE: Reprogramming failure. Giving up
    CE: Reprogramming failure. Giving up
    CE: xen increased min_delta_ns to 506250 nsec
    CE: xen increased min_delta_ns to 759375 nsec
    CE: xen increased min_delta_ns to 1000000 nsec
    CE: Reprogramming failure. Giving up
    CE: Reprogramming failure. Giving up
    CE: Reprogramming failure. Giving up
    Freezing user space processes ...
    INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
    Task dump for CPU 14:
    swapper/14      R  running task        0     0      1 0x00000000
    Call Trace:
     [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
     [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
     [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
     [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
     [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
     [<ffffffff900000d5>] ? start_cpu+0x5/0x14
    INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
    Task dump for CPU 26:
    swapper/26      R  running task        0     0      1 0x00000000
    Call Trace:
     [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
     [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
     [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
     [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
     [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
     [<ffffffff900000d5>] ? start_cpu+0x5/0x14
    INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
    Task dump for CPU 26:
    swapper/26      R  running task        0     0      1 0x00000000
    Call Trace:
     [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
     [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
     [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
     [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
     [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
     [<ffffffff900000d5>] ? start_cpu+0x5/0x14
    
    Thus leading to CPU stalls and a broken system as a result.
    
    Workaround this bogus usage by ignoring the VCPU_SSHOTTMR_future in
    the hypervisor.  Old Linux versions are the only ones known to have
    (wrongly) attempted to use the flag, and ignoring it is compatible
    with the behavior expected by any guests setting that flag.
    
    Note the usage of the flag has been removed from Linux by commit:
    
    c06b6d70feb3 xen/x86: don't lose event interrupts
    
    Which landed in Linux 4.7.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit f8135d234a90777b4b6606a241605fb75f239530
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed May 3 13:35:40 2023 +0200

    docs: allow generic virtio device types to contain device-id
    
    For generic virtio devices, where we don't need to add compatible or
    other special DT properties, the type field is set to "virtio,device".
    
    But this misses the case where the user sets the type with a valid
    virtio device id as well, like "virtio,device1a" for file system device.
    The complete list of virtio device ids is mentioned here:
    
    https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-2160005
    
    Update documentation to support that as well.
    
    Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
(qemu changes not included)

