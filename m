Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739735FBF78
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 05:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420584.665526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiSEZ-0000oL-UP; Wed, 12 Oct 2022 03:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420584.665526; Wed, 12 Oct 2022 03:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiSEZ-0000lC-QA; Wed, 12 Oct 2022 03:16:39 +0000
Received: by outflank-mailman (input) for mailman id 420584;
 Wed, 12 Oct 2022 03:16:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiSEY-0000l2-S3; Wed, 12 Oct 2022 03:16:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiSEY-0002Jh-J6; Wed, 12 Oct 2022 03:16:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiSEY-0006aQ-8w; Wed, 12 Oct 2022 03:16:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oiSEY-000523-8U; Wed, 12 Oct 2022 03:16:38 +0000
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
	bh=uW2Qp09ZZqQ1F7Q6Jv1iieBPL/vpkSGYzBX24iF6nsQ=; b=wmmees3AAOkAcsS49SgAFF1lOi
	16XQJe2IZoFLYbwxT8wG0p2YgD4miiqeH+BW3EK49Zai0beg3U9sXOrn1v9Mi/l0b9PYxoBLehRpF
	vAk6CP8EJKUQwFrAHFl26hRucQ1Yq4Ijn1fgiYY66GfQbbe2PCIvYI2KxCY7B1tFjrw8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173497-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 173497: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:build-arm64-pvops:kernel-build:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=42e1e350bffc8d4614e568a03380b2ec34a131bf
X-Osstest-Versions-That:
    qemuu=f1d33f55c47dfdaf8daacd618588ad3ae4c452d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 03:16:38 +0000

flight 173497 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173497/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 173447
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 173447

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173447
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173447
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173447
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 173447
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173447
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173447
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 173447
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173447
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                42e1e350bffc8d4614e568a03380b2ec34a131bf
baseline version:
 qemuu                f1d33f55c47dfdaf8daacd618588ad3ae4c452d1

Last test of basis   173447  2022-10-06 14:38:42 Z    5 days
Testing same since   173497  2022-10-11 15:38:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel Henrique Barboza <danielhb413@gmail.com>
  David Hildenbrand <david@redhat.com>
  Janosch Frank <frankja@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Stefan Hajnoczi <stefanha@redhat.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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
commit 42e1e350bffc8d4614e568a03380b2ec34a131bf
Merge: f1d33f55c4 94d788408d
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Tue Oct 11 09:31:19 2022 -0400

    Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging
    
    dump patches
    
    Hi
    
    Includes:
    - the first patches from "[PATCH v5 00/18] dump: Add arch section and s390x PV dump"
    - "[PATCH v2 0/2] Fix dumping in kdump format with non-aligned memory"
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQJQBAABCAA6FiEEh6m9kz+HxgbSdvYt2ujhCXWWnOUFAmM+9UocHG1hcmNhbmRy
    # ZS5sdXJlYXVAcmVkaGF0LmNvbQAKCRDa6OEJdZac5aoMD/0eya5IqxX0ke9jjUcB
    # wWhRbsVdiO9yt2oN3gsQVkUtuK98p7/JpWSKHWXsQQjd7vIYPCj8RBHXZ4Cp71+S
    # n+Db/K22fmWvuP0LtCNzYujq1ZxKdQI8KdKmYwHQdGkgy85QwYO+0SgpVgLjRd/2
    # 1IWzHuzIcEmraxkSLvR8N0lmz/Z2CBc7ME5izO1mHSZrs8Ria2tDpXnz5rFxPy+q
    # TDqo+LP0GIapoHbbE+6JWGL2u9mLiP0sg9SclZOPZG3CsPQ5XYEStyZcLw1YYIO1
    # rruom463SbP4NJHIRspC8pADFI+d4uBamj/eUu8/9CUVqetk0UpKyXWiqgEDvmkO
    # /2/yFYS60gEghvd3XVnuZnTNeRSDSE1aUXUmKdGqDjYL4DYcsehIQ9z8ut/tuYIO
    # D+4RuiuCmEyznV/DDecnwHhrv9jWftNwdwjW5GAniEjDBp/DtoouAeMArQw9rE1Z
    # mXqTa5NaeW69VTtzxzN25GzSAjiEzFT7UFRt3bT8fb0NX+UOkluD/agBqRIM5lzh
    # KbUJjqWhqA6TnHtDekbNLlmocDCn+NeBeXxDUIa19C4LICCuuxbFU+MG7cvdjSEg
    # sXRB6/qAdWgv4O3zGw1SHff+qmvtHjKVj0ihrNkrrYrL+31O2splqTMeaCqGdq9C
    # elE/TAS46CcMUSYuWzxy6mAMmA==
    # =O9tr
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Thu 06 Oct 2022 11:33:30 EDT
    # gpg:                using RSA key 87A9BD933F87C606D276F62DDAE8E10975969CE5
    # gpg:                issuer "marcandre.lureau@redhat.com"
    # gpg: Good signature from "Marc-André Lureau <marcandre.lureau@redhat.com>" [full]
    # gpg:                 aka "Marc-André Lureau <marcandre.lureau@gmail.com>" [full]
    # Primary key fingerprint: 87A9 BD93 3F87 C606 D276  F62D DAE8 E109 7596 9CE5
    
    * tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu:
      dump: fix kdump to work over non-aligned blocks
      dump: simplify a bit kdump get_next_page()
      dump: Rename write_elf*_phdr_note to prepare_elf*_phdr_note
      dump: Split elf header functions into prepare and write
      dump: Rework dump_calculate_size function
      dump: Rework filter area variables
      dump: Rework get_start_block
      dump: Refactor dump_iterate and introduce dump_filter_memblock_*()
      dump: Rename write_elf_loads to write_elf_phdr_loads
      dump: Replace opaque DumpState pointer with a typed one
    
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 94d788408d2d5a6474c99b2c9cf06913b9db7c58
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Mon Sep 5 16:06:21 2022 +0400

    dump: fix kdump to work over non-aligned blocks
    
    Rewrite get_next_page() to work over non-aligned blocks. When it
    encounters non aligned addresses, it will try to fill a page provided by
    the caller.
    
    This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
    qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
    uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
    ~target_page_mask) == 0' failed.
    
    because:
    guest_phys_block_add_section: target_start=00000000fed40080 target_end=00000000fed41000: added (count: 4)
    
    Fixes:
    https://bugzilla.redhat.com/show_bug.cgi?id=2120480
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Acked-by: David Hildenbrand <david@redhat.com>

