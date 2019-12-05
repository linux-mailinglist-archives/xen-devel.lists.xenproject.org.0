Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB19113FCC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:58:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icon9-00087l-DS; Thu, 05 Dec 2019 10:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h7HW=Z3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1icon8-00087C-2W
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:55:26 +0000
X-Inumbo-ID: ba27a08c-174d-11ea-99dd-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba27a08c-174d-11ea-99dd-bc764e2007e4;
 Thu, 05 Dec 2019 10:55:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1icon0-00055Q-G3; Thu, 05 Dec 2019 10:55:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1icon0-0007hn-8d; Thu, 05 Dec 2019 10:55:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1icon0-0002ir-7y; Thu, 05 Dec 2019 10:55:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1icon0-0002ir-7y@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Dec 2019 10:55:18 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-amd64-libvirt
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
Content-Type: multipart/mixed; boundary="===============8023786491844192221=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8023786491844192221==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Bug not present: bfe9f25b49827f02027b5a5e88226ce933e1bd7c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/144540/


  commit c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Oct 18 14:18:36 2019 +0100
  
      docs: introduce rst2html as a mandatory tool for building docs
      
      The rst2html tool is provided by python docutils, and as the name
      suggests, it converts RST documents into HTML.
      
      Basic rules are added for integrating RST docs into the website
      build process.
      
      This enables us to start writing docs on our website in RST format
      instead of HTML, without changing the rest of our website templating
      system away from XSLT yet.
      
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/144540.bisection-summary --basis-template=144517 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 144526 fail [host=godello0] / 144517 ok.
Failure / basis pass flights: 144526 / 144517
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 01bf0bafceb5fc9f12ddee23166ceafed9e951cf 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c9416efeef0d4a0554db01f3fd1cdaede14856d7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
Basis pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#d0d728c7c00fd3a62731e50c7bc646df323c0622-01bf0bafceb5fc9f12ddee23166ceafed9e951cf https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#4d613feee57ebd4680f3c23398a9b33723f29fd\
 6-c9416efeef0d4a0554db01f3fd1cdaede14856d7 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d-c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d git://xenbits.xen.org/xen.git#42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8-05de315b00bf2951\
 617b8ef28811b1f1f2dd5742
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

Loaded 15002 nodes in revision graph
Searching for test results:
 144517 pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
 144530 pass 74f270095a017b0e46657df305d042d9e8617f8a 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144526 fail 01bf0bafceb5fc9f12ddee23166ceafed9e951cf 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c9416efeef0d4a0554db01f3fd1cdaede14856d7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144528 pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
 144529 fail 01bf0bafceb5fc9f12ddee23166ceafed9e951cf 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c9416efeef0d4a0554db01f3fd1cdaede14856d7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144531 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144532 pass bba1ec3d37a8489cea114dc976b68ace73fa1d1f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144533 pass 504f83195709191fe417e2532919dc5c162ee141 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144534 pass df99aa311a33e87d45455f3ca831147a50bff353 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144535 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144536 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144537 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144538 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144539 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144540 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
Searching for interesting versions
 Result found: flight 144517 (pass), for basis pass
 Result found: flight 144526 (fail), for basis failure
 Repro found: flight 144528 (pass), for basis pass
 Repro found: flight 144529 (fail), for basis failure
 0 revisions at bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
No revisions left to test, checking graph state.
 Result found: flight 144535 (pass), for last pass
 Result found: flight 144536 (fail), for first failure
 Repro found: flight 144537 (pass), for last pass
 Repro found: flight 144538 (fail), for first failure
 Repro found: flight 144539 (pass), for last pass
 Repro found: flight 144540 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Bug not present: bfe9f25b49827f02027b5a5e88226ce933e1bd7c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/144540/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Oct 18 14:18:36 2019 +0100
  
      docs: introduce rst2html as a mandatory tool for building docs
      
      The rst2html tool is provided by python docutils, and as the name
      suggests, it converts RST documents into HTML.
      
      Basic rules are added for integrating RST docs into the website
      build process.
      
      This enables us to start writing docs on our website in RST format
      instead of HTML, without changing the rest of our website templating
      system away from XSLT yet.
      
      Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
144540: tolerable ALL FAIL

flight 144540 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/144540/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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



--===============8023786491844192221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8023786491844192221==--
