Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A967DFC9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 10:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485367.752539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLKnK-0006Xw-Jn; Fri, 27 Jan 2023 09:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485367.752539; Fri, 27 Jan 2023 09:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLKnK-0006Ux-GL; Fri, 27 Jan 2023 09:13:14 +0000
Received: by outflank-mailman (input) for mailman id 485367;
 Fri, 27 Jan 2023 09:13:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLKnJ-0006Un-8G; Fri, 27 Jan 2023 09:13:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLKnJ-0007IQ-5N; Fri, 27 Jan 2023 09:13:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLKnI-0004qw-NZ; Fri, 27 Jan 2023 09:13:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLKnI-0003zd-N4; Fri, 27 Jan 2023 09:13:12 +0000
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
	bh=E48k8rRtupaBL+QxXvUmkqQh2S/0WKFsjgFR6BwtAO4=; b=ktE3uP8jFT3GYUjmAVCUsNQqaE
	dP8DURgO7YZ6s3zHKZ8rgYa8mnd4Y6Dk7zxMhV0KVXzFFYwLRLdSoO0tg53zDot0HLe27t/aPpwhR
	jihmzPX4ObdIukmoh52RDHOAmB54YSwHq5zaZ/PwHFHAoU2GMi8mw33d3hNlgL8zqErw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176232: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0d129ef7c3a95d64f2f2cab4f8302318775f9933
X-Osstest-Versions-That:
    ovmf=ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 09:13:12 +0000

flight 176232 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0d129ef7c3a95d64f2f2cab4f8302318775f9933
baseline version:
 ovmf                 ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4

Last test of basis   176225  2023-01-26 22:14:24 Z    0 days
Testing same since   176232  2023-01-27 04:15:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dionna Glaze <dionnaglaze@google.com>

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
   ca573b8615..0d129ef7c3  0d129ef7c3a95d64f2f2cab4f8302318775f9933 -> xen-tested-master

