Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1F5F2235
	for <lists+xen-devel@lfdr.de>; Sun,  2 Oct 2022 11:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414637.658953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oev2k-0003L6-2C; Sun, 02 Oct 2022 09:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414637.658953; Sun, 02 Oct 2022 09:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oev2j-0003Ho-Uo; Sun, 02 Oct 2022 09:13:49 +0000
Received: by outflank-mailman (input) for mailman id 414637;
 Sun, 02 Oct 2022 09:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oev2i-0003He-Mp; Sun, 02 Oct 2022 09:13:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oev2i-0004lh-Dx; Sun, 02 Oct 2022 09:13:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oev2i-0001Vq-1r; Sun, 02 Oct 2022 09:13:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oev2i-0008OX-0p; Sun, 02 Oct 2022 09:13:48 +0000
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
	bh=trxYJivEWWgPhBJuSKOWWV6J+uTOnTEDkGy02m1294Q=; b=I5QwaV87wMR4GBEE+uQuKPXcrX
	jNVqIZFZINQKnXlHuj62VATW6QWpm2ncL3dX8YrAriPVnVP/WdQ7uBBTHGwyH/9Pnr81dz/UZfFs/
	RshHJGuQ0x048spu5IWh1ROvXTmQBVwh4r+dHx3qxbT67oHVpZYRN+qfpird8D1pI2Qc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173399-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173399: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f01d3ee12caf5eae4ece4fc5b85c57c56fb06cc0
X-Osstest-Versions-That:
    ovmf=6a2b20ff97e4256970644a07f74a4c5655bf5072
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Oct 2022 09:13:48 +0000

flight 173399 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173399/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f01d3ee12caf5eae4ece4fc5b85c57c56fb06cc0
baseline version:
 ovmf                 6a2b20ff97e4256970644a07f74a4c5655bf5072

Last test of basis   173396  2022-10-01 11:42:04 Z    0 days
Testing same since   173399  2022-10-02 05:41:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   6a2b20ff97..f01d3ee12c  f01d3ee12caf5eae4ece4fc5b85c57c56fb06cc0 -> xen-tested-master

