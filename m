Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DE7AAF65
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 12:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606816.944865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjdKR-0005ZT-Uv; Fri, 22 Sep 2023 10:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606816.944865; Fri, 22 Sep 2023 10:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjdKR-0005Wr-Rf; Fri, 22 Sep 2023 10:24:07 +0000
Received: by outflank-mailman (input) for mailman id 606816;
 Fri, 22 Sep 2023 10:24:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjdKQ-0005Wf-DE; Fri, 22 Sep 2023 10:24:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjdKQ-0005tH-4A; Fri, 22 Sep 2023 10:24:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjdKP-0006Mp-KV; Fri, 22 Sep 2023 10:24:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qjdKP-00007G-K3; Fri, 22 Sep 2023 10:24:05 +0000
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
	bh=7tPA9rGSKrgQGMw+JO0Dk8Z/ppgcitz0XQ92bPY5ngk=; b=R9diy3/eoMqqGLXdQ4VjKaNfq0
	oifeOyoe4+mCxGyaXj0OX5D07pUiQXIAomahQnKuPvG0Ewv7dIpCjzc7ZGj/iY2foyYfbmx3uEake
	P0lEWsHdMwbzOZ0TLYzXuootON14eJ6Tss6DAyxvih4KCITrd8jOju/8uv68UeQ9OQDM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=28a267af4024c329e58121ccd9bf5f4f7aabc0f4
X-Osstest-Versions-That:
    ovmf=f67e1934d985dcb8a465dcf44484be3688be99a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Sep 2023 10:24:05 +0000

flight 183114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 28a267af4024c329e58121ccd9bf5f4f7aabc0f4
baseline version:
 ovmf                 f67e1934d985dcb8a465dcf44484be3688be99a5

Last test of basis   183111  2023-09-22 04:10:47 Z    0 days
Testing same since   183114  2023-09-22 08:40:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ranbir Singh <Ranbir.Singh3@Dell.com>
  Ranbir Singh <rsingh@ventanamicro.com>

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
   f67e1934d9..28a267af40  28a267af4024c329e58121ccd9bf5f4f7aabc0f4 -> xen-tested-master

