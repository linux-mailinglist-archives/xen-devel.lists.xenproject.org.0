Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4E1D38FA
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 20:15:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZINy-0008PT-Kh; Thu, 14 May 2020 18:15:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v3kr=64=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jZINx-0008PO-2P
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 18:15:09 +0000
X-Inumbo-ID: d3d61c30-960e-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3d61c30-960e-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PIKMOuxL9SSLD6R0u4KMQWcfjFCF/dLKVS9lJpD+inw=; b=apnyCciaBWASn4dNPUmMBioye
 GZQ/9Vj5+n3fKcujaaNJQSi/4iulmmesqX93sc7IK9BCwjIcWS+/wTK2W5sbX+09Qyl/80GviJD3n
 sSQB3a1qio5CadI/+HTVO64n2PUQ27w8pYhlMuf+jJj3+uCfIrD/0GpmeWfc7I0pX4jl8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZINp-0006Q4-En; Thu, 14 May 2020 18:15:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZINp-0004SS-3m; Thu, 14 May 2020 18:15:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jZINp-0002Og-39; Thu, 14 May 2020 18:15:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150174-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150174: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=d8f9d57dbd0caf225c47f12e9faea9180e79fe2a
X-Osstest-Versions-That: qemuu=d5c75ec500d96f1d93447f990cd5a4ef5ba27fae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 May 2020 18:15:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150174 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150174/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-vhd       7 xen-boot                 fail REGR. vs. 150151

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10  fail blocked in 150151
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150151
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150151
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150151
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150151
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150151
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass

version targeted for testing:
 qemuu                d8f9d57dbd0caf225c47f12e9faea9180e79fe2a
baseline version:
 qemuu                d5c75ec500d96f1d93447f990cd5a4ef5ba27fae

Last test of basis   150151  2020-05-12 19:38:05 Z    1 days
Testing same since   150174  2020-05-14 10:06:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Denis Plotnikov <dplotnikov@virtuozzo.com>
  Markus Armbruster <armbru@redhat.com>
  Max Reitz <mreitz@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


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
commit d8f9d57dbd0caf225c47f12e9faea9180e79fe2a
Merge: d5c75ec500 fc9aefc8c0
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed May 13 15:35:32 2020 +0100

    Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2020-05-13' into staging
    
    Block patches:
    - zstd compression for qcow2
    - Fix use-after-free
    
    # gpg: Signature made Wed 13 May 2020 15:14:06 BST
    # gpg:                using RSA key 91BEB60A30DB3E8857D11829F407DB0061D5CF40
    # gpg:                issuer "mreitz@redhat.com"
    # gpg: Good signature from "Max Reitz <mreitz@redhat.com>" [full]
    # Primary key fingerprint: 91BE B60A 30DB 3E88 57D1  1829 F407 DB00 61D5 CF40
    
    * remotes/maxreitz/tags/pull-block-2020-05-13:
      block/block-copy: fix use-after-free of task pointer
      iotests: 287: add qcow2 compression type test
      qcow2: add zstd cluster compression
      qcow2: rework the cluster compression routine
      qcow2: introduce compression type feature
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit fc9aefc8c0d3c6392656ea661ce72c1583b70bbd
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Thu May 7 21:38:00 2020 +0300

    block/block-copy: fix use-after-free of task pointer
    
    Obviously, we should g_free the task after trace point and offset
    update.
    
    Reported-by: Coverity (CID 1428756)
    Fixes: 4ce5dd3e9b5ee0fac18625860eb3727399ee965e
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Message-Id: <20200507183800.22626-1-vsementsov@virtuozzo.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Signed-off-by: Max Reitz <mreitz@redhat.com>

commit dd488fc1c000700741355426198d240c6f25ccb7
Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
Date:   Thu May 7 11:25:21 2020 +0300

    iotests: 287: add qcow2 compression type test
    
    The test checks fulfilling qcow2 requirements for the compression
    type feature and zstd compression type operability.
    
    Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Message-Id: <20200507082521.29210-5-dplotnikov@virtuozzo.com>
    Signed-off-by: Max Reitz <mreitz@redhat.com>

