Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18045B8F9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230333.398195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqGC-0003y4-SE; Wed, 24 Nov 2021 11:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230333.398195; Wed, 24 Nov 2021 11:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqGC-0003w8-LO; Wed, 24 Nov 2021 11:16:20 +0000
Received: by outflank-mailman (input) for mailman id 230333;
 Wed, 24 Nov 2021 11:16:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpqGA-0003vy-Vr; Wed, 24 Nov 2021 11:16:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpqGA-0005FW-MT; Wed, 24 Nov 2021 11:16:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mpqGA-0004z8-9Z; Wed, 24 Nov 2021 11:16:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mpqGA-0002uW-93; Wed, 24 Nov 2021 11:16:18 +0000
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
	bh=peIdZisYa6aAX9LekiyBY0+KvPFCPiHT9H6YHfPss40=; b=vbT0d5/W5ql/zmsCNj+JeGusBS
	WGqmkwdNjTkMh3too4OpDbGKS9qnXDMvqMs4TfvN9gcb8nfHQzDakZK5pKCYOXSJVYLX4f9ZV0Ef4
	4rmwxloLuIl7HXipuv1CUZk9xk98t4vHtVnjbB75CxxoqhQFXzmCINTFcARYSeYukHMk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166313-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 166313: regressions - FAIL
X-Osstest-Failures:
    xen-4.12-testing:test-amd64-i386-xl-xsm:guest-localmigrate/x10:fail:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-ping-check-native/src_host:fail:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-ping-check-native/dst_host:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:host-ping-check-native:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-ping-check-native:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:debian-install:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:debian-install:fail:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:host-ping-check-xen:fail:regression
    xen-4.12-testing:test-armhf-armhf-xl-credit1:host-ping-check-native:fail:regression
    xen-4.12-testing:test-amd64-i386-xl-vhd:guest-localmigrate/x10:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1442eb9ac448ca43c58bd65dbd82dca0c412c143
X-Osstest-Versions-That:
    xen=95172a6347111247287ca6d7966aff69aa379965
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Nov 2021 11:16:18 +0000

flight 166313 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166313/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm       20 guest-localmigrate/x10   fail REGR. vs. 165384
 test-amd64-i386-libvirt-pair 8 host-ping-check-native/src_host fail REGR. vs. 165384
 test-amd64-i386-libvirt-pair 9 host-ping-check-native/dst_host fail REGR. vs. 165384
 test-amd64-amd64-xl-shadow    6 host-ping-check-native   fail REGR. vs. 165384
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 6 host-ping-check-native fail REGR. vs. 165384
 test-amd64-amd64-xl-xsm      12 debian-install           fail REGR. vs. 165384
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 165384
 test-amd64-amd64-xl-pvshim   12 debian-install           fail REGR. vs. 165384
 test-xtf-amd64-amd64-4       10 host-ping-check-xen      fail REGR. vs. 165384
 test-armhf-armhf-xl-credit1   6 host-ping-check-native   fail REGR. vs. 165384
 test-amd64-i386-xl-vhd       19 guest-localmigrate/x10   fail REGR. vs. 165384

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qcow2    19 guest-localmigrate/x10  fail blocked in 165384
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 165384
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 165384
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 165384
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 165384
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 165384
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 165384
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 165384
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 165384
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 165384
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 165384
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 165384
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 165384
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1442eb9ac448ca43c58bd65dbd82dca0c412c143
baseline version:
 xen                  95172a6347111247287ca6d7966aff69aa379965

