Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E41F513E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 17:36:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT7Cy-0004cM-TJ; Fri, 08 Nov 2019 16:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HYA3=ZA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iT7Cx-0004cH-CF
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 16:33:59 +0000
X-Inumbo-ID: 8f0c9e60-0245-11ea-a1d5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f0c9e60-0245-11ea-a1d5-12813bfff9fa;
 Fri, 08 Nov 2019 16:33:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iT7Cu-0005xl-3d; Fri, 08 Nov 2019 16:33:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iT7Ct-0000yR-JI; Fri, 08 Nov 2019 16:33:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iT7Ct-0007TE-Gl; Fri, 08 Nov 2019 16:33:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iT7Ct-0007TE-Gl@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Nov 2019 16:33:55 +0000
Subject: [Xen-devel] [libvirt bisection] complete
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
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
Content-Type: multipart/mixed; boundary="===============4783093575038959251=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4783093575038959251==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  18981877d2e20390a79d068861a24e716f8ee422
  Bug not present: c8007fdc5d2ce43fec2753cda60fb4963f55abd5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143931/


  commit 18981877d2e20390a79d068861a24e716f8ee422
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Oct 9 14:09:38 2019 +0200
  
      m4: virt-driver-libxl: remove Fedora 28 check
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/143931.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 143789 fail [host=huxelrebe1] / 143051 [host=huxelrebe0] 143023 [host=albana1] 142949 [host=chardonnay0] 142904 [host=fiano0] 142862 [host=italia1] 142840 [host=debina0] 142798 [host=albana0] 142761 [host=elbling1] 142644 [host=chardonnay1] 142584 [host=pinot0] 142535 [host=baroque0] 142476 [host=huxelrebe0] 142427 [host=italia0] 142384 [host=albana1] 142345 [host=debina1] 142252 [host=italia1] 142080 [host=albana0] 141931 [host=chardonnay0] 141893 [host=fiano1] 141859 [host=pinot0] 141806 [hos\
 t=elbling1] 141747 [host=elbling0] 141683 [host=albana1] 141622 [host=debina0] 141569 [host=fiano0] 141493 [host=huxelrebe0] 141456 [host=pinot1] 141415 [host=italia0] 141384 [host=rimava1] 141356 [host=baroque1] 141296 ok.
Failure / basis pass flights: 143789 / 141296
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 78a342441efca14680a934dc72d1b3d1ed9e8d3e 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e2fc50812895b17e8b23f5a9c43cde29531b200f d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass 281a7f1d400aeb0d4d53dd3b628b7275f49854d0 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5a9db858806912ebd4e836aaa607ef6d87ce9c0d d0d8ad39ecb51cd7497cd524484fe09f50876798 cef9660618a880ced798375a0fd16a8ad80bd0f0 43f5df79dad6738d52ea79d072de2b56eb96a91f 6c9639a72f0ca3a9430ef75f375877182281fdef
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#281a7f1d400aeb0d4d53dd3b628b7275f49854d0-78a342441efca14680a934dc72d1b3d1ed9e8d3e https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/linux-pvops.git#3ffe1e79c174b2093f7ee3df589a7705572c9620\
 -b98aebd298246df37b472c52a2ee1023256d02e3 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#5a9db858806912ebd4e836aaa607ef6d87ce9c0d-e2fc50812895b17e8b23f5a9c43cde29531b200f git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#cef9660618a880ced798375a0fd16a8ad80bd0f0-9\
 33ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#43f5df79dad6738d52ea79d072de2b56eb96a91f-c1ab7d7ed5306641784a9ed8972db5151a49a1a1 git://xenbits.xen.org/xen.git#6c9639a72f0ca3a9430ef75f375877182281fdef-518c935fac4d30b3ec35d4b6add82b17b7d7aca3
