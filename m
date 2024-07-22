Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B663993905C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762034.1172133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtjv-00045f-Gr; Mon, 22 Jul 2024 14:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762034.1172133; Mon, 22 Jul 2024 14:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtjv-00043c-Cb; Mon, 22 Jul 2024 14:10:11 +0000
Received: by outflank-mailman (input) for mailman id 762034;
 Mon, 22 Jul 2024 14:10:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVtjt-00043G-U3; Mon, 22 Jul 2024 14:10:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVtjt-0007rQ-QH; Mon, 22 Jul 2024 14:10:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVtjt-0004lP-GN; Mon, 22 Jul 2024 14:10:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sVtjt-0004Cc-Fv; Mon, 22 Jul 2024 14:10:09 +0000
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
	bh=tsaNMSZ4kHM+Pkd1BGjViIp5lSDklXZWmVTMrJ0pZTk=; b=OW/q6sfkr5P1LQ2IxmvV5kZTMq
	41VuQ9ii+AWPPTPP71izkezE9wrcDGV/stPDD97dTKsMattcO6X3pXWprkltZ77j7YIkZC8glJCGa
	aNRDICBo2l1MPDycuxp8bp71QSAU756fkAPrXWwbvOJAZHoUPlIgc0J2CWbgewnZUVmM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186942: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=469f29fe7647c6dc8975a3c03ea7e181270d44d3
X-Osstest-Versions-That:
    ovmf=734aaff8625760fb5d38024168a5f8696b14fd10
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Jul 2024 14:10:09 +0000

flight 186942 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186942/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 469f29fe7647c6dc8975a3c03ea7e181270d44d3
baseline version:
 ovmf                 734aaff8625760fb5d38024168a5f8696b14fd10

Last test of basis   186930  2024-07-21 12:15:01 Z    1 days
Testing same since   186942  2024-07-22 12:11:32 Z    0 days    1 attempts

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
   734aaff862..469f29fe76  469f29fe7647c6dc8975a3c03ea7e181270d44d3 -> xen-tested-master

