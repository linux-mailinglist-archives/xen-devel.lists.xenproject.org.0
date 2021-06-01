Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4136397B89
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 23:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135357.251471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loBZt-0001ib-3X; Tue, 01 Jun 2021 21:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135357.251471; Tue, 01 Jun 2021 21:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loBZs-0001fU-Vw; Tue, 01 Jun 2021 21:05:32 +0000
Received: by outflank-mailman (input) for mailman id 135357;
 Tue, 01 Jun 2021 21:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loBZr-0001fJ-Kh; Tue, 01 Jun 2021 21:05:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loBZr-0006G9-Fn; Tue, 01 Jun 2021 21:05:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loBZr-0002DF-8p; Tue, 01 Jun 2021 21:05:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1loBZr-0006Xz-8G; Tue, 01 Jun 2021 21:05:31 +0000
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
	bh=QI7h0j+07m2aWQOpBLAhiXvfJu3fCGHdACATQmfrVXk=; b=ql+zY/ll6crjvjysUJLNylwepH
	KaUMuC0WhDxiBdm59R9GGea8CB2/Fb4OPoXx0KGUF7ePvJy3uLVAyybIfLtm6AsGuTa+AhVTatoy6
	CkEEQI5MLZFzK0qIVeRfwSi5GsCX3kVuiwucpjNVdvrHUkBf2bzwrjgImWtueZUKreXQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162326-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162326: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fdf3666f01a2dd02d83a808f609b9c744a74c652
X-Osstest-Versions-That:
    ovmf=d3ff5dbe1dfc3420e5254d290500c0b6f6282d17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 01 Jun 2021 21:05:31 +0000

flight 162326 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162326/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fdf3666f01a2dd02d83a808f609b9c744a74c652
baseline version:
 ovmf                 d3ff5dbe1dfc3420e5254d290500c0b6f6282d17

Last test of basis   162288  2021-06-01 02:43:22 Z    0 days
Testing same since   162326  2021-06-01 11:41:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashish Singhal <ashishsingha@nvidia.com>
  Marcin Wojtas <mw@semihalf.com>

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
   d3ff5dbe1d..fdf3666f01  fdf3666f01a2dd02d83a808f609b9c744a74c652 -> xen-tested-master

