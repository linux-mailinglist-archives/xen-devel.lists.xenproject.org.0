Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B878316514
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83555.155758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nb5-0000yl-7D; Wed, 10 Feb 2021 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83555.155758; Wed, 10 Feb 2021 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nb5-0000yL-2q; Wed, 10 Feb 2021 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 83555;
 Wed, 10 Feb 2021 11:23:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nb4-0000yD-8T; Wed, 10 Feb 2021 11:23:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nb4-0007xS-3o; Wed, 10 Feb 2021 11:23:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nb3-0000eQ-QM; Wed, 10 Feb 2021 11:23:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nb3-0001YW-IP; Wed, 10 Feb 2021 11:23:49 +0000
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
	bh=BThOQduRW3RmZsGCjKfcY2v9/RsYlclKTdoNUzMJRtg=; b=KB9TGiwxGd7uQ29MG6mg5RdRQl
	ONftqlYbnDUOfS8NHI5SMNoJgzZqtvdZBJ42KR11D3iF/LnILxxpJvmn43GFRj1sE2UVf0e0Uiuui
	HpRw5kFp0lBGQU8kyeJIBZmw+3djyKYTeFXPQTR+AuTVsbt1aoeFk8taJaLtN+tQ8WmY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 159176: regressions - trouble: fail/pass/preparing
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-raw:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-pvshim:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-i386-pvgrub:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:hosts-allocate:running:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-coresched-i386-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=1214d55d1c41fbab3a9973a05085b8760647e411
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:23:49 +0000

flight 159176 qemu-mainline running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159176/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 152631
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 152631
 test-amd64-i386-libvirt-xsm   3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               running
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate    running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 test-amd64-amd64-amd64-pvgrub  3 hosts-allocate               running
 test-amd64-i386-freebsd10-amd64  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-intel  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate      running
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  3 hosts-allocate running
 test-amd64-i386-libvirt       3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-raw        3 hosts-allocate               running
 test-amd64-i386-xl-shadow     3 hosts-allocate               running
 test-amd64-i386-xl-xsm        3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-i386-xl            3 hosts-allocate               running
 test-amd64-i386-xl-pvshim     3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-i386-pair          4 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate   running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-i386-libvirt-pair  4 hosts-allocate               running
 test-amd64-amd64-i386-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-intel  3 hosts-allocate               running
 test-amd64-i386-freebsd10-i386  3 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64  3 hosts-allocate             running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-coresched-i386-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 152631
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152631
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                1214d55d1c41fbab3a9973a05085b8760647e411
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  174 days
Failing since        152659  2020-08-21 14:07:39 Z  172 days  342 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
394 people touched revisions under test,
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           preparing
 test-amd64-coresched-i386-xl                                 preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           preparing
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            preparing
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-libvirt-xsm                                 preparing
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  preparing
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       preparing
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemuu-rhel6hvm-amd                           preparing
 test-amd64-amd64-dom0pvh-xl-amd                              preparing
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     preparing
 test-amd64-i386-freebsd10-amd64                              preparing
 test-amd64-amd64-qemuu-freebsd11-amd64                       preparing
 test-amd64-amd64-qemuu-freebsd12-amd64                       preparing
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          preparing
 test-amd64-amd64-xl-qemuu-win7-amd64                         preparing
 test-amd64-i386-xl-qemuu-win7-amd64                          preparing
 test-amd64-amd64-xl-qemuu-ws16-amd64                         preparing
 test-amd64-i386-xl-qemuu-ws16-amd64                          preparing
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  preparing
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         preparing
 test-amd64-i386-freebsd10-i386                               preparing
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemuu-rhel6hvm-intel                         preparing
 test-amd64-amd64-dom0pvh-xl-intel                            preparing
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      preparing
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        preparing
 test-amd64-i386-pair                                         preparing
 test-amd64-amd64-libvirt-pair                                preparing
 test-amd64-i386-libvirt-pair                                 preparing
 test-amd64-amd64-amd64-pvgrub                                preparing
 test-amd64-amd64-i386-pvgrub                                 preparing
 test-amd64-amd64-xl-pvshim                                   preparing
 test-amd64-i386-xl-pvshim                                    preparing
 test-amd64-amd64-pygrub                                      preparing
 test-amd64-amd64-xl-qcow2                                    preparing
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       preparing
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              preparing
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    preparing
 test-arm64-arm64-xl-thunderx                                 pass    
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

(No revision log; it would be 109250 lines long.)

