Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5F2A63F5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 13:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19075.44280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaHeT-000874-Ms; Wed, 04 Nov 2020 12:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19075.44280; Wed, 04 Nov 2020 12:12:33 +0000
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
	id 1kaHeT-00086f-Jg; Wed, 04 Nov 2020 12:12:33 +0000
Received: by outflank-mailman (input) for mailman id 19075;
 Wed, 04 Nov 2020 12:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDu8=EK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kaHeS-00086a-PP
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:12:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3183ab08-46a1-4f4d-821d-2a753ca1653d;
 Wed, 04 Nov 2020 12:12:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kaHeR-0004J1-CE; Wed, 04 Nov 2020 12:12:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kaHeR-000480-3B; Wed, 04 Nov 2020 12:12:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kaHeR-00015c-1c; Wed, 04 Nov 2020 12:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NDu8=EK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kaHeS-00086a-PP
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:12:32 +0000
X-Inumbo-ID: 3183ab08-46a1-4f4d-821d-2a753ca1653d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3183ab08-46a1-4f4d-821d-2a753ca1653d;
	Wed, 04 Nov 2020 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=8Zt+WUGH0S9wZtCvq6zG31psDFkjRQMAZgs47S9jW1o=; b=ALpJT6YvRdC1XngtcDBzxoFbqf
	dJeMgb/r7qxt4Md1IED/aNuoHzV2LZsmzR2rLcI6h2I7iHO9+Jt9nyBN5G7mAt969x9c9OML5lfqW
	gbIjOognuthfTZdINrd5893sm/q5Ql14BfAsVJHHNQRaigCSPFtw7pOWmOIt5U4fTVO4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaHeR-0004J1-CE; Wed, 04 Nov 2020 12:12:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaHeR-000480-3B; Wed, 04 Nov 2020 12:12:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kaHeR-00015c-1c; Wed, 04 Nov 2020 12:12:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156395-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156395: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9ff9705647646aa937b5f5c1426a64c69a62b3bd
X-Osstest-Versions-That:
    xen=7056f2f89f03f2f804ac7e776c7b2b000cd716cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Nov 2020 12:12:31 +0000

flight 156395 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156395/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9ff9705647646aa937b5f5c1426a64c69a62b3bd
baseline version:
 xen                  7056f2f89f03f2f804ac7e776c7b2b000cd716cd

Last test of basis   156322  2020-10-30 20:02:33 Z    4 days
Testing same since   156395  2020-11-04 09:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>

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
   7056f2f89f..9ff9705647  9ff9705647646aa937b5f5c1426a64c69a62b3bd -> smoke

