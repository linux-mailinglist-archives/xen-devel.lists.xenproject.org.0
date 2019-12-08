Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E251F116034
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 04:05:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idmo6-00005X-2S; Sun, 08 Dec 2019 03:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SHqC=Z6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1idmo4-00005S-GA
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 03:00:24 +0000
X-Inumbo-ID: df5a604a-1966-11ea-8660-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df5a604a-1966-11ea-8660-12813bfff9fa;
 Sun, 08 Dec 2019 03:00:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1idmo0-0003JM-Uw; Sun, 08 Dec 2019 03:00:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1idmo0-0002Nz-IB; Sun, 08 Dec 2019 03:00:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1idmo0-0006yF-HZ; Sun, 08 Dec 2019 03:00:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1idmo0-0006yF-HZ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Dec 2019 03:00:20 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-armhf-libvirt
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
Content-Type: multipart/mixed; boundary="===============6441157545263293826=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6441157545263293826==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Bug not present: bfe9f25b49827f02027b5a5e88226ce933e1bd7c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/144632/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build --summary-out=tmp/144632.bisection-summary --basis-template=144517 --blessings=real,real-bisect libvirt build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 144615 fail [host=cubietruck-gleizes] / 144517 ok.
Failure / basis pass flights: 144615 / 144517
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fda14dd7821d3e20b1416b90525242b7d4306fe9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 49054b6bb66d35484e92c65f27584c4283a60986 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 8359dde71826bfbcf04412bda001903f809571c9
Basis pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#d0d728c7c00fd3a62731e50c7bc646df323c0622-fda14dd7821d3e20b1416b90525242b7d4306fe9 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#4d613feee57ebd4680f3c23398a9b33723f29fd\
 6-49054b6bb66d35484e92c65f27584c4283a60986 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d-c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d git://xenbits.xen.org/xen.git#42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8-8359dde71826bfbcf04412bda001903f809571c9
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

Loaded 15001 nodes in revision graph
Searching for test results:
 144517 pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
 144526 fail irrelevant
 144625 fail 8215da927a8fe69c4f98e962adc7592978c5f72c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144580 [host=cubietruck-braque]
 144582 pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
 144584 [host=cubietruck-braque]
 144614 [host=cubietruck-braque]
 144621 fail 8b928bed0896b86603a0d92bbcfbe48ab24db1a7 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144585 [host=cubietruck-braque]
 144616 [host=cubietruck-braque]
 144615 fail fda14dd7821d3e20b1416b90525242b7d4306fe9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 49054b6bb66d35484e92c65f27584c4283a60986 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 8359dde71826bfbcf04412bda001903f809571c9
 144589 [host=cubietruck-braque]
 144617 [host=cubietruck-braque]
 144611 [host=cubietruck-braque]
 144622 pass 951bc5a0b1bcac5c9d8f9e0adeef9a761a95eb49 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d a5d847ed642072bca5f170f05a66ba824e80b292
 144626 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144612 [host=cubietruck-braque]
 144629 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144618 pass d0d728c7c00fd3a62731e50c7bc646df323c0622 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 4d613feee57ebd4680f3c23398a9b33723f29fd6 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 42c8cdc039d6dc7d6aea8008bb24622eaf4b7bc8
 144623 pass bba1ec3d37a8489cea114dc976b68ace73fa1d1f 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144620 fail fda14dd7821d3e20b1416b90525242b7d4306fe9 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 49054b6bb66d35484e92c65f27584c4283a60986 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 8359dde71826bfbcf04412bda001903f809571c9
 144627 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144624 pass df99aa311a33e87d45455f3ca831147a50bff353 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144628 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144632 fail c7f75bf04d07506bd4d9e862b9b38a1e423d88b6 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 144630 pass bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
Searching for interesting versions
 Result found: flight 144517 (pass), for basis pass
 Result found: flight 144615 (fail), for basis failure
 Repro found: flight 144618 (pass), for basis pass
 Repro found: flight 144620 (fail), for basis failure
 0 revisions at bfe9f25b49827f02027b5a5e88226ce933e1bd7c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
No revisions left to test, checking graph state.
 Result found: flight 144626 (pass), for last pass
 Result found: flight 144627 (fail), for first failure
 Repro found: flight 144628 (pass), for last pass
 Repro found: flight 144629 (fail), for first failure
 Repro found: flight 144630 (pass), for last pass
 Repro found: flight 144632 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  c7f75bf04d07506bd4d9e862b9b38a1e423d88b6
  Bug not present: bfe9f25b49827f02027b5a5e88226ce933e1bd7c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/144632/

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

Revision graph left in /home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
144632: tolerable ALL FAIL

flight 144632 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/144632/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf-libvirt                                          fail    


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



--===============6441157545263293826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6441157545263293826==--
