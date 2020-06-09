Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF271F2A1D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 02:10:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiRq0-0000Q4-0X; Tue, 09 Jun 2020 00:09:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKNw=7W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jiRpx-0000Pz-NK
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 00:09:53 +0000
X-Inumbo-ID: 8a93e45e-a9e5-11ea-b2cd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a93e45e-a9e5-11ea-b2cd-12813bfff9fa;
 Tue, 09 Jun 2020 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4K2uYNbN+FbfYF5jz6z/pzbUe526X79AUyxyxFDuXFg=; b=kesLD+Mf1vLpt1h6aawrBE9X4
 6HM7L1ACcgNfnDl3UkEOCaww+LJccOwOsRfhpS0YxGlrhs/Y6XSC3wIyJ8hl0budNoyRr2TAUMo+T
 YuYgpZivpC8vTJ3joHGQCzsKzuzSMdSQfs0A7y80ntfo9YJ8kY+x6leCD/NC/E4vI+mMg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiRpw-000535-CB; Tue, 09 Jun 2020 00:09:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiRpw-00089G-4E; Tue, 09 Jun 2020 00:09:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jiRpw-0004RK-3G; Tue, 09 Jun 2020 00:09:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150925-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150925: FAIL
X-Osstest-Failures: linux-linus:test-amd64-i386-xl:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
 linux-linus:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-raw:<job status>:broken:regression
 linux-linus:test-amd64-coresched-i386-xl:<job status>:broken:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
 linux-linus:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:broken:heisenbug
 linux-linus:test-amd64-i386-xl:hosts-allocate:broken:heisenbug
 linux-linus:test-amd64-i386-xl-raw:host-install(4):broken:heisenbug
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(4):broken:heisenbug
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:capture-logs(16):broken:heisenbug
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:syslog-server:broken:heisenbug
 linux-linus:test-amd64-i386-xl-raw:syslog-server:broken:heisenbug
 linux-linus:test-amd64-amd64-examine:syslog-server:broken:heisenbug
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:syslog-server:broken:heisenbug
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:syslog-server:broken:heisenbug
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:heisenbug
 linux-linus:test-amd64-coresched-i386-xl:guest-start/debian.repeat:fail:heisenbug
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:guest-start/redhat.repeat:fail:heisenbug
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:windows-install:fail:heisenbug
 linux-linus:test-amd64-amd64-examine:memdisk-try-append:fail:heisenbug
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:heisenbug
 linux-linus:test-amd64-i386-xl-raw:capture-logs(5):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(11):broken:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:capture-logs(13):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:capture-logs(11):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(5):broken:nonblocking
 linux-linus:test-amd64-coresched-i386-xl:capture-logs(21):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=af7b4801030c07637840191c69eb666917e4135d
X-Osstest-Versions-That: linux=9aa900c8094dba7a60dc805ecec1e9f720744ba1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jun 2020 00:09:52 +0000
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

flight 150925 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150925/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl              <job status>                 broken  in 150920
 test-amd64-i386-xl-qemut-win7-amd64    <job status>           broken in 150920
 test-amd64-amd64-qemuu-nested-amd    <job status>             broken in 150920
 test-amd64-i386-xl-raw          <job status>                 broken  in 150920
 test-amd64-coresched-i386-xl    <job status>                 broken  in 150920
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>            broken in 150920
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 150920
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm <job status> broken in 150920
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>            broken in 150920

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-nested-amd 2 hosts-allocate broken in 150920 pass in 150925
 test-amd64-i386-xl            2 hosts-allocate broken in 150920 pass in 150925
 test-amd64-i386-xl-raw       4 host-install(4) broken in 150920 pass in 150925
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 4 host-install(4) broken in 150920 pass in 150925
 test-amd64-i386-qemuu-rhel6hvm-amd 16 capture-logs(16) broken in 150920 pass in 150925
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 3 syslog-server broken in 150920 pass in 150925
 test-amd64-i386-xl-raw        3 syslog-server  broken in 150920 pass in 150925
 test-amd64-amd64-examine      3 syslog-server  broken in 150920 pass in 150925
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 3 syslog-server broken in 150920 pass in 150925
 test-amd64-i386-xl-qemut-win7-amd64 3 syslog-server broken in 150920 pass in 150925
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 150920 pass in 150925
 test-amd64-coresched-i386-xl 20 guest-start/debian.repeat fail in 150920 pass in 150925
 test-amd64-i386-qemut-rhel6hvm-amd 12 guest-start/redhat.repeat fail in 150920 pass in 150925
 test-amd64-i386-xl-qemut-win7-amd64 10 windows-install fail in 150920 pass in 150925
 test-amd64-amd64-examine    4 memdisk-try-append fail in 150920 pass in 150925
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot            fail pass in 150920

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-raw    5 capture-logs(5) broken in 150920 blocked in 150910
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 11 capture-logs(11) broken in 150920 blocked in 150910
 test-amd64-i386-qemut-rhel6hvm-amd 13 capture-logs(13) broken in 150920 blocked in 150910
 test-amd64-i386-xl-qemut-win7-amd64 11 capture-logs(11) broken in 150920 blocked in 150910
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 capture-logs(5) broken in 150920 never pass
 test-amd64-coresched-i386-xl 21 capture-logs(21)   broken in 150920 never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop    fail in 150920 never pass
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150910
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150910
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150910
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150910
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150910
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150910
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150910
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150910
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150910
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150910
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                af7b4801030c07637840191c69eb666917e4135d
baseline version:
 linux                9aa900c8094dba7a60dc805ecec1e9f720744ba1

