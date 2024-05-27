Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34A8CF8AB
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 07:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730582.1135698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBSkF-00009p-JU; Mon, 27 May 2024 05:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730582.1135698; Mon, 27 May 2024 05:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBSkF-00008D-GJ; Mon, 27 May 2024 05:18:03 +0000
Received: by outflank-mailman (input) for mailman id 730582;
 Mon, 27 May 2024 05:18:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBSkD-000083-TO; Mon, 27 May 2024 05:18:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBSkD-00072n-RY; Mon, 27 May 2024 05:18:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBSkD-0006W5-KO; Mon, 27 May 2024 05:18:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sBSkD-0007SE-K1; Mon, 27 May 2024 05:18:01 +0000
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
	bh=oANKl1ASreOnaU4xrFDKbuYv5jAelqccWXJ18cx/S98=; b=Y4JsJ5DKjfPDyMV6/XWrNNIKIY
	3G3KjEJuJnM4bY1SiO+sBsAglHAu3lPs6E0DcuVFGkf5ZkTIPQCSVW+9Ad5fBo3O6wcla4Y4naIyG
	Eb8w65qkOtnlqRsGP9OL5K/KWDakbk9EtN6ljuK9291sWO+gmJm4lgj4ezakIcswZEes=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186158-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186158: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=88a4de450f17c6a319c3e8b2135cd7068a07d0f8
X-Osstest-Versions-That:
    ovmf=3e722403cd16388a0e4044e705a2b34c841d76ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 May 2024 05:18:01 +0000

flight 186158 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186158/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 88a4de450f17c6a319c3e8b2135cd7068a07d0f8
baseline version:
 ovmf                 3e722403cd16388a0e4044e705a2b34c841d76ca

Last test of basis   186137  2024-05-24 16:12:58 Z    2 days
Testing same since   186158  2024-05-27 02:13:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ning Feng <ning.feng@intel.com>

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
   3e722403cd..88a4de450f  88a4de450f17c6a319c3e8b2135cd7068a07d0f8 -> xen-tested-master

