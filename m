Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8227AD72
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrsu-0004PV-AA; Mon, 28 Sep 2020 12:04:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rPw=DF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMrss-0004OY-Dt
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:03:58 +0000
X-Inumbo-ID: 4d9c652b-9e76-49f7-8d52-18db531fcbea
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d9c652b-9e76-49f7-8d52-18db531fcbea;
 Mon, 28 Sep 2020 12:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=Wn79tYO7kqBsvQsZ+qKEbZFzrv6Q/It7WjW+QFN0jmI=; b=XxIin0hJtFliWLDiS4FQhMVIif
 uEv/Bl23bIzExO4gTVbqVy/qNy7UtwT9I3i6K8KjttdAGpmbRSTYTI7G9h7juuNR2JHlMVeSETlnH
 MGcOt8pui3dF/JHPMhLwihqg8gon3SHIrurnDBoZx0lk51i/lwczy+QNEgZoOtY4cWCk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrso-0001qR-7T; Mon, 28 Sep 2020 12:03:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrso-0004EP-1l; Mon, 28 Sep 2020 12:03:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrso-0003KW-1F; Mon, 28 Sep 2020 12:03:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154698-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 154698: regressions - trouble:
 fail/pass/preparing
X-Osstest-Failures: xen-4.14-testing:test-xtf-amd64-amd64-4:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.14-testing:test-xtf-amd64-amd64-4:xtf/test-pv64-xsa-221:fail:regression
 xen-4.14-testing:test-amd64-amd64-xl-xsm:guest-start:fail:regression
 xen-4.14-testing:test-xtf-amd64-amd64-1:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 xen-4.14-testing:test-xtf-amd64-amd64-5:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.14-testing:test-xtf-amd64-amd64-1:xtf/test-pv64-xsa-221:fail:regression
 xen-4.14-testing:test-xtf-amd64-amd64-5:xtf/test-pv64-xsa-221:fail:regression
 xen-4.14-testing:test-amd64-i386-xl-xsm:guest-start:fail:regression
 xen-4.14-testing:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
 xen-4.14-testing:test-xtf-amd64-amd64-2:hosts-allocate:running:regression
 xen-4.14-testing:test-xtf-amd64-amd64-3:hosts-allocate:running:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
 xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: xen=f37a1cf023b277d0d49323bf322ce3ff0c92262d
X-Osstest-Versions-That: xen=28855ebcdbfa437e60bc16c761405476fe16bc39
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Sep 2020 12:03:54 +0000
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

flight 154698 xen-4.14-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/154698/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-4       68 xtf/test-hvm64-xsa-221   fail REGR. vs. 154350
 test-xtf-amd64-amd64-4       106 xtf/test-pv64-xsa-221   fail REGR. vs. 154350
 test-amd64-amd64-xl-xsm      12 guest-start              fail REGR. vs. 154350
 test-xtf-amd64-amd64-1       68 xtf/test-hvm64-xsa-221   fail REGR. vs. 154350
 test-amd64-amd64-libvirt-xsm 12 guest-start              fail REGR. vs. 154350
 test-xtf-amd64-amd64-5       68 xtf/test-hvm64-xsa-221   fail REGR. vs. 154350
 test-xtf-amd64-amd64-1       106 xtf/test-pv64-xsa-221   fail REGR. vs. 154350
 test-xtf-amd64-amd64-5       106 xtf/test-pv64-xsa-221   fail REGR. vs. 154350
 test-amd64-i386-xl-xsm       12 guest-start              fail REGR. vs. 154350
 test-amd64-i386-libvirt-xsm  12 guest-start              fail REGR. vs. 154350
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 154350
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  2 hosts-allocate     running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  2 hosts-allocate         running
 test-xtf-amd64-amd64-2        2 hosts-allocate               running
 test-xtf-amd64-amd64-3        2 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  2 hosts-allocate               running

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass

version targeted for testing:
 xen                  f37a1cf023b277d0d49323bf322ce3ff0c92262d
baseline version:
 xen                  28855ebcdbfa437e60bc16c761405476fe16bc39

Last test of basis   154350  2020-09-15 00:36:14 Z   13 days
Failing since        154617  2020-09-22 14:37:47 Z    5 days    2 attempts
Testing same since   154641  2020-09-23 10:32:29 Z    5 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Don Slutz <don.slutz@gmail.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
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
 test-xtf-amd64-amd64-2                                       preparing
 test-xtf-amd64-amd64-3                                       preparing
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
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
 test-amd64-amd64-xl-qemuu-win7-amd64                         preparing
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
 test-amd64-i386-migrupgrade                                  pass    
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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

(No revision log; it would be 506 lines long.)

