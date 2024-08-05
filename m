Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F57947670
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 09:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771811.1182244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sasbg-0004v8-8T; Mon, 05 Aug 2024 07:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771811.1182244; Mon, 05 Aug 2024 07:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sasbg-0004sY-5m; Mon, 05 Aug 2024 07:58:16 +0000
Received: by outflank-mailman (input) for mailman id 771811;
 Mon, 05 Aug 2024 07:58:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sasbe-0004sO-QE; Mon, 05 Aug 2024 07:58:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sasbe-0002JI-GN; Mon, 05 Aug 2024 07:58:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sasbe-0006FS-1t; Mon, 05 Aug 2024 07:58:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sasbe-0001P2-1N; Mon, 05 Aug 2024 07:58:14 +0000
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
	bh=93DzS+6buU01KJjB5PTWikwkvL5K28tZrX64OZLlBZ0=; b=OL6xEcK82JQwYMtBGX7knqYZZs
	ZJ8KLPbjbQY76JcqasKohxNK9PYB8uTvUo1zDS3iYu0t5vDBaqkXxtTGtiIBsXPvnfJzILaWpEsbT
	GdIVUcuaQsU+ewHRxF38RcE2/yAtFCFSIeafP5bjs2bPwCUNHEnZ6rmj3eTLcq/kEc0o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187151-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187151: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=68b4c4b481f3129132cd90c45d241990445f4a3a
X-Osstest-Versions-That:
    ovmf=5ff99e0dabefea14b04e190c1659f4817fcb7bc0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Aug 2024 07:58:14 +0000

flight 187151 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187151/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 68b4c4b481f3129132cd90c45d241990445f4a3a
baseline version:
 ovmf                 5ff99e0dabefea14b04e190c1659f4817fcb7bc0

Last test of basis   187146  2024-08-04 11:13:58 Z    0 days
Testing same since   187151  2024-08-05 06:13:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   5ff99e0dab..68b4c4b481  68b4c4b481f3129132cd90c45d241990445f4a3a -> xen-tested-master

