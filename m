Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC531AFE1
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 10:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84850.159105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBE1O-0006Wl-Ar; Sun, 14 Feb 2021 09:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84850.159105; Sun, 14 Feb 2021 09:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBE1O-0006WI-5C; Sun, 14 Feb 2021 09:48:54 +0000
Received: by outflank-mailman (input) for mailman id 84850;
 Sun, 14 Feb 2021 09:48:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBE1M-0006WA-BZ; Sun, 14 Feb 2021 09:48:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBE1M-0007x0-4n; Sun, 14 Feb 2021 09:48:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lBE1L-00033o-Tz; Sun, 14 Feb 2021 09:48:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lBE1L-00029a-TT; Sun, 14 Feb 2021 09:48:51 +0000
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
	bh=ZNdzCzwGB8tNhjOddTJbrHmLpFBsMaYU/Li82+n4mRw=; b=G/VEElVDwsv4HepXwkX3uYiSi7
	V3bT1EztsoeU5kKP438KTG7RAdkrg6wzL+CMOJzoqjt+yMM6bjgp9leUAE7qMsxXF4IgMeKj5u3Vt
	v6xm0Q807qvlYw9KlItfTWXG8SE5QoA88QevZ79Ckq063+B+UFzvqoDGwSjHck7ARcKM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159344-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159344: all pass - PUSHED
X-Osstest-Versions-This:
    xen=04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
X-Osstest-Versions-That:
    xen=687121f8a0e7c1ea1c4fa3d056637e5819342f14
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Feb 2021 09:48:51 +0000

flight 159344 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159344/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  04085ec1ac05a362812e9b0c6b5a8713d7dc88ad
baseline version:
 xen                  687121f8a0e7c1ea1c4fa3d056637e5819342f14

Last test of basis   159197  2021-02-10 09:18:32 Z    4 days
Testing same since   159344  2021-02-14 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jukka Kaartinen <jukka.kaartinen@unikie.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
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
   687121f8a0..04085ec1ac  04085ec1ac05a362812e9b0c6b5a8713d7dc88ad -> coverity-tested/smoke

