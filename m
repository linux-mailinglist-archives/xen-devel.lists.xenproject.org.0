Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3A2EE90A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 23:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63134.112099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxe2e-0007a8-Tn; Thu, 07 Jan 2021 22:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63134.112099; Thu, 07 Jan 2021 22:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxe2e-0007Zj-QP; Thu, 07 Jan 2021 22:46:04 +0000
Received: by outflank-mailman (input) for mailman id 63134;
 Thu, 07 Jan 2021 22:46:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxe2d-0007Zb-Vp; Thu, 07 Jan 2021 22:46:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxe2d-0002vs-PB; Thu, 07 Jan 2021 22:46:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxe2d-0000GT-I0; Thu, 07 Jan 2021 22:46:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxe2d-00011w-HW; Thu, 07 Jan 2021 22:46:03 +0000
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
	bh=pbtZoFlh+V63YzlAko1KuwRAJ+c/+JDpFT5OdPcocVI=; b=BJX+W/6eGPM5Wig1QLChu7mJ7N
	Vp6uoW6xoPWRsImiXXsGoe0Y7fhgqYheA/rilgxYM2V+/s5khiMS8nLqEyQ0O8GmBFXkkaXU70k6S
	duJdqAe8EAAqEaZOYmQ8Xswc15rbV2h2eAyY9yhvZ8fvElXPuqOxCdO+9Ott7nNuF5Tk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158262-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158262: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=55ee36b0c490d9a6582e083bb3ac78a22d33053f
X-Osstest-Versions-That:
    ovmf=8015f3f6d4005d83bdd093bb4bffcef5be7ebaef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jan 2021 22:46:03 +0000

flight 158262 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158262/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 55ee36b0c490d9a6582e083bb3ac78a22d33053f
baseline version:
 ovmf                 8015f3f6d4005d83bdd093bb4bffcef5be7ebaef

Last test of basis   158260  2021-01-07 16:39:41 Z    0 days
Testing same since   158262  2021-01-07 18:44:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   8015f3f6d4..55ee36b0c4  55ee36b0c490d9a6582e083bb3ac78a22d33053f -> xen-tested-master

