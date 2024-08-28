Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450639631C2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 22:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785138.1194549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjPF1-0006DU-M2; Wed, 28 Aug 2024 20:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785138.1194549; Wed, 28 Aug 2024 20:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjPF1-0006BU-IK; Wed, 28 Aug 2024 20:26:07 +0000
Received: by outflank-mailman (input) for mailman id 785138;
 Wed, 28 Aug 2024 20:26:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjPEz-0006BG-NB; Wed, 28 Aug 2024 20:26:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjPEz-0001xe-B4; Wed, 28 Aug 2024 20:26:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjPEy-0002VV-Uq; Wed, 28 Aug 2024 20:26:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjPEy-0007PA-U7; Wed, 28 Aug 2024 20:26:04 +0000
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
	bh=id0QFhGk6Y1Qtoygn/1HFeXjt8ulcDbgmV25xTF4syc=; b=NdNtAR/flM77MKxSWROHtm/BU8
	tGpB9X+3E0hDx16JdiQzlgTgyGdNHDV4KTmM3JMihVIdlolW2HeLaLK6MDlSjAtKPrkztYyjShpzY
	+AtbTX0pS0zxk7MheMWRlaKgQhjVH1ngmGFHSyI35Cj9pFqzfcyBB+NL4NcgcfCNCPU0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187376-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187376: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=86987d84b968b69a610fd00ab9006c13db193b4e
X-Osstest-Versions-That:
    linux=3ec3f5fc4a91e389ea56b111a73d97ffc94f19c6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 20:26:04 +0000

flight 187376 linux-linus real [real]
flight 187385 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187376/
http://logs.test-lab.xenproject.org/osstest/logs/187385/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw      12 debian-di-install        fail REGR. vs. 187366

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187366
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187366
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187366
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187366
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187366
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187366
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                86987d84b968b69a610fd00ab9006c13db193b4e
baseline version:
 linux                3ec3f5fc4a91e389ea56b111a73d97ffc94f19c6

Last test of basis   187366  2024-08-27 18:40:54 Z    1 days
Testing same since   187376  2024-08-28 05:42:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Howells <dhowells@redhat.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Metzmacher <metze@samba.org>
  Steve French <stfrench@microsoft.com>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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


Not pushing.

------------------------------------------------------------
commit 86987d84b968b69a610fd00ab9006c13db193b4e
Merge: 46d22bfdf0bc 416871f4fb84
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Aug 28 15:05:02 2024 +1200

    Merge tag 'v6.11-rc5-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
    
    Pull smb client fixes from Steve French:
    
     - two RDMA/smbdirect fixes and a minor cleanup
    
     - punch hole fix
    
    * tag 'v6.11-rc5-client-fixes' of git://git.samba.org/sfrench/cifs-2.6:
      cifs: Fix FALLOC_FL_PUNCH_HOLE support
      smb/client: fix rdma usage in smb2_async_writev()
      smb/client: remove unused rq_iter_size from struct smb_rqst
      smb/client: avoid dereferencing rdata=NULL in smb2_new_read_req()

commit 46d22bfdf0bc76429f596c58ca74a8f67d0f6251
Merge: 3ec3f5fc4a91 08d08e2e9f0a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Aug 28 14:55:48 2024 +1200

    Merge tag 'tpmdd-next-6.11-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd
    
    Pull TPM fix from Jarkko Sakkinen:
     "A bug fix for tpm_ibmvtpm driver so that it will take the bus
      encryption into use"
    
    * tag 'tpmdd-next-6.11-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd:
      tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support

commit 08d08e2e9f0ad1af0044e4747723f66677c35ee9
Author: Stefan Berger <stefanb@linux.ibm.com>
Date:   Mon Jul 29 09:29:34 2024 -0400

    tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support
    
    Commit d2add27cf2b8 ("tpm: Add NULL primary creation") introduced
    CONFIG_TCG_TPM2_HMAC. When this option is enabled on ppc64 then the
    following message appears in the kernel log due to a missing call to
    tpm2_sessions_init().
    
    [    2.654549] tpm tpm0: auth session is not active
    
    Add the missing call to tpm2_session_init() to the ibmvtpm driver to
    resolve this issue.
    
    Cc: stable@vger.kernel.org # v6.10+
    Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
    Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

