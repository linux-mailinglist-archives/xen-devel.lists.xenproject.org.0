Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E2AEE90
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 11:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24603.51941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcn7g-00081m-QI; Wed, 11 Nov 2020 10:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24603.51941; Wed, 11 Nov 2020 10:13:04 +0000
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
	id 1kcn7g-00081H-ML; Wed, 11 Nov 2020 10:13:04 +0000
Received: by outflank-mailman (input) for mailman id 24603;
 Wed, 11 Nov 2020 10:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcn7f-00080b-PA
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:13:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32481d4a-0a80-485d-a7fc-ca82d624c381;
 Wed, 11 Nov 2020 10:13:01 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcn7d-00089B-Cs; Wed, 11 Nov 2020 10:13:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcn7d-0004vf-5p; Wed, 11 Nov 2020 10:13:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcn7d-00068t-5M; Wed, 11 Nov 2020 10:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcn7f-00080b-PA
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:13:03 +0000
X-Inumbo-ID: 32481d4a-0a80-485d-a7fc-ca82d624c381
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 32481d4a-0a80-485d-a7fc-ca82d624c381;
	Wed, 11 Nov 2020 10:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=563XLd+IDZGMNNFz3o2MvTuufWa43/SJiohlc7Nc8Mk=; b=n9sVbVhMucZHWcSn0iw16cDUVO
	fKWHgIQVgZJnKhzkHJ1VKtbeD8Yl3dNTax3tarcOaX6G6Xor98KxScQyNNR4IcXZivdAQCD9Q6Kyw
	3VLJgLbQRFr0GENm3i74PoC5HnkQBJNrD73Ffsi4YbjT+vcy40uIA4ETHwWBnmfdjCmk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcn7d-00089B-Cs; Wed, 11 Nov 2020 10:13:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcn7d-0004vf-5p; Wed, 11 Nov 2020 10:13:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcn7d-00068t-5M; Wed, 11 Nov 2020 10:13:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156679: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=69634224afaf84474f04e1ab050f216d66bcda68
X-Osstest-Versions-That:
    xen=3059178798a23ba870ff86ff54d442a07e6651fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Nov 2020 10:13:01 +0000

flight 156679 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156679/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  69634224afaf84474f04e1ab050f216d66bcda68
baseline version:
 xen                  3059178798a23ba870ff86ff54d442a07e6651fc

Last test of basis   156622  2020-11-10 13:01:19 Z    0 days
Failing since        156628  2020-11-10 17:00:28 Z    0 days    6 attempts
Testing same since   156679  2020-11-11 08:00:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   3059178798..69634224af  69634224afaf84474f04e1ab050f216d66bcda68 -> smoke

