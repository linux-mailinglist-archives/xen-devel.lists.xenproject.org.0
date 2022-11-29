Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B163BA5E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 08:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449259.705920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozuml-00056Q-E2; Tue, 29 Nov 2022 07:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449259.705920; Tue, 29 Nov 2022 07:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozuml-00053w-Am; Tue, 29 Nov 2022 07:12:07 +0000
Received: by outflank-mailman (input) for mailman id 449259;
 Tue, 29 Nov 2022 07:12:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozumj-00053m-C0; Tue, 29 Nov 2022 07:12:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozumj-0006br-AO; Tue, 29 Nov 2022 07:12:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozumi-0001AU-WA; Tue, 29 Nov 2022 07:12:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ozumi-0007i5-Vj; Tue, 29 Nov 2022 07:12:04 +0000
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
	bh=AJ0HKeH9jBjobCO1hTFhUL+84oIH7umEFnxebFU/PLg=; b=Kc9dXO6+gFhkIPnalsq8gu/RLi
	dr6uqxC4VgyBOj3GCIuEgRatqcn6JzJyuWyRlf87b5tDNc6+vsZvYUlTRv6ZsGrzdB/l9/kMHBKD+
	3Fs6+SsXSQd1ZjFin1EeuJjXStkBw3UmKZIwo8dhFphspMKHTUZETcRH5uKXsLzV+VUw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174986-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174986: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c8c978d32882413eeaf2b9917409af83af68cb5d
X-Osstest-Versions-That:
    ovmf=ae3bc559f98e68983df0a4b223dad7afeb6eee2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Nov 2022 07:12:04 +0000

flight 174986 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174986/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c8c978d32882413eeaf2b9917409af83af68cb5d
baseline version:
 ovmf                 ae3bc559f98e68983df0a4b223dad7afeb6eee2c

Last test of basis   174983  2022-11-29 00:43:15 Z    0 days
Testing same since   174986  2022-11-29 04:42:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  zhenhuay <zhenhua.yang@intel.com>

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
   ae3bc559f9..c8c978d328  c8c978d32882413eeaf2b9917409af83af68cb5d -> xen-tested-master

