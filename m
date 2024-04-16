Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615258A6729
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706832.1104238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwf9l-0008By-8y; Tue, 16 Apr 2024 09:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706832.1104238; Tue, 16 Apr 2024 09:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwf9l-00089X-5C; Tue, 16 Apr 2024 09:31:13 +0000
Received: by outflank-mailman (input) for mailman id 706832;
 Tue, 16 Apr 2024 09:31:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwf9j-00089N-Et; Tue, 16 Apr 2024 09:31:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwf9j-0004Zl-5f; Tue, 16 Apr 2024 09:31:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwf9i-0008JZ-Uj; Tue, 16 Apr 2024 09:31:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwf9i-0006n5-UH; Tue, 16 Apr 2024 09:31:10 +0000
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
	bh=KWtEoRlMp/QCrGipva5rkP/DHM/ALXCdxKJs+GXAr0U=; b=5gseg961bgMG08Me42Rxm4Khhv
	txpZPvZLBnQBodl1CX9AeYo/kmXzUg+Q+GpuoQBWsTUsP2mVMGkiRflh52LEfADtlapqmqXISybYP
	dta+u+H+OZcUSr1m0ag97uoShzbQ9g6NWWwK6+X0tsnguET0CmykxUMrNk14R/i/SiBA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185649-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185649: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6363872629cd58636128824977e56eea15b97a15
X-Osstest-Versions-That:
    ovmf=70892b13b28cdb0a10c82f3d3aca560a38dce5c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2024 09:31:10 +0000

flight 185649 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185649/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6363872629cd58636128824977e56eea15b97a15
baseline version:
 ovmf                 70892b13b28cdb0a10c82f3d3aca560a38dce5c9

Last test of basis   185643  2024-04-16 05:11:11 Z    0 days
Testing same since   185649  2024-04-16 07:49:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>
  Gerd Hoffmann <kraxel@redhat.com>
  Ray Ni <ray.ni@intel.com>

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
   70892b13b2..6363872629  6363872629cd58636128824977e56eea15b97a15 -> xen-tested-master

