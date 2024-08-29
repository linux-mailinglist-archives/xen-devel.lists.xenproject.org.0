Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEF963930
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 06:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785390.1194831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWKJ-0006Ci-Eo; Thu, 29 Aug 2024 04:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785390.1194831; Thu, 29 Aug 2024 04:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWKJ-00069a-At; Thu, 29 Aug 2024 04:00:03 +0000
Received: by outflank-mailman (input) for mailman id 785390;
 Thu, 29 Aug 2024 04:00:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjWKI-0005xC-8N; Thu, 29 Aug 2024 04:00:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjWKH-0001ZF-TO; Thu, 29 Aug 2024 04:00:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjWKH-0003Yv-KJ; Thu, 29 Aug 2024 04:00:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjWKH-00012u-Jj; Thu, 29 Aug 2024 04:00:01 +0000
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
	bh=QmPMO+HahwL8XPoGXOBznN4TSBBbRuQeTRYzBHNSo3k=; b=ZiV4xDEWRP5j0iohenL+NAobOP
	skAMlCQNLoUh1CMR81loHyuVbD4suDY40Z4lEkWme+ej6dF3czOyhPzEBRA+fJkPXE2/weBt1VAy/
	oOpAH44DCIUZUy4oFjd0GLtF2bFSzKh3g/bw40kJmMSvNV/MkbmuwMkKNAtY2RMQSstU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187393: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=383f729ac096b8deb279933fce86e83a5f7f5ec7
X-Osstest-Versions-That:
    ovmf=41a51d173557350ec8bcf64075a3e97730bf70dd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 04:00:01 +0000

flight 187393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187393/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 383f729ac096b8deb279933fce86e83a5f7f5ec7
baseline version:
 ovmf                 41a51d173557350ec8bcf64075a3e97730bf70dd

Last test of basis   187391  2024-08-29 00:11:30 Z    0 days
Testing same since   187393  2024-08-29 02:31:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>
  Michael G.A. Holland <michael.holland@intel.com>

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
   41a51d1735..383f729ac0  383f729ac096b8deb279933fce86e83a5f7f5ec7 -> xen-tested-master

