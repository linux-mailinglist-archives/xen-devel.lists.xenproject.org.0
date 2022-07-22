Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508157E789
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 21:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373465.605679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEyTc-0000Cy-A3; Fri, 22 Jul 2022 19:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373465.605679; Fri, 22 Jul 2022 19:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEyTc-00009b-6Z; Fri, 22 Jul 2022 19:38:20 +0000
Received: by outflank-mailman (input) for mailman id 373465;
 Fri, 22 Jul 2022 19:38:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEyTa-00009Q-V5; Fri, 22 Jul 2022 19:38:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEyTa-00047A-T6; Fri, 22 Jul 2022 19:38:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEyTa-0000ys-Ic; Fri, 22 Jul 2022 19:38:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEyTa-0006wn-Hv; Fri, 22 Jul 2022 19:38:18 +0000
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
	bh=6T0r2Pxi2bKgmEHHOzzMNnN3uW5lKJvWCxjNfuQIBmY=; b=50vqjUSWO4NWjGK1wDmWw5bl4G
	vJQUVZblK8H6fhP41Enhli4SKjPzDUmPfayFr2bz4iur0kjn+H19k+IiqBnGRSCm0utGlOT4/kaxV
	U9wSWAbPBK3aXytPFDN8rtL8QC1WKa6TK7+mDDx5+0d5rSEVPOgjCq6vGnSkaEb/5Kfc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171776-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171776: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c8af26627a4e9a3659255dc147d75596da08248e
X-Osstest-Versions-That:
    ovmf=343f37b5c07fd261b0fe8f3236459c9071be38b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Jul 2022 19:38:18 +0000

flight 171776 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171776/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c8af26627a4e9a3659255dc147d75596da08248e
baseline version:
 ovmf                 343f37b5c07fd261b0fe8f3236459c9071be38b7

Last test of basis   171766  2022-07-22 07:45:21 Z    0 days
Testing same since   171776  2022-07-22 17:41:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Sami Mujawar <sami.mujawar@arm.com>

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
   343f37b5c0..c8af26627a  c8af26627a4e9a3659255dc147d75596da08248e -> xen-tested-master

