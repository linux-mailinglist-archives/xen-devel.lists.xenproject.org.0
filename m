Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E7B76D882
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 22:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575161.900973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIIm-0000Cn-PC; Wed, 02 Aug 2023 20:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575161.900973; Wed, 02 Aug 2023 20:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRIIm-00009e-MD; Wed, 02 Aug 2023 20:18:36 +0000
Received: by outflank-mailman (input) for mailman id 575161;
 Wed, 02 Aug 2023 20:18:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRIIl-00009S-TD; Wed, 02 Aug 2023 20:18:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRIIl-0004C0-Ro; Wed, 02 Aug 2023 20:18:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRIIl-0007Nt-Gu; Wed, 02 Aug 2023 20:18:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qRIIl-00064q-GQ; Wed, 02 Aug 2023 20:18:35 +0000
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
	bh=WW3CnyCo5oqE4S8av5AUU8E8WLCj6QoZaXb44jbsiGE=; b=0QW0tx8kkC798clXJAJBJ6Dgfv
	e0j6NRpKC+Hf266QHffuyj/Sh8zhfDElqVYC5blUWQB6NhlhQodlJWILLIueUnCKSiKKCjcVVQ6NR
	W9k7MkiicV2sEd8CUmgBGZcSIweLQSYiiYGEhY1rim+jveAm6HtoLI7+7XnoOVjsGivQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182121-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182121: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fa789cc68a85a5781c18c64b9112c779750b2125
X-Osstest-Versions-That:
    ovmf=5cadb8ce2148979b6c464f6da5a8cd97425c5165
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Aug 2023 20:18:35 +0000

flight 182121 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182121/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fa789cc68a85a5781c18c64b9112c779750b2125
baseline version:
 ovmf                 5cadb8ce2148979b6c464f6da5a8cd97425c5165

Last test of basis   182111  2023-08-02 08:42:38 Z    0 days
Testing same since   182121  2023-08-02 15:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>
  Joey Vagedes <joeyvagedes@gmail.com>

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
   5cadb8ce21..fa789cc68a  fa789cc68a85a5781c18c64b9112c779750b2125 -> xen-tested-master

