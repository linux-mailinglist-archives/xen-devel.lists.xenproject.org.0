Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782B3271DE
	for <lists+xen-devel@lfdr.de>; Sun, 28 Feb 2021 11:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91044.172182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGJ9t-0000x8-4B; Sun, 28 Feb 2021 10:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91044.172182; Sun, 28 Feb 2021 10:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGJ9t-0000wf-0b; Sun, 28 Feb 2021 10:18:41 +0000
Received: by outflank-mailman (input) for mailman id 91044;
 Sun, 28 Feb 2021 10:18:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGJ9r-0000wX-GU; Sun, 28 Feb 2021 10:18:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGJ9r-00061B-Bu; Sun, 28 Feb 2021 10:18:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lGJ9r-0000u6-1q; Sun, 28 Feb 2021 10:18:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lGJ9r-0005db-1L; Sun, 28 Feb 2021 10:18:39 +0000
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
	bh=bWQNK+0eyJiECO2uemznfzQWSV7iHH7r80SPI/o9RNk=; b=t6nd6TYa90qZnh0qAGHzQHLIT2
	1HsRrOsrL369vSCDPPdkXILm7vdRf9UNvh5IPQJA2CCqcM/+zoIWmCD1OcToGofAL+3OPfGZ4wud4
	d7NQlIuSzXkKMKPkRFAMCetcDGhd1f0POBpFd8IRMnUW6ShK8lrgffIXBuo9g3N1Nxf4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159783-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159783: all pass - PUSHED
X-Osstest-Versions-This:
    xen=c4441ab1f1d506a942002ccc55fdde2fe30ef626
X-Osstest-Versions-That:
    xen=5d94433a66df29ce314696a13bdd324ec0e342fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Feb 2021 10:18:39 +0000

flight 159783 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159783/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  c4441ab1f1d506a942002ccc55fdde2fe30ef626
baseline version:
 xen                  5d94433a66df29ce314696a13bdd324ec0e342fe

Last test of basis   159620  2021-02-24 09:19:25 Z    4 days
Testing same since   159783  2021-02-28 09:19:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   5d94433a66..c4441ab1f1  c4441ab1f1d506a942002ccc55fdde2fe30ef626 -> coverity-tested/smoke

