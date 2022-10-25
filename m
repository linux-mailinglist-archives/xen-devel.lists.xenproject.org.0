Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F096C60C625
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 10:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429629.680720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onF3t-0001ru-DR; Tue, 25 Oct 2022 08:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429629.680720; Tue, 25 Oct 2022 08:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onF3t-0001q7-AZ; Tue, 25 Oct 2022 08:13:25 +0000
Received: by outflank-mailman (input) for mailman id 429629;
 Tue, 25 Oct 2022 08:13:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onF3r-0001pt-UV; Tue, 25 Oct 2022 08:13:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onF3r-0006c2-PZ; Tue, 25 Oct 2022 08:13:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onF3r-0002XM-EL; Tue, 25 Oct 2022 08:13:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1onF3r-0004dM-Df; Tue, 25 Oct 2022 08:13:23 +0000
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
	bh=X+x3nY9xy/lq7XDBqzxv6L5b8QzyDlWBEMqfCzAQhqo=; b=i7oT+nCy4TGFs5br0FC6lcNZbv
	b2Ip6sdvi9IkHtbtgMfRB/XjvV8hMe4nbswSEuCz+9a2ilqWF4st6uBA7DA92eD7do++na/0ffMmU
	Q4UN9/Lm17LZnlF7i79UH/vfmOeSkjyilpVepqeYV3pZQoDbMN5f+WG5UTxSom7TeQzY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174370: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fb493ac84ebc6860e1690770fb88183effadebfb
X-Osstest-Versions-That:
    ovmf=4d29da411fa031031a90ec713ad826570e9117d7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Oct 2022 08:13:23 +0000

flight 174370 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174370/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fb493ac84ebc6860e1690770fb88183effadebfb
baseline version:
 ovmf                 4d29da411fa031031a90ec713ad826570e9117d7

Last test of basis   174354  2022-10-24 06:40:39 Z    1 days
Testing same since   174370  2022-10-24 22:42:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Yi Li <yi1.li@intel.com>

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
   4d29da411f..fb493ac84e  fb493ac84ebc6860e1690770fb88183effadebfb -> xen-tested-master

