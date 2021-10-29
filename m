Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23F43FC6F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 14:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218540.379025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgRAi-00071m-7X; Fri, 29 Oct 2021 12:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218540.379025; Fri, 29 Oct 2021 12:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgRAi-0006zU-2N; Fri, 29 Oct 2021 12:39:48 +0000
Received: by outflank-mailman (input) for mailman id 218540;
 Fri, 29 Oct 2021 12:39:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgRAg-0006zK-DI; Fri, 29 Oct 2021 12:39:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgRAg-0002ed-3M; Fri, 29 Oct 2021 12:39:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgRAf-0002mG-Qz; Fri, 29 Oct 2021 12:39:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mgRAf-0005oq-QT; Fri, 29 Oct 2021 12:39:45 +0000
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
	bh=DimGPb+qTv05LBGKqYRMVKZ1Oqwo3p5ldqW+qZ8lzjQ=; b=7Gxb6Ip5u9aigm0tu/QzTxdRt9
	xJ3mWjQ/DUkxtAk/T6IZFsWmT63NgLXJzQU1HM76hFRaLXiHbT5+3TyU67zyI/QOdVxT+hWaODg4+
	9PqCIXh1bNeQqDooD12SzvcKr5EseN60Az5i5gY8b7x1/BlkLkDyDpHC8CooBnCRXnhM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165934-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165934: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1bc232aae32e812341f10c9b938350cd93308eee
X-Osstest-Versions-That:
    ovmf=bb146ce32dd8edc463e792554351e50b9e5b769f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Oct 2021 12:39:45 +0000

flight 165934 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165934/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1bc232aae32e812341f10c9b938350cd93308eee
baseline version:
 ovmf                 bb146ce32dd8edc463e792554351e50b9e5b769f

Last test of basis   165921  2021-10-28 02:41:24 Z    1 days
Testing same since   165934  2021-10-29 08:11:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nickle.wang@hpe.com>

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
   bb146ce32d..1bc232aae3  1bc232aae32e812341f10c9b938350cd93308eee -> xen-tested-master

