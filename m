Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533E7DE537
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 18:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626566.976897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEsp-0008Tt-CP; Wed, 01 Nov 2023 17:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626566.976897; Wed, 01 Nov 2023 17:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEsp-0008RW-8u; Wed, 01 Nov 2023 17:19:59 +0000
Received: by outflank-mailman (input) for mailman id 626566;
 Wed, 01 Nov 2023 17:19:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qyEsn-0008RM-LB; Wed, 01 Nov 2023 17:19:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qyEsn-0007gx-E4; Wed, 01 Nov 2023 17:19:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qyEsn-0007Aw-0D; Wed, 01 Nov 2023 17:19:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qyEsm-00079x-Vy; Wed, 01 Nov 2023 17:19:56 +0000
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
	bh=PWdx50xTaBcQARwHFIq9PmUo4VpvStcdEm8EPIIkYzA=; b=1wdxIERqEq2Af4eCbnH9btjwB7
	s5b1khsVlwYCbfli+yKZiu/F0MxYjz5V7lUpDugDhetu+IysYkDzmgyIckW5ijpjge9d0o9wx3UtD
	neC1uD3QVHL3gvW1mDkrMHvPHWjCXiORHgtUJFIF1uUBLxXWFJknrckkUIXWoudG9RSE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183649-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183649: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fbbbd984998d83cf6b69e9291336aefbac23396c
X-Osstest-Versions-That:
    ovmf=1b1509abee839b74d3232bbd6a256a1bdc230925
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Nov 2023 17:19:56 +0000

flight 183649 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183649/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fbbbd984998d83cf6b69e9291336aefbac23396c
baseline version:
 ovmf                 1b1509abee839b74d3232bbd6a256a1bdc230925

Last test of basis   183646  2023-11-01 03:11:04 Z    0 days
Testing same since   183649  2023-11-01 15:41:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   1b1509abee..fbbbd98499  fbbbd984998d83cf6b69e9291336aefbac23396c -> xen-tested-master

