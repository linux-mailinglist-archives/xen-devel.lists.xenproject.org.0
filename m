Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0792647C9E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 04:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457585.715534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3UM5-0005uP-2I; Fri, 09 Dec 2022 03:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457585.715534; Fri, 09 Dec 2022 03:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3UM4-0005sc-VX; Fri, 09 Dec 2022 03:47:20 +0000
Received: by outflank-mailman (input) for mailman id 457585;
 Fri, 09 Dec 2022 03:47:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3UM3-0005sS-7p; Fri, 09 Dec 2022 03:47:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3UM3-0004Jj-2s; Fri, 09 Dec 2022 03:47:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3UM2-0005DZ-R2; Fri, 09 Dec 2022 03:47:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3UM2-0005fI-Qb; Fri, 09 Dec 2022 03:47:18 +0000
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
	bh=ZTt12kGUGhIdevsFM7xdbo2wWTUpxsBCuodjp4ddG/0=; b=s8PuXQfEieGV/xP75d4Lg1OmF5
	lcn/Rz1R5XDHEd4cnxmxHNbgymNW/DHwREKKhnASV+n3r4i1GEf2Hkbgsqwnl0I/GqfRhiGwkgGmL
	Ku2X8kwsOCLG2NHakX6LIuxdmzJ03nYeorkQiPhYwAgkMPTlpvvUaVgR95b25rG7UNDA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175101-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175101: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=54d81d06fc165fcb8eb832acd6a7cf644b029549
X-Osstest-Versions-That:
    ovmf=8a485e4bb8b5c5a800d6b3e1b8fa80fe27afb274
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Dec 2022 03:47:18 +0000

flight 175101 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175101/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 54d81d06fc165fcb8eb832acd6a7cf644b029549
baseline version:
 ovmf                 8a485e4bb8b5c5a800d6b3e1b8fa80fe27afb274

Last test of basis   175093  2022-12-08 16:12:26 Z    0 days
Testing same since   175101  2022-12-08 21:43:51 Z    0 days    1 attempts

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
   8a485e4bb8..54d81d06fc  54d81d06fc165fcb8eb832acd6a7cf644b029549 -> xen-tested-master

