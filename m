Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79D63A3E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 10:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448791.705347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozZzr-0007NC-HR; Mon, 28 Nov 2022 09:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448791.705347; Mon, 28 Nov 2022 09:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozZzr-0007K0-DV; Mon, 28 Nov 2022 09:00:15 +0000
Received: by outflank-mailman (input) for mailman id 448791;
 Mon, 28 Nov 2022 09:00:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozZzp-0007Jq-Hw; Mon, 28 Nov 2022 09:00:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozZzp-0002IS-G5; Mon, 28 Nov 2022 09:00:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozZzp-0002HD-3y; Mon, 28 Nov 2022 09:00:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ozZzp-000515-3V; Mon, 28 Nov 2022 09:00:13 +0000
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
	bh=Rs9NC+fGl3ic2JsQrc3EKCYBWYWSCCJuzG9cuwuHpEc=; b=vP0RAgk9pE5Idgr2grTG90tslR
	1vuzKtCMDIvPv+NB+q/TnDw1GWKRHzUPxT64PKy2446s9piLlcpeuhjU3aS247N0a8M1xyWI9LKcl
	BFxFkryrya0m4aEaCZ4ksXQXoW3sYRK6uvBNY3wjW79B1JGFN6Sv81NK0Uv+o/ttD1/w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174978-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174978: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=85d805ed3201de16c4dcbfc4b886a0d11ad5885c
X-Osstest-Versions-That:
    ovmf=6ae2b6648eb4b42b5a133f3cde567f9765467bf6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Nov 2022 09:00:13 +0000

flight 174978 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174978/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 85d805ed3201de16c4dcbfc4b886a0d11ad5885c
baseline version:
 ovmf                 6ae2b6648eb4b42b5a133f3cde567f9765467bf6

Last test of basis   174969  2022-11-26 15:13:18 Z    1 days
Testing same since   174978  2022-11-28 07:12:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  VictorX Hsu <victorx.hsu@intel.com>

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
   6ae2b6648e..85d805ed32  85d805ed3201de16c4dcbfc4b886a0d11ad5885c -> xen-tested-master

