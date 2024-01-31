Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF458434DB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 05:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673734.1048214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV2Ji-0005m8-QI; Wed, 31 Jan 2024 04:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673734.1048214; Wed, 31 Jan 2024 04:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV2Ji-0005jo-ND; Wed, 31 Jan 2024 04:35:18 +0000
Received: by outflank-mailman (input) for mailman id 673734;
 Wed, 31 Jan 2024 04:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV2Jh-0005je-1I; Wed, 31 Jan 2024 04:35:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV2Jg-0002zs-UI; Wed, 31 Jan 2024 04:35:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rV2Jg-00083S-FO; Wed, 31 Jan 2024 04:35:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rV2Jg-0005Vo-Ej; Wed, 31 Jan 2024 04:35:16 +0000
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
	bh=Zg3PDA/SHKN5qSC6oXvK/roDPedg3tNxdjmL8IvuA+A=; b=zly8w6HzfI5XsGZW3EdBgdU64Q
	t1EqzQOz9XuPPe6AAM35XQHRm62WLNvdqluqbJyBTGsMFxkw3PO6prUy41SW2HJY7yDL4Qp/RFvth
	UZKhiGGgdAU+G/mehAFELZIK0SSvVCITdF1kQXkD+T+17LoKcgrX6aCPQKXc+gIMrmx8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184533-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184533: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=909a9a5ae4b8236c1ca7cad7f214c752a579bd67
X-Osstest-Versions-That:
    ovmf=98c7cb3be73d0f15151133abe91bc880a4400794
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jan 2024 04:35:16 +0000

flight 184533 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184533/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 909a9a5ae4b8236c1ca7cad7f214c752a579bd67
baseline version:
 ovmf                 98c7cb3be73d0f15151133abe91bc880a4400794

Last test of basis   184522  2024-01-29 22:12:44 Z    1 days
Testing same since   184533  2024-01-30 15:12:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@os.amperecomputing.com>

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
   98c7cb3be7..909a9a5ae4  909a9a5ae4b8236c1ca7cad7f214c752a579bd67 -> xen-tested-master

