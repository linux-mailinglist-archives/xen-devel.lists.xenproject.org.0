Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8546A1161
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 21:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500705.772186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIRx-0008MB-4i; Thu, 23 Feb 2023 20:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500705.772186; Thu, 23 Feb 2023 20:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIRx-0008K3-1b; Thu, 23 Feb 2023 20:44:21 +0000
Received: by outflank-mailman (input) for mailman id 500705;
 Thu, 23 Feb 2023 20:44:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVIRu-0008Jt-Uq; Thu, 23 Feb 2023 20:44:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVIRu-0007Yq-Tj; Thu, 23 Feb 2023 20:44:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVIRu-0001lV-Nc; Thu, 23 Feb 2023 20:44:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pVIRu-0000k6-L9; Thu, 23 Feb 2023 20:44:18 +0000
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
	bh=pLR346oi3CZkVXn7QowAohVJfbMvEBv1+XoUSaDcD1I=; b=1k+72Nurd6wU99JhngTkKf1qNL
	DZANczYFS3tKYT7o07g9T1YtMktmy9y9rMgpL3ikmdS9h8mRj6CGstStUNXe3tLYWOhXaUaJhP2m8
	D3k0mWLXxubc2fpg8VhfhaX7NDJpscmglOImWVk3/9Ad9B/LT9HPC44MBJWhRv7qxIvA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178254-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 178254: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1eeca0750af5af2f0e78437bf791ac2de74bde74
X-Osstest-Versions-That:
    ovmf=2c5961cccff1164ac7d0e34baa606d1ba1abcf43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Feb 2023 20:44:18 +0000

flight 178254 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178254/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1eeca0750af5af2f0e78437bf791ac2de74bde74
baseline version:
 ovmf                 2c5961cccff1164ac7d0e34baa606d1ba1abcf43

Last test of basis   178201  2023-02-23 04:12:36 Z    0 days
Testing same since   178254  2023-02-23 15:11:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  MarsX Lin <marsx.lin@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>

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
   2c5961cccf..1eeca0750a  1eeca0750af5af2f0e78437bf791ac2de74bde74 -> xen-tested-master

