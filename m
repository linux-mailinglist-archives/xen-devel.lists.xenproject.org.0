Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCA4970F1
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jan 2022 11:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259662.448111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaBn-0001jD-2a; Sun, 23 Jan 2022 10:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259662.448111; Sun, 23 Jan 2022 10:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaBm-0001g9-Up; Sun, 23 Jan 2022 10:33:38 +0000
Received: by outflank-mailman (input) for mailman id 259662;
 Sun, 23 Jan 2022 10:33:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBaBl-0001fz-Se; Sun, 23 Jan 2022 10:33:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBaBl-00026R-Q5; Sun, 23 Jan 2022 10:33:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nBaBl-0002Jz-Aw; Sun, 23 Jan 2022 10:33:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nBaBl-0001wn-9x; Sun, 23 Jan 2022 10:33:37 +0000
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
	bh=yrKLEoYV3lzWlFLKhZIH4TdaUV0KRhxBJH54VJ01Qo8=; b=3o3GLHip+CUkoHlC9QFpS0Aa0d
	sSU3+R+TaLlz5N1XBQR8xfM06bxF3h4KbNOD4/q6KQi45Hi7iNT/c5x6M2jWkUPRcHYoMiYLUVVvx
	4OzzQAedwmnT45z6k1HvnAXoNK0+yoDMH3FuAgJHKY7q/RK2F+c1pOex8EqPjoX1diKU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167798-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167798: all pass - PUSHED
X-Osstest-Versions-This:
    xen=fe9be76d880b1d43b9dca471f45af3fd380ecb00
X-Osstest-Versions-That:
    xen=444597436d08ccae6d210a2b1b877fef636796ea
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Jan 2022 10:33:37 +0000

flight 167798 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167798/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  fe9be76d880b1d43b9dca471f45af3fd380ecb00
baseline version:
 xen                  444597436d08ccae6d210a2b1b877fef636796ea

Last test of basis   167746  2022-01-19 09:19:44 Z    4 days
Testing same since   167798  2022-01-23 09:19:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Monakov <amonakov@ispras.ru>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Chen Yu <yu.c.chen@intel.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>
  Zhang Rui <rui.zhang@intel.com>

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
   444597436d..fe9be76d88  fe9be76d880b1d43b9dca471f45af3fd380ecb00 -> coverity-tested/smoke

