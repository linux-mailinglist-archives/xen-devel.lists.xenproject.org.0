Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC938C831
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131304.245475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5H9-0001VX-Ha; Fri, 21 May 2021 13:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131304.245475; Fri, 21 May 2021 13:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5H9-0001Tc-E2; Fri, 21 May 2021 13:33:15 +0000
Received: by outflank-mailman (input) for mailman id 131304;
 Fri, 21 May 2021 13:33:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lk5H8-0001TS-7u; Fri, 21 May 2021 13:33:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lk5H8-0007z0-3a; Fri, 21 May 2021 13:33:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lk5H7-00050x-Qr; Fri, 21 May 2021 13:33:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lk5H7-0006wt-Q0; Fri, 21 May 2021 13:33:13 +0000
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
	bh=jmCZLawip62gSHYDFPUugO2WQZV8cjrk1jI6cR0REKo=; b=unpb1dpbQyid0Wyye8/SBbU/BI
	FTbbXRGdvgW0q2CDm6v3i/NYkcqLLsCWn36eT/lsvDpA+rT2AbzY+Gm1UOLkFtJLZwnYoZTSNyF7P
	FuA8jV1N+BsliVyDPBGHttzx9ymMiBAXrrY29Ftekx2md9fOZr87R57BG+nNHYzsN4V0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162111-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162111: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=04ae17218deec25c6f488609c5e2ca9c419d2c4b
X-Osstest-Versions-That:
    ovmf=15ee7b76891a78141e6e30ef3f8572e8d6b326d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 May 2021 13:33:13 +0000

flight 162111 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162111/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 04ae17218deec25c6f488609c5e2ca9c419d2c4b
baseline version:
 ovmf                 15ee7b76891a78141e6e30ef3f8572e8d6b326d2

Last test of basis   162071  2021-05-19 01:40:34 Z    2 days
Testing same since   162111  2021-05-21 07:11:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Garrett Kirkendall <garrett.kirkendall@amd.com>

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
   15ee7b7689..04ae17218d  04ae17218deec25c6f488609c5e2ca9c419d2c4b -> xen-tested-master

