Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFA82CD97
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jan 2024 16:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667045.1038046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOgE8-0002iw-1Q; Sat, 13 Jan 2024 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667045.1038046; Sat, 13 Jan 2024 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOgE7-0002ho-Up; Sat, 13 Jan 2024 15:47:15 +0000
Received: by outflank-mailman (input) for mailman id 667045;
 Sat, 13 Jan 2024 15:47:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOgE7-0002he-00; Sat, 13 Jan 2024 15:47:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOgE6-00026B-Po; Sat, 13 Jan 2024 15:47:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOgE6-00023J-ES; Sat, 13 Jan 2024 15:47:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rOgE6-0002xm-Dw; Sat, 13 Jan 2024 15:47:14 +0000
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
	bh=j18NLn8ANYYJm7GQOPPNXq4wTD8WZfmGygSuiK8dvz4=; b=50YevMVMN6IoBsvRdVwXB0L+Xt
	m0qbjvYOue0P9IK6kHcRbjLWGoeQGgsSTheIXZbjJgwHxgTHPdmSlx6GUy+tMqdY+tTLR48OtOT9C
	8Qlh5gJZuG67mknZwn8DeTyez2wM80RWqzIeSUamHDlPrATTk/WVwOmwxN3BGlk3Sj74=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184341-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184341: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=5a513bb7a7f08a0ab9aa23312ab9a34240a24d2c
X-Osstest-Versions-That:
    xtf=f3bd152f5e83da943535f6ba7b5772d4dbe96717
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Jan 2024 15:47:14 +0000

flight 184341 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184341/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  5a513bb7a7f08a0ab9aa23312ab9a34240a24d2c
baseline version:
 xtf                  f3bd152f5e83da943535f6ba7b5772d4dbe96717

Last test of basis   184308  2024-01-10 14:12:53 Z    3 days
Testing same since   184341  2024-01-13 14:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   f3bd152..5a513bb  5a513bb7a7f08a0ab9aa23312ab9a34240a24d2c -> xen-tested-master

