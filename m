Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59A432C56
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 05:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212619.370561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcfwL-0007eG-Q9; Tue, 19 Oct 2021 03:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212619.370561; Tue, 19 Oct 2021 03:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcfwL-0007bH-M9; Tue, 19 Oct 2021 03:37:25 +0000
Received: by outflank-mailman (input) for mailman id 212619;
 Tue, 19 Oct 2021 03:37:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcfwK-0007b7-A5; Tue, 19 Oct 2021 03:37:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcfwK-0006Nw-2j; Tue, 19 Oct 2021 03:37:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcfwJ-00073X-HJ; Tue, 19 Oct 2021 03:37:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcfwJ-0002oG-GW; Tue, 19 Oct 2021 03:37:23 +0000
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
	bh=ABGxX1NGrgz4eJjOeSuojW/J1tjWdGVqX6glsuy02qE=; b=hBfBNAoP8X7bS3dAUqc+gSIA5k
	K3x1aVu2wpmBBn8Gr3IdSB9Ra5taFl82Arce0oNtKDaXhml4uZR4L82QRjMnkEDEtGTjgPMkIkgYd
	iuJDFIisOwQxWnn8DYWvxFZ31C1mQmt6BJ2VCYQ9ubgR/GGg9/RXXO1J01+3+6BkQ/pY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165652-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165652: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=36b561623a4b8a6c7fea0b1b01f6789f2adf97e0
X-Osstest-Versions-That:
    ovmf=210869834639c1150b1f016e2022472a55cdd884
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Oct 2021 03:37:23 +0000

flight 165652 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165652/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 36b561623a4b8a6c7fea0b1b01f6789f2adf97e0
baseline version:
 ovmf                 210869834639c1150b1f016e2022472a55cdd884

Last test of basis   165637  2021-10-18 13:41:07 Z    0 days
Testing same since   165652  2021-10-19 01:40:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Dov Murik <dovmurik@linux.ibm.com>

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
   2108698346..36b561623a  36b561623a4b8a6c7fea0b1b01f6789f2adf97e0 -> xen-tested-master

