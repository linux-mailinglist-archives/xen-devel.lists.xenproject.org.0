Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E399A3164DA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83535.155689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nT4-0007yq-Lu; Wed, 10 Feb 2021 11:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83535.155689; Wed, 10 Feb 2021 11:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nT4-0007yR-Gx; Wed, 10 Feb 2021 11:15:34 +0000
Received: by outflank-mailman (input) for mailman id 83535;
 Wed, 10 Feb 2021 11:15:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nT2-0007yI-P6; Wed, 10 Feb 2021 11:15:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nT2-0007nc-Hl; Wed, 10 Feb 2021 11:15:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nT2-0000TP-Bs; Wed, 10 Feb 2021 11:15:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nT2-0005e0-BL; Wed, 10 Feb 2021 11:15:32 +0000
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
	bh=ZKz8phywdPy/YjVHiKO5S8Dj9v52FyJ91iQUwEtnPCs=; b=yhVnW0kBO8Zweain9/tI0NVT5c
	jw9VBwjWhLHX791zXKmyJz+M+jLjakDW8/oxtQu2i8G0QBI92YVsKMS3En0Cv2sHe/HmkvA/PqLri
	pxKdU+d75QWzHZRV9rSDFh5znZfqu88YmpnkqOsYKDhby7StCsSS0ul29pbKRQJb4CKU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159166-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 159166: regressions - trouble: fail/pass/preparing/running
X-Osstest-Failures:
    linux-5.4:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-5.4:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-examine:hosts-allocate:running:regression
    linux-5.4:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-i386-pvgrub:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt-pair:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-raw:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-amd64-pvgrub:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-shadow:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-freebsd10-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-freebsd10-i386:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-pair:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-pvshim:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-pair:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-coresched-i386-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-examine:host-install:running:regression
    linux-5.4:test-amd64-i386-examine:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-xl-qcow2:debian-di-install:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-saverestore.2:running:regression
    linux-5.4:test-amd64-amd64-xl-qcow2:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:syslog-server:running:regression
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
X-Osstest-Versions-This:
    linux=d4716ee8751bf8dabf5872ba008124a0979a5f94
X-Osstest-Versions-That:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:15:32 +0000

flight 159166 linux-5.4 running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159166/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 158387
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 158387
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 158387
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 158387
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 test-amd64-amd64-examine      2 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-i386-xl-xsm        3 hosts-allocate               running
 test-amd64-i386-libvirt       3 hosts-allocate               running
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-i386-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-amd64-i386-libvirt-pair  4 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64  3 hosts-allocate             running
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  3 hosts-allocate running
 test-amd64-i386-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-raw        3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-amd64-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-intel  3 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 test-amd64-i386-xl-shadow     3 hosts-allocate               running
 test-amd64-i386-libvirt-xsm   3 hosts-allocate               running
 test-amd64-i386-qemut-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-i386-xl            3 hosts-allocate               running
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm  3 hosts-allocate running
 test-amd64-i386-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate      running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-i386-freebsd10-amd64  3 hosts-allocate               running
 test-amd64-i386-freebsd10-i386  3 hosts-allocate               running
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate    running
 test-amd64-i386-qemut-rhel6hvm-intel  3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-intel  3 hosts-allocate               running
 test-amd64-i386-xl-qemut-debianhvm-amd64  3 hosts-allocate             running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 hosts-allocate running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-i386-xl-pvshim     3 hosts-allocate               running
 test-amd64-i386-pair          4 hosts-allocate               running
 test-amd64-i386-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-coresched-i386-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-qemut-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-i386-examine       5 host-install                 running
 test-amd64-i386-examine       3 syslog-server                running
 test-amd64-amd64-xl-qcow2    12 debian-di-install            running
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-saverestore.2          running
 test-amd64-amd64-xl-qcow2     4 syslog-server                running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  5 host-install(5)  running
 test-amd64-amd64-xl-qemuu-win7-amd64  4 syslog-server                running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  4 syslog-server    running

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 158387

version targeted for testing:
 linux                d4716ee8751bf8dabf5872ba008124a0979a5f94
baseline version:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b

Last test of basis   158387  2021-01-12 19:40:06 Z   28 days
Failing since        158473  2021-01-17 13:42:20 Z   23 days   34 attempts
Testing same since   159129  2021-02-08 10:46:56 Z    2 days    1 attempts

------------------------------------------------------------
377 people touched revisions under test,
not listing them all

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
 test-amd64-amd64-xl                                          preparing
 test-amd64-coresched-amd64-xl                                preparing
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           preparing
 test-amd64-coresched-i386-xl                                 preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           running 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            preparing
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        preparing
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         preparing
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-libvirt-xsm                                 preparing
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  preparing
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       preparing
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemut-rhel6hvm-amd                           preparing
 test-amd64-i386-qemuu-rhel6hvm-amd                           preparing
 test-amd64-amd64-dom0pvh-xl-amd                              preparing
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemut-debianhvm-amd64                     preparing
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     preparing
 test-amd64-i386-freebsd10-amd64                              preparing
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       preparing
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          preparing
 test-amd64-amd64-xl-qemut-win7-amd64                         preparing
 test-amd64-i386-xl-qemut-win7-amd64                          preparing
 test-amd64-amd64-xl-qemuu-win7-amd64                         running 
 test-amd64-i386-xl-qemuu-win7-amd64                          preparing
 test-amd64-amd64-xl-qemut-ws16-amd64                         preparing
 test-amd64-i386-xl-qemut-ws16-amd64                          preparing
 test-amd64-amd64-xl-qemuu-ws16-amd64                         preparing
 test-amd64-i386-xl-qemuu-ws16-amd64                          preparing
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  preparing
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         preparing
 test-amd64-amd64-examine                                     running 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      running 
 test-amd64-i386-freebsd10-i386                               preparing
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemut-rhel6hvm-intel                         preparing
 test-amd64-i386-qemuu-rhel6hvm-intel                         preparing
 test-amd64-amd64-dom0pvh-xl-intel                            preparing
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      preparing
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        preparing
 test-amd64-i386-pair                                         preparing
 test-amd64-amd64-libvirt-pair                                preparing
 test-amd64-i386-libvirt-pair                                 preparing
 test-amd64-amd64-amd64-pvgrub                                preparing
 test-amd64-amd64-i386-pvgrub                                 preparing
 test-amd64-amd64-xl-pvshim                                   preparing
 test-amd64-i386-xl-pvshim                                    preparing
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    running 
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       preparing
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              preparing
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    preparing
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 preparing
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

(No revision log; it would be 11411 lines long.)

