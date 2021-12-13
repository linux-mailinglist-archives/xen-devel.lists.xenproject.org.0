Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26660473395
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 19:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246254.424690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwpkN-0007vw-94; Mon, 13 Dec 2021 18:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246254.424690; Mon, 13 Dec 2021 18:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwpkN-0007t2-5q; Mon, 13 Dec 2021 18:08:23 +0000
Received: by outflank-mailman (input) for mailman id 246254;
 Mon, 13 Dec 2021 18:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwpkL-0007ss-Ir; Mon, 13 Dec 2021 18:08:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwpkL-0001yh-Bl; Mon, 13 Dec 2021 18:08:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwpkL-0002rv-1n; Mon, 13 Dec 2021 18:08:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mwpkL-0005e3-16; Mon, 13 Dec 2021 18:08:21 +0000
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
	bh=2zVFt9tbieqrp6kmc5nwx7rl1r1KZY6bA/cA3No04+o=; b=6FddPEeKlKH8ha0B5lRizzgLcC
	jegA8TrZng2/1+Dj32zVH5ufW+fKG4mclafRFY665Lx902LmbzXpBCy6Q9yfMcsoPeqHCP4Panqwv
	DtDfyksX7MdRCvjeYkdB72RusC4/AcvYbf0nRJPAHQ9TrSTwSZkklSh7vmltTJrwndsY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167394-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167394: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7a6e6ae9332614d386446d2a73e34b74fe66446f
X-Osstest-Versions-That:
    ovmf=ec37fd9c1fbc6c14ad3291b415ad6677a022a554
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Dec 2021 18:08:21 +0000

flight 167394 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167394/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7a6e6ae9332614d386446d2a73e34b74fe66446f
baseline version:
 ovmf                 ec37fd9c1fbc6c14ad3291b415ad6677a022a554

Last test of basis   167393  2021-12-13 13:42:29 Z    0 days
Testing same since   167394  2021-12-13 16:12:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
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
   ec37fd9c1f..7a6e6ae933  7a6e6ae9332614d386446d2a73e34b74fe66446f -> xen-tested-master

