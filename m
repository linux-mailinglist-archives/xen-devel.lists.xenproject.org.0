Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8592F6CA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 10:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757818.1166951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSBTW-0001kR-Q5; Fri, 12 Jul 2024 08:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757818.1166951; Fri, 12 Jul 2024 08:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSBTW-0001iB-Mt; Fri, 12 Jul 2024 08:17:54 +0000
Received: by outflank-mailman (input) for mailman id 757818;
 Fri, 12 Jul 2024 08:17:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sSBTV-0001i1-UW; Fri, 12 Jul 2024 08:17:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sSBTV-0005ua-T0; Fri, 12 Jul 2024 08:17:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sSBTV-0006Hw-HU; Fri, 12 Jul 2024 08:17:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sSBTV-000675-H5; Fri, 12 Jul 2024 08:17:53 +0000
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
	bh=DE3pmMAdJ/wGbFknXwpmGDO4+kdtUqDxCjhMt/VxaUA=; b=Xlxo/sCvLYpMsK39e7CrRk7KLm
	7F3s3+6RJ+KuOlBhO204vkeVkQZE1wUIFX9KBeSaltaAetswMHUVa2y/5hdGQ4RTjUYN1NDtCoyhl
	bPe3vFEceF5lkqLZQOuQURwRhmCkrNDuAzBJ40nGAG86GmgsoZ/MDpkITLUl/c6TCDcE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186774-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186774: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2e7230f1ba65e0ec9e6a3e191cca3a8b04e22ca8
X-Osstest-Versions-That:
    ovmf=72d6e247b781cca65aac71c97c5094650b003a9d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jul 2024 08:17:53 +0000

flight 186774 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186774/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2e7230f1ba65e0ec9e6a3e191cca3a8b04e22ca8
baseline version:
 ovmf                 72d6e247b781cca65aac71c97c5094650b003a9d

Last test of basis   186772  2024-07-12 04:11:24 Z    0 days
Testing same since   186774  2024-07-12 06:44:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Awiral Shrivastava <awiral.shrivastava@intel.com>

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
   72d6e247b7..2e7230f1ba  2e7230f1ba65e0ec9e6a3e191cca3a8b04e22ca8 -> xen-tested-master

