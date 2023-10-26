Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C317D8C35
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 01:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624074.972474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9m0-00060Z-NT; Thu, 26 Oct 2023 23:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624074.972474; Thu, 26 Oct 2023 23:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9m0-0005yN-Jf; Thu, 26 Oct 2023 23:28:20 +0000
Received: by outflank-mailman (input) for mailman id 624074;
 Thu, 26 Oct 2023 23:28:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw9lz-0005y9-GH; Thu, 26 Oct 2023 23:28:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw9lz-0002Bp-6l; Thu, 26 Oct 2023 23:28:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw9ly-0000sG-S4; Thu, 26 Oct 2023 23:28:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qw9ly-00079o-RX; Thu, 26 Oct 2023 23:28:18 +0000
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
	bh=uS+z49a7pZQy9JLPg+3cKv4sR8poUNQXdRBvODVekxQ=; b=YRijPGTUFVweXQEbaamZbN8UQ5
	NAgOueRnWYWUa1AoxiZEpp/QOLCEhHl3vu1ik/CBgBxlwCZvcgc59pP5HYNEpmzcVJyWmiR2f181E
	lIJ3sG9AGTeMPCyFiY7KHQEwef0pq8JRMnUxql9sIAI2sWalJD3jx075LQxiegWlomlg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183545-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183545: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f945b72331d7e9eed7f84c71052f198377ac3950
X-Osstest-Versions-That:
    ovmf=74c687cc2f2f29d3bdd454a416624f0ca5a86566
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Oct 2023 23:28:18 +0000

flight 183545 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183545/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f945b72331d7e9eed7f84c71052f198377ac3950
baseline version:
 ovmf                 74c687cc2f2f29d3bdd454a416624f0ca5a86566

Last test of basis   183542  2023-10-26 18:10:40 Z    0 days
Testing same since   183545  2023-10-26 20:14:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Laszlo Ersek <lersek@redhat.com>

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
   74c687cc2f..f945b72331  f945b72331d7e9eed7f84c71052f198377ac3950 -> xen-tested-master

