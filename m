Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358024BCD7A
	for <lists+xen-devel@lfdr.de>; Sun, 20 Feb 2022 10:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275822.471832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLiqG-0000WF-FU; Sun, 20 Feb 2022 09:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275822.471832; Sun, 20 Feb 2022 09:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLiqG-0000UG-CN; Sun, 20 Feb 2022 09:49:20 +0000
Received: by outflank-mailman (input) for mailman id 275822;
 Sun, 20 Feb 2022 09:49:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nLiqE-0000U6-TA; Sun, 20 Feb 2022 09:49:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nLiqE-0001Ty-OP; Sun, 20 Feb 2022 09:49:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nLiqE-0007xF-Cs; Sun, 20 Feb 2022 09:49:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nLiqE-0007jg-CR; Sun, 20 Feb 2022 09:49:18 +0000
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
	bh=S0EMfC5jK9NJnXE8h92L8qn7Qq6XMRE2QhXLPltg7Bk=; b=fVPpfOA8gVaxTjImJlN6cugWfD
	aZ6Rh+qCcE1O4DQrxXpDMR4qQArbiRol8fnI9WPfI8LHxQUjpVjp/faWS0mt+1C5thy5C2KNtJx7R
	fCT2h7wcAmO9FVj5HvS9+8nwWJi4j5stheQHvkw05WqMEIqOhVcy6WGbP3IeZAhrBF8M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168177-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168177: all pass - PUSHED
X-Osstest-Versions-This:
    xen=686f13cfce1d95464ff39fb59ac1f85163cea03b
X-Osstest-Versions-That:
    xen=e7c2017cf4a91ab6a0fea6adca2d9dd2ab1603b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Feb 2022 09:49:18 +0000

flight 168177 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168177/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  686f13cfce1d95464ff39fb59ac1f85163cea03b
baseline version:
 xen                  e7c2017cf4a91ab6a0fea6adca2d9dd2ab1603b0

Last test of basis   168128  2022-02-16 09:19:44 Z    4 days
Testing same since   168177  2022-02-20 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   e7c2017cf4..686f13cfce  686f13cfce1d95464ff39fb59ac1f85163cea03b -> coverity-tested/smoke

