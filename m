Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F9B929B3F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 06:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754981.1163239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQfhp-0000Lm-5l; Mon, 08 Jul 2024 04:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754981.1163239; Mon, 08 Jul 2024 04:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQfhp-0000J8-35; Mon, 08 Jul 2024 04:10:25 +0000
Received: by outflank-mailman (input) for mailman id 754981;
 Mon, 08 Jul 2024 04:10:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQfhn-0000Iw-5L; Mon, 08 Jul 2024 04:10:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQfhm-0006lD-VK; Mon, 08 Jul 2024 04:10:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQfhm-0000RR-8r; Mon, 08 Jul 2024 04:10:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sQfhm-00061V-7l; Mon, 08 Jul 2024 04:10:22 +0000
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
	bh=Bv0Vg623jSGV3M4nUosnnKsWPRRS0f2XN4XM1yb7nAo=; b=7IlEDavqpg+Y4tmO6ypixk6uTF
	gIyCITRbKCu5UyWxA9nIiGh0hWNWY/zQVCKLmGFIpxWkJqdAmiwca/ZfIlL+GeABQPMPJVQ8Wljdr
	3Z98UlRvb4N5tNfdww1HkGpnjOyXk5eRyiGCQ5JA29qWkU0YYpRTg7nw/3ptxNPnDoFE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186724-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186724: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5a4bd506ddad75f1f2711cfbcf7551a5504e3f1e
X-Osstest-Versions-That:
    linux=c6653f49e4fd3b0d52c12a1fc814d6c5b234ea15
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jul 2024 04:10:22 +0000

flight 186724 linux-linus real [real]
flight 186725 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186724/
http://logs.test-lab.xenproject.org/osstest/logs/186725/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 186720
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 186720
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 186720

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-vhd  8 xen-boot            fail pass in 186725-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check fail in 186725 never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check fail in 186725 never pass
 test-armhf-armhf-examine      8 reboot                       fail  like 186720
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186720
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186720
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186720
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186720
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186720
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5a4bd506ddad75f1f2711cfbcf7551a5504e3f1e
baseline version:
 linux                c6653f49e4fd3b0d52c12a1fc814d6c5b234ea15

Last test of basis   186720  2024-07-07 04:19:59 Z    0 days
Testing same since   186724  2024-07-07 18:42:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bjorn Andersson <andersson@kernel.org>
  Chen-Yu Tsai <wens@csie.org>
  Frank Oltmanns <frank@oltmanns.dev>
  Gabor Juhos <j4g8y7@gmail.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Md Sadre Alam <quic_mdalam@quicinc.com>
  Pin-yen Lin <treapking@chromium.org>
  Robert J. Pafford <pafford.9@buckeyemail.osu.edu>
  Stephen Boyd <sboyd@kernel.org>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
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


Not pushing.

------------------------------------------------------------
commit 5a4bd506ddad75f1f2711cfbcf7551a5504e3f1e
Merge: c6653f49e4fd 10f84de27bd0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 7 10:59:38 2024 -0700

    Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
    
    Pull clk fixes from Stephen Boyd:
     "A set of clk fixes for the Qualcomm, Mediatek, and Allwinner drivers:
    
       - Fix the Qualcomm Stromer Plus PLL set_rate() clk_op to explicitly
         set the alpha enable bit and not set bits that don't exist
    
       - Mark Qualcomm IPQ9574 crypto clks as voted to avoid stuck clk
         warnings
    
       - Fix the parent of some PLLs on Qualcomm sm6530 so their rate is
         correct
    
       - Fix the min/max rate clamping logic in the Allwinner driver that
         got broken in v6.9
    
       - Limit runtime PM enabling in the Mediatek driver to only
         mt8183-mfgcfg so that system wide resume doesn't break on other
         Mediatek SoCs"
    
    * tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux:
      clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
      clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common
      clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
      clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
      clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
      clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents

