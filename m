Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEAE433467
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213011.371096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmxf-0006By-U8; Tue, 19 Oct 2021 11:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213011.371096; Tue, 19 Oct 2021 11:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmxf-00069z-Q2; Tue, 19 Oct 2021 11:07:15 +0000
Received: by outflank-mailman (input) for mailman id 213011;
 Tue, 19 Oct 2021 11:07:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcmxd-00069p-TP; Tue, 19 Oct 2021 11:07:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcmxd-0008DR-QA; Tue, 19 Oct 2021 11:07:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcmxd-0000Gv-G8; Tue, 19 Oct 2021 11:07:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcmxd-0003HX-Fd; Tue, 19 Oct 2021 11:07:13 +0000
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
	bh=1rY2b755Vwr/ziBY6G4BNPYDvcmN6ljayQ5l790Aa7k=; b=JigZ1xzpUS+Y5PAwsB9hC6AWXp
	47W91zwXgCJ5XwX1KWBAptX29frWZm8JnzxYMlZwclwNNmtqotPWGUStdJjbdTq68ng8uf9z7mAXQ
	Rsx884U13FAp76stvlS5VpFOuUHp1BXbDwNDTpaJPFWKCv7rrChShJIquNYYJzje67F8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165657-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165657: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=91a978ce7e0c7a327cff1d9411b0e1c9dae8824a
X-Osstest-Versions-That:
    ovmf=36b561623a4b8a6c7fea0b1b01f6789f2adf97e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Oct 2021 11:07:13 +0000

flight 165657 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165657/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 91a978ce7e0c7a327cff1d9411b0e1c9dae8824a
baseline version:
 ovmf                 36b561623a4b8a6c7fea0b1b01f6789f2adf97e0

Last test of basis   165652  2021-10-19 01:40:11 Z    0 days
Testing same since   165657  2021-10-19 04:10:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  Moritz Fischer <moritzf@google.com>

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
   36b561623a..91a978ce7e  91a978ce7e0c7a327cff1d9411b0e1c9dae8824a -> xen-tested-master