commit 416871f4fb84bc96822562e654941d5625a25bf8
Author: David Howells <dhowells@redhat.com>
Date:   Fri Aug 23 14:22:42 2024 +0100

    cifs: Fix FALLOC_FL_PUNCH_HOLE support
    
    The cifs filesystem doesn't quite emulate FALLOC_FL_PUNCH_HOLE correctly
    (note that due to lack of protocol support, it can't actually implement it
    directly).  Whilst it will (partially) invalidate dirty folios in the
    pagecache, it doesn't write them back first, and so the EOF marker on the
    server may be lower than inode->i_size.
    
    This presents a problem, however, as if the punched hole invalidates the
    tail of the locally cached dirty data, writeback won't know it needs to
    move the EOF over to account for the hole punch (which isn't supposed to
    move the EOF).  We could just write zeroes over the punched out region of
    the pagecache and write that back - but this is supposed to be a
    deallocatory operation.
    
    Fix this by manually moving the EOF over on the server after the operation
    if the hole punched would corrupt it.
    
    Note that the FSCTL_SET_ZERO_DATA RPC and the setting of the EOF should
    probably be compounded to stop a third party interfering (or, at least,
    massively reduce the chance).
    
    This was reproducible occasionally by using fsx with the following script:
    
            truncate 0x0 0x375e2 0x0
            punch_hole 0x2f6d3 0x6ab5 0x375e2
            truncate 0x0 0x3a71f 0x375e2
            mapread 0xee05 0xcf12 0x3a71f
            write 0x2078e 0x5604 0x3a71f
            write 0x3ebdf 0x1421 0x3a71f *
            punch_hole 0x379d0 0x8630 0x40000 *
            mapread 0x2aaa2 0x85b 0x40000
            fallocate 0x1b401 0x9ada 0x40000
            read 0x15f2 0x7d32 0x40000
            read 0x32f37 0x7a3b 0x40000 *
    
    The second "write" should extend the EOF to 0x40000, and the "punch_hole"
    should operate inside of that - but that depends on whether the VM gets in
    and writes back the data first.  If it doesn't, the file ends up 0x3a71f in
    size, not 0x40000.
    
    Fixes: 31742c5a3317 ("enable fallocate punch hole ("fallocate -p") for SMB3")
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Steve French <sfrench@samba.org>
    cc: Paulo Alcantara <pc@manguebit.com>
    cc: Shyam Prasad N <nspmangalore@gmail.com>
    cc: Jeff Layton <jlayton@kernel.org>
    cc: linux-cifs@vger.kernel.org
    cc: netfs@lists.linux.dev
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit 017d1701743657fbfaea74397727a9d2b81846b7
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Aug 21 16:31:39 2024 +0200

    smb/client: fix rdma usage in smb2_async_writev()
    
    rqst.rq_iter needs to be truncated otherwise we'll
    also send the bytes into the stream socket...
    
    This is the logic behind rqst.rq_npages = 0, which was removed in
    "cifs: Change the I/O paths to use an iterator rather than a page list"
    (d08089f649a0cfb2099c8551ac47eef0cc23fdf2).
    
    Cc: stable@vger.kernel.org
    Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rather than a page list")
    Reviewed-by: David Howells <dhowells@redhat.com>
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit b608e2c318789aeba49055747166e13bee57df4a
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Aug 21 15:59:12 2024 +0200

    smb/client: remove unused rq_iter_size from struct smb_rqst
    
    Reviewed-by: David Howells <dhowells@redhat.com>
    Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rather than a page list")
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit c724b2ab6a46435b4e7d58ad2fbbdb7a318823cf
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Aug 21 17:18:23 2024 +0200

    smb/client: avoid dereferencing rdata=NULL in smb2_new_read_req()
    
    This happens when called from SMB2_read() while using rdma
    and reaching the rdma_readwrite_threshold.
    
    Cc: stable@vger.kernel.org
    Fixes: a6559cc1d35d ("cifs: split out smb3_use_rdma_offload() helper")
    Reviewed-by: David Howells <dhowells@redhat.com>
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

