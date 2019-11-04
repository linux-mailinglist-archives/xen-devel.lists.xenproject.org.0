Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E545ED858
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 06:00:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRURt-00057E-PU; Mon, 04 Nov 2019 04:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pWhq=Y4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iRURs-000579-LT
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 04:58:40 +0000
X-Inumbo-ID: c2497f2a-febf-11e9-9594-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2497f2a-febf-11e9-9594-12813bfff9fa;
 Mon, 04 Nov 2019 04:58:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iRURn-0001AN-UI; Mon, 04 Nov 2019 04:58:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iRURn-0007Li-9x; Mon, 04 Nov 2019 04:58:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iRURn-0007HI-9D; Mon, 04 Nov 2019 04:58:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iRURn-0007HI-9D@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Nov 2019 04:58:35 +0000
Subject: [Xen-devel] [libvirt bisection] complete test-amd64-i386-libvirt
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
Content-Type: multipart/mixed; boundary="===============7735245576520984497=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7735245576520984497==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143666/


  commit 18981877d2e20390a79d068861a24e716f8ee422
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Oct 9 14:09:38 2019 +0200
  
      m4: virt-driver-libxl: remove Fedora 28 check
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-i386-libvirt.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-i386-libvirt.guest-start --summary-out=tmp/143666.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt test-amd64-i386-libvirt guest-start
Searching for failure / basis pass:
 143484 fail [host=huxelrebe0] / 143051 [host=chardonnay0] 143023 [host=italia1] 142949 [host=huxelrebe1] 142904 [host=italia0] 142862 [host=pinot0] 142840 [host=elbling0] 142798 [host=albana1] 142761 [host=albana0] 142644 [host=debina1] 142584 ok.
Failure / basis pass flights: 143484 / 142584
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
Latest bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6f3ac73cd3792c7eeccb4533e545270d640bef4c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass 668dc9fe8c95e919d028356f729404a5ad49e678 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#668dc9fe8c95e919d028356f729404a5ad49e678-bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/linux-pvops.git#42327896f194f256e5a361e0069985bc8d209b42\
 -b98aebd298246df37b472c52a2ee1023256d02e3 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#410c4d00d9f7e369d1ce183e9e8de98cb59c4d20-6f3ac73cd3792c7eeccb4533e545270d640bef4c git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-9\
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
 142584 pass 668dc9fe8c95e919d028356f729404a5ad49e678 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142644 [host=debina1]
 142761 [host=albana0]
 142840 [host=elbling0]
 142798 [host=albana1]
 142862 [host=pinot0]
 142949 [host=huxelrebe1]
 142904 [host=italia0]
 143023 [host=italia1]
 143051 [host=chardonnay0]
 143085 []
 143140 fail irrelevant
 143189 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143218 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143263 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143316 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9e639c1cb6abd5ffed0f9017de26f93d2ee99eac d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143391 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4976a776b283021c252be794e90947732b6f8a92 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143484 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6f3ac73cd3792c7eeccb4533e545270d640bef4c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143585 pass 227d405d1d66e1dd4737b9fdfc64a43d0deb73a9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e132c8d7b58d8dc2c1888f5768454550d1f3ea7b c530a75c1e6a472b0eb9558310b518f0dfcd8860 cd70b1a71d30d0fff4c549a309682fdf127aaae6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143587 blocked f31bdc7ced695becdd6a090b23ab3e4f57b3a323 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3b889f6faba1786c059dd9306e813707aef497ca d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143606 fail 3365cdf8a8743f74f775187919f76f799d4bcdc7 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143590 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6f3ac73cd3792c7eeccb4533e545270d640bef4c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143592 pass 71519d4638e30a7c4f59a9764a7a8e5e8f679eb3 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 92f018a232759824e9b5e448cd7600eafa42c9ac c530a75c1e6a472b0eb9558310b518f0dfcd8860 e797a806a8d090a09a782fe10ba2765154579d4b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143594 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d891592457199c517b1490368c192508a603fd5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143555 pass 668dc9fe8c95e919d028356f729404a5ad49e678 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 42327896f194f256e5a361e0069985bc8d209b42 c530a75c1e6a472b0eb9558310b518f0dfcd8860 410c4d00d9f7e369d1ce183e9e8de98cb59c4d20 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 143609 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143582 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4976a776b283021c252be794e90947732b6f8a92 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143596 fail 5a45ed9c9626edc2281b3745ac29158d651e5e7f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 703232b8e8889e908771b64e22b5ed94e403aa0a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143601 blocked b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d6b926e76e3d639ac37610e97d33ff9e3a6281eb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143612 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143603 fail 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143605 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143617 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143651 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143666 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 142584 (pass), for basis pass
 Result found: flight 143484 (fail), for basis failure
 Repro found: flight 143555 (pass), for basis pass
 Repro found: flight 143590 (fail), for basis failure
 0 revisions at c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143605 (pass), for last pass
 Result found: flight 143609 (fail), for first failure
 Repro found: flight 143612 (pass), for last pass
 Repro found: flight 143617 (fail), for first failure
 Repro found: flight 143651 (pass), for last pass
 Repro found: flight 143666 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  18981877d2e20390a79d068861a24e716f8ee422
  Bug not present: c8007fdc5d2ce43fec2753cda60fb4963f55abd5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143666/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.786119 to fit
pnmtopng: 81 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-i386-libvirt.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
143666: tolerable FAIL

flight 143666 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143666/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt      12 guest-start             fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt                                      fail    


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



--===============7735245576520984497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7735245576520984497==--
