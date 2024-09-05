Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3E96E317
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 21:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791327.1201193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smI4B-0008Bq-Ep; Thu, 05 Sep 2024 19:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791327.1201193; Thu, 05 Sep 2024 19:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smI4B-0008A9-C3; Thu, 05 Sep 2024 19:22:51 +0000
Received: by outflank-mailman (input) for mailman id 791327;
 Thu, 05 Sep 2024 19:22:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smI49-00089z-OU; Thu, 05 Sep 2024 19:22:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smI49-0008JB-D1; Thu, 05 Sep 2024 19:22:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smI48-0005X4-TH; Thu, 05 Sep 2024 19:22:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smI48-0002KJ-St; Thu, 05 Sep 2024 19:22:48 +0000
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
	bh=FJSARnq5Hf+sYBD9WuAOOne041fZ61HAGw9Iv7plFvY=; b=uOa0ZNa4OQ4De8pLrFDOCscnkh
	MctcDzq6g1SzkB/EcXzrM9R8v7ciDH9Pd9w/AaXI7qSFnpE5T+mwVax9WafXoDdRe3chDwkUdNLVq
	S9z9UeA/GOcm9sE/V/VDdhSRzaqPCXGE6tti/Zhzz0G2Eow7LcMqq51cwfoWhpTK7qtk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187508-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187508: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=013d51771a67ff87e6cb17a57e156ef4b6f4ec54
X-Osstest-Versions-That:
    ovmf=3151798123e1419e74ebef1df73e9d651f1fcd3e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Sep 2024 19:22:48 +0000

flight 187508 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187508/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 013d51771a67ff87e6cb17a57e156ef4b6f4ec54
baseline version:
 ovmf                 3151798123e1419e74ebef1df73e9d651f1fcd3e

Last test of basis   187503  2024-09-05 08:15:06 Z    0 days
Testing same since   187508  2024-09-05 17:14:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Vishal Oliyil Kunnil <quic_vishalo@quicinc.com>
  Vishal Oliyil Kunnil <vishalo@qti.qualcomm.com>

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
   3151798123..013d51771a  013d51771a67ff87e6cb17a57e156ef4b6f4ec54 -> xen-tested-master

