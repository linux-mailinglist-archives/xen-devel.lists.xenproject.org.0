Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3F1DDAB2
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 01:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbuDj-0005Bu-6N; Thu, 21 May 2020 23:03:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcJi=7D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbuDi-0005Bm-9A
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 23:03:22 +0000
X-Inumbo-ID: 4359f7ea-9bb7-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4359f7ea-9bb7-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 23:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAVEe/OA3XlG+yMD2Nf4GEjKXaaw/dVfBvxw1bpD3pI=; b=z6f/ste2Ex0LRne6lAYZfaMcN
 JtlyY1aWe2K7pro28R5didvX2VPGFDnDp1DhBsBW7g+58wEwjrq/Kt+QjTZUwd/yHbqKnXTlkWw9B
 A886W5iA8iSSV+gSJTTiby2+Fr/h+e2IaPUCzUEnUIbZqLmMC3Un/ooHJ/6dmfMCUOqPQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbuDf-0006s5-M5; Thu, 21 May 2020 23:03:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbuDZ-0004Oa-KX; Thu, 21 May 2020 23:03:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbuDZ-0004MB-Je; Thu, 21 May 2020 23:03:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150297: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=956ae3e9265fd36cb1c487cb3c868e906bd55897
X-Osstest-Versions-That: qemuu=f2465433b43fb87766d79f42191607dac4aed5b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 May 2020 23:03:13 +0000
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

flight 150297 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150297/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail REGR. vs. 150271

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10  fail blocked in 150271
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150271
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150271
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150271
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150271
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150271
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                956ae3e9265fd36cb1c487cb3c868e906bd55897
baseline version:
 qemuu                f2465433b43fb87766d79f42191607dac4aed5b4

Last test of basis   150271  2020-05-20 06:14:37 Z    1 days
Testing same since   150297  2020-05-21 10:37:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Peter Maydell <peter.maydell@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>

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
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
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
commit 956ae3e9265fd36cb1c487cb3c868e906bd55897
Merge: f2465433b4 150c7a91ce
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Tue May 19 19:18:41 2020 +0100

    Merge remote-tracking branch 'remotes/rth/tags/pull-fpu-20200519' into staging
    
    Misc cleanups
    
    # gpg: Signature made Tue 19 May 2020 16:51:38 BST
    # gpg:                using RSA key 7A481E78868B4DB6A85A05C064DF38E8AF7E215F
    # gpg:                issuer "richard.henderson@linaro.org"
    # gpg: Good signature from "Richard Henderson <richard.henderson@linaro.org>" [full]
    # Primary key fingerprint: 7A48 1E78 868B 4DB6 A85A  05C0 64DF 38E8 AF7E 215F
    
    * remotes/rth/tags/pull-fpu-20200519:
      softfloat: Return bool from all classification predicates
      softfloat: Inline floatx80 compare specializations
      softfloat: Inline float128 compare specializations
      softfloat: Inline float64 compare specializations
      softfloat: Inline float32 compare specializations
      softfloat: Name compare relation enum
      softfloat: Name rounding mode enum
      softfloat: Change tininess_before_rounding to bool
      softfloat: Replace flag with bool
      softfloat: Use post test for floatN_mul
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 150c7a91ce7862bcaf7422f6038dcf0ba4a7eee3
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 12:16:24 2020 -0700

    softfloat: Return bool from all classification predicates
    
    This includes *_is_any_nan, *_is_neg, *_is_inf, etc.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit c6baf65000f826a713e8d9b5b35e617b0ca9ab5d
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:53:15 2020 -0700

    softfloat: Inline floatx80 compare specializations
    
    Replace the floatx80 compare specializations with inline functions
    that call the standard floatx80_compare{,_quiet} functions.
    Use bool as the return type.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b7b1ac684fea49c6bfe1ad8b706aed7b09116d15
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:50:32 2020 -0700

    softfloat: Inline float128 compare specializations
    
    Replace the float128 compare specializations with inline functions
    that call the standard float128_compare{,_quiet} functions.
    Use bool as the return type.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 0673ecdf6cb2b1445a85283db8cbacb251c46516
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:40:23 2020 -0700

    softfloat: Inline float64 compare specializations
    
    Replace the float64 compare specializations with inline functions
    that call the standard float64_compare{,_quiet} functions.
    Use bool as the return type.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 5da2d2d8e53d80e92a61720ea995c86b33cbf25d
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:33:18 2020 -0700

    softfloat: Inline float32 compare specializations
    
    Replace the float32 compare specializations with inline functions
    that call the standard float32_compare{,_quiet} functions.
    Use bool as the return type.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 71bfd65c5fcd72f8af2735905415c7ce4220f6dc
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:22:05 2020 -0700

    softfloat: Name compare relation enum
    
    Give the previously unnamed enum a typedef name.  Use it in the
    prototypes of compare functions.  Use it to hold the results
    of the compare functions.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 3dede407cc61b64997f0c30f6dbf4df09949abc9
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 09:01:49 2020 -0700

    softfloat: Name rounding mode enum
    
    Give the previously unnamed enum a typedef name.  Use the packed
    attribute so that we do not affect the layout of the float_status
    struct.  Use it in the prototypes of relevant functions.
    
    Adjust switch statements as necessary to avoid compiler warnings.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit a828b373bdabc7e53d1e218e3fc76f85b6674688
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon May 4 21:19:39 2020 -0700

    softfloat: Change tininess_before_rounding to bool
    
    Slightly tidies the usage within softfloat.c and the
    representation in float_status.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit c120391c0090d9c40425c92cdb00f38ea8588ff6
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon May 4 19:54:57 2020 -0700

    softfloat: Replace flag with bool
    
    We have had this on the to-do list for quite some time.
    
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b240c9c497b9880ac0ba29465907d5ebecd48083
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon May 4 16:57:21 2020 -0700

    softfloat: Use post test for floatN_mul
    
    The existing f{32,64}_addsub_post test, which checks for zero
    inputs, is identical to f{32,64}_mul_fast_test.  Which means
    we can eliminate the fast_test/fast_op hooks in favor of
    reusing the same post hook.
    
    This means we have one fewer test along the fast path for multiply.
    
    Tested-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