From git://cache:9419/git://libvirt.org/libvirt
   ebd004299a..137f71486c  master     -> origin/master
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 41330 nodes in revision graph
Searching for test results:
 141296 pass 281a7f1d400aeb0d4d53dd3b628b7275f49854d0 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5a9db858806912ebd4e836aaa607ef6d87ce9c0d d0d8ad39ecb51cd7497cd524484fe09f50876798 cef9660618a880ced798375a0fd16a8ad80bd0f0 43f5df79dad6738d52ea79d072de2b56eb96a91f 6c9639a72f0ca3a9430ef75f375877182281fdef
 141356 [host=baroque1]
 141384 [host=rimava1]
 141493 [host=huxelrebe0]
 141415 [host=italia0]
 141456 [host=pinot1]
 141569 [host=fiano0]
 141683 [host=albana1]
 141622 [host=debina0]
 141806 [host=elbling1]
 141747 [host=elbling0]
 141859 [host=pinot0]
 141931 [host=chardonnay0]
 141893 [host=fiano1]
 142080 [host=albana0]
 142252 [host=italia1]
 142345 [host=debina1]
 142384 [host=albana1]
 142427 [host=italia0]
 142476 [host=huxelrebe0]
 142535 [host=baroque0]
 142584 [host=pinot0]
 142644 [host=chardonnay1]
 142761 [host=elbling1]
 142840 [host=debina0]
 142798 [host=albana0]
 142862 [host=italia1]
 142949 [host=chardonnay0]
 142904 [host=fiano0]
 143023 [host=albana1]
 143051 [host=huxelrebe0]
 143085 []
 143140 fail irrelevant
 143189 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143218 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143263 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143316 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9e639c1cb6abd5ffed0f9017de26f93d2ee99eac d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143391 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4976a776b283021c252be794e90947732b6f8a92 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143484 fail irrelevant
 143589 fail 73f91d659b07df8ab267fed1ea4949245a7b57af 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b15646484eaffcf7cc464fdea0214498f26addc2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143909 pass fd3b8fe7ad491c77c0b3f57110adaf64f743855e 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 976d0353a6ce48149039849b52bb67527be5b580 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 4ca8eab5ce1893b3048b06921f12157d33ab60f7
 143794 pass 281a7f1d400aeb0d4d53dd3b628b7275f49854d0 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5a9db858806912ebd4e836aaa607ef6d87ce9c0d d0d8ad39ecb51cd7497cd524484fe09f50876798 cef9660618a880ced798375a0fd16a8ad80bd0f0 43f5df79dad6738d52ea79d072de2b56eb96a91f 6c9639a72f0ca3a9430ef75f375877182281fdef
 143789 fail 78a342441efca14680a934dc72d1b3d1ed9e8d3e 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e2fc50812895b17e8b23f5a9c43cde29531b200f d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143925 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143914 pass 71519d4638e30a7c4f59a9764a7a8e5e8f679eb3 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 10b0e388a18353d224ccf17cc46a57f1070abb2b c530a75c1e6a472b0eb9558310b518f0dfcd8860 e797a806a8d090a09a782fe10ba2765154579d4b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143875 fail 78a342441efca14680a934dc72d1b3d1ed9e8d3e 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e2fc50812895b17e8b23f5a9c43cde29531b200f d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143915 pass 69a66f13196d21a3dac06b9e0cf0db77e5e467fe 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91f98c908627f4cde8f7139c80e8004b79d1d0ba d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143916 blocked b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 79cd636f3ee1d89cf8282067ec33c59e1f2a6666 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143917 fail 4d60e7fdd47802f8356497c2a6f55560872e2cdb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143901 pass a95e585e132de71bab030c84b1f7f1d116b65695 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 f835e1d4c187014742fbd766ec2fbc07ef5384ba d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f d5b7d10cb49cf8fcf1104606fb27b80233bb98c1
 143918 pass 48f48b27afe97284d2ba8208663320c8f0554421 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 46bb81200742fabfe5c5624c22e72f036af02869 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143926 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143919 fail 3365cdf8a8743f74f775187919f76f799d4bcdc7 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143928 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143920 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d891592457199c517b1490368c192508a603fd5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143921 pass 9cddc6e8ee9d9ce62dd20a6317c3148f4cd1c0e9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143923 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143929 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143924 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143931 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 141296 (pass), for basis pass
 Result found: flight 143789 (fail), for basis failure
 Repro found: flight 143794 (pass), for basis pass
 Repro found: flight 143875 (fail), for basis failure
 0 revisions at c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143924 (pass), for last pass
 Result found: flight 143925 (fail), for first failure
 Repro found: flight 143926 (pass), for last pass
 Repro found: flight 143928 (fail), for first failure
 Repro found: flight 143929 (pass), for last pass
 Repro found: flight 143931 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  18981877d2e20390a79d068861a24e716f8ee422
  Bug not present: c8007fdc5d2ce43fec2753cda60fb4963f55abd5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143931/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 18981877d2e20390a79d068861a24e716f8ee422
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Oct 9 14:09:38 2019 +0200
  
      m4: virt-driver-libxl: remove Fedora 28 check
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.272654 to fit
pnmtopng: 46 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
143931: tolerable FAIL

flight 143931 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143931/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    


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



--===============4783093575038959251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4783093575038959251==--
