Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8E44F75F
	for <lists+xen-devel@lfdr.de>; Sun, 14 Nov 2021 10:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225570.389560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmCEo-0003LI-5a; Sun, 14 Nov 2021 09:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225570.389560; Sun, 14 Nov 2021 09:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmCEo-0003Hp-1q; Sun, 14 Nov 2021 09:55:50 +0000
Received: by outflank-mailman (input) for mailman id 225570;
 Sun, 14 Nov 2021 09:55:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mmCEm-0003Hf-DN; Sun, 14 Nov 2021 09:55:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mmCEm-0002Fb-A1; Sun, 14 Nov 2021 09:55:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mmCEm-0007aO-1X; Sun, 14 Nov 2021 09:55:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mmCEm-00061H-11; Sun, 14 Nov 2021 09:55:48 +0000
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
	bh=iL4N/LQDC3G4t6bEM8ldslQ7aiuXgzcb8vAUtpmc3ZU=; b=Y6zue37Po2pZXz75D3up2ySF0b
	AeWUUI0cfIVzun0l8fTlKxcBs5ED1qyQToreu2PAYJtV/bmqhhSHqkex+sQ6yZ6JD//14v2Z8FFI6
	+MwlRPut0IeJNHYHwMMh7jvLqtgMAuVYaAFs/5CXISj3QRZC7HpgCesDhdk63h6cF5ME=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166145-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166145: all pass - PUSHED
X-Osstest-Versions-This:
    xen=c7a7f14b92991e7d79735bff95f04676b9af34c6
X-Osstest-Versions-That:
    xen=9d9cd0c6f5b16652f61e7f21233ec8dfd6cf7df2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Nov 2021 09:55:48 +0000

flight 166145 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166145/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  c7a7f14b92991e7d79735bff95f04676b9af34c6
baseline version:
 xen                  9d9cd0c6f5b16652f61e7f21233ec8dfd6cf7df2

Last test of basis   166107  2021-11-10 09:19:41 Z    4 days
Testing same since   166145  2021-11-14 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   9d9cd0c6f5..c7a7f14b92  c7a7f14b92991e7d79735bff95f04676b9af34c6 -> coverity-tested/smoke

