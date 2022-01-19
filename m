Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4994937B8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 10:50:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258791.446111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA7bI-0002Hv-23; Wed, 19 Jan 2022 09:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258791.446111; Wed, 19 Jan 2022 09:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA7bH-0002G3-Uy; Wed, 19 Jan 2022 09:49:55 +0000
Received: by outflank-mailman (input) for mailman id 258791;
 Wed, 19 Jan 2022 09:49:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nA7bG-0002Ft-HQ; Wed, 19 Jan 2022 09:49:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nA7bG-0001DU-EK; Wed, 19 Jan 2022 09:49:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nA7bG-0004rE-75; Wed, 19 Jan 2022 09:49:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nA7bG-000459-6c; Wed, 19 Jan 2022 09:49:54 +0000
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
	bh=dFpIhqSfT8jkRAmgyfhbkr3qjiGp22xxt9bdbpe+LR8=; b=NH02cozqSU8spGGeCliPorvx6N
	O9PHqklSnWmvXrBFc1Yl+GSaqNVqj9/xBA+JOmbDjn88dxXLJ80UNkSVBBIlq4i48B5XaTHXDuHjM
	2U8OKAJsPqer1lvgHhPdaJ/JiwmQ8HtLR3Jx8p6neWVch4+ab9I35LLdDaqayPY4ZHAo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167746: all pass - PUSHED
X-Osstest-Versions-This:
    xen=444597436d08ccae6d210a2b1b877fef636796ea
X-Osstest-Versions-That:
    xen=9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Jan 2022 09:49:54 +0000

flight 167746 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167746/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  444597436d08ccae6d210a2b1b877fef636796ea
baseline version:
 xen                  9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f

Last test of basis   167714  2022-01-16 09:19:39 Z    3 days
Testing same since   167746  2022-01-19 09:19:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Lukasz Hawrylko <lukasz@hawrylko.pl>
  Nick Rosbrook <rosbrookn@gmail.com>

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
   9ce0a5e207..444597436d  444597436d08ccae6d210a2b1b877fef636796ea -> coverity-tested/smoke

