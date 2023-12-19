Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACE81877A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 13:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656769.1025193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZDy-0006bw-5y; Tue, 19 Dec 2023 12:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656769.1025193; Tue, 19 Dec 2023 12:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZDy-0006Ys-38; Tue, 19 Dec 2023 12:29:26 +0000
Received: by outflank-mailman (input) for mailman id 656769;
 Tue, 19 Dec 2023 12:29:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFZDw-0006Yi-9t; Tue, 19 Dec 2023 12:29:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFZDw-0000R0-44; Tue, 19 Dec 2023 12:29:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFZDv-0004N8-LJ; Tue, 19 Dec 2023 12:29:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFZDv-0000vr-Kj; Tue, 19 Dec 2023 12:29:23 +0000
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
	bh=q8Bgrk6dNDvcBdMEpzDDUnT8lUndcWHSBUsmwfD5Qtg=; b=HZdUk76FEuK1p3rVzqMtolgW63
	4I+fEFZdKdeyp7HxwtThYetVvhA+s6kY8Ek2lvAJT4J0wH1g4yR7UTCyGKnbU4ibUOHzFVL1yDOMJ
	iEcJ+5gHwE9DbJDV6hEQ3p5bID1Dq85CkA9efIDCtpVYFyVL1fFmWnGPvIsHIgSq83aA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184173-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184173: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c66390e4a514dcce4c8cc82f489d653d55ee3fa
X-Osstest-Versions-That:
    ovmf=74daeded0cabe87d26546f07f9a3911cb60ec0e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Dec 2023 12:29:23 +0000

flight 184173 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184173/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c66390e4a514dcce4c8cc82f489d653d55ee3fa
baseline version:
 ovmf                 74daeded0cabe87d26546f07f9a3911cb60ec0e1

Last test of basis   184163  2023-12-18 06:42:51 Z    1 days
Testing same since   184173  2023-12-19 09:44:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wei6 Xu <wei6.xu@intel.com>

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
   74daeded0c..3c66390e4a  3c66390e4a514dcce4c8cc82f489d653d55ee3fa -> xen-tested-master

