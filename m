Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51019168D3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747698.1155163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6F0-0000UY-Gt; Tue, 25 Jun 2024 13:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747698.1155163; Tue, 25 Jun 2024 13:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6F0-0000Rd-Dy; Tue, 25 Jun 2024 13:29:46 +0000
Received: by outflank-mailman (input) for mailman id 747698;
 Tue, 25 Jun 2024 13:29:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM6Ey-0000RT-JP; Tue, 25 Jun 2024 13:29:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM6Ey-0005IF-Dv; Tue, 25 Jun 2024 13:29:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM6Ex-0005lv-Vf; Tue, 25 Jun 2024 13:29:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sM6Ex-000436-UJ; Tue, 25 Jun 2024 13:29:43 +0000
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
	bh=BonLUIyqgKMG5sbVQPzcMXjLZWEbV7YNPSnETCU7QD0=; b=6iID9MIlEfhBWhbY7jLa4s4ONs
	m008EN7j5ywiMmlqmTTkdutCwPVFrm76x8B+xQ9+uId2hbq79LJCI6xEt76RZFgm9juXvqJU/iUrx
	YdumI0itlxtfgL/oVlSdojwOsElB8DJ57WPF8SRGiXHvnbmexUDj0OId0THXD8oHhgOg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186475-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 186475: trouble: broken/pass
X-Osstest-Failures:
    libvirt:test-armhf-armhf-libvirt:<job status>:broken:regression
    libvirt:test-armhf-armhf-libvirt:host-install(5):broken:regression
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=ba6cd2d5a8dc785cd56a074a4d088316cc1b678b
X-Osstest-Versions-That:
    libvirt=43a0881274e632dc44fff9320357dc8bf31e4826
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 13:29:43 +0000

flight 186475 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186475/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt      5 host-install(5)        broken REGR. vs. 186451

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              ba6cd2d5a8dc785cd56a074a4d088316cc1b678b
baseline version:
 libvirt              43a0881274e632dc44fff9320357dc8bf31e4826

Last test of basis   186451  2024-06-22 04:20:26 Z    3 days
Testing same since   186475  2024-06-25 04:20:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Julis <ajulis@redhat.com>
  Göran Uddeborg <goeran@uddeborg.se>
  Jonathon Jongsma <jjongsma@redhat.com>
  Laine Stump <laine@redhat.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    


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

broken-job test-armhf-armhf-libvirt broken
broken-step test-armhf-armhf-libvirt host-install(5)

Not pushing.

------------------------------------------------------------
commit ba6cd2d5a8dc785cd56a074a4d088316cc1b678b
Author: Göran Uddeborg <goeran@uddeborg.se>
Date:   Mon Jun 24 14:47:17 2024 +0200

    Translated using Weblate (Swedish)
    
    Currently translated at 77.1% (8062 of 10454 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Translated using Weblate (Swedish)
    
    Currently translated at 76.9% (8042 of 10454 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Co-authored-by: Göran Uddeborg <goeran@uddeborg.se>
    Signed-off-by: Göran Uddeborg <goeran@uddeborg.se>

commit af437d2d64cd39dac437e849156592128a8ceb28
Author: Jonathon Jongsma <jjongsma@redhat.com>
Date:   Wed Jun 12 12:18:49 2024 -0500

    qemu: Don't specify vfio-pci.ramfb when ramfb is false
    
    Commit 7c8e606b64c73ca56d7134cb16d01257f39c53ef attempted to fix
    the specification of the ramfb property for vfio-pci devices, but it
    failed when ramfb is explicitly set to 'off'. This is because only the
    'vfio-pci-nohotplug' device supports the 'ramfb' property. Since we use
    the base 'vfio-pci' device unless ramfb is enabled, attempting to set
    the 'ramfb' parameter to 'off' this will result in an error like the
    following:
    
      error: internal error: QEMU unexpectedly closed the monitor
      (vm='rhel'): 2024-06-06T04:43:22.896795Z qemu-kvm: -device
      {"driver":"vfio-pci","host":"0000:b1:00.4","id":"hostdev0","display":"on
      ","ramfb":false,"bus":"pci.7","addr":"0x0"}: Property 'vfio-pci.ramfb'
      not found.
    
    This also more closely matches what is done for mdev devices.
    
    Resolves: https://issues.redhat.com/browse/RHEL-28808
    
    Signed-off-by: Jonathon Jongsma <jjongsma@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 397c0f4b01ae1b24806a145ffbd31a9a49126ae3
Author: Laine Stump <laine@redhat.com>
Date:   Fri Jun 21 08:17:58 2024 -0400

    network: add more firewall test cases
    
    This patch adds some previously missing test cases that test for
    proper firewall rule creation when the following are included in the
    network definition:
    
    * <forward dev='blah'>
    * no forward element (an "isolated" network)
    * nat port range when only ipv4 is nat-ed
    * nat port range when both ipv4 & ipv6 are nated
    
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Laine Stump <laine@redhat.com>

commit aabf279ca07d9d5c3d2e6d4efd7d4c5bc2dd471e
Author: Laine Stump <laine@redhat.com>
Date:   Wed Jun 12 15:25:46 2024 -0400

    tests: fix broken nftables test data so that individual tests are successful
    
    When the chain names and table name used by the nftables firewall
    backend were changed in commit
    958aa7f274904eb8e4678a43eac845044f0dcc38, I forgot to change the test
    data file base.nftables, which has the extra "list" and "add
    chain/table" commands that are generated for the first test case of
    networkxml2firewalltest.c. When the full set of tests is run, the
    first test will be an iptables test case, so those extra commands
    won't be added to any of the nftables cases, and so the data in
    base.nftables never matches, and the tests are all successful.
    
    However, if the test are limited with, e.g. VIR_TEST_RANGE=2 (test #2
    will be the nftables version of the 1st test case), then the commands
    to add nftables table/chains *will* be generated in the test output,
    and so the test will fail. Because I was only running the entire test
    series after the initial commits of nftables tests, I didn't notice
    this. Until now.
    
    base.nftables has now been updated to reflect the current names for
    chains/table, and running individual test cases is once again
    successful.
    
    Fixes: 958aa7f274904eb8e4678a43eac845044f0dcc38
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Laine Stump <laine@redhat.com>

commit 3a9095976e1060f95a8a4a985d5e9901e1098547
Author: Adam Julis <ajulis@redhat.com>
Date:   Fri Jun 21 18:16:55 2024 +0200

    qemuDomainDiskChangeSupported: Fill in missing check
    
    The attribute 'discard_no_unref' of <disk/> is not allowed to be
    changed while the virtual machine is running.
    
    Resolves: https://issues.redhat.com/browse/RHEL-37542
    Signed-off-by: Adam Julis <ajulis@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

