Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4805460B0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346022.571743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaUj-0007Kb-65; Fri, 10 Jun 2022 08:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346022.571743; Fri, 10 Jun 2022 08:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaUj-0007IG-2D; Fri, 10 Jun 2022 08:59:53 +0000
Received: by outflank-mailman (input) for mailman id 346022;
 Fri, 10 Jun 2022 08:59:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzaUh-0007I6-Il; Fri, 10 Jun 2022 08:59:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzaUh-0004bC-ES; Fri, 10 Jun 2022 08:59:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzaUh-0004TK-4V; Fri, 10 Jun 2022 08:59:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzaUh-0003nv-1n; Fri, 10 Jun 2022 08:59:51 +0000
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
	bh=VPKUrZ3pSQwSy/v69fbxF1Ad2d6/8DeNP5zgLAu7hLs=; b=lPIOzX9zQzodXbK4ov03oQ+CX1
	eq6m8jX59+w0aroTUALeaBe6Cc8ISdNT29u2qKZ0bi3ARVRFFc+VC34fC7ZcNcfd1hL59PBafdJNv
	npTqVSgLMhkOfMMvHj+PWSrQ3nlcUG1aQly0OWg9K7Bo071vXEseOHccSJXoTSA7hs24=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170903-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 170903: regressions - FAIL
X-Osstest-Failures:
    xen-4.14-testing:test-amd64-i386-pair:xen-boot/src_host:fail:regression
    xen-4.14-testing:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-vhd:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-livepatch:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-migrupgrade:xen-boot/dst_host:fail:regression
    xen-4.14-testing:test-amd64-coresched-i386-xl:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt-raw:xen-install:fail:regression
    xen-4.14-testing:test-amd64-i386-libvirt:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-shadow:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-xsm:xen-boot:fail:regression
    xen-4.14-testing:test-xtf-amd64-amd64-2:xtf/test-pv32pae-xsa-213:fail:regression
    xen-4.14-testing:test-xtf-amd64-amd64-2:leak-check/check:fail:regression
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=82ba97ec6b24f3e92fd1749962154cedf2addc5d
X-Osstest-Versions-That:
    xen=17848dfed47f52b479c4e7eb412671aec5757329
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 08:59:51 +0000

flight 170903 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170903/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-pair         12 xen-boot/src_host        fail REGR. vs. 169330
 test-amd64-i386-pair         13 xen-boot/dst_host        fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-win7-amd64  8 xen-boot          fail REGR. vs. 169330
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 169330
 test-amd64-i386-xl-vhd        8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-freebsd10-i386  8 xen-boot               fail REGR. vs. 169330
 test-amd64-i386-livepatch     8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-qemuu-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 169330
 test-amd64-i386-migrupgrade  13 xen-boot/dst_host        fail REGR. vs. 169330
 test-amd64-coresched-i386-xl  8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-qemut-debianhvm-amd64  8 xen-boot     fail REGR. vs. 169330
 test-amd64-i386-libvirt-pair 12 xen-boot/src_host        fail REGR. vs. 169330
 test-amd64-i386-libvirt-pair 13 xen-boot/dst_host        fail REGR. vs. 169330
 test-amd64-i386-libvirt-xsm   8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-debianhvm-amd64  8 xen-boot     fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-ovmf-amd64  8 xen-boot          fail REGR. vs. 169330
 test-amd64-i386-xl            8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-qemut-win7-amd64  8 xen-boot          fail REGR. vs. 169330
 test-amd64-i386-xl-qemut-ws16-amd64  8 xen-boot          fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 169330
 test-amd64-i386-freebsd10-amd64  8 xen-boot              fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 169330
 test-amd64-i386-libvirt-raw   7 xen-install              fail REGR. vs. 169330
 test-amd64-i386-libvirt       8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-pvshim     8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 169330
 test-amd64-i386-xl-qemuu-ws16-amd64  8 xen-boot          fail REGR. vs. 169330
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 169330
 test-amd64-i386-qemut-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 169330
 test-amd64-i386-xl-shadow     8 xen-boot                 fail REGR. vs. 169330
 test-amd64-i386-xl-xsm        8 xen-boot                 fail REGR. vs. 169330
 test-xtf-amd64-amd64-2       89 xtf/test-pv32pae-xsa-213 fail REGR. vs. 169330
 test-xtf-amd64-amd64-2       90 leak-check/check         fail REGR. vs. 169330
 test-amd64-i386-qemuu-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 169330
 test-amd64-i386-qemut-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 169330

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169330
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169330
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169330
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169330
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169330
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169330
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169330
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169330
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  82ba97ec6b24f3e92fd1749962154cedf2addc5d
baseline version:
 xen                  17848dfed47f52b479c4e7eb412671aec5757329

