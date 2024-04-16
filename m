Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3CD8A6503
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 09:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706697.1104018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwd9c-0008Ah-Jk; Tue, 16 Apr 2024 07:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706697.1104018; Tue, 16 Apr 2024 07:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwd9c-00089G-Gz; Tue, 16 Apr 2024 07:22:56 +0000
Received: by outflank-mailman (input) for mailman id 706697;
 Tue, 16 Apr 2024 07:22:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwd9a-000896-W7; Tue, 16 Apr 2024 07:22:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwd9a-0000Rp-Ns; Tue, 16 Apr 2024 07:22:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwd9a-00054G-Gq; Tue, 16 Apr 2024 07:22:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwd9a-0006Jg-GI; Tue, 16 Apr 2024 07:22:54 +0000
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
	bh=C2ZJEuwD3zMAz/fRF3MOvD55eIw0e1yhsFg2pGtFNAk=; b=ouS8G2shKG39rGysuP2QIh5v8/
	RRW0rvTm4v2Hi3rhciAQhjGCVkT50f8VvL7QapSorTJDtLcSy5Y2+zeRVrqDSADTFVBO94m2DRhUs
	5mEBqQy3Qh5tPaCWDUhw/IN+VN0jR1E1Enb2RxXWkBOhs5QSjqgKk1zJqrHAVQOgnl7Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185643-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185643: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=70892b13b28cdb0a10c82f3d3aca560a38dce5c9
X-Osstest-Versions-That:
    ovmf=5ba3602e4580d6b65dacf4292a031627f93e1167
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2024 07:22:54 +0000

flight 185643 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185643/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 70892b13b28cdb0a10c82f3d3aca560a38dce5c9
baseline version:
 ovmf                 5ba3602e4580d6b65dacf4292a031627f93e1167

Last test of basis   185624  2024-04-15 20:11:06 Z    0 days
Testing same since   185643  2024-04-16 05:11:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   5ba3602e45..70892b13b2  70892b13b28cdb0a10c82f3d3aca560a38dce5c9 -> xen-tested-master

