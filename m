Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471588677A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 08:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696670.1087780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZKi-0007yS-Dr; Fri, 22 Mar 2024 07:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696670.1087780; Fri, 22 Mar 2024 07:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZKi-0007vX-A3; Fri, 22 Mar 2024 07:28:56 +0000
Received: by outflank-mailman (input) for mailman id 696670;
 Fri, 22 Mar 2024 07:28:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnZKh-0007vL-Ap; Fri, 22 Mar 2024 07:28:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnZKh-0004sb-6p; Fri, 22 Mar 2024 07:28:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rnZKg-0005XC-Um; Fri, 22 Mar 2024 07:28:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rnZKg-0002pW-UF; Fri, 22 Mar 2024 07:28:54 +0000
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
	bh=9TZB8S0AevJRYVAbWJ4eSczJ5lgzkHn1UOKtWFNhks0=; b=CKphLNcs132cBqLJsjUN98EPu7
	wBosE6fP36ni2bdA0IaV5uAMheXD6/mESteDO8mkqcT09Z3vfM+rkWgxpbhv6D9DSdxZ29Gb8ykvn
	t5X+pV52TboMiX6iUxwUv4tMDxs+s27wd2OrHnaGHbS/qO8jEAf/rjgxTM8xSnpwcLgQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185138-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185138: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7f1ffba5de3d9840dbeeba20fba165f2fb724941
X-Osstest-Versions-That:
    ovmf=35f6a2780e5198315a9f100c07b3bc86187d20a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Mar 2024 07:28:54 +0000

flight 185138 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185138/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f1ffba5de3d9840dbeeba20fba165f2fb724941
baseline version:
 ovmf                 35f6a2780e5198315a9f100c07b3bc86187d20a8

Last test of basis   185098  2024-03-19 12:43:35 Z    2 days
Testing same since   185138  2024-03-22 05:12:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dat Mach <dmach@nvidia.com>

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
   35f6a2780e..7f1ffba5de  7f1ffba5de3d9840dbeeba20fba165f2fb724941 -> xen-tested-master

