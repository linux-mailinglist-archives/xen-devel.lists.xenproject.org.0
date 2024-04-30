Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4EC8B6E53
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714670.1115948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jnU-0001Kn-5d; Tue, 30 Apr 2024 09:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714670.1115948; Tue, 30 Apr 2024 09:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jnU-0001Ie-1C; Tue, 30 Apr 2024 09:29:12 +0000
Received: by outflank-mailman (input) for mailman id 714670;
 Tue, 30 Apr 2024 09:29:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1jnS-0001IR-Gf; Tue, 30 Apr 2024 09:29:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1jnS-0004NJ-E6; Tue, 30 Apr 2024 09:29:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1jnS-0001Cw-3i; Tue, 30 Apr 2024 09:29:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s1jnS-0007DH-35; Tue, 30 Apr 2024 09:29:10 +0000
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
	bh=yFwOSBt180pzTW8yWaDQ19ZtDoG2a81w/uVFUL+oY4A=; b=5obY2nvGR7/awbg25Wq9V/GJG0
	LN8PkzMIgTwqqNld2knJr2MJHwdOr8aUGbg4z1ceR3hNiPRxwTzu75IToG9nZwEkC6hCyDRcEK3vV
	c75+mmGuNT44KCXY82gOwJwftZXwVFTT42ZUvsvRUz3WpKMPsZxpmoB0CsvPc1oZIBNQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185876-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185876: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0c74aa2073e48b2143413f2dc76557acf8884202
X-Osstest-Versions-That:
    ovmf=88781ccd744c73acbbbe9767627860a538b9f3a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Apr 2024 09:29:10 +0000

flight 185876 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185876/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0c74aa2073e48b2143413f2dc76557acf8884202
baseline version:
 ovmf                 88781ccd744c73acbbbe9767627860a538b9f3a2

Last test of basis   185873  2024-04-30 02:41:15 Z    0 days
Testing same since   185876  2024-04-30 07:42:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   88781ccd74..0c74aa2073  0c74aa2073e48b2143413f2dc76557acf8884202 -> xen-tested-master

