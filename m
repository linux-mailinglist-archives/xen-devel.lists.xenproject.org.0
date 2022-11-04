Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87476190C1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 07:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437291.691566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqpve-0004Hv-L5; Fri, 04 Nov 2022 06:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437291.691566; Fri, 04 Nov 2022 06:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqpve-0004G8-H7; Fri, 04 Nov 2022 06:11:46 +0000
Received: by outflank-mailman (input) for mailman id 437291;
 Fri, 04 Nov 2022 06:11:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqpvd-0004Fw-3d; Fri, 04 Nov 2022 06:11:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqpvd-0007vq-2l; Fri, 04 Nov 2022 06:11:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqpvc-0005M9-MC; Fri, 04 Nov 2022 06:11:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oqpvc-0004PB-Lj; Fri, 04 Nov 2022 06:11:44 +0000
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
	bh=Q1z68JeZUc1+Q98M+Cw4vgXbBMdbeG39kObe+f87W0k=; b=V6kjWqPNGPe7YBIiQ7cyZF7uvW
	F0CeUiZfQN/7M47hp8Z6zMNeaLsCckYHf+dMdiwr+lOdp7uqbbIAWoFwp+mf52lGG9PmlnonsEzTL
	Hu5pbFg0byoV7qkXYoDPkk+4EWD7TXaw48tfxF+nXqS5trT31nIDGDZyzNA+5TV0r+aM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174613-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174613: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ee3da09bb2b7284a8bda6b7d85160cdd63cfb405
X-Osstest-Versions-That:
    ovmf=cab1f02565d3b29081dd21afb074f35fdb4e1fd6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Nov 2022 06:11:44 +0000

flight 174613 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174613/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ee3da09bb2b7284a8bda6b7d85160cdd63cfb405
baseline version:
 ovmf                 cab1f02565d3b29081dd21afb074f35fdb4e1fd6

Last test of basis   174610  2022-11-04 02:11:52 Z    0 days
Testing same since   174613  2022-11-04 04:10:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
  Sivaparvathi C <sivaparvathic@ami.com>
  Sivaparvathi chellaiah <sivaparvathic@ami.com>

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
   cab1f02565..ee3da09bb2  ee3da09bb2b7284a8bda6b7d85160cdd63cfb405 -> xen-tested-master

