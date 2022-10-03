Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C45F3097
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 14:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414882.659305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofL1c-0000ZG-93; Mon, 03 Oct 2022 12:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414882.659305; Mon, 03 Oct 2022 12:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofL1c-0000XO-6E; Mon, 03 Oct 2022 12:58:24 +0000
Received: by outflank-mailman (input) for mailman id 414882;
 Mon, 03 Oct 2022 12:58:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofL1b-0000XE-Gs; Mon, 03 Oct 2022 12:58:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofL1b-0005OH-ER; Mon, 03 Oct 2022 12:58:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofL1a-00043D-Uz; Mon, 03 Oct 2022 12:58:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofL1a-00063z-UX; Mon, 03 Oct 2022 12:58:22 +0000
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
	bh=xJZw1GUw26Ki4ds8svaWynzw7bXMFOzVxGBZIFq1ju0=; b=nR9jsrIPqSgeoiTRsc1SbKkPpm
	bCxW00ssiyjkjUqYnaPRX8ftfBmEnd9DveD8cphmmn71bZaegUtyLfkLc5xea4UQ8aejWiC9cDqJa
	ekjiPB3i9l3AUwTgVXTCQgNmIAtS1Uexy8ZqJY7suZYJwPBGAKGAF7e9YtAuWxo4PPTA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173404-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 173404: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=5e770502e81e6bde08f55db6b0f66fbc1013850d
X-Osstest-Versions-That:
    xtf=37ea4e513a2ce0cd22f9c9a32b18d5c022e38e12
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 03 Oct 2022 12:58:22 +0000

flight 173404 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173404/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  5e770502e81e6bde08f55db6b0f66fbc1013850d
baseline version:
 xtf                  37ea4e513a2ce0cd22f9c9a32b18d5c022e38e12

Last test of basis   170789  2022-05-31 17:41:55 Z  124 days
Testing same since   173404  2022-10-03 12:13:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   37ea4e5..5e77050  5e770502e81e6bde08f55db6b0f66fbc1013850d -> xen-tested-master

