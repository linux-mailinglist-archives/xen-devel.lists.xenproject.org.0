Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA366DC971
	for <lists+xen-devel@lfdr.de>; Mon, 10 Apr 2023 18:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519542.806537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pluYE-0000S9-Nr; Mon, 10 Apr 2023 16:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519542.806537; Mon, 10 Apr 2023 16:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pluYE-0000Oo-Ir; Mon, 10 Apr 2023 16:39:30 +0000
Received: by outflank-mailman (input) for mailman id 519542;
 Mon, 10 Apr 2023 16:39:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pluYD-0000Oe-E7; Mon, 10 Apr 2023 16:39:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pluYD-0003La-C8; Mon, 10 Apr 2023 16:39:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pluYC-0002ek-SF; Mon, 10 Apr 2023 16:39:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pluYC-0008L7-Ro; Mon, 10 Apr 2023 16:39:28 +0000
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
	bh=XB5ke6pxsM4SVEjmueJhrWhiqKxPUEEamVn9vkeaWdQ=; b=du472UvvHqmQdReA30qT0QKeMK
	sYZowh5ACodDh5u75gyl8EBfxZaq/EFmzEo1tXAf5ED0iFy4FHw3Xh03soUXe1U3lz4YqtRKklyLE
	4YXXm+ecfYVf99BMLVuvUXERO0b7Y+U/Tmvai4qMzUOJkl6ynotVJaRbkoIHDt4/Zz3w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180196-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180196: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=61652efd04a7585a779226137d0f9739a75aac69
X-Osstest-Versions-That:
    ovmf=cf4af503fb61e7a942e05e61627364cad48c5781
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Apr 2023 16:39:28 +0000

flight 180196 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180196/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 61652efd04a7585a779226137d0f9739a75aac69
baseline version:
 ovmf                 cf4af503fb61e7a942e05e61627364cad48c5781

Last test of basis   180193  2023-04-10 06:12:15 Z    0 days
Testing same since   180196  2023-04-10 14:40:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   cf4af503fb..61652efd04  61652efd04a7585a779226137d0f9739a75aac69 -> xen-tested-master

