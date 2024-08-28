Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322039623E8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784598.1193993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFIN-00043K-Kl; Wed, 28 Aug 2024 09:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784598.1193993; Wed, 28 Aug 2024 09:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFIN-00041Q-GT; Wed, 28 Aug 2024 09:48:55 +0000
Received: by outflank-mailman (input) for mailman id 784598;
 Wed, 28 Aug 2024 09:48:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjFIL-0003zn-KT; Wed, 28 Aug 2024 09:48:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjFIL-0004qV-8k; Wed, 28 Aug 2024 09:48:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjFIK-0007RF-Rj; Wed, 28 Aug 2024 09:48:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjFIK-0003d8-RJ; Wed, 28 Aug 2024 09:48:52 +0000
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
	bh=4EAExhmCMIFJzRf7CnQ5S79jO5HVueJTxHyVvTOp0do=; b=SsPj3mOzLe9Pn4KOpSVa/z3Lj1
	PFQpGDzFonaurmF1dR7e4XC7xfj46aTKMLWCTWV59bT1DcQlgZ6yHTJamtc2xxNPdlF2GuYOpf33C
	wcIgHp8zrqvUEBXFBioWAQxDj3ecVBBy+il/C9p8kUJ5q+R9/zoY/dDAkllst4cTfEzU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187378-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187378: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=99e4c8ea93fa0e98bc1bdb968e9d5bb42ff5d39c
X-Osstest-Versions-That:
    ovmf=25da777d95c0e76b3e0a15ff617870105c228b7b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 09:48:52 +0000

flight 187378 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187378/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 99e4c8ea93fa0e98bc1bdb968e9d5bb42ff5d39c
baseline version:
 ovmf                 25da777d95c0e76b3e0a15ff617870105c228b7b

Last test of basis   187375  2024-08-28 04:41:30 Z    0 days
Testing same since   187378  2024-08-28 07:13:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>

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
   25da777d95..99e4c8ea93  99e4c8ea93fa0e98bc1bdb968e9d5bb42ff5d39c -> xen-tested-master

