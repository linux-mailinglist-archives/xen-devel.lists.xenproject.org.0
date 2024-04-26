Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D138B2F99
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 06:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712394.1113055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0De5-0007mr-7C; Fri, 26 Apr 2024 04:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712394.1113055; Fri, 26 Apr 2024 04:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0De5-0007k8-4V; Fri, 26 Apr 2024 04:57:13 +0000
Received: by outflank-mailman (input) for mailman id 712394;
 Fri, 26 Apr 2024 04:57:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0De4-0007jy-AV; Fri, 26 Apr 2024 04:57:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0De4-0005c0-1X; Fri, 26 Apr 2024 04:57:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0De3-0002FS-OK; Fri, 26 Apr 2024 04:57:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s0De3-0001MW-Ng; Fri, 26 Apr 2024 04:57:11 +0000
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
	bh=GDOZV1BcPVCFodKcqgP2EuV6mfhqdTjBNoAIyaeAgRM=; b=yw6lqRAp6awjkqomYq510wyl8H
	FYsSvXIgJhVPro004E385CP7H9voP+YitKazHEv2AgcLCEcrn4z/RX7wvRGeh3p5cP9hQxgPoZgTx
	LfYU2v1uJ0C7Ad9Mb98pUhq/1lBJwYaWOBoW1Yw9XQh5TW4+vk74Q0lkJJZxs1v2IYcU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185803-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185803: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c0dfe3ec1f364dbdaf6b241e01343e560b21dd03
X-Osstest-Versions-That:
    ovmf=66c24219ade92b85b24f3ce29b988d187a9f6517
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Apr 2024 04:57:11 +0000

flight 185803 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185803/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c0dfe3ec1f364dbdaf6b241e01343e560b21dd03
baseline version:
 ovmf                 66c24219ade92b85b24f3ce29b988d187a9f6517

Last test of basis   185792  2024-04-25 01:43:46 Z    1 days
Testing same since   185803  2024-04-26 03:11:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   66c24219ad..c0dfe3ec1f  c0dfe3ec1f364dbdaf6b241e01343e560b21dd03 -> xen-tested-master