Last test of basis   165384  2021-10-05 19:06:05 Z   49 days
Testing same since   166313  2021-11-23 13:06:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       fail    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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
commit 1442eb9ac448ca43c58bd65dbd82dca0c412c143
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 23 13:36:28 2021 +0100

    x86/P2M: deal with partial success of p2m_set_entry()
    
    M2P and PoD stats need to remain in sync with P2M; if an update succeeds
    only partially, respective adjustments need to be made. If updates get
    made before the call, they may also need undoing upon complete failure
    (i.e. including the single-page case).
    
    Log-dirty state would better also be kept in sync.
    
    Note that the change to set_typed_p2m_entry() may not be strictly
    necessary (due to the order restriction enforced near the top of the
    function), but is being kept here to be on the safe side.
    
    This is CVE-2021-28705 and CVE-2021-28709 / XSA-389.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 74a11c43fd7e074b1f77631b446dd2115eacb9e8
    master date: 2021-11-22 12:27:30 +0000

commit 1a2e8d6cccddf984fce09b7b8b1139d81cea421e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 23 13:35:55 2021 +0100

    x86/PoD: handle intermediate page orders in p2m_pod_cache_add()
    
    p2m_pod_decrease_reservation() may pass pages to the function which
    aren't 4k, 2M, or 1G. Handle all intermediate orders as well, to avoid
    hitting the BUG() at the switch() statement's "default" case.
    
    This is CVE-2021-28708 / part of XSA-388.
    
    Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 8ec13f68e0b026863d23e7f44f252d06478bc809
    master date: 2021-11-22 12:27:30 +0000

commit 398f7aec5dab6ad0853a8b069b48ae304e059fa4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 23 13:35:36 2021 +0100

    x86/PoD: deal with misaligned GFNs
    
    Users of XENMEM_decrease_reservation and XENMEM_populate_physmap aren't
    required to pass in order-aligned GFN values. (While I consider this
    bogus, I don't think we can fix this there, as that might break existing
    code, e.g Linux'es swiotlb, which - while affecting PV only - until
    recently had been enforcing only page alignment on the original
    allocation.) Only non-PoD code paths (guest_physmap_{add,remove}_page(),
    p2m_set_entry()) look to be dealing with this properly (in part by being
    implemented inefficiently, handling every 4k page separately).
    
    Introduce wrappers taking care of splitting the incoming request into
    aligned chunks, without putting much effort in trying to determine the
    largest possible chunk at every iteration.
    
    Also "handle" p2m_set_entry() failure for non-order-0 requests by
    crashing the domain in one more place. Alongside putting a log message
    there, also add one to the other similar path.
    
    Note regarding locking: This is left in the actual worker functions on
    the assumption that callers aren't guaranteed atomicity wrt acting on
    multiple pages at a time. For mis-aligned GFNs gfn_lock() wouldn't have
    locked the correct GFN range anyway, if it didn't simply resolve to
    p2m_lock(), and for well-behaved callers there continues to be only a
    single iteration, i.e. behavior is unchanged for them. (FTAOD pulling
    out just pod_lock() into p2m_pod_decrease_reservation() would result in
    a lock order violation.)
    
    This is CVE-2021-28704 and CVE-2021-28707 / part of XSA-388.
    
    Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 182c737b9ba540ebceb1433f3940fbed6eac4ea9
    master date: 2021-11-22 12:27:30 +0000

commit 8e657cfe0aec6c2bf548cae98a97d2485304d4c6
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Nov 23 13:35:03 2021 +0100

    xen/page_alloc: Harden assign_pages()
    
    domain_tot_pages() and d->max_pages are 32-bit values. While the order
    should always be quite small, it would still be possible to overflow
    if domain_tot_pages() is near to (2^32 - 1).
    
    As this code may be called by a guest via XENMEM_increase_reservation
    and XENMEM_populate_physmap, we want to make sure the guest is not going
    to be able to allocate more than it is allowed.
    
    Rework the allocation check to avoid any possible overflow. While the
    check domain_tot_pages() < d->max_pages should technically not be
    necessary, it is probably best to have it to catch any possible
    inconsistencies in the future.
    
    This is CVE-2021-28706 / part of XSA-385.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 143501861d48e1bfef495849fd68584baac05849
    master date: 2021-11-22 11:11:05 +0000
(qemu changes not included)

