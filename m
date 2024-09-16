Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBB979E69
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799347.1209328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7yY-0004LE-AO; Mon, 16 Sep 2024 09:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799347.1209328; Mon, 16 Sep 2024 09:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7yY-0004JE-7Y; Mon, 16 Sep 2024 09:24:54 +0000
Received: by outflank-mailman (input) for mailman id 799347;
 Mon, 16 Sep 2024 09:24:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sq7yX-0004J4-Fq; Mon, 16 Sep 2024 09:24:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sq7yX-00088y-7z; Mon, 16 Sep 2024 09:24:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sq7yW-0002SG-Ps; Mon, 16 Sep 2024 09:24:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sq7yW-0000pE-PR; Mon, 16 Sep 2024 09:24:52 +0000
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
	bh=wE7cpMQ/EfByn3oT6skLvp5HdwQMnnnbOz4tQrFOB40=; b=jlXKChFl3lz6Ayiv/iG1UZRmNL
	VifHQ4xxB5kHG3CIaQJTQEg47R8Ym2wRl+dzRe8ko56ZAUUNNvoKgUMkoqXTDnIEUlAPN3rxl9Z1d
	mDaXFOvBVLRW/8jYhNeOHSvzURtTjSD8ueH0FY7OKXO+bU/iPZRHelbh3K4z+OL0OXOw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187718: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=be36ddb23463e0238406129eff1e89c56df561eb
X-Osstest-Versions-That:
    ovmf=73dbb68006caf538d1b69a11e306b161526932f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Sep 2024 09:24:52 +0000

flight 187718 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187718/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 be36ddb23463e0238406129eff1e89c56df561eb
baseline version:
 ovmf                 73dbb68006caf538d1b69a11e306b161526932f3

Last test of basis   187715  2024-09-15 21:43:21 Z    0 days
Testing same since   187718  2024-09-16 07:44:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   73dbb68006..be36ddb234  be36ddb23463e0238406129eff1e89c56df561eb -> xen-tested-master

