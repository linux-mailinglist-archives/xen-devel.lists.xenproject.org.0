Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9953BACA9
	for <lists+xen-devel@lfdr.de>; Sun,  4 Jul 2021 11:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149669.276857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzyuM-0005IJ-6Y; Sun, 04 Jul 2021 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149669.276857; Sun, 04 Jul 2021 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzyuM-0005Fn-2g; Sun, 04 Jul 2021 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 149669;
 Sun, 04 Jul 2021 09:59:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lzyuK-0005Fd-70; Sun, 04 Jul 2021 09:59:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lzyuJ-0001Vx-Vf; Sun, 04 Jul 2021 09:59:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lzyuJ-0002uv-M6; Sun, 04 Jul 2021 09:59:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lzyuJ-00020b-Lf; Sun, 04 Jul 2021 09:59:23 +0000
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
	bh=V/EigjgZn+tf/83AHSyx4rFygNlFfT+Y9bS6F0eTaN4=; b=Tl161iJnEMTx2j+mG2rIWCGsdD
	k5mgBSwrJIoxHydLb2X0kZrEQEbiYQKiV5Aatl5oe1SFwJdRslmeDLTOLeLKmGpWkyO8xusg3m2oV
	QPYaYlf83BV+gbN9rJwlwr5DoOvNDeLIPHKtUKKA4p7YX8HPntMxTSdTvHaBqC1Bqei8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163297: all pass - PUSHED
X-Osstest-Versions-This:
    xen=74d044d51b19bb697eac5c3deafa140f6afafec8
X-Osstest-Versions-That:
    xen=f95b7b37cfc6d4613721df9357090d14712013c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Jul 2021 09:59:23 +0000

flight 163297 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163297/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  74d044d51b19bb697eac5c3deafa140f6afafec8
baseline version:
 xen                  f95b7b37cfc6d4613721df9357090d14712013c0

Last test of basis   163196  2021-06-30 09:18:32 Z    4 days
Testing same since   163297  2021-07-04 09:20:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Olaf Hering <olaf@aepfle.de>

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
   f95b7b37cf..74d044d51b  74d044d51b19bb697eac5c3deafa140f6afafec8 -> coverity-tested/smoke

