Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8D47724
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 00:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcdzw-0001Ux-FB; Sun, 16 Jun 2019 22:51:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rcm0=UP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hcdzv-0001Ul-4L
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2019 22:51:39 +0000
X-Inumbo-ID: 4b502f92-9089-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b502f92-9089-11e9-8980-bc764e045a96;
 Sun, 16 Jun 2019 22:51:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hcdzr-0005Zf-MZ; Sun, 16 Jun 2019 22:51:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hcdzr-00055b-Cb; Sun, 16 Jun 2019 22:51:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hcdzr-0001cV-6o; Sun, 16 Jun 2019 22:51:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hcdzr-0001cV-6o@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Jun 2019 22:51:35 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-arm64-xsm
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2484948432228206819=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2484948432228206819==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  59c58f96b270f5edd4ad10954c3a96556cb3a728
  Bug not present: d3e3413bd6a8c0287dbad8942e208d562fd8e29e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137889/


  commit 59c58f96b270f5edd4ad10954c3a96556cb3a728
  Merge: d3e3413bd6 84995ea219
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Wed Jun 12 13:50:01 2019 +0100
  
      Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2019-06-11-v3' into staging
      
      Miscellaneous patches for 2019-06-11
      
      # gpg: Signature made Wed 12 Jun 2019 12:20:41 BST
      # gpg:                using RSA key 354BC8B3D7EB2A6B68674E5F3870B400EB918653
      # gpg:                issuer "armbru@redhat.com"
      # gpg: Good signature from "Markus Armbruster <armbru@redhat.com>" [full]
      # gpg:                 aka "Markus Armbruster <armbru@pond.sub.org>" [full]
      # Primary key fingerprint: 354B C8B3 D7EB 2A6B 6867  4E5F 3870 B400 EB91 8653
      
      * remotes/armbru/tags/pull-misc-2019-06-11-v3:
        MAINTAINERS: Polish headline decorations
        MAINTAINERS: Improve section headlines
        MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org
        Clean up a header guard symbols (again)
        Supply missing header guards
        Clean up a few header guard symbols
        scripts/clean-header-guards: Fix handling of trailing comments
        Normalize position of header guard
        Include qemu-common.h exactly where needed
        Include qemu/module.h where needed, drop it from qemu-common.h
        qemu-common: Move qemu_isalnum() etc. to qemu/ctype.h
        qemu-common: Move tcg_enabled() etc. to sysemu/tcg.h
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 84995ea21935403cc9d57b6cb7dddcac5fa02c1c
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu Jun 6 19:24:08 2019 +0200
  
      MAINTAINERS: Polish headline decorations
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190606172408.18399-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit 6347e1f1cc7afc4276392361c30bdc8b3e7aafa3
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu Jun 6 19:24:07 2019 +0200
  
      MAINTAINERS: Improve section headlines
      
      When scripts/get_maintainer.pl reports something like
      
          John Doe <jdoe@example.org> (maintainer:Overall)
      
      the user is left to wonder *which* of our three "Overall" sections
      applies: the one under "Guest CPU cores (TCG)", or the one under
      "Guest CPU Cores (KVM)", or the one under "Usermode emulation".
      
      Rename sections under
      
      * "Guest CPU cores (TCG)" from "FOO" to "FOO TCG CPUs"
      
      * "Guest CPU Cores (KVM)" from "FOO" to "FOO KVM CPUs"
      
      * "Guest CPU Cores (Xen)" from "FOO" to "FOO Xen CPUs"
      
      * "Architecture support" from "FOO" to "FOO general architecture
        support"
      
      * "Usermode Emulation" from "Overall" to "Overall usermode emulation"
      
      * "Tiny Code Generator (TCG)" from "FOO target" to "FOO TCG target",
        and from "Common code" to "Common TCG code"
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190606172408.18399-3-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit 30aec7d331c0dd43c3e83b028c3169993d897552
  Author: Philippe Mathieu-Daudé <philmd@redhat.com>
  Date:   Fri Jun 7 16:27:20 2019 +0200
  
      MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org
      
      The list is always selected by the 'All patches CC here' section.
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      [Conflicts resolved by redoing the patch]
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
  
  commit fe2611b0165e019e341981ce663282e335f5bc4e
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Fri Jun 7 16:13:21 2019 +0200
  
      Clean up a header guard symbols (again)
      
      Commit d52c454aad "contrib: add vhost-user-gpu" and "c68082c43a
      virtio-gpu: split virtio-gpu-pci & virtio-vga" created headers with
      unusual header guard symbols.  Clean them up
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190607141321.9726-1-armbru@redhat.com>
  
  commit f91005e195e7e1485e60cb121731589960f1a3c9
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:18 2019 +0200
  
      Supply missing header guards
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-5-armbru@redhat.com>
  
  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:16 2019 +0200
  
      scripts/clean-header-guards: Fix handling of trailing comments
      
      clean-header-guards.pl fails to recognize a header guard #endif when
      it's followed by a // comment, or multiple comments.  Fix that.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-3-armbru@redhat.com>
  
  commit 0553d895f98d6ffa7354dee324ff7a65fca3367f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:15 2019 +0200
  
      Normalize position of header guard
      
      This is the common header guard idiom:
      
          /*
           * File comment
           */
      
          #ifndef GUARD_SYMBOL_H
          #define GUARD_SYMBOL_H
      
          ... actual contents ...
      
          #endif
      
      A few of our headers have some #include before the guard.
      target/tilegx/spr_def_64.h has #ifndef __DOXYGEN__ outside the guard.
      A few more have the #define elsewhere.
      
      Change them to match the common idiom.  For spr_def_64.h, that means
      dropping #ifndef __DOXYGEN__.  While there, rename guard symbols to
      make scripts/clean-header-guards.pl happy.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-2-armbru@redhat.com>
      [Rebased with conflicts resolved automatically]
  
  commit a8d2532645cf5ce4f75981f81dfe363efc35d05c
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:08 2019 +0200
  
      Include qemu-common.h exactly where needed
      
      No header includes qemu-common.h after this commit, as prescribed by
      qemu-common.h's file comment.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-5-armbru@redhat.com>
      [Rebased with conflicts resolved automatically, except for
      include/hw/arm/xlnx-zynqmp.h hw/arm/nrf51_soc.c hw/arm/msf2-soc.c
      block/qcow2-refcount.c block/qcow2-cluster.c block/qcow2-cache.c
      target/arm/cpu.h target/lm32/cpu.h target/m68k/cpu.h target/mips/cpu.h
      target/moxie/cpu.h target/nios2/cpu.h target/openrisc/cpu.h
      target/riscv/cpu.h target/tilegx/cpu.h target/tricore/cpu.h
      target/unicore32/cpu.h target/xtensa/cpu.h; bsd-user/main.c and
      net/tap-bsd.c fixed up]
  
  commit 0b8fa32f551e863bb548a11394239239270dd3dc
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:07 2019 +0200
  
      Include qemu/module.h where needed, drop it from qemu-common.h
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-4-armbru@redhat.com>
      [Rebased with conflicts resolved automatically, except for
      hw/usb/dev-hub.c hw/misc/exynos4210_rng.c hw/misc/bcm2835_rng.c
      hw/misc/aspeed_scu.c hw/display/virtio-vga.c hw/arm/stm32f205_soc.c;
      ui/cocoa.m fixed up]
  
  commit 856dfd8a035e42cd96ca823f1cbbd18d332e2f84
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:06 2019 +0200
  
      qemu-common: Move qemu_isalnum() etc. to qemu/ctype.h
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-3-armbru@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
  
  commit 14a48c1d0d687735c76880e59bcede6e99871ded
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:05 2019 +0200
  
      qemu-common: Move tcg_enabled() etc. to sysemu/tcg.h
      
      Other accelerators have their own headers: sysemu/hax.h, sysemu/hvf.h,
      sysemu/kvm.h, sysemu/whpx.h.  Only tcg_enabled() & friends sit in
      qemu-common.h.  This necessitates inclusion of qemu-common.h into
      headers, which is against the rules spelled out in qemu-common.h's
      file comment.
      
      Move tcg_enabled() & friends into their own header sysemu/tcg.h, and
      adjust #include directives.
      
      Cc: Richard Henderson <rth@twiddle.net>
      Cc: Paolo Bonzini <pbonzini@redhat.com>
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-2-armbru@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      [Rebased with conflicts resolved automatically, except for
      accel/tcg/tcg-all.c]


