Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175C681AAD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 20:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487188.754730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZzn-0007XL-Cg; Mon, 30 Jan 2023 19:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487188.754730; Mon, 30 Jan 2023 19:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZzn-0007UT-9I; Mon, 30 Jan 2023 19:39:15 +0000
Received: by outflank-mailman (input) for mailman id 487188;
 Mon, 30 Jan 2023 19:39:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMZzm-0007UJ-2v; Mon, 30 Jan 2023 19:39:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMZzm-0002LW-1n; Mon, 30 Jan 2023 19:39:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMZzl-0002z2-IW; Mon, 30 Jan 2023 19:39:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pMZzl-0004fS-I0; Mon, 30 Jan 2023 19:39:13 +0000
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
	bh=/u7ylizqTY5u434PH6RaAZawvp80DlX5LzKchcNE81A=; b=5I+3WsilrNjFf4KiMirOC/au14
	vUm2jBGZ1LbhB1I3+Q2/HqUpRJvnB+mlTbrlACa7tWDnOggpLAz5M4UpV7hoczZcUy9rO1gdQVo1I
	POFP79DGNJORDVzVZoeRlL1ySbTbrCmCmZa8k/bP16ugW199NCAhadr5hdBjFo8XNK0s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176282-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176282: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c59230bce1c6973af4190b418971c1d008340cc4
X-Osstest-Versions-That:
    ovmf=4b384c21ad02fbf5eda25a1516cc72fa66b150f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Jan 2023 19:39:13 +0000

flight 176282 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176282/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c59230bce1c6973af4190b418971c1d008340cc4
baseline version:
 ovmf                 4b384c21ad02fbf5eda25a1516cc72fa66b150f6

Last test of basis   176280  2023-01-30 14:12:12 Z    0 days
Testing same since   176282  2023-01-30 17:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Bob Feng <bob.c.feng@intel.com>
  Rebecca Cran <rebecca@bsdio.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   4b384c21ad..c59230bce1  c59230bce1c6973af4190b418971c1d008340cc4 -> xen-tested-master