Last test of basis   169330  2022-04-12 10:36:29 Z   58 days
Testing same since   170903  2022-06-09 14:07:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@eu.citrix.com>

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
 test-xtf-amd64-amd64-2                                       fail    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    fail    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
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
commit 82ba97ec6b24f3e92fd1749962154cedf2addc5d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:52:11 2022 +0200

    x86/pv: Track and flush non-coherent mappings of RAM
    
    There are legitimate uses of WC mappings of RAM, e.g. for DMA buffers with
    devices that make non-coherent writes.  The Linux sound subsystem makes
    extensive use of this technique.
    
    For such usecases, the guest's DMA buffer is mapped and consistently used as
    WC, and Xen doesn't interact with the buffer.
    
    However, a mischevious guest can use WC mappings to deliberately create
    non-coherency between the cache and RAM, and use this to trick Xen into
    validating a pagetable which isn't actually safe.
    
    Allocate a new PGT_non_coherent to track the non-coherency of mappings.  Set
    it whenever a non-coherent writeable mapping is created.  If the page is used
    as anything other than PGT_writable_page, force a cache flush before
    validation.  Also force a cache flush before the page is returned to the heap.
    
    This is CVE-2022-26364, part of XSA-402.
    
    Reported-by: Jann Horn <jannh@google.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: c1c9cae3a9633054b177c5de21ad7268162b2f2c
    master date: 2022-06-09 14:23:37 +0200

commit 25c7adeefa7538d1f88bab1859ce77f8b46f229e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:51:47 2022 +0200

    x86/amd: Work around CLFLUSH ordering on older parts
    
    On pre-CLFLUSHOPT AMD CPUs, CLFLUSH is weakely ordered with everything,
    including reads and writes to the address, and LFENCE/SFENCE instructions.
    
    This creates a multitude of problematic corner cases, laid out in the manual.
    Arrange to use MFENCE on both sides of the CLFLUSH to force proper ordering.
    
    This is part of XSA-402.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 062868a5a8b428b85db589fa9a6d6e43969ffeb9
    master date: 2022-06-09 14:23:07 +0200

commit 204d4f16506334a0398649c714c19349145589be
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:51:23 2022 +0200

    x86: Split cache_flush() out of cache_writeback()
    
    Subsequent changes will want a fully flushing version.
    
    Use the new helper rather than opencoding it in flush_area_local().  This
    resolves an outstanding issue where the conditional sfence is on the wrong
    side of the clflushopt loop.  clflushopt is ordered with respect to older
    stores, not to younger stores.
    
    Rename gnttab_cache_flush()'s helper to avoid colliding in name.
    grant_table.c can see the prototype from cache.h so the build fails
    otherwise.
    
    This is part of XSA-402.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 9a67ffee3371506e1cbfdfff5b90658d4828f6a2
    master date: 2022-06-09 14:22:38 +0200

