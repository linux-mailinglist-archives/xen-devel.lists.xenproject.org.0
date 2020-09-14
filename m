Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA6268C86
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 15:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHore-0008Ge-12; Mon, 14 Sep 2020 13:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qj2e=CX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHorc-0008GR-1T
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 13:49:48 +0000
X-Inumbo-ID: e7142223-df4c-4202-8f9f-23df82bbf3ab
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7142223-df4c-4202-8f9f-23df82bbf3ab;
 Mon, 14 Sep 2020 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=9y6ZB3kqryf80XRh6HJywnrCNBWLfh5l5pfm/0WaEvk=; b=YKl6bCopLQBiN4Pw14XL3A86I5
 uV3jbuYiExhlVqWPE8u+IDAQbFCe35TX3M/kkDBCevJKkz0g3qhqdbhAaT3JZ8oCxYGOhQi3+xKD1
 8uF7NqrT9nDJxjb6BC3Wg2456AKX5uBnlUgCVZk6jeQFICm9cu99MN1rjHngti4g/THA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHorZ-0007VZ-Gh; Mon, 14 Sep 2020 13:49:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHorZ-0000SV-7N; Mon, 14 Sep 2020 13:49:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHorZ-0002rC-6t; Mon, 14 Sep 2020 13:49:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154332-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 154332: tolerable all pass - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=d16467b18e0c0a77743c3111bed2a833a77fbfe7
X-Osstest-Versions-That: xen=6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Sep 2020 13:49:45 +0000
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

flight 154332 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154332/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d16467b18e0c0a77743c3111bed2a833a77fbfe7
baseline version:
 xen                  6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6

Last test of basis   154129  2020-09-11 18:00:26 Z    2 days
Testing same since   154332  2020-09-14 11:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Juergen Gross <jgross@suse.com>
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
   6c5fb129e8..d16467b18e  d16467b18e0c0a77743c3111bed2a833a77fbfe7 -> smoke

