Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B959CEA8FA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 02:51:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPzXv-0006AU-Ci; Thu, 31 Oct 2019 01:46:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oze9=YY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iPzXt-0006AP-K4
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 01:46:41 +0000
X-Inumbo-ID: 478da050-fb80-11e9-bbab-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 478da050-fb80-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 01:46:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iPzXp-0001yD-Sx; Thu, 31 Oct 2019 01:46:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iPzXp-0004M6-Et; Thu, 31 Oct 2019 01:46:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iPzXp-0005gM-E7; Thu, 31 Oct 2019 01:46:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iPzXp-0005gM-E7@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Oct 2019 01:46:37 +0000
Subject: [Xen-devel] [libvirt bisection] complete
 test-amd64-i386-libvirt-pair
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
Content-Type: multipart/mixed; boundary="===============0772076228644476696=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0772076228644476696==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-pair
testid guest-start/debian

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143429/


  commit 18981877d2e20390a79d068861a24e716f8ee422
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Oct 9 14:09:38 2019 +0200
  
      m4: virt-driver-libxl: remove Fedora 28 check
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-i386-libvirt-pair.guest-start--debian.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-i386-libvirt-pair.guest-start--debian --summary-out=tmp/143429.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt test-amd64-i386-libvirt-pair guest-start/debian
Searching for failure / basis pass:
 143316 fail [dst_host=pinot1,src_host=pinot0] / 143051 [dst_host=chardonnay1,src_host=chardonnay0] 143023 [dst_host=debina1,src_host=debina0] 142949 [dst_host=fiano1,src_host=fiano0] 142904 [dst_host=huxelrebe0,src_host=huxelrebe1] 142862 [dst_host=chardonnay0,src_host=chardonnay1] 142840 [dst_host=italia1,src_host=italia0] 142798 [dst_host=albana0,src_host=albana1] 142761 [dst_host=baroque1,src_host=baroque0] 142644 [dst_host=albana1,src_host=albana0] 142584 [dst_host=pinot0,src_host=pinot1] 1\
 42535 [dst_host=fiano0,src_host=fiano1] 142476 ok.
Failure / basis pass flights: 143316 / 142476
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
Latest bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9e639c1cb6abd5ffed0f9017de26f93d2ee99eac d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass 412cc0f4038875aa1b0a3c176c309a7e777e9c3f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#412cc0f4038875aa1b0a3c176c309a7e777e9c3f-bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/linux-pvops.git#42327896f194f256e5a361e0069985bc8d209b42\
 -b98aebd298246df37b472c52a2ee1023256d02e3 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#410c4d00d9f7e369d1ce183e9e8de98cb59c4d20-9e639c1cb6abd5ffed0f9017de26f93d2ee99eac git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-9\
 33ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#43f5df79dad6738d52ea79d072de2b56eb96a91f-120996f147131eca8af90e30c900bc14bc824d9f git://xenbits.xen.org/xen.git#f93abf0315efef861270c25d83c8047fd6a54ec4-518c935fac4d30b3ec35d4b6add82b17b7d7aca3
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

Loaded 5001 nodes in revision graph
Searching for test results:
 142476 pass 412cc0f4038875aa1b0a3c176c309a7e777e9c3f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142535 [dst_host=fiano0,src_host=fiano1]
 142584 [dst_host=pinot0,src_host=pinot1]
 142644 [dst_host=albana1,src_host=albana0]
 142761 [dst_host=baroque1,src_host=baroque0]
 142840 [dst_host=italia1,src_host=italia0]
 142798 [dst_host=albana0,src_host=albana1]
 142862 [dst_host=chardonnay0,src_host=chardonnay1]
 142949 [dst_host=fiano1,src_host=fiano0]
 142904 [dst_host=huxelrebe0,src_host=huxelrebe1]
 143023 [dst_host=debina1,src_host=debina0]
 143051 [dst_host=chardonnay1,src_host=chardonnay0]
 143085 []
 143140 fail irrelevant
 143189 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143218 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143263 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143316 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9e639c1cb6abd5ffed0f9017de26f93d2ee99eac d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143369 pass 14a5993d32fec385479b6c9c2e55241873789b3a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e132c8d7b58d8dc2c1888f5768454550d1f3ea7b c530a75c1e6a472b0eb9558310b518f0dfcd8860 cd70b1a71d30d0fff4c549a309682fdf127aaae6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143421 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143373 pass b6a8c9df4df236d70ef9001420af7705ae62526b 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f28c513d392a807f7b4225964eba6e2b1c453a2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143356 pass 412cc0f4038875aa1b0a3c176c309a7e777e9c3f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 143390 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9e639c1cb6abd5ffed0f9017de26f93d2ee99eac d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143376 pass 6cc9b74e0e7b2f7dde443a4bca06f3435d70235e 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 46bb81200742fabfe5c5624c22e72f036af02869 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143403 pass 9cddc6e8ee9d9ce62dd20a6317c3148f4cd1c0e9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143364 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143381 fail 29795544fdf145df9e129dbd578f0862de540e8a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 703232b8e8889e908771b64e22b5ed94e403aa0a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143383 blocked b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143387 fail c7f8a66b220712727672a6a264e371d34f1d86e0 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143394 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 44c9618a3f518b0fc21df71d9f047b60754b7ebb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143429 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143427 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143406 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143413 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143423 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 142476 (pass), for basis pass
 Result found: flight 143316 (fail), for basis failure
 Repro found: flight 143356 (pass), for basis pass
 Repro found: flight 143390 (fail), for basis failure
 0 revisions at c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143406 (pass), for last pass
 Result found: flight 143413 (fail), for first failure
 Repro found: flight 143421 (pass), for last pass
 Repro found: flight 143423 (fail), for first failure
 Repro found: flight 143427 (pass), for last pass
 Repro found: flight 143429 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  18981877d2e20390a79d068861a24e716f8ee422
  Bug not present: c8007fdc5d2ce43fec2753cda60fb4963f55abd5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143429/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.759409 to fit
pnmtopng: 68 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-i386-libvirt-pair.guest-start--debian.{dot,ps,png,html,svg}.
----------------------------------------
143429: tolerable FAIL

flight 143429 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143429/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 21 guest-start/debian      fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-pair                                 fail    


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



--===============0772076228644476696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0772076228644476696==--
