Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC52A77C1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 08:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19637.44869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaZNO-00079C-2Z; Thu, 05 Nov 2020 07:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19637.44869; Thu, 05 Nov 2020 07:08:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaZNN-00078n-VF; Thu, 05 Nov 2020 07:08:05 +0000
Received: by outflank-mailman (input) for mailman id 19637;
 Thu, 05 Nov 2020 07:08:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kaZNM-00078i-2g
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 07:08:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74826320-0ee2-4b0d-a579-0ea55aa23172;
 Thu, 05 Nov 2020 07:08:01 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kaZNJ-0000Iu-1N; Thu, 05 Nov 2020 07:08:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kaZNI-00070u-ML; Thu, 05 Nov 2020 07:08:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kaZNI-0001z4-Lr; Thu, 05 Nov 2020 07:08:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kaZNM-00078i-2g
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 07:08:04 +0000
X-Inumbo-ID: 74826320-0ee2-4b0d-a579-0ea55aa23172
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 74826320-0ee2-4b0d-a579-0ea55aa23172;
	Thu, 05 Nov 2020 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=TKdttiedhUe8Qn38/CWoCXu3MBG7+L7okN6yOOTjQzs=; b=wZZXAX/tGaF7ATBzABmJ1eAwhE
	40VrbvapdEn4vrlPKKIdKN1swfTitjI5vowsm3n9vXFG9uccdWBtGUe+eKOsaihYsN1JARuqDD77K
	buwbygZSLQhqu4EuNHxOEtnAOewK53XW05MjMPyoOQWoZLsah3XIKm+xJYY5fo70JMVA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaZNJ-0000Iu-1N; Thu, 05 Nov 2020 07:08:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaZNI-00070u-ML; Thu, 05 Nov 2020 07:08:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaZNI-0001z4-Lr; Thu, 05 Nov 2020 07:08:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156398-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 156398: trouble: broken/fail/pass
X-Osstest-Failures:
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4f9294d21c47415376215d68a0298e88582b8e7a
X-Osstest-Versions-That:
    xen=97b7b5567fba6918a656ad349051b5343b5dea2e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Nov 2020 07:08:00 +0000

flight 156398 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156398/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-cubietruck  5 host-install(5)      broken REGR. vs. 156358

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qcow2    19 guest-localmigrate/x10       fail  like 156358
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156358
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156358
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156358
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156358
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156358
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156358
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156358
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156358
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156358
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156358
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156358
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  4f9294d21c47415376215d68a0298e88582b8e7a
baseline version:
 xen                  97b7b5567fba6918a656ad349051b5343b5dea2e

Last test of basis   156358  2020-11-02 08:38:03 Z    2 days
Testing same since   156398  2020-11-04 09:06:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <ian.jackson@eu.citrix.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
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
 test-armhf-armhf-xl-cubietruck                               broken  
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
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
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

broken-job test-armhf-armhf-xl-cubietruck broken
broken-step test-armhf-armhf-xl-cubietruck host-install(5)

Not pushing.

------------------------------------------------------------
commit 4f9294d21c47415376215d68a0298e88582b8e7a
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Wed Nov 4 09:36:36 2020 +0100

    SUPPORT.md: Desupport qemu trad except stub dm
    
    While investigating XSA-335 we discovered that many upstream security
    fixes were missing.  It is not practical to backport them.  There is
    no good reason to be running this very ancient version of qemu, except
    that it is the only way to run a stub dm which is currently supported
    by upstream.
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
    master commit: 8587160b3e2951b722d395a0346bb17c3c22152f
    master date: 2020-11-04 09:22:37 +0100
(qemu changes not included)

