Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A892F40C32F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 12:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187434.336289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRhY-0008AY-41; Wed, 15 Sep 2021 09:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187434.336289; Wed, 15 Sep 2021 09:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRhY-00087W-01; Wed, 15 Sep 2021 09:59:36 +0000
Received: by outflank-mailman (input) for mailman id 187434;
 Wed, 15 Sep 2021 09:59:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQRhV-00087M-Nk; Wed, 15 Sep 2021 09:59:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQRhV-00030i-Jf; Wed, 15 Sep 2021 09:59:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQRhV-0003EF-BZ; Wed, 15 Sep 2021 09:59:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mQRhV-0004bq-B8; Wed, 15 Sep 2021 09:59:33 +0000
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
	bh=BJ8N+wvGN7xQPMtvn2byw9Nso/jluF76F5ucJy7afmg=; b=qfN5pvfHtcoRe6Hf/355odezBR
	eFOasBU0ruAlFzHkjvt/L9l3w/oKgsNt+Qsn+4JuXK6Cgwouzlr1/JhQLuqAx6v2o9gCsbfM1Od4K
	5IkYBs4gPExmtB6pV1BRwmSBywr8MRgzJMpOu67wmQFB2KHSvfsHm3gjUzpi1wW0nuVs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164994-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164994: all pass - PUSHED
X-Osstest-Versions-This:
    xen=487975df53b5298316b594550c79934d646701bd
X-Osstest-Versions-That:
    xen=6d45368a0a89e01a3a01d156af61fea565db96cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Sep 2021 09:59:33 +0000

flight 164994 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164994/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  487975df53b5298316b594550c79934d646701bd
baseline version:
 xen                  6d45368a0a89e01a3a01d156af61fea565db96cc

Last test of basis   164955  2021-09-12 09:19:39 Z    3 days
Testing same since   164994  2021-09-15 09:19:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   6d45368a0a..487975df53  487975df53b5298316b594550c79934d646701bd -> coverity-tested/smoke

