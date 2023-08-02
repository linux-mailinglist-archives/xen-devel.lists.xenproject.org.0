Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198F76C841
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 10:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574794.900385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR74N-0006xA-As; Wed, 02 Aug 2023 08:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574794.900385; Wed, 02 Aug 2023 08:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR74N-0006un-7c; Wed, 02 Aug 2023 08:18:59 +0000
Received: by outflank-mailman (input) for mailman id 574794;
 Wed, 02 Aug 2023 08:18:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qR74M-0006ud-5B; Wed, 02 Aug 2023 08:18:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qR74M-00044T-1q; Wed, 02 Aug 2023 08:18:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qR74L-0004OC-Kx; Wed, 02 Aug 2023 08:18:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qR74L-00069l-KW; Wed, 02 Aug 2023 08:18:57 +0000
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
	bh=/8xT2lzrodVcsoi1AbXIqYwzOx7fU+RQ2aEc9BFhBxk=; b=Wkq4C+wr/mpdZ0qsF2KTokG3DC
	Z7gkYQWuCPise8HKDU/tttjpzMJk3fCITe5pTbQNhIUd1aVcI7lIetLyFaiAsZWYm4ZhY40mLoUvA
	kbk4ZzECx4FfNHXjNdpWlTxM2NvpmwMdzRoObQJyPdSXN6Wj39AoVb3x1bJS5x9wOZ+8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182108: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d11968fcc56cbbffef7d906048b00faea9415447
X-Osstest-Versions-That:
    ovmf=677f2c6f1509da21258e02957b869b71b008fc61
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Aug 2023 08:18:57 +0000

flight 182108 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d11968fcc56cbbffef7d906048b00faea9415447
baseline version:
 ovmf                 677f2c6f1509da21258e02957b869b71b008fc61

Last test of basis   182090  2023-07-31 12:44:11 Z    1 days
Testing same since   182108  2023-08-02 03:40:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ranbir Singh <Ranbir.Singh3@Dell.com>
  Ranbir Singh <rsingh@ventanamicro.com>

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
   677f2c6f15..d11968fcc5  d11968fcc56cbbffef7d906048b00faea9415447 -> xen-tested-master

