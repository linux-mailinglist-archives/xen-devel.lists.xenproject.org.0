Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B62AAB9C
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 15:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21674.47997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kblWH-0001KE-NX; Sun, 08 Nov 2020 14:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21674.47997; Sun, 08 Nov 2020 14:18:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kblWH-0001Ju-K6; Sun, 08 Nov 2020 14:18:13 +0000
Received: by outflank-mailman (input) for mailman id 21674;
 Sun, 08 Nov 2020 14:18:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kblWG-0001JL-6e
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 14:18:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c59bca0-d539-4ca3-917d-83fc64529f6f;
 Sun, 08 Nov 2020 14:18:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kblW9-0001CD-Hs; Sun, 08 Nov 2020 14:18:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kblW9-0005fL-Am; Sun, 08 Nov 2020 14:18:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kblW9-0001YX-AF; Sun, 08 Nov 2020 14:18:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kblWG-0001JL-6e
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 14:18:12 +0000
X-Inumbo-ID: 8c59bca0-d539-4ca3-917d-83fc64529f6f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8c59bca0-d539-4ca3-917d-83fc64529f6f;
	Sun, 08 Nov 2020 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=XjhYqF8DrZfyMje/FR/eFmGc6sq7LNyYtWG7PnTFyXU=; b=MKnh7ehOxRTZLnrLJPn9TAuNwI
	HwObia3KxRnuHCGKLXcbBEogI1sDRMQEnTIG38LlbFLrg1/ectgl8+yzqrD09vmwvz0uz3IIFPZtL
	2vocrVCzaDJARlGZGk3+8Mk3CQpogspDgqSXiYwAqWyaLsvh8dOpd1bY+/o3ip5KPJlI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kblW9-0001CD-Hs; Sun, 08 Nov 2020 14:18:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kblW9-0005fL-Am; Sun, 08 Nov 2020 14:18:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kblW9-0001YX-AF; Sun, 08 Nov 2020 14:18:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156545-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156545: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1366cd58cd4459f00b4ecf5abed13e77ac4ad06c
X-Osstest-Versions-That:
    ovmf=dc0dae2d18d4b6f904e99e0ef9824d61ca750b3d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Nov 2020 14:18:05 +0000

flight 156545 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156545/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c
baseline version:
 ovmf                 dc0dae2d18d4b6f904e99e0ef9824d61ca750b3d

Last test of basis   156533  2020-11-06 17:11:20 Z    1 days
Testing same since   156545  2020-11-07 20:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   dc0dae2d18..1366cd58cd  1366cd58cd4459f00b4ecf5abed13e77ac4ad06c -> xen-tested-master

