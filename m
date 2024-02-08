Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F092B84DA8F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 08:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677995.1054983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXyWD-0002bD-O4; Thu, 08 Feb 2024 07:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677995.1054983; Thu, 08 Feb 2024 07:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXyWD-0002ZD-Kz; Thu, 08 Feb 2024 07:08:21 +0000
Received: by outflank-mailman (input) for mailman id 677995;
 Thu, 08 Feb 2024 07:08:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXyWC-0002Z3-83; Thu, 08 Feb 2024 07:08:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXyWB-0008AM-T1; Thu, 08 Feb 2024 07:08:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXyWB-0007Y2-Ff; Thu, 08 Feb 2024 07:08:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXyWB-0007ej-F6; Thu, 08 Feb 2024 07:08:19 +0000
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
	bh=24glUhnC94L/gBKCzKHCtBdTr5SdFSSbwG1SFn7aCYY=; b=Yt+0U2Q/E36BnK37YQLgzIPWa3
	1jjyjFfacS4qkV60lv3lG1TXhZGjlzY8BeMbdQP8cvxiD41NE8OTnIgzprbtJQGOOrwXSJdOvzbWd
	i8yVHVF0goUPFqyb4O6Qxx42mvGsTTxk/A0nDICIAPq48qthWajeQZj/6uzN47hnN/W4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184623-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184623: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8f316e99ec8de9dea294f6751dd7457f9f1a828c
X-Osstest-Versions-That:
    ovmf=4d1f0babe20cf757897fa43c399fd79bb6aa8a30
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Feb 2024 07:08:19 +0000

flight 184623 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184623/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8f316e99ec8de9dea294f6751dd7457f9f1a828c
baseline version:
 ovmf                 4d1f0babe20cf757897fa43c399fd79bb6aa8a30

Last test of basis   184619  2024-02-07 19:12:58 Z    0 days
Testing same since   184623  2024-02-08 04:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>
  devel@edk2.groups.io <devel@edk2.groups.io>

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
   4d1f0babe2..8f316e99ec  8f316e99ec8de9dea294f6751dd7457f9f1a828c -> xen-tested-master

