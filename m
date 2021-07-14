Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CE3C826F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 12:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156010.287930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bo1-0006q8-Bz; Wed, 14 Jul 2021 10:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156010.287930; Wed, 14 Jul 2021 10:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bo1-0006ny-80; Wed, 14 Jul 2021 10:07:53 +0000
Received: by outflank-mailman (input) for mailman id 156010;
 Wed, 14 Jul 2021 10:07:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bnz-0006no-25; Wed, 14 Jul 2021 10:07:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-0002QJ-RK; Wed, 14 Jul 2021 10:07:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-00051b-Ja; Wed, 14 Jul 2021 10:07:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-0005PF-J2; Wed, 14 Jul 2021 10:07:50 +0000
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
	bh=in7jPKPNeiVXueRPU0N/OxdohKUNMFXYSbpjM+Cdvdg=; b=x5F2aEMKFY4w1mLYenyKUFPmXV
	R5ShCGvG/S0J5ybpAJ1SJ4wvpnsbYjg6X5TweIJpH2LKpkFqVtg0C9FLuw+2uEN1Zmd2dV2xZYzuT
	wWxZGKR50nm+LrwVEug2K6FZv0AwGBLCYvKIiuxDdit3KM0uLs6edGUvl3YZWOnz2c6A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163679: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3a98c1a4cec1a302beaddf944ded240b61173f87
X-Osstest-Versions-That:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Jul 2021 10:07:50 +0000

flight 163679 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163679/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3a98c1a4cec1a302beaddf944ded240b61173f87
baseline version:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf

Last test of basis   163562  2021-07-11 09:18:28 Z    3 days
Testing same since   163679  2021-07-14 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   6de3e5fce5..3a98c1a4ce  3a98c1a4cec1a302beaddf944ded240b61173f87 -> coverity-tested/smoke

