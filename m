Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798643239D1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 10:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89227.167899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqma-0003ok-Go; Wed, 24 Feb 2021 09:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89227.167899; Wed, 24 Feb 2021 09:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqma-0003oI-D0; Wed, 24 Feb 2021 09:48:36 +0000
Received: by outflank-mailman (input) for mailman id 89227;
 Wed, 24 Feb 2021 09:48:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEqmZ-0003oA-0e; Wed, 24 Feb 2021 09:48:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEqmY-0002TB-Uz; Wed, 24 Feb 2021 09:48:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEqmY-0001no-O2; Wed, 24 Feb 2021 09:48:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lEqmY-0001gs-NV; Wed, 24 Feb 2021 09:48:34 +0000
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
	bh=Qw4iIDdkjmKLiGNeBIkvnOTBKEq6PsnJxK6jQEG9W1o=; b=1JU+fqonYa2K3YJ12pfJl4HlBj
	XRsiESmBhpIMZqu1rHpYDa/BnGMCktIeiUv/GnS63TG7FnEae4OE4RPb9pSethflwJCWpnTK3Qc1H
	zCIxdwrOgE2q2dLQlTWXFLcdm28+o1xo4zEVM7anVpI5etNs+su5ZQbjmjmgDAvqCpGc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159620-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159620: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5d94433a66df29ce314696a13bdd324ec0e342fe
X-Osstest-Versions-That:
    xen=87a067fd8f4d4f7c6be02c3d38145115ac542017
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 09:48:34 +0000

flight 159620 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159620/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5d94433a66df29ce314696a13bdd324ec0e342fe
baseline version:
 xen                  87a067fd8f4d4f7c6be02c3d38145115ac542017

Last test of basis   159515  2021-02-21 09:18:27 Z    3 days
Testing same since   159620  2021-02-24 09:19:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   87a067fd8f..5d94433a66  5d94433a66df29ce314696a13bdd324ec0e342fe -> coverity-tested/smoke

