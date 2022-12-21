Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFD652B1E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 02:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467522.726584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7oJW-00011x-CZ; Wed, 21 Dec 2022 01:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467522.726584; Wed, 21 Dec 2022 01:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7oJW-0000yc-9A; Wed, 21 Dec 2022 01:54:34 +0000
Received: by outflank-mailman (input) for mailman id 467522;
 Wed, 21 Dec 2022 01:54:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7oJV-0000yS-K1; Wed, 21 Dec 2022 01:54:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7oJV-0001UD-G4; Wed, 21 Dec 2022 01:54:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7oJU-00072G-UR; Wed, 21 Dec 2022 01:54:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7oJU-00067L-Tv; Wed, 21 Dec 2022 01:54:32 +0000
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
	bh=iOs2vQWvwP6fvyK54ERSgfBLQoql3ymRrb9oDBmJyYM=; b=6BBxrlT0bwIYw7Z4xRna9CFrar
	SdUeQ3SLsJwkiJvVqOkXMzbur2on1hdAs9Rdd2yjU3EhrtDbFfU7DdJ+RRAngSZ1JwtidM/ieMcy3
	4rCiIq4oA5SP+1yX4SVZL6KDWQTwNLgcV2XiJ4wvrwEB8NjxiMDtRW8jC6RIYi6wRVoE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175419-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 175419: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    libvirt:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    libvirt:test-amd64-i386-libvirt-pair:host-install/dst_host(7):broken:regression
    libvirt:test-arm64-arm64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=4102acc608819b15658ca3e37ceca7c89efae16b
X-Osstest-Versions-That:
    libvirt=b271d6f3b0d70e8e7be22252bf25deebe8536d39
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 01:54:32 +0000

flight 175419 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175419/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 175306
 test-arm64-arm64-libvirt-qcow2 17 guest-start/debian.repeat fail REGR. vs. 175306

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175306
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175306
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175306
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 libvirt              4102acc608819b15658ca3e37ceca7c89efae16b
baseline version:
 libvirt              b271d6f3b0d70e8e7be22252bf25deebe8536d39

Last test of basis   175306  2022-12-16 04:21:45 Z    4 days
Testing same since   175419  2022-12-20 04:18:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ján Tomko <jtomko@redhat.com>
  Peter Krempa <pkrempa@redhat.com>

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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 broken  
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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

broken-job test-amd64-i386-libvirt-pair broken
broken-step test-amd64-i386-libvirt-pair host-install/dst_host(7)

Not pushing.

------------------------------------------------------------
commit 4102acc608819b15658ca3e37ceca7c89efae16b
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Dec 8 12:28:13 2022 +0100

    virSecretGetSecretString: Refactor cleanup
    
    Automatically free 'sec' and remove the 'cleanup' section and 'ret'
    variables.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit a754ee59d838c77f022ada1d05b34ae2fd296e8b
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Dec 8 12:27:23 2022 +0100

    datatypes: Register autoptr cleanup for virSecret
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 6d661329dd1c426c5a46c678cf2e71b4ef2647e8
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Fri Dec 9 16:49:12 2022 +0100

    virStorageBackendRBDOpenRADOSConn: Don't log the RBD key
    
    'virStorageBackendRBDRADOSConfSet' logs its arguments but it's also
    used to set the RBD secret/key.
    
    All the security theatre with securely erasing the string we do to fetch
    the secret would be quite pointless if we log it thus introduce
    virStorageBackendRBDRADOSConfSetQuiet and use it to avoid logging the
    password.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 7df6338f4df4b053bb5d969d1dc63da7057cbca3
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Dec 8 12:37:30 2022 +0100

    virCryptoEncryptDataAESgnutls: Properly initialize data structures
    
    The initialization vector is not optional thus we also don't need to
    check whether the caller passed it in. Additionally we can use c99
    initializers for the gnutls_datum_t structs.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 53e46e4cd67835c9dfcf1a20df74ae42e1450155
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Thu Dec 8 10:56:28 2022 +0100

    virCryptoEncryptDataAESgnutls: Don't secure erase gnutls_datum_t structs
    
    'gnutls_datum_t' simply holds pointers to the encryption key and its
    length. There's absolutely no point in securely erasing that.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit ac3614b5ad352817b9a2688ef114fda60a267d90
Author: Ján Tomko <jtomko@redhat.com>
Date:   Mon Oct 17 16:05:08 2022 +0200

    qemu: add tests for external swtpm
    
    Signed-off-by: Ján Tomko <jtomko@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit ad3f33a9921feebb064e6071649486ede31a3973
Author: Ján Tomko <jtomko@redhat.com>
Date:   Mon Oct 17 15:20:24 2022 +0200

    qemu: add external backend for tpm
    
    Introduce a new backend type 'external' for connecting to a swtpm daemon
    not managed by libvirtd.
    
    Mostly in one commit, thanks to -Wswitch and the way we generate
    capabilities.
    
    https://bugzilla.redhat.com/show_bug.cgi?id=2063723
    
    Signed-off-by: Ján Tomko <jtomko@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 443eb2330d780adb5d90728012defba3c83620be
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Mon Nov 28 09:18:24 2022 +0100

    tests: qemucapabilitiesdata: Final update of qemu-7.2 capabilities on x86
    
    QEMU 7.2 was released, update the capabilities data to the final state.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

