Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8DA33EF5D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98644.187186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUBo-0001So-MI; Wed, 17 Mar 2021 11:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98644.187186; Wed, 17 Mar 2021 11:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUBo-0001SM-HK; Wed, 17 Mar 2021 11:18:12 +0000
Received: by outflank-mailman (input) for mailman id 98644;
 Wed, 17 Mar 2021 11:18:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMUBm-0001RT-Vr; Wed, 17 Mar 2021 11:18:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMUBm-0004bo-O1; Wed, 17 Mar 2021 11:18:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMUBm-00087y-Fs; Wed, 17 Mar 2021 11:18:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMUBm-00084k-FO; Wed, 17 Mar 2021 11:18:10 +0000
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
	bh=llIOs1agaojugFMmfmiGAFenmLjoNgOSnvi63b0eK3Q=; b=XZMsxi8TZsdNszNAieMs3JSu5T
	LH5jxgs3Nzl84EA7Khfl/YpueuqNXCT31Z3mFEpb39MxrH5i3rv941dLSpeKMXwz5ITgYRtwTnPlW
	m1HKlJzjyfSQskwUJpVbAaAAQ5mIDO8UsiiRrWHj+VYWTUbBpxZGj88zXGmWWVFZYne0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160110-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160110: regressions - ALL FAIL
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This:
    xen=21657ad4f01a634beac570c64c0691e51b9cf366
X-Osstest-Versions-That:
    xen=1b47cc852fd130ed9ce274a0f1600a4a62949a2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Mar 2021 11:18:10 +0000

flight 160110 xen-unstable-coverity real [real]
flight 160112 xen-unstable-coverity real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/160110/
http://logs.test-lab.xenproject.org/osstest/logs/160112/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 159907

version targeted for testing:
 xen                  21657ad4f01a634beac570c64c0691e51b9cf366
baseline version:
 xen                  1b47cc852fd130ed9ce274a0f1600a4a62949a2c

Last test of basis   159907  2021-03-10 09:18:33 Z    7 days
Failing since        160076  2021-03-14 09:18:27 Z    3 days    2 attempts
Testing same since   160110  2021-03-17 09:20:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Doug Goldstein <cardoe@cardoe.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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

(No revision log; it would be 389 lines long.)

