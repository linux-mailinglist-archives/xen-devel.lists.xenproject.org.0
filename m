Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548C34FDFD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103825.197996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRY1L-0003Ze-I2; Wed, 31 Mar 2021 10:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103825.197996; Wed, 31 Mar 2021 10:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRY1L-0003Z8-E3; Wed, 31 Mar 2021 10:24:19 +0000
Received: by outflank-mailman (input) for mailman id 103825;
 Wed, 31 Mar 2021 10:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRY1J-0003Z0-UE; Wed, 31 Mar 2021 10:24:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRY1J-0000BN-ND; Wed, 31 Mar 2021 10:24:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRY1J-0001Kt-Fs; Wed, 31 Mar 2021 10:24:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lRY1J-0006tl-FC; Wed, 31 Mar 2021 10:24:17 +0000
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
	bh=9i9emVrm3EpzXVXK2sU3ooCTUKwUuNjWQUGfLJ41bg4=; b=tDaZ7s3ckOIZtl1Jdgo9JyLZqP
	XI3bbgvn62d/WvGxbfvUuKGwzYNg+binyAQUtVIpFkRsFEYiYtrVuWP6IlT647nz+zCH5O6e9c4FK
	RB5Uan6IDW7/0Ge/xOo22UnCgHGj16ITs6gu1yV0iWXeD7LV2fFbFsMRtin0FaATMyBw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160582-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160582: all pass - PUSHED
X-Osstest-Versions-This:
    xen=90629587e16e2efdb61da77f25c25fba3c4a5fd7
X-Osstest-Versions-That:
    xen=e680cc48b7184d3489873d6776f84ba1fc238ced
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Mar 2021 10:24:17 +0000

flight 160582 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160582/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  90629587e16e2efdb61da77f25c25fba3c4a5fd7
baseline version:
 xen                  e680cc48b7184d3489873d6776f84ba1fc238ced

Last test of basis   160495  2021-03-28 09:19:58 Z    3 days
Testing same since   160582  2021-03-31 09:18:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   e680cc48b7..90629587e1  90629587e16e2efdb61da77f25c25fba3c4a5fd7 -> coverity-tested/smoke

