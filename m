Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAC403744
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181603.328790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuEE-0008CT-DM; Wed, 08 Sep 2021 09:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181603.328790; Wed, 08 Sep 2021 09:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuEE-00089r-9p; Wed, 08 Sep 2021 09:50:50 +0000
Received: by outflank-mailman (input) for mailman id 181603;
 Wed, 08 Sep 2021 09:50:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNuED-00089h-9O; Wed, 08 Sep 2021 09:50:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNuEC-0001TN-VT; Wed, 08 Sep 2021 09:50:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNuEC-0005e0-Ly; Wed, 08 Sep 2021 09:50:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mNuEC-0006Sj-LQ; Wed, 08 Sep 2021 09:50:48 +0000
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
	bh=jxv4/VF0rSRpr8nxrdNXoK4ReTaCqegR0vpgtk6im0g=; b=zV9wbBfYnpvqYSHYsZDN9z2xcF
	xF2/9Tl+BHjk4z23mVzBV7w3c3G3Se4H7ewE6DEfxnv6AdKgyqF+R8Rn0GZYJLs+7YapdbNVb6TUX
	BRLz4Ne9OpZ0jZ15LsrqePbf37+wff4GW3qF+K/kIj/sKL0YyX/JzcunlpIdMUjnqQRg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164882-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164882: all pass - PUSHED
X-Osstest-Versions-This:
    xen=e70a9a043a5ce6d4025420f729bc473f711bf5d1
X-Osstest-Versions-That:
    xen=2d4978ead4b98452bc45ebe47952e524b12e2b41
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Sep 2021 09:50:48 +0000

flight 164882 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164882/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e70a9a043a5ce6d4025420f729bc473f711bf5d1
baseline version:
 xen                  2d4978ead4b98452bc45ebe47952e524b12e2b41

Last test of basis   164827  2021-09-05 09:18:31 Z    3 days
Testing same since   164882  2021-09-08 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
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
   2d4978ead4..e70a9a043a  e70a9a043a5ce6d4025420f729bc473f711bf5d1 -> coverity-tested/smoke

