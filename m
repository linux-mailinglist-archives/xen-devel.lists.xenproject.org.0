Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D786476D2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 20:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457427.715335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3MuO-0008H5-1S; Thu, 08 Dec 2022 19:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457427.715335; Thu, 08 Dec 2022 19:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3MuN-0008FH-Un; Thu, 08 Dec 2022 19:50:15 +0000
Received: by outflank-mailman (input) for mailman id 457427;
 Thu, 08 Dec 2022 19:50:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3MuM-0008F7-Ui; Thu, 08 Dec 2022 19:50:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3MuM-0002Q5-MK; Thu, 08 Dec 2022 19:50:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3MuM-0000AJ-Ai; Thu, 08 Dec 2022 19:50:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3MuL-0007T5-VD; Thu, 08 Dec 2022 19:50:13 +0000
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
	bh=cf2k308maoCsagjW4HpqsO1SOYtmpvwpkwuz6hYrtho=; b=VIuB8BCu4BeQgSu9cy5I0/89UE
	M/tOlyDmc46xyoOJ9VAaxOTFz7Pf1JcBB9fbf+2h/kd0ebT+VynFWlIdA0LkfEAfWcBkJz9LHocG6
	uffpt0japijUybZB3mMxGeK95vIsNkqPRJNNyXhaKpiW+xbfHR1RRQE7ptItXovoJTw0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175089-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 175089: regressions - FAIL
X-Osstest-Failures:
    xen-4.16-testing:test-amd64-i386-pair:xen-install/src_host:fail:regression
    xen-4.16-testing:test-amd64-i386-migrupgrade:xen-install/dst_host:fail:regression
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4ad5975d4e35635f03d2cb9e86292c0daeabd75f
X-Osstest-Versions-That:
    xen=042a5b7024e7b27f5806914b9d42099a48c8f893
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Dec 2022 19:50:13 +0000

flight 175089 xen-4.16-testing real [real]
flight 175097 xen-4.16-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/175089/
http://logs.test-lab.xenproject.org/osstest/logs/175097/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 175067
 test-amd64-i386-migrupgrade  11 xen-install/dst_host     fail REGR. vs. 175067

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175067
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175067
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175067
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175067
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175067
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175067
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175067
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175067
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175067
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175067
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175067
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175067
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  4ad5975d4e35635f03d2cb9e86292c0daeabd75f
baseline version:
 xen                  042a5b7024e7b27f5806914b9d42099a48c8f893

Last test of basis   175067  2022-12-07 01:08:35 Z    1 days
Testing same since   175089  2022-12-08 09:38:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
commit 4ad5975d4e35635f03d2cb9e86292c0daeabd75f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Dec 8 10:12:41 2022 +0100

    x86/HVM: don't mark evtchn upcall vector as pending when vLAPIC is disabled
    
    Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
    exposed a problem with the marking of the respective vector as
    pending: For quite some time Linux has been checking whether any stale
    ISR or IRR bits would still be set while preparing the LAPIC for use.
    This check is now triggering on the upcall vector, as the registration,
    at least for APs, happens before the LAPIC is actually enabled.
    
    In software-disabled state an LAPIC would not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark the upcall vector as
    having a pending request when the vLAPIC is in this state.
    
    To compensate for the "enabled" check added to the assertion logic, add
    logic to (conditionally) mark the upcall vector as having a request
    pending at the time the LAPIC is being software-enabled by the guest.
    Note however that, like for the pt_may_unmask_irq() we already have
    there, long term we may need to find a different solution. This will be
    especially relevant in case yet better LAPIC acceleration would
    eliminate notifications of guest writes to this and other registers.
    
    Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    master commit: f5d0279839b58cb622f0995dbf9cff056f03082e
    master date: 2022-12-06 13:51:49 +0100

commit a61f93d59742986d3119124bbe7a77fdcdf98a38
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Dec 8 10:12:02 2022 +0100

    x86/Viridian: don't mark IRQ vectors as pending when vLAPIC is disabled
    
    In software-disabled state an LAPIC does not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark Viridian IPI or timer
    vectors as having a pending request when the vLAPIC is in this state.
    Such interrupts are simply lost.
    
    Introduce a local variable in send_ipi() to help readability.
    
    Fixes: fda96b7382ea ("viridian: add implementation of the HvSendSyntheticClusterIpi hypercall")
    Fixes: 26fba3c85571 ("viridian: add implementation of synthetic timers")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    master commit: 831419f82913417dee4e5b0f80769c5db590540b
    master date: 2022-12-02 10:35:32 +0100

commit 07bbac08b594741480457c272c5f2d1feee3fbbd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Dec 8 10:11:32 2022 +0100

    x86/HVM: don't mark external IRQs as pending when vLAPIC is disabled
    
    In software-disabled state an LAPIC does not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark IO-APIC or MSI
    originating vectors as having a pending request when the vLAPIC is in
    this state. Such interrupts are simply lost.
    
    Introduce (IO-APIC) or re-use (MSI) a local variable to help
    readability.
    
    Fixes: 4fe21ad3712e ("This patch add virtual IOAPIC support for VMX guest")
    Fixes: 85715f4bc7c9 ("MSI 5/6: add MSI support to passthrough HVM domain")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: f1d7aac1e3c3cd164e17d41791a575a5c3e87121
    master date: 2022-12-02 10:35:01 +0100

commit 09849cdd251443f22fb2ee07b2aaa7cd45546b5b
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Dec 8 10:10:50 2022 +0100

    x86/pvh: do not forward MADT Local APIC NMI structures to dom0
    
    Currently Xen will passthrough any Local APIC NMI Structure found in
    the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
    doesn't have access to the physical local APIC, and instead gets an
    emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
    pins wired to anything.  Furthermore the ACPI Processor UIDs used in
    the APIC NMI Structures are likely to not match the ones generated by
    Xen for the Local x2APIC Structures, creating confusion to dom0.
    
    Fix this by removing the logic to passthrough the Local APIC NMI
    Structure for PVH dom0.
    
    Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: b39e6385250ccef9509af0eab9003ad5c1478842
    master date: 2022-12-02 10:33:40 +0100

commit b6b3dc8d887b4d78b802c236d93dc792c8355074
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Dec 8 10:10:00 2022 +0100

    x86/irq: do not release irq until all cleanup is done
    
    Current code in _clear_irq_vector() will mark the irq as unused before
    doing the cleanup required when move_in_progress is true.
    
    This can lead to races in create_irq() if the function picks an irq
    desc that's been marked as unused but has move_in_progress set, as the
    call to assign_irq_vector() in that function can then fail with
    -EAGAIN.
    
    Prevent that by only marking irq descs as unused when all the cleanup
    has been done.  While there also use write_atomic() when setting
    IRQ_UNUSED in _clear_irq_vector() and add a barrier in order to
    prevent the setting of IRQ_UNUSED getting reordered by the compiler.
    
    The check for move_in_progress cannot be removed from
    _assign_irq_vector(), as other users (io_apic_set_pci_routing() and
    ioapic_guest_write()) can still pass active irq descs to
    assign_irq_vector().
    
    Note the trace point is not moved and is now set before the irq is
    marked as unused.  This is done so that the CPU mask provided in the
    trace point is the one belonging to the current vector, not the old
    one.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: e267d11969a40f0aec33dbf966f5a6490b205f43
    master date: 2022-12-02 10:32:21 +0100
(qemu changes not included)

