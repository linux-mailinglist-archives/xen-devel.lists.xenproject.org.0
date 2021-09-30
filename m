Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249C41D59A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199606.353773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrfE-000862-BS; Thu, 30 Sep 2021 08:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199606.353773; Thu, 30 Sep 2021 08:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrfE-00082g-6U; Thu, 30 Sep 2021 08:43:36 +0000
Received: by outflank-mailman (input) for mailman id 199606;
 Thu, 30 Sep 2021 08:43:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVrfC-00082W-HV; Thu, 30 Sep 2021 08:43:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVrfC-0003vh-Cf; Thu, 30 Sep 2021 08:43:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVrfC-0000PY-2s; Thu, 30 Sep 2021 08:43:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVrfC-0007MK-2K; Thu, 30 Sep 2021 08:43:34 +0000
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
	bh=PEGxfrrPvn3wdZcd95ayAQkZDM5DjaDQxiVocv1F2+s=; b=0vxzyRXuDQJZlXHuznIyyiRUpJ
	P/BPMAWvADKMuEcKjG5fRvYLKfOpnJOFaQ/VwjwpB9x9jDk/d6WuMBT73PaPvakgfbNCki06oD9HA
	RkRu8FGbokTT/GC+yR8wr3vLsPuv99TduQe8PCFO1VuFYb5zgDxM7wgZJK5Gf3odNPDo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165321-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165321: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=442e46d3b6c1931b54111c92e0efb5a797bc622b
X-Osstest-Versions-That:
    ovmf=46b4606ba23498d3d0e66b53e498eb3d5d592586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Sep 2021 08:43:34 +0000

flight 165321 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165321/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 442e46d3b6c1931b54111c92e0efb5a797bc622b
baseline version:
 ovmf                 46b4606ba23498d3d0e66b53e498eb3d5d592586

Last test of basis   165200  2021-09-26 03:10:18 Z    4 days
Testing same since   165321  2021-09-29 20:41:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Bob Feng <bob.c.feng@intel.com>
  Cheng-Chieh Huang <chengchieh@google.com>
  Guo Dong <guo.dong@intel.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Rebecca Cran <rebecca@bsdio.com>
  yi1 li <yi1.li@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   46b4606ba2..442e46d3b6  442e46d3b6c1931b54111c92e0efb5a797bc622b -> xen-tested-master

