Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C698089AE92
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 06:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701536.1095927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtKKE-0006P7-NF; Sun, 07 Apr 2024 04:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701536.1095927; Sun, 07 Apr 2024 04:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtKKE-0006NY-JL; Sun, 07 Apr 2024 04:40:14 +0000
Received: by outflank-mailman (input) for mailman id 701536;
 Sun, 07 Apr 2024 04:40:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtKKC-0006NN-PO; Sun, 07 Apr 2024 04:40:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtKKC-00055J-Cq; Sun, 07 Apr 2024 04:40:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtKKB-0003d8-Rp; Sun, 07 Apr 2024 04:40:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rtKKB-0004Am-RI; Sun, 07 Apr 2024 04:40:11 +0000
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
	bh=LnllqMo/qIQMsHswjfTL4C0VasgCu/IHddj4hsqrtJY=; b=OE6Zx6OEsfIp1wC2ObUStHN4KF
	iJzhilG003zosubhXYV6iNxtrXYNGE9NO2PWgi+oRcy6WbZsf3vuTw4XjdAT/wMT9LQ5jmUnYVETI
	p300oF3kBhzDPhFVY4TfYDmumxw7AVNNSHSoS8v/Shw5Rjdi9/rnAN0hSfmYM6qEuLTU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185263-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185263: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ee28bea4c0779d3874dbe0a5d6ade549295d7d8b
X-Osstest-Versions-That:
    ovmf=8707f835ae355832965508b6be96765660fb1861
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Apr 2024 04:40:11 +0000

flight 185263 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185263/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ee28bea4c0779d3874dbe0a5d6ade549295d7d8b
baseline version:
 ovmf                 8707f835ae355832965508b6be96765660fb1861

Last test of basis   185245  2024-04-05 05:11:17 Z    1 days
Testing same since   185263  2024-04-07 03:14:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Ming Tan <ming.tan@intel.com>

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
   8707f835ae..ee28bea4c0  ee28bea4c0779d3874dbe0a5d6ade549295d7d8b -> xen-tested-master

