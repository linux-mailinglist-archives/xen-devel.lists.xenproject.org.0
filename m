Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859C36685A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114245.217659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9UO-0002nw-4o; Wed, 21 Apr 2021 09:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114245.217659; Wed, 21 Apr 2021 09:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9UO-0002nS-12; Wed, 21 Apr 2021 09:49:44 +0000
Received: by outflank-mailman (input) for mailman id 114245;
 Wed, 21 Apr 2021 09:49:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZ9UN-0002nJ-2d; Wed, 21 Apr 2021 09:49:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZ9UM-0004iF-Q5; Wed, 21 Apr 2021 09:49:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZ9UM-0003z2-Ho; Wed, 21 Apr 2021 09:49:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lZ9UM-0000vj-H1; Wed, 21 Apr 2021 09:49:42 +0000
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
	bh=53KQugm1fyqBzWtPGDhRW0n6H8Rgv0kiflbsZe5AGHk=; b=NsCkKNDKvGdlkAbGVbd54czXM/
	dYi//zQwivJWJcAzsOoVE6wL9AvCt7coMH/1ilk0/L3w7w/RSFtMzesawBDKzs/mm+N4ctXHcN0Nr
	vhzlXwwcWc5fqcsGgzkRhr7PVsVVdKwpNwR9r+VotH3WPNgJCwU1ciQU4X2rwu0t+rd4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161350-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161350: all pass - PUSHED
X-Osstest-Versions-This:
    xen=aaa3eafb3ba8b544d19ca41cda1477640b22b8fc
X-Osstest-Versions-That:
    xen=dd22a64de7e02b48312839a15179528c8f7db5c6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Apr 2021 09:49:42 +0000

flight 161350 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161350/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  aaa3eafb3ba8b544d19ca41cda1477640b22b8fc
baseline version:
 xen                  dd22a64de7e02b48312839a15179528c8f7db5c6

Last test of basis   161257  2021-04-18 09:19:39 Z    3 days
Testing same since   161350  2021-04-21 09:19:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquish <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Tim Deegan <tim@xen.org>
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
   dd22a64de7..aaa3eafb3b  aaa3eafb3ba8b544d19ca41cda1477640b22b8fc -> coverity-tested/smoke