Last test of basis   150910  2020-06-07 20:10:01 Z    1 days
Testing same since   150920  2020-06-08 03:35:33 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ahmed Abdelsalam <ahabdels@gmail.com>
  Ahmed S. Darwish <a.darwish@linutronix.de>
  Al Viro <viro@zeniv.linux.org.uk>
  Alexander Fomichev <fomichev.ru@gmail.com>
  Alexander Lobakin <bloodyreaper@yandex.ru>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Allen Hubbe <allenbh@gmail.com>
  Alok Prasad <palok@marvell.com>
  Amelie Delaunay <amelie.delaunay@st.com>
  Amit Sahrawat <a.sahrawat@samsung.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anson Huang <Anson.Huang@nxp.com>
  Antoine Tenart <antoine.tenart@bootlin.com>
  Anupam Aggarwal <anupam.al@samsung.com>
  Arindam Nath <arindam.nath@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Baolin Wang <baolin.wang7@gmail.com>
  Benjamin Gaignard <benjamin.gaignard@st.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bruno Thomsen <bruno.thomsen@gmail.com>
  Chen Zhou <chenzhou10@huawei.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuhong Yuan <hslester96@gmail.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Corentin Labbe <clabbe@baylibre.com>
  Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Murphy <dmurphy@ti.com>
  Dave Jiang <dave.jiang@intel.com>
  David S. Miller <davem@davemloft.net>
  Dejin Zheng <zhengdejin5@gmail.com>
  Denis Efremov <efremov@linux.com>
  Ding Xiang <dingxiang@cmss.chinamobile.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Grace Kao <grace.kao@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ido Schimmel <idosch@mellanox.com>
  Igor Russkikh <irusskikh@marvell.com>
  Jacopo Mondi <jacopo+renesas@jmondi.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Yan <yanaijie@huawei.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jiasen Lin <linjiasen@hygon.cn>
  Jiri Benc <jbenc@redhat.com>
  Johan Jonker <jbx6244@gmail.com>
  John Hubbard <jhubbard@nvidia.com>
  John Johansen <john.johansen@canonical.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jon Mason <jdmason@kudzu.us>
  Jonathan Bakker <xc-racer2@live.ca>
  Kees Cook <keescook@chromium.org>
  Kevin P. Fleming <kevin+linux@km6g.us>
  Krzysztof Kozlowski <krzk@kernel.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lars Povlsen <lars.povlsen@microchip.com>
  Light Hsieh <light.hsieh@mediatek.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Logan Gunthorpe <logang@deltatee.com>
  Maciej Grochowski <maciej.grochowski@pm.me>
  Markus Elfring <elfring@users.sourceforge.net>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Mateusz Nosek <mateusznosek0@gmail.com>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Maxime Ripard <mripard@kernel.org>
  Michal Vokáč <michal.vokac@ysoft.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Pavel Machek (CIP) <pavel@denx.de>
  Pavel Machek <pavel@ucw.cz>
  Qiushi Wu <wu000273@umn.edu>
  Ran Wang <ran.wang_1@nxp.com>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Rishabh Bhatnagar <rishabhb@codeaurora.org>
  Rob Herring <robh@kernel.org>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Roberto Sassu <roberto.sassu@huawei.com>
  Roelof Berg <rberg@berg-solutions.de>
  Rohit Maheshwari <rohitm@chelsio.com>
  Sameeh Jubran <sameehj@amazon.com>
  Sanjay R Mehta <sanju.mehta@amd.com>
  Sean Wang <sean.wang@mediatek.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thierry Reding <treding@nvidia.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tuong Lien <tuong.t.lien@dektech.com.au>
  Vadim Pasternak <vadimp@mellanox.com>
  Valentin Longchamp <valentin@longchamp.me>
  Vasyl Gomonovych <gomonovych@gmail.com>
  Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vivek Trivedi <t.vivek@samsung.com>
  Vladimir Zapolskiy <vz@mleia.com>
  Wang Hai <wanghai38@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wesley Sheng <wesley.sheng@amd.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa@kernel.org>
  yu kuai <yukuai3@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
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
 test-armhf-armhf-xl-rtds                                     fail    
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

broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-coresched-i386-xl broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken

Not pushing.

(No revision log; it would be 3957 lines long.)

