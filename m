Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025C900D4B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 22:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736647.1142770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFgfi-0000N5-Gb; Fri, 07 Jun 2024 20:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736647.1142770; Fri, 07 Jun 2024 20:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFgfi-0000L8-E0; Fri, 07 Jun 2024 20:58:50 +0000
Received: by outflank-mailman (input) for mailman id 736647;
 Fri, 07 Jun 2024 20:58:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFgfh-0000Ky-0R; Fri, 07 Jun 2024 20:58:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFgfg-0005Yg-Vf; Fri, 07 Jun 2024 20:58:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFgfg-0002u6-Mi; Fri, 07 Jun 2024 20:58:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFgfg-0004wA-MC; Fri, 07 Jun 2024 20:58:48 +0000
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
	bh=uU17lVaMVsdSGO/703rEv3cElSHdVauBJy+PUzEoF54=; b=bYy5AfnHKcGAFS5O7V7NfeVKii
	XtibnX/hYf89ghcJA7DJwlHaFpP6JO0kEOd8dXmgc9YzArnaWUGkCzoERYywfBjdr2S31gPxdPadF
	1WRxXu176xsoBYxejCG/vMPuJP4dE0PXGrSQugDys7DiOj4Zzx4Dk0C1sjooHmzZLhnM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186283-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186283: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ab069d580111ccc64d6b0c9697b7c5fd6e1507ce
X-Osstest-Versions-That:
    ovmf=c36414b131dfd0a1ca51f10f87a18955bc110ff2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 20:58:48 +0000

flight 186283 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186283/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ab069d580111ccc64d6b0c9697b7c5fd6e1507ce
baseline version:
 ovmf                 c36414b131dfd0a1ca51f10f87a18955bc110ff2

Last test of basis   186281  2024-06-07 15:44:37 Z    0 days
Testing same since   186283  2024-06-07 18:13:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>

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
   c36414b131..ab069d5801  ab069d580111ccc64d6b0c9697b7c5fd6e1507ce -> xen-tested-master

