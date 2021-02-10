Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22903162A3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83508.155602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9m6I-0007ZM-QE; Wed, 10 Feb 2021 09:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83508.155602; Wed, 10 Feb 2021 09:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9m6I-0007Yp-Kt; Wed, 10 Feb 2021 09:47:58 +0000
Received: by outflank-mailman (input) for mailman id 83508;
 Wed, 10 Feb 2021 09:47:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9m6H-0007Yf-JD; Wed, 10 Feb 2021 09:47:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9m6H-0006Hj-AB; Wed, 10 Feb 2021 09:47:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9m6H-0004xJ-0f; Wed, 10 Feb 2021 09:47:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9m6H-00037N-0A; Wed, 10 Feb 2021 09:47:57 +0000
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
	bh=3oFBYrFbNCXfWZwckUDkN6fK3wLQvA/IQj8ezqCB2X8=; b=ETHz4oGulNwIZJPcs3GgEPzHMh
	qOTAW2dvAJTWJvFMIt5Zcm0qKLN8uu3MKKB5CcmbbMaPee4YKJyuGhbUzisrzU5VOLIQr7Vm+ine8
	JlO/PRznPIm+l948xxoJoaCARQ2jV3BKAblznOsmj8rRVaOAgBIe8VRDsd+qUdNwJn9E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159197-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159197: all pass - PUSHED
X-Osstest-Versions-This:
    xen=687121f8a0e7c1ea1c4fa3d056637e5819342f14
X-Osstest-Versions-That:
    xen=5e7aa904405fa2f268c3af213516bae271de3265
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 09:47:57 +0000

flight 159197 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159197/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  687121f8a0e7c1ea1c4fa3d056637e5819342f14
baseline version:
 xen                  5e7aa904405fa2f268c3af213516bae271de3265

Last test of basis   158979  2021-02-03 09:18:36 Z    7 days
Failing since        159095  2021-02-07 09:19:37 Z    3 days    2 attempts
Testing same since   159197  2021-02-10 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Michał Leszczyński <michal.leszczynski@cert.pl>
  Olaf Hering <olaf@aepfle.de>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
   5e7aa90440..687121f8a0  687121f8a0e7c1ea1c4fa3d056637e5819342f14 -> coverity-tested/smoke

