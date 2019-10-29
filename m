Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A2E890A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 14:07:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPR9S-0000fr-AY; Tue, 29 Oct 2019 13:03:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kpi8=YW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iPR9R-0000fm-Hn
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 13:03:09 +0000
X-Inumbo-ID: 703c9bd0-fa4c-11e9-9512-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 703c9bd0-fa4c-11e9-9512-12813bfff9fa;
 Tue, 29 Oct 2019 13:03:02 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iPR9J-0004Ip-4S; Tue, 29 Oct 2019 13:03:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iPR9I-0006eK-EG; Tue, 29 Oct 2019 13:03:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iPR9I-0003VF-DZ; Tue, 29 Oct 2019 13:03:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iPR9I-0003VF-DZ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Oct 2019 13:03:00 +0000
Subject: [Xen-devel] [libvirt bisection] complete
 test-amd64-amd64-libvirt-xsm
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
Content-Type: multipart/mixed; boundary="===============8647913125371102360=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8647913125371102360==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143337/


  commit 18981877d2e20390a79d068861a24e716f8ee422
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Oct 9 14:09:38 2019 +0200
  
      m4: virt-driver-libxl: remove Fedora 28 check
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start --summary-out=tmp/143337.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt test-amd64-amd64-libvirt-xsm guest-start
Searching for failure / basis pass:
 143263 fail [host=albana0] / 143051 [host=elbling0] 143023 [host=pinot0] 142949 [host=debina1] 142904 [host=chardonnay1] 142862 [host=italia0] 142840 [host=pinot1] 142798 [host=huxelrebe0] 142761 [host=albana1] 142644 [host=italia1] 142584 [host=godello0] 142535 [host=huxelrebe1] 142476 [host=chardonnay0] 142427 ok.
Failure / basis pass flights: 143263 / 142427
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
Latest bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass 23605f58bfd5c47d0f6fbd2aa57a8bda15e720df 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 db1892238c55c5138801f131a837ccd0056f002e c530a75c1e6a472b0eb9558310b518f0dfcd8860 d19040804afb2bdd60f18e8aef7da78028575fe6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#23605f58bfd5c47d0f6fbd2aa57a8bda15e720df-bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/linux-pvops.git#db1892238c55c5138801f131a837ccd0056f002e\
 -b98aebd298246df37b472c52a2ee1023256d02e3 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#d19040804afb2bdd60f18e8aef7da78028575fe6-6996ec88a244a2428beb81d126ee55d152f62a07 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-9\
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
 142427 pass 23605f58bfd5c47d0f6fbd2aa57a8bda15e720df 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 db1892238c55c5138801f131a837ccd0056f002e c530a75c1e6a472b0eb9558310b518f0dfcd8860 d19040804afb2bdd60f18e8aef7da78028575fe6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142476 [host=chardonnay0]
 142535 [host=huxelrebe1]
 142584 [host=godello0]
 142644 [host=italia1]
 142761 [host=albana1]
 142840 [host=pinot1]
 142798 [host=huxelrebe0]
 142862 [host=italia0]
 142949 [host=debina1]
 142904 [host=chardonnay1]
 143023 [host=pinot0]
 143051 [host=elbling0]
 143085 []
 143140 fail irrelevant
 143189 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143218 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143261 pass 23605f58bfd5c47d0f6fbd2aa57a8bda15e720df 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 db1892238c55c5138801f131a837ccd0056f002e c530a75c1e6a472b0eb9558310b518f0dfcd8860 d19040804afb2bdd60f18e8aef7da78028575fe6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 143263 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143323 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143315 fail c7f8a66b220712727672a6a264e371d34f1d86e0 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143297 pass 71519d4638e30a7c4f59a9764a7a8e5e8f679eb3 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e797a806a8d090a09a782fe10ba2765154579d4b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143282 !! flight 143282 missing revision for libvirt_gnulib
!! flight 143282 missing revision for libvirt_keycodemapdb
 143303 pass 2825803477a54a337e194288ae6a8fd1c950957c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 46bb81200742fabfe5c5624c22e72f036af02869 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143318 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143306 blocked b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 703232b8e8889e908771b64e22b5ed94e403aa0a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143285 fail bf0e7bdeeb790bc6ba5732623be0d9ff26a5961a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6996ec88a244a2428beb81d126ee55d152f62a07 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143291 pass a7262a664d514b6d9f49c6e40b5a581b9bc271ec 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e132c8d7b58d8dc2c1888f5768454550d1f3ea7b c530a75c1e6a472b0eb9558310b518f0dfcd8860 a7e2d20193e853020a1415c25b53280955055394 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f fef8d99fbce1a5e7ddfd22b0f33940b8d6193ec8
 143321 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143307 fail 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143310 pass 71aadcd76435d00819e994357c7443665a653a65 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 46bb81200742fabfe5c5624c22e72f036af02869 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143332 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143313 pass 9cddc6e8ee9d9ce62dd20a6317c3148f4cd1c0e9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143334 pass c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143337 fail 18981877d2e20390a79d068861a24e716f8ee422 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 142427 (pass), for basis pass
 Result found: flight 143189 (fail), for basis failure
 Repro found: flight 143261 (pass), for basis pass
 Repro found: flight 143263 (fail), for basis failure
 0 revisions at c8007fdc5d2ce43fec2753cda60fb4963f55abd5 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c7006c9de4029afc508e2c43d78de12a0d19cfe d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143318 (pass), for last pass
 Result found: flight 143321 (fail), for first failure
 Repro found: flight 143323 (pass), for last pass
 Repro found: flight 143332 (fail), for first failure
 Repro found: flight 143334 (pass), for last pass
 Repro found: flight 143337 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  18981877d2e20390a79d068861a24e716f8ee422
  Bug not present: c8007fdc5d2ce43fec2753cda60fb4963f55abd5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143337/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.683229 to fit
pnmtopng: 62 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
143337: tolerable FAIL

flight 143337 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143337/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 12 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-xsm                                 fail    


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



--===============8647913125371102360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8647913125371102360==--
