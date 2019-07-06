Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1D60FB2
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 11:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjhNk-000775-Rk; Sat, 06 Jul 2019 09:53:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j5Tn=VD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hjhNj-00076t-Gg
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 09:53:23 +0000
X-Inumbo-ID: e18b960c-9fd3-11e9-adea-d70d249eda86
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e18b960c-9fd3-11e9-adea-d70d249eda86;
 Sat, 06 Jul 2019 09:53:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hjhNd-00072b-Rt; Sat, 06 Jul 2019 09:53:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hjhNd-0000JM-He; Sat, 06 Jul 2019 09:53:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hjhNd-00079H-H4; Sat, 06 Jul 2019 09:53:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hjhNd-00079H-H4@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jul 2019 09:53:17 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-i386-libvirt
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
Content-Type: multipart/mixed; boundary="===============2273248078581717108=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2273248078581717108==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
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
  Bug introduced:  86fbce56f27e06b34d63879c9f634a58a1e0a04a
  Bug not present: 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138788/


  commit 86fbce56f27e06b34d63879c9f634a58a1e0a04a
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Jul 3 18:27:29 2019 +0100
  
      remote: remove unused constant for libvirtd config file
      
      The LIBVIRTD_CONFIGURATION_FILE constant was introduced in
      
        commit b7c42619e69acd8416be88b8aa3b4161bc813f8a
        Author: Richard W.M. Jones <rjones@redhat.com>
        Date:   Mon Jun 11 11:43:41 2007 +0000
      
          Mon Jun 11 12:41:00 BST 2007 Richard W.M. Jones <rjones@redhat.com>
      
      and then never used !
      
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/138788.bisection-summary --basis-template=138618 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 138746 fail [host=albana1] / 138718 [host=italia0] 138695 [host=baroque1] 138618 [host=italia0] 138596 ok.
Failure / basis pass flights: 138746 / 138596
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
Basis pass bd17012f0c2a689c814923e5c7c61b278e9636d6 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#bd17012f0c2a689c814923e5c7c61b278e9636d6-86fbce56f27e06b34d63879c9f634a58a1e0a04a https://git.savannah.gnu.org/git/gnulib.git/#8089c00979a5b089cff592c6b91420e595657167-8089c00979a5b089cff592c6b91420e595657167 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#51f7a3e6c5192d3f9a0fa63b0b5617c151180ad\
 7-4286eb22f4aec33b90574b998a31f8bd34dd4f47 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#9cca02d8ffc23e9688a971d858e4ffdff5389b11-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/osstest/seabios.git#6e56ed129c9782ba050a5fbfbf4ac12335b230f7-30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 git://xenbits.xen.org/xen.git#85fd4f7a09d8aaa783932b8c15b80ddaff0a174d-93ef224d63f9f04a\
 0897d64981c619eb4816c0d3
Loaded 4001 nodes in revision graph
Searching for test results:
 138618 [host=italia0]
 138596 pass bd17012f0c2a689c814923e5c7c61b278e9636d6 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138695 [host=baroque1]
 138746 fail 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138718 [host=italia0]
 138781 pass 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138783 fail 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138784 pass 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138785 fail 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138786 pass 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138788 fail 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138767 pass bd17012f0c2a689c814923e5c7c61b278e9636d6 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138771 fail 86fbce56f27e06b34d63879c9f634a58a1e0a04a 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138773 pass d40f7b6bac0a9398c5b5d67b6641bddc0edb44e5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3f0829b341618b12d69874ff676d9f720a32f3c d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 cc07ec6107d23ee9a4237686711eede387741c08
 138774 pass 86e43ded42105ab059644a8b88b6301c0bb64b99 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138775 pass 50dfabbb59ae830b77ddde4feb75e9883d92b2d5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138776 pass b0ea31af5272248ec7ae922f45623067b8f7fac6 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138777 pass 5a050f019104b0775350f8b5d61694e9466ba303 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138778 pass 2936c36747b51f44c07a996de05ac102f0461457 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
 138779 pass bc282e90756c3e0160a54d6f1df6c5c66b4a1940 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
Searching for interesting versions
 Result found: flight 138596 (pass), for basis pass
 Result found: flight 138746 (fail), for basis failure
 Repro found: flight 138767 (pass), for basis pass
 Repro found: flight 138771 (fail), for basis failure
 0 revisions at 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 4286eb22f4aec33b90574b998a31f8bd34dd4f47 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 93ef224d63f9f04a0897d64981c619eb4816c0d3
No revisions left to test, checking graph state.
 Result found: flight 138781 (pass), for last pass
 Result found: flight 138783 (fail), for first failure
 Repro found: flight 138784 (pass), for last pass
 Repro found: flight 138785 (fail), for first failure
 Repro found: flight 138786 (pass), for last pass
 Repro found: flight 138788 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  86fbce56f27e06b34d63879c9f634a58a1e0a04a
  Bug not present: 07e4d5145db93359c8f4da120ed6a6b6eb6c06f5
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138788/


  commit 86fbce56f27e06b34d63879c9f634a58a1e0a04a
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Jul 3 18:27:29 2019 +0100
  
      remote: remove unused constant for libvirtd config file
      
      The LIBVIRTD_CONFIGURATION_FILE constant was introduced in
      
        commit b7c42619e69acd8416be88b8aa3b4161bc813f8a
        Author: Richard W.M. Jones <rjones@redhat.com>
        Date:   Mon Jun 11 11:43:41 2007 +0000
      
          Mon Jun 11 12:41:00 BST 2007 Richard W.M. Jones <rjones@redhat.com>
      
      and then never used !
      
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
138788: tolerable ALL FAIL

flight 138788 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138788/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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



--===============2273248078581717108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2273248078581717108==--
