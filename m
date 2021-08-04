Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A33DFE69
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 11:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163696.299796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBDYh-0002dd-0E; Wed, 04 Aug 2021 09:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163696.299796; Wed, 04 Aug 2021 09:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBDYg-0002bf-Qp; Wed, 04 Aug 2021 09:51:30 +0000
Received: by outflank-mailman (input) for mailman id 163696;
 Wed, 04 Aug 2021 09:51:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBDYf-0002bV-QC; Wed, 04 Aug 2021 09:51:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBDYf-0005eQ-HF; Wed, 04 Aug 2021 09:51:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBDYf-0002DU-9h; Wed, 04 Aug 2021 09:51:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mBDYf-0003HD-9G; Wed, 04 Aug 2021 09:51:29 +0000
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
	bh=0rinA3pL9OCVqUr+63QHg9SfgF9Y5TAgPl4Zg1I28qE=; b=0uE+INixD4cDgg2qWNiHFFY7ON
	460P6K+u0+DLBQa1LsRPGlw8XdFZTA2VpGuz/0jnlYMovrNLv7oTvpfSAszN2JLZtp7MNtyOcWgKW
	IDxAaSxR0rPNrD9nqfLC86L/bO3FQBsryDB8Gk/RyZSfg7MjyBrRcFi4VxOWGiS3t5IM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164101-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164101: all pass - PUSHED
X-Osstest-Versions-This:
    xen=2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
X-Osstest-Versions-That:
    xen=e066ca5acc2ee3b5db5c005e1a548b05e753e07d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Aug 2021 09:51:29 +0000

flight 164101 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164101/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
baseline version:
 xen                  e066ca5acc2ee3b5db5c005e1a548b05e753e07d

Last test of basis   164072  2021-08-01 09:19:40 Z    3 days
Testing same since   164101  2021-08-04 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brian Woods <brian.woods@xilinx.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
   e066ca5acc..2278d2cbb0  2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928 -> coverity-tested/smoke

