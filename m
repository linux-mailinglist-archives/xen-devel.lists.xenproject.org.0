Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5256F13FB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 11:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527215.819567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKJm-0006l3-A6; Fri, 28 Apr 2023 09:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527215.819567; Fri, 28 Apr 2023 09:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKJm-0006id-7K; Fri, 28 Apr 2023 09:23:06 +0000
Received: by outflank-mailman (input) for mailman id 527215;
 Fri, 28 Apr 2023 09:23:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psKJl-0006iT-Hv; Fri, 28 Apr 2023 09:23:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psKJl-00080C-9M; Fri, 28 Apr 2023 09:23:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psKJk-0002nj-UN; Fri, 28 Apr 2023 09:23:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psKJk-0005lK-Ts; Fri, 28 Apr 2023 09:23:04 +0000
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
	bh=UP3CF0w6rn/bV0QsoFth0J3hyoiylRQbcUvajhPJoNU=; b=Wk7FCO7Fi96II+dYqKRq6rqEq0
	dxboiUTgcjZWOciIw3RZsg5gyHaLTWwyVwRoMtjSOiicWu41nrUdDQMXZShjbMmohQo2PFWmtNXls
	ZRt3xTg1bu4lCaCpjihcPVomwJ1R+EABZqzMuZ9YCSdIZfHEbizNVmGMocCT0Lp5jtAM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180463-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180463: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=95ef765839a8d0de52095e3dec3584fc347b94b2
X-Osstest-Versions-That:
    ovmf=e5e1cd1a83e2e7aa2179db3de5fc00d76713ec6f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Apr 2023 09:23:04 +0000

flight 180463 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180463/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 95ef765839a8d0de52095e3dec3584fc347b94b2
baseline version:
 ovmf                 e5e1cd1a83e2e7aa2179db3de5fc00d76713ec6f

Last test of basis   180454  2023-04-27 22:12:22 Z    0 days
Testing same since   180463  2023-04-28 06:10:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BruceX Wang <brucex.wang@intel.com>

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
   e5e1cd1a83..95ef765839  95ef765839a8d0de52095e3dec3584fc347b94b2 -> xen-tested-master

