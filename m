Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B624A3579
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 10:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262459.454704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE6rU-0000AD-K6; Sun, 30 Jan 2022 09:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262459.454704; Sun, 30 Jan 2022 09:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE6rU-00006g-Gi; Sun, 30 Jan 2022 09:51:08 +0000
Received: by outflank-mailman (input) for mailman id 262459;
 Sun, 30 Jan 2022 09:51:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nE6rT-00006V-5M; Sun, 30 Jan 2022 09:51:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nE6rT-0002EH-3V; Sun, 30 Jan 2022 09:51:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nE6rS-0000tl-Lc; Sun, 30 Jan 2022 09:51:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nE6rS-0005I6-LD; Sun, 30 Jan 2022 09:51:06 +0000
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
	bh=qkIgQa2aaDe4OS+c1j0e6m2X+n1ZEypruf7T4j+vCiU=; b=Mh2bXFexwKQF2yUBKwq06m+8lI
	p0sNRsAEF74p12uf3WlKHEyMCuSMzqSvxzs5SPWLaMIgP/14AzwJN9qUz39cjld8ZTMUhXCE/xS/x
	FJJPdfK92hMQJTEcMWWnYHxCI+WD07tc5MuNFhgJes2if0GT2w/TEaB8bLqVcY2hcSFI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167953-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167953: all pass - PUSHED
X-Osstest-Versions-This:
    xen=21170a738c11b24815b4afab2151bd3aa2a29acc
X-Osstest-Versions-That:
    xen=9480a1a519cf016623f657dc544cb372a82b5708
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 30 Jan 2022 09:51:06 +0000

flight 167953 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167953/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  21170a738c11b24815b4afab2151bd3aa2a29acc
baseline version:
 xen                  9480a1a519cf016623f657dc544cb372a82b5708

Last test of basis   167855  2022-01-26 09:18:33 Z    4 days
Testing same since   167953  2022-01-30 09:20:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  James Dingwall <james-xen@dingwall.me.uk>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
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
   9480a1a519..21170a738c  21170a738c11b24815b4afab2151bd3aa2a29acc -> coverity-tested/smoke

