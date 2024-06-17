Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478890A2DC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 05:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741570.1148181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ31d-0008PR-VS; Mon, 17 Jun 2024 03:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741570.1148181; Mon, 17 Jun 2024 03:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ31d-0008Mp-S9; Mon, 17 Jun 2024 03:27:21 +0000
Received: by outflank-mailman (input) for mailman id 741570;
 Mon, 17 Jun 2024 03:27:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJ31c-0008Mf-G1; Mon, 17 Jun 2024 03:27:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJ31c-0003IE-9O; Mon, 17 Jun 2024 03:27:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJ31c-0004Sf-0m; Mon, 17 Jun 2024 03:27:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJ31c-0001sH-0O; Mon, 17 Jun 2024 03:27:20 +0000
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
	bh=VHztLn89YGOacChiQgYRx5abaNG9rCIzc+mKwbW+o9Q=; b=CVPvlS6WzZbcxwz4ki/jQgqS89
	FDxJ+B9BGzZC47JLk1huBJZq1vweUQN72V5zcSjfWyiH+sm2ZkN1yfYjGV2s2TONDkLF9PLqdQm3i
	ctSDrtD1lUN6VgShoyWQt6tW72I3DLWnEcN4Vb5DEH+mlVItbldLhtZ/BbZOLURR18mk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186375-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186375: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7dbd2ac7b359644b4961b027d711893132cdb00
X-Osstest-Versions-That:
    ovmf=aa99d36be9ad68d8d0a99896332a9b5da10cf343
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jun 2024 03:27:20 +0000

flight 186375 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186375/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7dbd2ac7b359644b4961b027d711893132cdb00
baseline version:
 ovmf                 aa99d36be9ad68d8d0a99896332a9b5da10cf343

Last test of basis   186362  2024-06-15 11:42:45 Z    1 days
Testing same since   186375  2024-06-17 01:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   aa99d36be9..a7dbd2ac7b  a7dbd2ac7b359644b4961b027d711893132cdb00 -> xen-tested-master

