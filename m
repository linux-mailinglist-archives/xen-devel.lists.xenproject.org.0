Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E459580DFA4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 00:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652558.1018476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCpxe-0000F4-Sa; Mon, 11 Dec 2023 23:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652558.1018476; Mon, 11 Dec 2023 23:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCpxe-0000DP-PZ; Mon, 11 Dec 2023 23:45:18 +0000
Received: by outflank-mailman (input) for mailman id 652558;
 Mon, 11 Dec 2023 23:45:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCpxd-0000DF-ND; Mon, 11 Dec 2023 23:45:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCpxd-0000Ap-L5; Mon, 11 Dec 2023 23:45:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCpxd-0004SF-8f; Mon, 11 Dec 2023 23:45:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rCpxd-0004QX-8D; Mon, 11 Dec 2023 23:45:17 +0000
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
	bh=wsa8AnRAx50XDY+4Y8mIhADFp/o/BmMCsJfSGKfrCsc=; b=AF0m61IqCPK9z/JbqOv6erbtir
	927tG1qTfI8iuNVeoc/5iAQygOCuXNpKNA3ObNRH61jLjuj4+rO6DSMM8jjc0pyOAjkAYwQpzB6/W
	elNj0DYyfwdVr/ErP173lFASPE2MY1m9ZRuhJxfF7EA+/0KZ3T9kwijvPKp3+YntY6AQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184095-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184095: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1d50544aa2321e4efcd9c193d534fb4096d64dbf
X-Osstest-Versions-That:
    ovmf=aa2f32cefa567133d94d574672a4479e004211ee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Dec 2023 23:45:17 +0000

flight 184095 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184095/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1d50544aa2321e4efcd9c193d534fb4096d64dbf
baseline version:
 ovmf                 aa2f32cefa567133d94d574672a4479e004211ee

Last test of basis   184093  2023-12-11 17:12:41 Z    0 days
Testing same since   184095  2023-12-11 21:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   aa2f32cefa..1d50544aa2  1d50544aa2321e4efcd9c193d534fb4096d64dbf -> xen-tested-master

