Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB4942D74
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 13:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768499.1179330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7o4-0004BB-IN; Wed, 31 Jul 2024 11:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768499.1179330; Wed, 31 Jul 2024 11:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7o4-00048x-Fd; Wed, 31 Jul 2024 11:47:48 +0000
Received: by outflank-mailman (input) for mailman id 768499;
 Wed, 31 Jul 2024 11:47:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ7o3-00048n-4j; Wed, 31 Jul 2024 11:47:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ7o2-0002GJ-ET; Wed, 31 Jul 2024 11:47:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ7o1-0004W3-Qs; Wed, 31 Jul 2024 11:47:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZ7o1-0006QY-QS; Wed, 31 Jul 2024 11:47:45 +0000
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
	bh=o32WeyScDgwpWFTMmCxVdIe+IhNX3Vw/PyhN30lzK/I=; b=x1LJdsh5V2Gh8ePoyEI8YTlDnG
	YnAuL7MuAaezO+zKKUnvb53RZSYS9MjmawxNdfyQd/47AdWvHilEDg+NtKghTssEJEgftwex7iGHC
	6PaNvYnPVwJH6rn0F9DfsKWCsHj6fWQ61Mt38uGdBIn4B0y605whDUA7OAvr3ugm4cC0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187074-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187074: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=03f49e44096fc25c33f96a11b3da93abc93dad34
X-Osstest-Versions-That:
    ovmf=9df400fd4d75831e02428e9ccb3dcfce85ceab82
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jul 2024 11:47:45 +0000

flight 187074 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187074/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 03f49e44096fc25c33f96a11b3da93abc93dad34
baseline version:
 ovmf                 9df400fd4d75831e02428e9ccb3dcfce85ceab82

Last test of basis   187070  2024-07-31 04:13:22 Z    0 days
Testing same since   187074  2024-07-31 09:13:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   9df400fd4d..03f49e4409  03f49e44096fc25c33f96a11b3da93abc93dad34 -> xen-tested-master

