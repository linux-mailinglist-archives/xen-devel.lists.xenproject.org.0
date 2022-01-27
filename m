Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A049EE45
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 23:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261767.453501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDbl-0008KH-1A; Thu, 27 Jan 2022 22:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261767.453501; Thu, 27 Jan 2022 22:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDbk-0008IQ-Sy; Thu, 27 Jan 2022 22:51:12 +0000
Received: by outflank-mailman (input) for mailman id 261767;
 Thu, 27 Jan 2022 22:51:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDDbj-0008IG-7I; Thu, 27 Jan 2022 22:51:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDDbj-00036B-3t; Thu, 27 Jan 2022 22:51:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDDbi-0003zK-K8; Thu, 27 Jan 2022 22:51:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDDbi-0007GQ-Jj; Thu, 27 Jan 2022 22:51:10 +0000
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
	bh=A/tnLphRBM+COxVZqhqW7RZ6Gll6WXdqr15PlkuZTjM=; b=JCZizl+RyEBxI+UzFkX4JFtNLu
	bJyWFzOJRVjE3LfKi7en9Zoc+MqIZWJZGLVJS7iR5ww+MJc7XimMxkbaDYyWiuKNsMqcrDAwww89u
	aUztfYm1fxRgxMbLvGmiuGkxKC+DB34xRgISrNv7X41PdumZQ+vGIxPen6uzZCSGntqQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167919-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167919: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6777e673839a510aaa62a48514a4223da7d3bba2
X-Osstest-Versions-That:
    ovmf=8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Jan 2022 22:51:10 +0000

flight 167919 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167919/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6777e673839a510aaa62a48514a4223da7d3bba2
baseline version:
 ovmf                 8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae

Last test of basis   167907  2022-01-27 02:40:24 Z    0 days
Testing same since   167919  2022-01-27 13:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min Xu <min.m.xu@intel.com>

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
   8cc5590eab..6777e67383  6777e673839a510aaa62a48514a4223da7d3bba2 -> xen-tested-master