*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137893/


  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build --summary-out=tmp/137893.bisection-summary --basis-template=137600 --blessings=real,real-bisect qemu-mainline build-arm64-xsm xen-build
Searching for failure / basis pass:
 137734 fail [host=rochester0] / 137600 ok.
Failure / basis pass flights: 137734 / 137600
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fc7d997c35372126823c3b0acf7b67c45cbeea36 f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
Basis pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#f0718d1d6b47745a4249f4006807a45f2245dba1-fc7d997c35372126823c3b0acf7b67c45cbeea36 git://git.qemu.org/qemu.git#a578cdfbdd8f9beff5ced52b7826ddb1669abbbf-f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f git://xenbits.xen.org/osstest/seabios.git#0932c20560574696cf87ddd12623e8c423ee821b-85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 git://xenbits.xen.org/xen.git#844aa0a13d34e9a341a8374119d2ed67d4dcd6bb-480800c76969b38f13b6\
 909eb679b23571417538
Loaded 18557 nodes in revision graph
Searching for test results:
 137600 pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 137734 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137697 fail irrelevant
 137862 pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 137864 fail irrelevant
 137866 pass irrelevant
 137869 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137873 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 650a379d505bf558bcb41124bc6c951a76cbc113 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137874 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 8e23e34d989d5ce542fa26425f091fc61e1f23f4 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137875 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 d14055dc69dfe4f53e3af9a93126382a40da3366 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137876 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 6d7a134da4afebe8551a69329478415cfb4cbe91 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137877 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137878 pass 1631bb26ae991e530d3c96fe3161ea15144b358e 219dca61ebf41625831d4f96a720852baf44b762 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 0afba78cce7e12cafc79a4eb64e72c633e696bfc
 137879 pass 1631bb26ae991e530d3c96fe3161ea15144b358e a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 0afba78cce7e12cafc79a4eb64e72c633e696bfc
 137880 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 59c58f96b270f5edd4ad10954c3a96556cb3a728 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137881 pass e5b4d825afc474a8cb916a2476dc0bb85fb32b2d 856dfd8a035e42cd96ca823f1cbbd18d332e2f84 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137882 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137883 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 fe2611b0165e019e341981ce663282e335f5bc4e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137884 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137885 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137886 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 59c58f96b270f5edd4ad10954c3a96556cb3a728 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137887 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137889 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 59c58f96b270f5edd4ad10954c3a96556cb3a728 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137890 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137891 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137892 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137893 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
