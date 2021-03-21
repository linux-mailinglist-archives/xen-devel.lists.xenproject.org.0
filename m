Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6534328D
	for <lists+xen-devel@lfdr.de>; Sun, 21 Mar 2021 13:41:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99704.189571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNxNP-0007Cw-FG; Sun, 21 Mar 2021 12:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99704.189571; Sun, 21 Mar 2021 12:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNxNP-0007CS-Bj; Sun, 21 Mar 2021 12:40:15 +0000
Received: by outflank-mailman (input) for mailman id 99704;
 Sun, 21 Mar 2021 12:40:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNxNN-0007CK-Fs; Sun, 21 Mar 2021 12:40:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNxNN-0008LL-7p; Sun, 21 Mar 2021 12:40:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNxNM-0002oa-Tm; Sun, 21 Mar 2021 12:40:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lNxNM-0000pf-TF; Sun, 21 Mar 2021 12:40:12 +0000
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
	bh=o5U2T0Zo8s9ApZ5BXytKS0Nos3Pa95GUTzIZ843bJ10=; b=L0ZHTeHLPZz86nYTWSaMz1LT9w
	qqE8xqukw3hD1w/4U/MoYZkp+jWoYsipszMcXVsLCRP44N3OHGe4bhh9kMZMaQ2LnCif/LGAaOh/W
	BvYwwzckpZxL+hmGzGF3hV/Td6xUZ7kT0H61tJ7+8wYu1JvEjMWa9Hzbpu+f5HappEZI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160171-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160171: regressions - ALL FAIL
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This:
    xen=dae3c3e8b257cd27d6b35a467a34bf79a6650340
X-Osstest-Versions-That:
    xen=1b47cc852fd130ed9ce274a0f1600a4a62949a2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Mar 2021 12:40:12 +0000

flight 160171 xen-unstable-coverity real [real]
flight 160177 xen-unstable-coverity real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/160171/
http://logs.test-lab.xenproject.org/osstest/logs/160177/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 159907

version targeted for testing:
 xen                  dae3c3e8b257cd27d6b35a467a34bf79a6650340
baseline version:
 xen                  1b47cc852fd130ed9ce274a0f1600a4a62949a2c

Last test of basis   159907  2021-03-10 09:18:33 Z   11 days
Failing since        160076  2021-03-14 09:18:27 Z    7 days    3 attempts
Testing same since   160171  2021-03-21 09:19:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Doug Goldstein <cardoe@cardoe.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               fail    


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


Not pushing.

(No revision log; it would be 412 lines long.)

