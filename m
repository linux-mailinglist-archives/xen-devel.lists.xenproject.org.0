Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAA454474
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226684.391799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHhc-0003yx-Ue; Wed, 17 Nov 2021 09:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226684.391799; Wed, 17 Nov 2021 09:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHhc-0003w3-RO; Wed, 17 Nov 2021 09:58:04 +0000
Received: by outflank-mailman (input) for mailman id 226684;
 Wed, 17 Nov 2021 09:58:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnHhb-0003vL-3Q; Wed, 17 Nov 2021 09:58:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnHhb-00044M-0s; Wed, 17 Nov 2021 09:58:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnHha-0004Bo-MK; Wed, 17 Nov 2021 09:58:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mnHha-0006MV-Ls; Wed, 17 Nov 2021 09:58:02 +0000
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
	bh=5qZbDxHHrOlW0/kF+LuIIdj6Hdd5kt4Mel2aWcylHJo=; b=WcKaqiLfXr418KjDD6eQfIO4AH
	TFKfNcxLVzO04oi0O4JaPP9PmHj8j4sc63hRghvMi11D1nOyHHzw4upHr/BeqLpSIII/gVuchM52v
	CN5rI25ISNC4MCJEnWMw4ozNgmrUOMubyGt09N8TiOxDKhIiDjesSZZxQNhbjp66MkDw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166165-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166165: all pass - PUSHED
X-Osstest-Versions-This:
    xen=2d72d2784eb71d8532bfbd6462d261739c9e82e4
X-Osstest-Versions-That:
    xen=c7a7f14b92991e7d79735bff95f04676b9af34c6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Nov 2021 09:58:02 +0000

flight 166165 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166165/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  2d72d2784eb71d8532bfbd6462d261739c9e82e4
baseline version:
 xen                  c7a7f14b92991e7d79735bff95f04676b9af34c6

Last test of basis   166145  2021-11-14 09:18:29 Z    3 days
Testing same since   166165  2021-11-17 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
   c7a7f14b92..2d72d2784e  2d72d2784eb71d8532bfbd6462d261739c9e82e4 -> coverity-tested/smoke

