Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF596A41C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 18:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789425.1199039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slWFc-0003tV-6t; Tue, 03 Sep 2024 16:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789425.1199039; Tue, 03 Sep 2024 16:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slWFc-0003qv-3z; Tue, 03 Sep 2024 16:19:28 +0000
Received: by outflank-mailman (input) for mailman id 789425;
 Tue, 03 Sep 2024 16:19:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slWFb-0003ql-0P; Tue, 03 Sep 2024 16:19:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slWFa-0000kj-KV; Tue, 03 Sep 2024 16:19:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slWFa-0004jz-69; Tue, 03 Sep 2024 16:19:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slWFa-0000AC-5f; Tue, 03 Sep 2024 16:19:26 +0000
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
	bh=uo1FzEcPeJHNLqY/q9UxnYcIctx7S6mDXdwlNdm1DSM=; b=2FkhIjIFbHo/fqUsuVXbRkLqhN
	XjNHE8CBs8uWzxoafvmRgtoMBST1OLkD0toBEgPfO22DNHeUlrpK3tH3XesCgAGtweANj3bTRSh2V
	86+33HdYr0l+c5Hb0U3v2FagHYqVVvWb5336xbsp7r9Is3weNanBux/gI1kh+/JnRDsQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187475-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187475: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e48acc0fa98e307b1192037062f4623da3eeeb7f
X-Osstest-Versions-That:
    ovmf=72cf76868ce7b7cda1ba5f9eb28693557ff10256
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 16:19:26 +0000

flight 187475 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187475/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e48acc0fa98e307b1192037062f4623da3eeeb7f
baseline version:
 ovmf                 72cf76868ce7b7cda1ba5f9eb28693557ff10256

Last test of basis   187468  2024-09-03 07:11:31 Z    0 days
Testing same since   187475  2024-09-03 14:45:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Zhao <jason.zhao@intel.com>

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
   72cf76868c..e48acc0fa9  e48acc0fa98e307b1192037062f4623da3eeeb7f -> xen-tested-master

