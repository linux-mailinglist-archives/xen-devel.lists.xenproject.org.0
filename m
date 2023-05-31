Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1E7186DA
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 17:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541885.845116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4OBc-00079S-5C; Wed, 31 May 2023 15:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541885.845116; Wed, 31 May 2023 15:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4OBc-00077H-2M; Wed, 31 May 2023 15:56:32 +0000
Received: by outflank-mailman (input) for mailman id 541885;
 Wed, 31 May 2023 15:56:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4OBa-000777-JT; Wed, 31 May 2023 15:56:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4OBa-0008UG-8J; Wed, 31 May 2023 15:56:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4OBZ-0006Ex-PK; Wed, 31 May 2023 15:56:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4OBZ-0002Vq-Os; Wed, 31 May 2023 15:56:29 +0000
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
	bh=n/V8tbR3zDs1g0bC/KCjSJqBVmBKlL51dyPXPruZtf8=; b=aUJUf95slN+lJxAETMfGOMEHn2
	JiVr9UgrQMiofsrUVUEGodwGq97uREOWVUPahGKZw66pvbqUkH0Ch7faCp6kv2vNdP2XNyoseunR5
	kywqgJDWbO7QSuJsRjRaV8eMzDTXNtlhMt6XMV6uOQyp0BoGE1jiCF5ppx29OIFMpZ6Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181036-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181036: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0
X-Osstest-Versions-That:
    ovmf=d15d2667d58d40c0748919ac4b5771b875c0780b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 May 2023 15:56:29 +0000

flight 181036 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181036/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0
baseline version:
 ovmf                 d15d2667d58d40c0748919ac4b5771b875c0780b

Last test of basis   181028  2023-05-31 09:12:10 Z    0 days
Testing same since   181036  2023-05-31 13:10:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhihao Li <zhihao.li@intel.com>

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
   d15d2667d5..9f12d6b6ec  9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0 -> xen-tested-master

