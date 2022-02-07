Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA464AC9A8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 20:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267421.461170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9mh-00055N-MR; Mon, 07 Feb 2022 19:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267421.461170; Mon, 07 Feb 2022 19:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9mh-000525-Ih; Mon, 07 Feb 2022 19:34:47 +0000
Received: by outflank-mailman (input) for mailman id 267421;
 Mon, 07 Feb 2022 19:34:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH9mf-00051s-P4; Mon, 07 Feb 2022 19:34:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH9mf-0002mo-LX; Mon, 07 Feb 2022 19:34:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH9me-00058M-VE; Mon, 07 Feb 2022 19:34:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nH9me-000770-UV; Mon, 07 Feb 2022 19:34:44 +0000
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
	bh=45saJKPgPvtaxFklVIyZ/aZ4Q+Y0sMyerXs5kGe4g7M=; b=KzXoEFoIUm3f+w76dqz1JcwJZO
	K5jQJA3oMuUYzO73zbG0PVNJD6WreHUpI2BPFv9dOGSNuhQl7/gFDYczKokKm1f9M0IVA4YylQTNu
	TyMQhspxVXzX+fUM4eKFFfmGBd2wuOVD2emxC8Z8u0NcbYUMMxCHvEMUqGyVFyveOGFg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168048-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168048: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b360b0b589697da267f5d3a553e65635b91ebae2
X-Osstest-Versions-That:
    ovmf=1f54eaa725f45e0c66c28f8d47fa8fb33f7be52c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Feb 2022 19:34:44 +0000

flight 168048 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168048/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b360b0b589697da267f5d3a553e65635b91ebae2
baseline version:
 ovmf                 1f54eaa725f45e0c66c28f8d47fa8fb33f7be52c

Last test of basis   168046  2022-02-07 14:11:34 Z    0 days
Testing same since   168048  2022-02-07 17:10:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Xiaoyu Lu <xiaoyu1.lu@intel.com>

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
   1f54eaa725..b360b0b589  b360b0b589697da267f5d3a553e65635b91ebae2 -> xen-tested-master

