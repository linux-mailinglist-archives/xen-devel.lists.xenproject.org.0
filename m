Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4083E142171
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 02:28:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itLo1-0003Jy-Jj; Mon, 20 Jan 2020 01:24:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l8ur=3J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1itLnz-0003Jt-PI
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 01:24:39 +0000
X-Inumbo-ID: 96356e62-3b23-11ea-9fd7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96356e62-3b23-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 01:24:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itLnh-0008JX-Fz; Mon, 20 Jan 2020 01:24:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itLnh-0005NX-7a; Mon, 20 Jan 2020 01:24:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1itLnh-0002ew-6b; Mon, 20 Jan 2020 01:24:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1itLnh-0002ew-6b@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Jan 2020 01:24:21 +0000
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
Content-Type: multipart/mixed; boundary="===============6272458389165206866=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6272458389165206866==
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
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146292/


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/146292.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 146240 fail [host=italia0] / 146182 [host=pinot1] 146156 [host=huxelrebe0] 146103 [host=pinot1] 146061 ok.
Failure / basis pass flights: 146240 / 146061
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Basis pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#7d608469621a3fda72dff2a89308e68cc9fb4c9a-2feaa925bba06e77be918bcbfab63bc8201c8f19 https://git.savannah.gnu.org/git/gnulib.git/#7d069378921bfa0d7c7198ea177aac0a2440016f-611869be9f1083e53305446d90a2909fc89914ef https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066be\
 b-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-2f4d068645c211e309812372cd0ac58c9024e93b git://xenbits.xen.org/xen.git#03bfe526ecadc86f31eda433b91dc90be0563919-03bfe526ecadc86f\
 31eda433b91dc90be0563919
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
Loaded 12534 nodes in revision graph
Searching for test results:
 146061 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146103 [host=pinot1]
 146182 [host=pinot1]
 146156 [host=huxelrebe0]
 146270 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146289 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146240 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146211 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146272 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146290 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146275 pass 662876723cdfb138ca31847fdb3a84bbe3cadea5 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146276 pass 9a7d618c7979edecab9d648049c15a2bb0ccda5f 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146291 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146278 pass 9bb3571f10880eb92e0d7b0bcc47ee862d969b90 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146282 fail c02e9621b950f9af024c7abed2eef1f70bdb47aa 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146279 pass aaf885e55241d97c087877ea28d1c6f71c7392a2 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146280 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146292 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146287 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Searching for interesting versions
 Result found: flight 146061 (pass), for basis pass
 Result found: flight 146211 (fail), for basis failure
 Repro found: flight 146270 (pass), for basis pass
 Repro found: flight 146272 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
No revisions left to test, checking graph state.
 Result found: flight 146280 (pass), for last pass
 Result found: flight 146287 (fail), for first failure
 Repro found: flight 146289 (pass), for last pass
 Repro found: flight 146290 (fail), for first failure
 Repro found: flight 146291 (pass), for last pass
 Repro found: flight 146292 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146292/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
146292: tolerable ALL FAIL

flight 146292 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/146292/

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



--===============6272458389165206866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6272458389165206866==--