commit 10f84de27bd05bd2648512975d085dbe0a1e71c3
Merge: 878e845d8db0 72ceafb587a5
Author: Stephen Boyd <sboyd@kernel.org>
Date:   Tue Jul 2 12:03:15 2024 -0700

    Merge tag 'qcom-clk-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes
    
    Pull Qualcomm clk driver fixes from Bjorn Andersson:
    
     - Correct the Stromer Plus PLL set_rate to explicitly set ALPHA_EN bit and
       remove unnecessary upper parts of CONFIG_CTL values.
     - Mark the recently added IPQ9574 GCC crypto clocks BRANCH_HALT_VOTED, to
       address stuck clock warnings.
     - Fix the GPLL6 and GPLL7 parents on SM6350 to avoid issues with these
       reportedly running at ~25GHz.
    
    * tag 'qcom-clk-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux:
      clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
      clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
      clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
      clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents

commit 878e845d8db04df9ff3bbbaac09d335b24153704
Author: Pin-yen Lin <treapking@chromium.org>
Date:   Thu Jun 13 20:02:28 2024 +0800

    clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
    
    Commit 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers
    during probe") enabled runtime PM for all mediatek clock controllers,
    but this introduced an issue on the resume path.
    
    If a device resumes earlier than the clock controller and calls
    clk_prepare() when runtime PM is enabled on the controller, it will end
    up calling clk_pm_runtime_get(). But the subsequent
    pm_runtime_resume_and_get() call will fail because the runtime PM is
    temporarily disabled during suspend.
    
    To workaround this, introduce a need_runtime_pm flag and only enable it
    on mt8183-mfgcfg, which is the driver that observed deadlock previously.
    Hopefully mt8183-cfgcfg won't run into the issue at the resume stage
    because the GPU should have stopped rendering before the system calls
    suspend.
    
    Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
    Signed-off-by: Pin-yen Lin <treapking@chromium.org>
    Link: https://lore.kernel.org/r/20240613120357.1043342-1-treapking@chromium.org
    Signed-off-by: Stephen Boyd <sboyd@kernel.org>

commit f7275fdf945cc91217dfba75d8c9e984c1dab05c
Merge: 2607133196c3 ea977d742507
Author: Stephen Boyd <sboyd@kernel.org>
Date:   Mon Jul 1 13:18:29 2024 -0700

    Merge tag 'sunxi-clk-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes
    
    Pull one Allwinner SoC clk driver fix for 6.10
    
     - Fix min/max rate clamping that caused a regression back in 6.9
    
    * tag 'sunxi-clk-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux:
      clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common

commit ea977d742507e534d9fe4f4d74256f6b7f589338
Author: Frank Oltmanns <frank@oltmanns.dev>
Date:   Sun Jun 23 10:45:58 2024 +0200

    clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common
    
    In order to set the rate range of a hw sunxi_ccu_probe calls
    hw_to_ccu_common() assuming all entries in desc->ccu_clks are contained
    in a ccu_common struct. This assumption is incorrect and, in
    consequence, causes invalid pointer de-references.
    
    Remove the faulty call. Instead, add one more loop that iterates over
    the ccu_clks and sets the rate range, if required.
    
    Fixes: b914ec33b391 ("clk: sunxi-ng: common: Support minimum and maximum rate")
    Reported-by: Robert J. Pafford <pafford.9@buckeyemail.osu.edu>
    Closes: https://lore.kernel.org/lkml/DM6PR01MB58047C810DDD5D0AE397CADFF7C22@DM6PR01MB5804.prod.exchangelabs.com/
    Cc: stable@vger.kernel.org
    Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
    Tested-by: Robert J. Pafford <pafford.9@buckeyemail.osu.edu>
    Link: https://lore.kernel.org/r/20240623-sunxi-ng_fix_common_probe-v1-1-7c97e32824a1@oltmanns.dev
    Signed-off-by: Chen-Yu Tsai <wens@csie.org>