commit d298ac10add95e2b7f8850332f3b755c8a23d925
Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
Date:   Thu May 7 11:25:20 2020 +0300

    qcow2: add zstd cluster compression
    
    zstd significantly reduces cluster compression time.
    It provides better compression performance maintaining
    the same level of the compression ratio in comparison with
    zlib, which, at the moment, is the only compression
    method available.
    
    The performance test results:
    Test compresses and decompresses qemu qcow2 image with just
    installed rhel-7.6 guest.
    Image cluster size: 64K. Image on disk size: 2.2G
    
    The test was conducted with brd disk to reduce the influence
    of disk subsystem to the test results.
    The results is given in seconds.
    
    compress cmd:
      time ./qemu-img convert -O qcow2 -c -o compression_type=[zlib|zstd]
                      src.img [zlib|zstd]_compressed.img
    decompress cmd
      time ./qemu-img convert -O qcow2
                      [zlib|zstd]_compressed.img uncompressed.img
    
               compression               decompression
             zlib       zstd           zlib         zstd
    ------------------------------------------------------------
    real     65.5       16.3 (-75 %)    1.9          1.6 (-16 %)
    user     65.0       15.8            5.3          2.5
    sys       3.3        0.2            2.0          2.0
    
    Both ZLIB and ZSTD gave the same compression ratio: 1.57
    compressed image size in both cases: 1.4G
    
    Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
    QAPI part:
    Acked-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20200507082521.29210-4-dplotnikov@virtuozzo.com>
    Signed-off-by: Max Reitz <mreitz@redhat.com>

commit 25dd077d1d0aaef23f8608468cbef9a396583b1b
Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
Date:   Thu May 7 11:25:19 2020 +0300

    qcow2: rework the cluster compression routine
    
    The patch enables processing the image compression type defined
    for the image and chooses an appropriate method for image clusters
    (de)compression.
    
    Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Reviewed-by: Alberto Garcia <berto@igalia.com>
    Reviewed-by: Max Reitz <mreitz@redhat.com>
    Message-Id: <20200507082521.29210-3-dplotnikov@virtuozzo.com>
    Signed-off-by: Max Reitz <mreitz@redhat.com>

commit 572ad9783f3e728a70617ce6bf144c09de3add50
Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
Date:   Thu May 7 11:25:18 2020 +0300

    qcow2: introduce compression type feature
    
    The patch adds some preparation parts for incompatible compression type
    feature to qcow2 allowing the use different compression methods for
    image clusters (de)compressing.
    
    It is implied that the compression type is set on the image creation and
    can be changed only later by image conversion, thus compression type
    defines the only compression algorithm used for the image, and thus,
    for all image clusters.
    
    The goal of the feature is to add support of other compression methods
    to qcow2. For example, ZSTD which is more effective on compression than ZLIB.
    
    The default compression is ZLIB. Images created with ZLIB compression type
    are backward compatible with older qemu versions.
    
    Adding of the compression type breaks a number of tests because now the
    compression type is reported on image creation and there are some changes
    in the qcow2 header in size and offsets.
    
    The tests are fixed in the following ways:
        * filter out compression_type for many tests
        * fix header size, feature table size and backing file offset
          affected tests: 031, 036, 061, 080
          header_size +=8: 1 byte compression type
                           7 bytes padding
          feature_table += 48: incompatible feature compression type
          backing_file_offset += 56 (8 + 48 -> header_change + feature_table_change)
        * add "compression type" for test output matching when it isn't filtered
          affected tests: 049, 060, 061, 065, 082, 085, 144, 182, 185, 198, 206,
                          242, 255, 274, 280
    
    Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Max Reitz <mreitz@redhat.com>
    QAPI part:
    Acked-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20200507082521.29210-2-dplotnikov@virtuozzo.com>
    Signed-off-by: Max Reitz <mreitz@redhat.com>