commit 07fbed87582c117262541a9a0903848a36adcc79
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:50:59 2022 +0200

    x86: Don't change the cacheability of the directmap
    
    Changeset 55f97f49b7ce ("x86: Change cache attributes of Xen 1:1 page mappings
    in response to guest mapping requests") attempted to keep the cacheability
    consistent between different mappings of the same page.
    
    The reason wasn't described in the changelog, but it is understood to be in
    regards to a concern over machine check exceptions, owing to errata when using
    mixed cacheabilities.  It did this primarily by updating Xen's mapping of the
    page in the direct map when the guest mapped a page with reduced cacheability.
    
    Unfortunately, the logic didn't actually prevent mixed cacheability from
    occurring:
     * A guest could map a page normally, and then map the same page with
       different cacheability; nothing prevented this.
     * The cacheability of the directmap was always latest-takes-precedence in
       terms of guest requests.
     * Grant-mapped frames with lesser cacheability didn't adjust the page's
       cacheattr settings.
     * The map_domain_page() function still unconditionally created WB mappings,
       irrespective of the page's cacheattr settings.
    
    Additionally, update_xen_mappings() had a bug where the alias calculation was
    wrong for mfn's which were .init content, which should have been treated as
    fully guest pages, not Xen pages.
    
    Worse yet, the logic introduced a vulnerability whereby necessary
    pagetable/segdesc adjustments made by Xen in the validation logic could become
    non-coherent between the cache and main memory.  The CPU could subsequently
    operate on the stale value in the cache, rather than the safe value in main
    memory.
    
    The directmap contains primarily mappings of RAM.  PAT/MTRR conflict
    resolution is asymmetric, and generally for MTRR=WB ranges, PAT of lesser
    cacheability resolves to being coherent.  The special case is WC mappings,
    which are non-coherent against MTRR=WB regions (except for fully-coherent
    CPUs).
    
    Xen must not have any WC cacheability in the directmap, to prevent Xen's
    actions from creating non-coherency.  (Guest actions creating non-coherency is
    dealt with in subsequent patches.)  As all memory types for MTRR=WB ranges
    inter-operate coherently, so leave Xen's directmap mappings as WB.
    
    Only PV guests with access to devices can use reduced-cacheability mappings to
    begin with, and they're trusted not to mount DoSs against the system anyway.
    
    Drop PGC_cacheattr_{base,mask} entirely, and the logic to manipulate them.
    Shift the later PGC_* constants up, to gain 3 extra bits in the main reference
    count.  Retain the check in get_page_from_l1e() for special_pages() because a
    guest has no business using reduced cacheability on these.
    
    This reverts changeset 55f97f49b7ce6c3520c555d19caac6cf3f9a5df0
    
    This is CVE-2022-26363, part of XSA-402.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    master commit: ae09597da34aee6bc5b76475c5eea6994457e854
    master date: 2022-06-09 14:22:08 +0200

commit a72146db9e9719f16bf2cab2fc9ac7a0d8d7ee3f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:50:32 2022 +0200

    x86/page: Introduce _PAGE_* constants for memory types
    
    ... rather than opencoding the PAT/PCD/PWT attributes in __PAGE_HYPERVISOR_*
    constants.  These are going to be needed by forthcoming logic.
    
    No functional change.
    
    This is part of XSA-402.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 1be8707c75bf4ba68447c74e1618b521dd432499
    master date: 2022-06-09 14:21:38 +0200

commit 758f40d7fa7e98ef2d2772ef8f0f57eabde028bd
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:50:16 2022 +0200

    x86/pv: Fix ABAC cmpxchg() race in _get_page_type()
    
    _get_page_type() suffers from a race condition where it incorrectly assumes
    that because 'x' was read and a subsequent a cmpxchg() succeeds, the type
    cannot have changed in-between.  Consider:
    
    CPU A:
      1. Creates an L2e referencing pg
         `-> _get_page_type(pg, PGT_l1_page_table), sees count 0, type PGT_writable_page
      2.     Issues flush_tlb_mask()
    CPU B:
      3. Creates a writeable mapping of pg
         `-> _get_page_type(pg, PGT_writable_page), count increases to 1
      4. Writes into new mapping, creating a TLB entry for pg
      5. Removes the writeable mapping of pg
         `-> _put_page_type(pg), count goes back down to 0
    CPU A:
      7.     Issues cmpxchg(), setting count 1, type PGT_l1_page_table
    
    CPU B now has a writeable mapping to pg, which Xen believes is a pagetable and
    suitably protected (i.e. read-only).  The TLB flush in step 2 must be deferred
    until after the guest is prohibited from creating new writeable mappings,
    which is after step 7.
    
    Defer all safety actions until after the cmpxchg() has successfully taken the
    intended typeref, because that is what prevents concurrent users from using
    the old type.
    
    Also remove the early validation for writeable and shared pages.  This removes
    race conditions where one half of a parallel mapping attempt can return
    successfully before:
     * The IOMMU pagetables are in sync with the new page type
     * Writeable mappings to shared pages have been torn down
    
    This is part of XSA-401 / CVE-2022-26362.
    
    Reported-by: Jann Horn <jannh@google.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    master commit: 8cc5036bc385112a82f1faff27a0970e6440dfed
    master date: 2022-06-09 14:21:04 +0200

commit c70071eb6c6d43f96d0d9e2f2446de491c8ed527
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jun 9 15:49:50 2022 +0200

    x86/pv: Clean up _get_page_type()
    
    Various fixes for clarity, ahead of making complicated changes.
    
     * Split the overflow check out of the if/else chain for type handling, as
       it's somewhat unrelated.
     * Comment the main if/else chain to explain what is going on.  Adjust one
       ASSERT() and state the bit layout for validate-locked and partial states.
     * Correct the comment about TLB flushing, as it's backwards.  The problem
       case is when writeable mappings are retained to a page becoming read-only,
       as it allows the guest to bypass Xen's safety checks for updates.
     * Reduce the scope of 'y'.  It is an artefact of the cmpxchg loop and not
       valid for use by subsequent logic.  Switch to using ACCESS_ONCE() to treat
       all reads as explicitly volatile.  The only thing preventing the validated
       wait-loop being infinite is the compiler barrier hidden in cpu_relax().
     * Replace one page_get_owner(page) with the already-calculated 'd' already in
       scope.
    
    No functional change.
    
    This is part of XSA-401 / CVE-2022-26362.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: George Dunlap <george.dunlap@eu.citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    master commit: 9186e96b199e4f7e52e033b238f9fe869afb69c7
    master date: 2022-06-09 14:20:36 +0200
(qemu changes not included)

