Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FEB84891E
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 23:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675478.1050905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWONe-0004sn-Jn; Sat, 03 Feb 2024 22:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675478.1050905; Sat, 03 Feb 2024 22:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWONe-0004r2-Gd; Sat, 03 Feb 2024 22:20:58 +0000
Received: by outflank-mailman (input) for mailman id 675478;
 Sat, 03 Feb 2024 22:20:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWONd-0004qs-7q; Sat, 03 Feb 2024 22:20:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWONd-0006jU-71; Sat, 03 Feb 2024 22:20:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWONc-0007mG-Nr; Sat, 03 Feb 2024 22:20:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rWONc-0007RE-NV; Sat, 03 Feb 2024 22:20:56 +0000
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
	bh=LwUIW0bnnfgyNXSbHtx4jL3Tc81JLnHiFdliE0TuAeE=; b=beQ/E9WEl2UTx38TiYMFSK0jZS
	XYIXUtApRAHnTrnZhMTO0Po2GlBEYStH4j51HJzC7By8hkHezuoyphMsONKyR1CT43VLHTq5ijfGS
	kmLR0DOEPmLpw2a3sw8vfsaSx1xcSa5yIgohd8yy7SC4H4dHNpQHy5t9/umIbOOy0oy0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184580-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184580: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cd6f2152237713d12723a55aa258c7ae91577dff
X-Osstest-Versions-That:
    ovmf=a1b98c8f845c165572937149a46e12ca36960617
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Feb 2024 22:20:56 +0000

flight 184580 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184580/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cd6f2152237713d12723a55aa258c7ae91577dff
baseline version:
 ovmf                 a1b98c8f845c165572937149a46e12ca36960617

Last test of basis   184579  2024-02-03 17:11:33 Z    0 days
Testing same since   184580  2024-02-03 20:14:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tom Lendacky <thomas.lendacky@amd.com>

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
   a1b98c8f84..cd6f215223  cd6f2152237713d12723a55aa258c7ae91577dff -> xen-tested-master

