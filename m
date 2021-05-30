Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B032395067
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 12:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134268.249891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnIXP-0007xs-Kk; Sun, 30 May 2021 10:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134268.249891; Sun, 30 May 2021 10:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnIXP-0007vA-HG; Sun, 30 May 2021 10:19:19 +0000
Received: by outflank-mailman (input) for mailman id 134268;
 Sun, 30 May 2021 10:19:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lnIXO-0007v0-Pa; Sun, 30 May 2021 10:19:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lnIXO-00088d-HE; Sun, 30 May 2021 10:19:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lnIXO-0002Vy-8T; Sun, 30 May 2021 10:19:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lnIXO-000059-7u; Sun, 30 May 2021 10:19:18 +0000
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
	bh=UIjazsDUxpvVPdlogBgfcYwSR5z1AabvaZxDW3xX7wI=; b=sHEzyOtQ79UqRGlh9/u+bauFGX
	ckdd8wsYBmguY/MtAyG9QEcVjo6KtE6Gcppt3mqwOw3+8ciwWmLO0qkk6N4tVvD5Pv8evw1SKdFCJ
	TTBJKcrsyI+uc6akvONI2GCLFCDT4Kd8YCQgviZtWK38aC/Eov1LZ5KMHcgPc7n2EpLA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162265-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162265: all pass - PUSHED
X-Osstest-Versions-This:
    xen=683d899e4bffca35c5b192ea0662362b0270a695
X-Osstest-Versions-That:
    xen=3092006fc4e096a7eebb8042cb76d82b09ccece4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 30 May 2021 10:19:18 +0000

flight 162265 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162265/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  683d899e4bffca35c5b192ea0662362b0270a695
baseline version:
 xen                  3092006fc4e096a7eebb8042cb76d82b09ccece4

Last test of basis   162163  2021-05-26 09:18:28 Z    4 days
Testing same since   162265  2021-05-30 09:19:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Connor Davis <connojdavis@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roger Pau Monné <rogerpau@citrix.com>
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
   3092006fc4..683d899e4b  683d899e4bffca35c5b192ea0662362b0270a695 -> coverity-tested/smoke

