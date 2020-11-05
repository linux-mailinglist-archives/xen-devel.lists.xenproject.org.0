Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0992A8606
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20000.45579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajsw-0003b7-R7; Thu, 05 Nov 2020 18:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20000.45579; Thu, 05 Nov 2020 18:21:22 +0000
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
	id 1kajsw-0003ak-O8; Thu, 05 Nov 2020 18:21:22 +0000
Received: by outflank-mailman (input) for mailman id 20000;
 Thu, 05 Nov 2020 18:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kajsv-0003Ze-Ir
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:21:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2cecc96-017b-4c9e-8cb5-9285c380a33b;
 Thu, 05 Nov 2020 18:21:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kajso-00071x-3Q; Thu, 05 Nov 2020 18:21:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kajsn-00031B-Sn; Thu, 05 Nov 2020 18:21:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kajsn-0003bB-SN; Thu, 05 Nov 2020 18:21:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kajsv-0003Ze-Ir
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:21:21 +0000
X-Inumbo-ID: e2cecc96-017b-4c9e-8cb5-9285c380a33b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e2cecc96-017b-4c9e-8cb5-9285c380a33b;
	Thu, 05 Nov 2020 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ZYCz7L8P3iUSQjB7P92erWsatO8NNesl1Kssu51zA1E=; b=vqMAA/NZJezC5qj8m+e/6ygTAh
	g/SlaWemaBMy9fTasaUsqB+mT1THoPS5d+JQMda012PvMWMRfQpmQQIVBOh/42jzxmxRqrzDzxMIH
	HCyHPvKD0IulnKJTV1RbNDaCm9YCdQ4vDzhr7ho3cZRRPZ6NtMYx2cqcMKl2sgeSWSyY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kajso-00071x-3Q; Thu, 05 Nov 2020 18:21:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kajsn-00031B-Sn; Thu, 05 Nov 2020 18:21:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kajsn-0003bB-SN; Thu, 05 Nov 2020 18:21:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156444-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156444: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e006b2e3be72e502b86bd9e1405417abd87bdfed
X-Osstest-Versions-That:
    xen=9ff9705647646aa937b5f5c1426a64c69a62b3bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Nov 2020 18:21:13 +0000

flight 156444 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156444/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e006b2e3be72e502b86bd9e1405417abd87bdfed
baseline version:
 xen                  9ff9705647646aa937b5f5c1426a64c69a62b3bd

Last test of basis   156395  2020-11-04 09:00:24 Z    1 days
Testing same since   156444  2020-11-05 16:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   9ff9705647..e006b2e3be  e006b2e3be72e502b86bd9e1405417abd87bdfed -> smoke

