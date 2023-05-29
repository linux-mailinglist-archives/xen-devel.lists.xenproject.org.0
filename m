Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931687150BF
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 22:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540699.842632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3jtO-0006uA-BF; Mon, 29 May 2023 20:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540699.842632; Mon, 29 May 2023 20:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3jtO-0006rm-7k; Mon, 29 May 2023 20:55:02 +0000
Received: by outflank-mailman (input) for mailman id 540699;
 Mon, 29 May 2023 20:55:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3jtM-0006rc-1T; Mon, 29 May 2023 20:55:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3jtL-0001Mw-IQ; Mon, 29 May 2023 20:54:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3jtL-0003Js-5o; Mon, 29 May 2023 20:54:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q3jtL-0003tf-5J; Mon, 29 May 2023 20:54:59 +0000
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
	bh=xlPZzT12CfL0DJmP9EQiurD2i+HxFPmgptGG5OcNsx8=; b=IVyJCg1vsonFzS2r6le1rnd2kz
	E40c/Z3kCUIVEWuzZz1BjnwBuyrRH/cSykFiPv126XwVDcQzILkdgRQS+EHiOpq8xwWgM2bKgmmoK
	EpjaETel0uQKuuBVBiAJoORMGHZ9tGU2wM3/N634hQfTq+4oap4LyiJpqbmV6PWBuVeU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181004: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1034d223f8cc6bf8b9b86c57e564753cdad46f88
X-Osstest-Versions-That:
    ovmf=8e934ab9562a33191af21ce3babf1ad37a3cdc34
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 May 2023 20:54:59 +0000

flight 181004 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181004/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1034d223f8cc6bf8b9b86c57e564753cdad46f88
baseline version:
 ovmf                 8e934ab9562a33191af21ce3babf1ad37a3cdc34

Last test of basis   181001  2023-05-29 15:42:05 Z    0 days
Testing same since   181004  2023-05-29 18:15:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   8e934ab956..1034d223f8  1034d223f8cc6bf8b9b86c57e564753cdad46f88 -> xen-tested-master

