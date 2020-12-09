Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06182D3F12
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 10:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48062.85023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmw4y-0002eV-Qb; Wed, 09 Dec 2020 09:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48062.85023; Wed, 09 Dec 2020 09:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmw4y-0002e4-L7; Wed, 09 Dec 2020 09:48:12 +0000
Received: by outflank-mailman (input) for mailman id 48062;
 Wed, 09 Dec 2020 09:48:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmw4x-0002dw-50; Wed, 09 Dec 2020 09:48:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmw4w-0003vf-SO; Wed, 09 Dec 2020 09:48:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmw4w-00018D-CV; Wed, 09 Dec 2020 09:48:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kmw4w-0005vY-C5; Wed, 09 Dec 2020 09:48:10 +0000
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
	bh=/FU8OOivyMLVridxEUC9401GRTVxWvWUR0O3mnLIiXc=; b=SgfEkMtzyyvUk4gosfbn6rRxwO
	Yyuih+1fi7YvTm+1FdK5ddLqgSgVeDQoYfF2qjnjqjbXpXmQv3qxWRcnf/FmSk9hQwkLw4nEVGXLR
	lEzzWYpY+s+cEwSiqXlLYQu0V1MLsA9oyf7dauTPcE+F1BF+JkTlNwRaH3zCHS00gz/k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157343-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157343: all pass - PUSHED
X-Osstest-Versions-This:
    xen=777e3590f154e6a8af560dd318b9465fa168db20
X-Osstest-Versions-That:
    xen=5e666356a9d55fbd9eb5b8506088aa760e107b5b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Dec 2020 09:48:10 +0000

flight 157343 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157343/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  777e3590f154e6a8af560dd318b9465fa168db20
baseline version:
 xen                  5e666356a9d55fbd9eb5b8506088aa760e107b5b

Last test of basis   157238  2020-12-06 09:18:27 Z    3 days
Testing same since   157343  2020-12-09 09:19:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  From: Juergen Gross <jgross@suse.com>
  Hongyan Xia <hongyxia@amazon.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
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
   5e666356a9..777e3590f1  777e3590f154e6a8af560dd318b9465fa168db20 -> coverity-tested/smoke