Searching for interesting versions
 Result found: flight 137600 (pass), for basis pass
 Result found: flight 137734 (fail), for basis failure
 Repro found: flight 137862 (pass), for basis pass
 Repro found: flight 137869 (fail), for basis failure
 0 revisions at 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
No revisions left to test, checking graph state.
 Result found: flight 137877 (pass), for last pass
 Result found: flight 137880 (fail), for first failure
 Repro found: flight 137885 (pass), for last pass
 Repro found: flight 137886 (fail), for first failure
 Repro found: flight 137887 (pass), for last pass
 Repro found: flight 137889 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  59c58f96b270f5edd4ad10954c3a96556cb3a728
  Bug not present: d3e3413bd6a8c0287dbad8942e208d562fd8e29e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137889/


  commit 59c58f96b270f5edd4ad10954c3a96556cb3a728
  Merge: d3e3413bd6 84995ea219
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Wed Jun 12 13:50:01 2019 +0100
  
      Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2019-06-11-v3' into staging
      
      Miscellaneous patches for 2019-06-11
      
      # gpg: Signature made Wed 12 Jun 2019 12:20:41 BST
      # gpg:                using RSA key 354BC8B3D7EB2A6B68674E5F3870B400EB918653
      # gpg:                issuer "armbru@redhat.com"
      # gpg: Good signature from "Markus Armbruster <armbru@redhat.com>" [full]
      # gpg:                 aka "Markus Armbruster <armbru@pond.sub.org>" [full]
      # Primary key fingerprint: 354B C8B3 D7EB 2A6B 6867  4E5F 3870 B400 EB91 8653
      
      * remotes/armbru/tags/pull-misc-2019-06-11-v3:
        MAINTAINERS: Polish headline decorations
        MAINTAINERS: Improve section headlines
        MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org
        Clean up a header guard symbols (again)
        Supply missing header guards
        Clean up a few header guard symbols
        scripts/clean-header-guards: Fix handling of trailing comments
        Normalize position of header guard
        Include qemu-common.h exactly where needed
        Include qemu/module.h where needed, drop it from qemu-common.h
        qemu-common: Move qemu_isalnum() etc. to qemu/ctype.h
        qemu-common: Move tcg_enabled() etc. to sysemu/tcg.h
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 84995ea21935403cc9d57b6cb7dddcac5fa02c1c
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu Jun 6 19:24:08 2019 +0200
  
      MAINTAINERS: Polish headline decorations
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190606172408.18399-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit 6347e1f1cc7afc4276392361c30bdc8b3e7aafa3
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu Jun 6 19:24:07 2019 +0200
  
      MAINTAINERS: Improve section headlines
      
      When scripts/get_maintainer.pl reports something like
      
          John Doe <jdoe@example.org> (maintainer:Overall)
      
      the user is left to wonder *which* of our three "Overall" sections
      applies: the one under "Guest CPU cores (TCG)", or the one under
      "Guest CPU Cores (KVM)", or the one under "Usermode emulation".
      
      Rename sections under
      
      * "Guest CPU cores (TCG)" from "FOO" to "FOO TCG CPUs"
      
      * "Guest CPU Cores (KVM)" from "FOO" to "FOO KVM CPUs"
      
      * "Guest CPU Cores (Xen)" from "FOO" to "FOO Xen CPUs"
      
      * "Architecture support" from "FOO" to "FOO general architecture
        support"
      
      * "Usermode Emulation" from "Overall" to "Overall usermode emulation"
      
      * "Tiny Code Generator (TCG)" from "FOO target" to "FOO TCG target",
        and from "Common code" to "Common TCG code"
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190606172408.18399-3-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit 30aec7d331c0dd43c3e83b028c3169993d897552
  Author: Philippe Mathieu-Daudé <philmd@redhat.com>
  Date:   Fri Jun 7 16:27:20 2019 +0200
  
      MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org
      
      The list is always selected by the 'All patches CC here' section.
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      [Conflicts resolved by redoing the patch]
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
  
  commit fe2611b0165e019e341981ce663282e335f5bc4e
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Fri Jun 7 16:13:21 2019 +0200
  
      Clean up a header guard symbols (again)
      
      Commit d52c454aad "contrib: add vhost-user-gpu" and "c68082c43a
      virtio-gpu: split virtio-gpu-pci & virtio-vga" created headers with
      unusual header guard symbols.  Clean them up
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190607141321.9726-1-armbru@redhat.com>
  
  commit f91005e195e7e1485e60cb121731589960f1a3c9
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:18 2019 +0200
  
      Supply missing header guards
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-5-armbru@redhat.com>
  
  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  
  commit c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:16 2019 +0200
  
      scripts/clean-header-guards: Fix handling of trailing comments
      
      clean-header-guards.pl fails to recognize a header guard #endif when
      it's followed by a // comment, or multiple comments.  Fix that.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-3-armbru@redhat.com>
  
  commit 0553d895f98d6ffa7354dee324ff7a65fca3367f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:15 2019 +0200
  
      Normalize position of header guard
      
      This is the common header guard idiom:
      
          /*
           * File comment
           */
      
          #ifndef GUARD_SYMBOL_H
          #define GUARD_SYMBOL_H
      
          ... actual contents ...
      
          #endif
      
      A few of our headers have some #include before the guard.
      target/tilegx/spr_def_64.h has #ifndef __DOXYGEN__ outside the guard.
      A few more have the #define elsewhere.
      
      Change them to match the common idiom.  For spr_def_64.h, that means
      dropping #ifndef __DOXYGEN__.  While there, rename guard symbols to
      make scripts/clean-header-guards.pl happy.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-2-armbru@redhat.com>
      [Rebased with conflicts resolved automatically]
  
  commit a8d2532645cf5ce4f75981f81dfe363efc35d05c
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:08 2019 +0200
  
      Include qemu-common.h exactly where needed
      
      No header includes qemu-common.h after this commit, as prescribed by
      qemu-common.h's file comment.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-5-armbru@redhat.com>
      [Rebased with conflicts resolved automatically, except for
      include/hw/arm/xlnx-zynqmp.h hw/arm/nrf51_soc.c hw/arm/msf2-soc.c
      block/qcow2-refcount.c block/qcow2-cluster.c block/qcow2-cache.c
      target/arm/cpu.h target/lm32/cpu.h target/m68k/cpu.h target/mips/cpu.h
      target/moxie/cpu.h target/nios2/cpu.h target/openrisc/cpu.h
      target/riscv/cpu.h target/tilegx/cpu.h target/tricore/cpu.h
      target/unicore32/cpu.h target/xtensa/cpu.h; bsd-user/main.c and
      net/tap-bsd.c fixed up]
  
  commit 0b8fa32f551e863bb548a11394239239270dd3dc
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:07 2019 +0200
  
      Include qemu/module.h where needed, drop it from qemu-common.h
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-4-armbru@redhat.com>
      [Rebased with conflicts resolved automatically, except for
      hw/usb/dev-hub.c hw/misc/exynos4210_rng.c hw/misc/bcm2835_rng.c
      hw/misc/aspeed_scu.c hw/display/virtio-vga.c hw/arm/stm32f205_soc.c;
      ui/cocoa.m fixed up]
  
  commit 856dfd8a035e42cd96ca823f1cbbd18d332e2f84
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:06 2019 +0200
  
      qemu-common: Move qemu_isalnum() etc. to qemu/ctype.h
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-3-armbru@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
  
  commit 14a48c1d0d687735c76880e59bcede6e99871ded
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Thu May 23 16:35:05 2019 +0200
  
      qemu-common: Move tcg_enabled() etc. to sysemu/tcg.h
      
      Other accelerators have their own headers: sysemu/hax.h, sysemu/hvf.h,
      sysemu/kvm.h, sysemu/whpx.h.  Only tcg_enabled() & friends sit in
      qemu-common.h.  This necessitates inclusion of qemu-common.h into
      headers, which is against the rules spelled out in qemu-common.h's
      file comment.
      
      Move tcg_enabled() & friends into their own header sysemu/tcg.h, and
      adjust #include directives.
      
      Cc: Richard Henderson <rth@twiddle.net>
      Cc: Paolo Bonzini <pbonzini@redhat.com>
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190523143508.25387-2-armbru@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      [Rebased with conflicts resolved automatically, except for
      accel/tcg/tcg-all.c]

 Result found: flight 137882 (pass), for last pass
 Result found: flight 137884 (fail), for first failure
 Repro found: flight 137890 (pass), for last pass
 Repro found: flight 137891 (fail), for first failure
 Repro found: flight 137892 (pass), for last pass
 Repro found: flight 137893 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137893/


  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
137893: tolerable ALL FAIL

flight 137893 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/137893/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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



--===============2484948432228206819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2484948432228206819==--
