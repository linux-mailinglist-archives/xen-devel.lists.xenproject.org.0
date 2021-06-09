Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72343A0FD3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139141.257367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqus1-0007HM-Jn; Wed, 09 Jun 2021 09:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139141.257367; Wed, 09 Jun 2021 09:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqus1-0007FF-Fy; Wed, 09 Jun 2021 09:51:33 +0000
Received: by outflank-mailman (input) for mailman id 139141;
 Wed, 09 Jun 2021 09:51:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqurz-0007F5-GJ; Wed, 09 Jun 2021 09:51:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqurz-0004Fi-4q; Wed, 09 Jun 2021 09:51:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqury-0003TT-R5; Wed, 09 Jun 2021 09:51:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lqury-00074f-Qd; Wed, 09 Jun 2021 09:51:30 +0000
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
	bh=d7276AINmcEngLwFL29K70j0n+LX5cby2RC1h89ui1M=; b=K8Dt53vRtspCug1tYOQ164n1xY
	OjAzZ+BzEp4PcITsW0o6Lm/cJkudkFNXxDXcFu+Oyn2A10DiqEG9OGmHja82yxwBFLQsYV28lMfNQ
	aUmdXMokfqFthgfJnVf/Sd1XA7oCm0NlM9n/G4oSAd4GGyfkLn1T1rBnEtazxW7fyuPE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162566-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162566: all pass - PUSHED
X-Osstest-Versions-This:
    xen=e4fee66043120c954fc309bbb37813604c1c0eb7
X-Osstest-Versions-That:
    xen=5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Jun 2021 09:51:30 +0000

flight 162566 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162566/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e4fee66043120c954fc309bbb37813604c1c0eb7
baseline version:
 xen                  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1

Last test of basis   162335  2021-06-02 09:20:40 Z    7 days
Testing same since   162566  2021-06-09 09:19:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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
   5268b2dcf7..e4fee66043  e4fee66043120c954fc309bbb37813604c1c0eb7 -> coverity-tested/smoke

