Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF107FB2C4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 08:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642755.1002444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7sZB-0005sv-Hu; Tue, 28 Nov 2023 07:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642755.1002444; Tue, 28 Nov 2023 07:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7sZB-0005rJ-EQ; Tue, 28 Nov 2023 07:31:33 +0000
Received: by outflank-mailman (input) for mailman id 642755;
 Tue, 28 Nov 2023 07:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7sZA-0005r8-BY; Tue, 28 Nov 2023 07:31:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7sZA-0001WL-6P; Tue, 28 Nov 2023 07:31:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7sZ9-0003PR-Sj; Tue, 28 Nov 2023 07:31:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r7sZ9-0007Yj-SJ; Tue, 28 Nov 2023 07:31:31 +0000
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
	bh=qHvvJDxKPGOFf4FUqX6fRlIpj6wy7Pa1QmzjB7AiNRQ=; b=MtLYUcKte5ZIDDyWfnBfablky1
	Rfv0TwNPTExXDaJ19xt5hdX4p+RvMBPIa8tgbPQnlw6kbAp6sw8gXS4zA/Y2NQactdK/ot9NaiYeu
	+YWPY+3QJ0U2iJ333XXKhLoK/w/pj2rTc728l4SmgDcwm5QGgMYpfW/4ovRxg5GP1LHc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183879-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183879: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e9ce9146a6dc50a35488e3a4a7a2a4bbaf1eb1c
X-Osstest-Versions-That:
    ovmf=8736b8fdca85e02933cdb0a13309de14c9799ece
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 07:31:31 +0000

flight 183879 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183879/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e9ce9146a6dc50a35488e3a4a7a2a4bbaf1eb1c
baseline version:
 ovmf                 8736b8fdca85e02933cdb0a13309de14c9799ece

Last test of basis   183825  2023-11-22 13:41:06 Z    5 days
Failing since        183867  2023-11-27 05:41:07 Z    1 days    4 attempts
Testing same since   183875  2023-11-27 20:41:05 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Taylor Beebe <taylor.d.beebe@gmail.com>
  xieyuanh <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   8736b8fdca..0e9ce9146a  0e9ce9146a6dc50a35488e3a4a7a2a4bbaf1eb1c -> xen-tested-master

