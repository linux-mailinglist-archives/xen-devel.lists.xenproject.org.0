Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F00E6CFA2F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 06:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516418.800463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phjuU-0007sb-MT; Thu, 30 Mar 2023 04:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516418.800463; Thu, 30 Mar 2023 04:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phjuU-0007q5-JO; Thu, 30 Mar 2023 04:29:14 +0000
Received: by outflank-mailman (input) for mailman id 516418;
 Thu, 30 Mar 2023 04:29:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phjuT-0007pv-IC; Thu, 30 Mar 2023 04:29:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phjuT-00031k-Dc; Thu, 30 Mar 2023 04:29:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phjuS-0006i4-Uw; Thu, 30 Mar 2023 04:29:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phjuS-0004fs-UV; Thu, 30 Mar 2023 04:29:12 +0000
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
	bh=4+Z1L9ne66g13fqgGSK7NQYHnhHOasRAwtHG2fXtGgE=; b=XZ/2L10esqekExjJf3bZnNGLcW
	M2QwiqCEzl7KC38dofg/hAy+gso4B0KdL9xSkOZzBFLI/gDkf5pLUcEZaNG/syuRJROjQwwrKBYBA
	RiDN9dezQZHVsB/yAfK2AEEpWKSlXimVlciwmvtT+yIOCgV1uZ4QkpJugKi5wVDYqBKg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180060-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180060: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e3e88d90e8d777e38120c32c7b3bbfb9bcf99b79
X-Osstest-Versions-That:
    ovmf=f92a9dce10281c103b04d6b38283e0ff1d677b91
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Mar 2023 04:29:12 +0000

flight 180060 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180060/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e3e88d90e8d777e38120c32c7b3bbfb9bcf99b79
baseline version:
 ovmf                 f92a9dce10281c103b04d6b38283e0ff1d677b91

Last test of basis   180055  2023-03-29 18:13:35 Z    0 days
Testing same since   180060  2023-03-30 02:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Wu <linusx.wu@intel.com>

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
   f92a9dce10..e3e88d90e8  e3e88d90e8d777e38120c32c7b3bbfb9bcf99b79 -> xen-tested-master

