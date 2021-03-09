Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452D331E15
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 05:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95207.179647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJUJb-0001sN-Ci; Tue, 09 Mar 2021 04:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95207.179647; Tue, 09 Mar 2021 04:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJUJb-0001rq-8g; Tue, 09 Mar 2021 04:49:51 +0000
Received: by outflank-mailman (input) for mailman id 95207;
 Tue, 09 Mar 2021 04:49:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJUJZ-0001ri-9N; Tue, 09 Mar 2021 04:49:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJUJZ-0006ne-0L; Tue, 09 Mar 2021 04:49:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJUJY-0002mu-Nr; Tue, 09 Mar 2021 04:49:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lJUJY-0006M7-NP; Tue, 09 Mar 2021 04:49:48 +0000
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
	bh=ZcW1HInNMndwefGu4RANP5TI2NSsshUmB2KvPjwLeMc=; b=Hb4lWnOksgsZDzfXoQMBG9ZwGt
	3kFACgOM00T331XX9SF+Vqw1rDWmZX3zVddFNYO/fQ+OiKFokpAxX5MF4yQidySg5on3fApmF2cFA
	52KW9poieqGI9OYgFUgEZG3xXqsEoTl25jRVMcR0dJ87NDcQIJBBidqvEkTT5H5QvoAg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159879-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159879: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507
X-Osstest-Versions-That:
    ovmf=94fa95c8746c553324e8b69ea4a74af670075324
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Mar 2021 04:49:48 +0000

flight 159879 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159879/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507
baseline version:
 ovmf                 94fa95c8746c553324e8b69ea4a74af670075324

Last test of basis   159872  2021-03-08 13:11:56 Z    0 days
Testing same since   159879  2021-03-08 21:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   94fa95c874..edd46cd407  edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507 -> xen-tested-master

