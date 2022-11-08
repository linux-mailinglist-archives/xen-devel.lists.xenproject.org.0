Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8454621DBD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 21:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440556.694650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osVL3-0004e4-D7; Tue, 08 Nov 2022 20:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440556.694650; Tue, 08 Nov 2022 20:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osVL3-0004af-9h; Tue, 08 Nov 2022 20:36:53 +0000
Received: by outflank-mailman (input) for mailman id 440556;
 Tue, 08 Nov 2022 20:36:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osVL2-0004aV-1n; Tue, 08 Nov 2022 20:36:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osVL2-00008M-06; Tue, 08 Nov 2022 20:36:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osVL1-0001wv-J6; Tue, 08 Nov 2022 20:36:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1osVL1-0008CE-IX; Tue, 08 Nov 2022 20:36:51 +0000
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
	bh=Jhk0BqfbPJeWspAUxiZ3/fY7GJEPtRlHWDsdkCGXK/U=; b=EzqP6DeqB2Q6cd+HWPFErrklT4
	F9RbDftwMJvwaEVFRUsTLw4Mc6x8vTqmFtoMMUyRzwWiIFYcQVY+jB+duUcX4ZeD8sovqikf55rGI
	VHj84YinSPww4JftDRV562lCl98XJ9sd8X0NwNY43FJ/IoaknVMEl3gLlthw5bfwK9dk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174673-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174673: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6c1a4a376e97800c555dab9ca9d9651a5676d231
X-Osstest-Versions-That:
    ovmf=50bee4cc121aacc67f40b6c5ee0c71d3879dcc41
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Nov 2022 20:36:51 +0000

flight 174673 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174673/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6c1a4a376e97800c555dab9ca9d9651a5676d231
baseline version:
 ovmf                 50bee4cc121aacc67f40b6c5ee0c71d3879dcc41

Last test of basis   174666  2022-11-08 03:42:06 Z    0 days
Testing same since   174673  2022-11-08 15:40:34 Z    0 days    1 attempts

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
   50bee4cc12..6c1a4a376e  6c1a4a376e97800c555dab9ca9d9651a5676d231 -> xen-tested-master

