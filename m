Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B4836453
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669876.1042347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuCs-0005S1-Az; Mon, 22 Jan 2024 13:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669876.1042347; Mon, 22 Jan 2024 13:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuCs-0005Pf-6O; Mon, 22 Jan 2024 13:19:18 +0000
Received: by outflank-mailman (input) for mailman id 669876;
 Mon, 22 Jan 2024 13:19:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRuCr-0005PV-74; Mon, 22 Jan 2024 13:19:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRuCr-0007Dq-0P; Mon, 22 Jan 2024 13:19:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRuCq-0001rA-IA; Mon, 22 Jan 2024 13:19:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rRuCq-0008QQ-Hg; Mon, 22 Jan 2024 13:19:16 +0000
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
	bh=+e4BCi74RzVxfDSE0n/83iVaEG9LZgBgCSq70/T2N7g=; b=IFPk18WONpWQNki4zm4hTX1WvP
	/Im/GESbOOAd6hC6edpI/GuuQSgkFcaUOrWkMsznqtUWF6500cafO8kW8APRp19f7ZBgU1qd1NEmv
	d2DbRMhwEuKpRo6KAWnCW5TjDHRg6LNYqJaXIEHwgEhHvTCT2Mv2Mg8IDikiOdEWZy1Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184423-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184423: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0b09397dfa0123b9a27c2c52fd2ddafd7a902137
X-Osstest-Versions-That:
    ovmf=0c6d29be8b1731ff6880d59e0189184395e45968
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Jan 2024 13:19:16 +0000

flight 184423 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184423/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0b09397dfa0123b9a27c2c52fd2ddafd7a902137
baseline version:
 ovmf                 0c6d29be8b1731ff6880d59e0189184395e45968

Last test of basis   184421  2024-01-22 03:11:07 Z    0 days
Testing same since   184423  2024-01-22 11:14:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Patrick Rudolph <patrick.rudolph@9elements.com>

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
   0c6d29be8b..0b09397dfa  0b09397dfa0123b9a27c2c52fd2ddafd7a902137 -> xen-tested-master

