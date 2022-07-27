Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467158359C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 01:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376518.609368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGqQS-0005ty-Pr; Wed, 27 Jul 2022 23:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376518.609368; Wed, 27 Jul 2022 23:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGqQS-0005sA-N4; Wed, 27 Jul 2022 23:26:48 +0000
Received: by outflank-mailman (input) for mailman id 376518;
 Wed, 27 Jul 2022 23:26:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGqQQ-0005rb-UZ; Wed, 27 Jul 2022 23:26:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGqQQ-0001l7-Te; Wed, 27 Jul 2022 23:26:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGqQQ-000121-F9; Wed, 27 Jul 2022 23:26:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGqQQ-0005bw-Ek; Wed, 27 Jul 2022 23:26:46 +0000
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
	bh=xKbHlqPAVBbT9tW098Sx90cLVvT7oQ5asa7AY3SAMRE=; b=VEjsF3v95d6ppK6VS0P2PiqWLp
	sqsggd8DNwKi6HfLKQLSHw+IDjT4xND52SNBHcs1c5tg9usEqIFmz5sEB5QpGPDC/T3wR7Rdflixd
	HTvgU/cJms/hBYFhOahyyIcw1nygz9Hej9yhN3kojdHAQWStDeR9Cl2uYM3SdMM1vm60=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171889-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171889: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f26b70cb9f1367ceb25190ba2777631ee42c69fe
X-Osstest-Versions-That:
    ovmf=2677286307c67b62c198cf6890d62ec540dd8c99
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Jul 2022 23:26:46 +0000

flight 171889 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171889/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f26b70cb9f1367ceb25190ba2777631ee42c69fe
baseline version:
 ovmf                 2677286307c67b62c198cf6890d62ec540dd8c99

Last test of basis   171888  2022-07-27 17:10:40 Z    0 days
Testing same since   171889  2022-07-27 21:13:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Benjamin Doron <benjamin.doron00@gmail.com>

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
   2677286307..f26b70cb9f  f26b70cb9f1367ceb25190ba2777631ee42c69fe -> xen-tested-master

