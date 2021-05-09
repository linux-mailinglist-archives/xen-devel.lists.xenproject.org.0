Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D137761C
	for <lists+xen-devel@lfdr.de>; Sun,  9 May 2021 11:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124544.234900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfg2e-0000zv-Oc; Sun, 09 May 2021 09:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124544.234900; Sun, 09 May 2021 09:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfg2e-0000xg-Jf; Sun, 09 May 2021 09:48:04 +0000
Received: by outflank-mailman (input) for mailman id 124544;
 Sun, 09 May 2021 09:48:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lfg2c-0000xU-PK; Sun, 09 May 2021 09:48:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lfg2c-00011A-Ky; Sun, 09 May 2021 09:48:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lfg2c-0006Y1-8m; Sun, 09 May 2021 09:48:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lfg2c-0001PY-8H; Sun, 09 May 2021 09:48:02 +0000
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
	bh=eP4kgsbfj8aswDhybzjVs0/RTcIDkoNqdgUIggWsK8g=; b=E+2In0W2tSUr63rH13KOGhrpb1
	yorIq/6NHJ/9sHPnMNCz7TrbBsqf7Nh07o1EzI2zd3NlpxtBjLEg98zr7Bp71EYzspQfffbuQ8Zv+
	ewxmYWc9D2oTAZD0KU5LkWgBlBjzEES3VVK12u1/nAdhRXK1wvKlMtPKYPWV6ZDBZ4Ak=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161877-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161877: all pass - PUSHED
X-Osstest-Versions-This:
    xen=a7da84c457b05479ab423a2e589c5f46c7da0ed7
X-Osstest-Versions-That:
    xen=8cccd6438e86112ab383e41b433b5a7e73be9621
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 May 2021 09:48:02 +0000

flight 161877 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161877/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  a7da84c457b05479ab423a2e589c5f46c7da0ed7
baseline version:
 xen                  8cccd6438e86112ab383e41b433b5a7e73be9621

Last test of basis   161786  2021-05-05 09:18:31 Z    4 days
Testing same since   161877  2021-05-09 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monné <roger.pau@citrix.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
   8cccd6438e..a7da84c457  a7da84c457b05479ab423a2e589c5f46c7da0ed7 -> coverity-tested/smoke