commit 72ceafb587a56e26c905472418c7dc2033c294d3
Author: Md Sadre Alam <quic_mdalam@quicinc.com>
Date:   Thu May 9 16:24:05 2024 +0530

    clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
    
    The crypto_ahb and crypto_axi clks are hardware voteable.
    This means that the halt bit isn't reliable because some
    other voter in the system, e.g. TrustZone, could be keeping
    the clk enabled when the kernel turns it off from clk_disable().
    Make these clks use voting mode by changing the halt check to
    BRANCH_HALT_VOTED and toggle the voting bit in the voting register
    instead of directly controlling the branch by writing to the branch
    register. This fixes stuck clk warnings seen on ipq9574 and saves
    power by actually turning the clk off.
    
    Also changes the CRYPTO_AHB_CLK_ENA & CRYPTO_AXI_CLK_ENA
    offset to 0xb004 from 0x16014.
    
    Cc: stable@vger.kernel.org
    Fixes: f6b2bd9cb29a ("clk: qcom: gcc-ipq9574: Enable crypto clocks")
    Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
    Link: https://lore.kernel.org/r/20240509105405.1262369-1-quic_mdalam@quicinc.com
    Signed-off-by: Bjorn Andersson <andersson@kernel.org>

commit 2ba8425678af422da37b6c9b50e9ce66f0f55cae
Author: Gabor Juhos <j4g8y7@gmail.com>
Date:   Thu May 9 10:08:04 2024 +0200

    clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
    
    Since the CONFIG_CTL register is only 32 bits wide in the Stromer
    and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
    IPQ5018 and IPQ5332 configurations are not used so remove those.
    
    No functional changes.
    
    Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
    Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
    Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
    Link: https://lore.kernel.org/r/20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com
    Signed-off-by: Bjorn Andersson <andersson@kernel.org>

commit 5a33a64524e6381c399e5e42571d9363ffc0bed4
Author: Gabor Juhos <j4g8y7@gmail.com>
Date:   Wed May 8 22:34:14 2024 +0200

    clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
    
    The clk_alpha_pll_stromer_plus_set_rate() function does not
    sets the ALPHA_EN bit in the USER_CTL register, so setting
    rates which requires using alpha mode works only if the bit
    gets set already prior calling the function.
    
    Extend the function to set the ALPHA_EN bit in order to allow
    using fractional rates regardless whether the bit gets set
    previously or not.
    
    Fixes: 84da48921a97 ("clk: qcom: clk-alpha-pll: introduce stromer plus ops")
    Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
    Link: https://lore.kernel.org/r/20240508-stromer-plus-alpha-en-v1-1-6639ce01ca5b@gmail.com
    Signed-off-by: Bjorn Andersson <andersson@kernel.org>

commit 3414f41a13eb41db15c558fbc695466203dca4fa
Author: Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed May 8 10:12:53 2024 +0200

    clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
    
    Both gpll6 and gpll7 are parented to CXO at 19.2 MHz and not to GPLL0
    which runs at 600 MHz. Also gpll6_out_even should have the parent gpll6
    and not gpll0.
    
    Adjust the parents of these clocks to make Linux report the correct rate
    and not absurd numbers like gpll7 at ~25 GHz or gpll6 at 24 GHz.
    
    Corrected rates are the following:
    
      gpll7              807999902 Hz
      gpll6              768000000 Hz
         gpll6_out_even  384000000 Hz
      gpll0              600000000 Hz
         gpll0_out_odd   200000000 Hz
         gpll0_out_even  300000000 Hz
    
    And because gpll6 is the parent of gcc_sdcc2_apps_clk_src (at 202 MHz)
    that clock also reports the correct rate now and avoids this warning:
    
      [    5.984062] mmc0: Card appears overclocked; req 202000000 Hz, actual 6312499237 Hz
    
    Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
    Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
    Link: https://lore.kernel.org/r/20240508-sm6350-gpll-fix-v1-1-e4ea34284a6d@fairphone.com
    Signed-off-by: Bjorn Andersson <andersson@kernel.org>