commit 08df343874fcddd260021a04ce3c5a34f2c48164
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Thu Aug 25 12:40:12 2022 +0400

    dump: simplify a bit kdump get_next_page()
    
    This should be functionally equivalent, but slightly easier to read,
    with simplified paths and checks at the end of the function.
    
    The following patch is a major rewrite to get rid of the assert().
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: David Hildenbrand <david@redhat.com>

commit 2341a94d3a0a8a93a5a977e642da1807b8edaab8
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:11:01 2022 +0000

    dump: Rename write_elf*_phdr_note to prepare_elf*_phdr_note
    
    The functions in question do not actually write to the file descriptor
    they set up a buffer which is later written to the fd.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220811121111.9878-9-frankja@linux.ibm.com>

commit 670e76998a61ca171200fcded3865b294a2d1243
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:11:00 2022 +0000

    dump: Split elf header functions into prepare and write
    
    Let's split the write from the modification of the elf header so we
    can consolidate the write of the data in one function.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220811121111.9878-8-frankja@linux.ibm.com>

commit c370d5300f9ac1f90f8158082d22262b904fe30e
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:59 2022 +0000

    dump: Rework dump_calculate_size function
    
    dump_calculate_size() sums up all the sizes of the guest memory
    blocks. Since we already have a function that calculates the size of a
    single memory block (dump_get_memblock_size()) we can simply iterate
    over the blocks and use the function instead of calculating the size
    ourselves.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Message-Id: <20220811121111.9878-7-frankja@linux.ibm.com>

commit dddf725f70bfe7f5adb41fa31dbd06e767271bda
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:58 2022 +0000

    dump: Rework filter area variables
    
    While the DumpState begin and length variables directly mirror the API
    variable names they are not very descriptive. So let's add a
    "filter_area_" prefix and make has_filter a function checking length > 0.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220811121111.9878-6-frankja@linux.ibm.com>

commit 0c2994ac9009577b967529ce18e269da5b280351
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:57 2022 +0000

    dump: Rework get_start_block
    
    get_start_block() returns the start address of the first memory block
    or -1.
    
    With the GuestPhysBlock iterator conversion we don't need to set the
    start address and can therefore remove that code and the "start"
    DumpState struct member. The only functionality left is the validation
    of the start block so it only makes sense to re-name the function to
    validate_start_block()
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Message-Id: <20220811121111.9878-5-frankja@linux.ibm.com>

commit 1e8113032f5b1efc5da66382470ce4809c76f8f2
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:56 2022 +0000

    dump: Refactor dump_iterate and introduce dump_filter_memblock_*()
    
    The iteration over the memblocks in dump_iterate() is hard to
    understand so it's about time to clean it up. Instead of manually
    grabbing the next memblock we can use QTAILQ_FOREACH to iterate over
    all memblocks.
    
    Additionally we move the calculation of the offset and length out by
    introducing and using the dump_filter_memblock_*() functions. These
    functions will later be used to cleanup other parts of dump.c.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220811121111.9878-4-frankja@linux.ibm.com>

commit afae6056ea79e2d89fd90867de3a01732eae724f
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:55 2022 +0000

    dump: Rename write_elf_loads to write_elf_phdr_loads
    
    Let's make it a bit clearer that we write the program headers of the
    PT_LOAD type.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
    Reviewed-by: Steffen Eiden <seiden@ibm.linux.com>
    Message-Id: <20220811121111.9878-3-frankja@linux.ibm.com>

commit 1af0006ab959864dfa2f59e9136c5fb93000b61f
Author: Janosch Frank <frankja@linux.ibm.com>
Date:   Thu Aug 11 12:10:54 2022 +0000

    dump: Replace opaque DumpState pointer with a typed one
    
    It's always better to convey the type of a pointer if at all
    possible. So let's add the DumpState typedef to typedefs.h and move
    the dump note functions from the opaque pointers to DumpState
    pointers.
    
    Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
    CC: Peter Maydell <peter.maydell@linaro.org>
    CC: Cédric Le Goater <clg@kaod.org>
    CC: Daniel Henrique Barboza <danielhb413@gmail.com>
    CC: David Gibson <david@gibson.dropbear.id.au>
    CC: Greg Kurz <groug@kaod.org>
    CC: Palmer Dabbelt <palmer@dabbelt.com>
    CC: Alistair Francis <alistair.francis@wdc.com>
    CC: Bin Meng <bin.meng@windriver.com>
    CC: Cornelia Huck <cohuck@redhat.com>
    CC: Thomas Huth <thuth@redhat.com>
    CC: Richard Henderson <richard.henderson@linaro.org>
    CC: David Hildenbrand <david@redhat.com>
    Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-Id: <20220811121111.9878-2-frankja@linux.ibm.com>

