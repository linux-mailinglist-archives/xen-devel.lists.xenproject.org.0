Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3082D5B2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667240.1038302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJ5h-0007FY-In; Mon, 15 Jan 2024 09:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667240.1038302; Mon, 15 Jan 2024 09:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJ5h-0007Dv-GC; Mon, 15 Jan 2024 09:17:09 +0000
Received: by outflank-mailman (input) for mailman id 667240;
 Mon, 15 Jan 2024 09:17:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPJ5f-0007Dl-PI; Mon, 15 Jan 2024 09:17:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPJ5f-00071G-Dr; Mon, 15 Jan 2024 09:17:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPJ5f-0004i4-0B; Mon, 15 Jan 2024 09:17:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPJ5e-0007df-Vv; Mon, 15 Jan 2024 09:17:06 +0000
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
	bh=HTlFTx/W69W9vWcjlUC73FMa9ZylvKIEbFq5OZT0CLs=; b=SCSDoDMr1kDg+trh+WbSsuBPC1
	TT9fbGrAf9i/Ecsgnj9HA/V6k8tJI/uKUZI+c224W+HM2e36zlVhSQvZWSZSjsa+9DXJFblsc20up
	DxVoWOCVFK57qemcuW5SgfOXkVdwZLmK83JdJn+ZQkziMt/TzucEyn1sIpbWHfxeBN/8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184350-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184350: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6a01fb2ea5b3b142a98f3649b0947268f038f389
X-Osstest-Versions-That:
    ovmf=f5b91c60ef24eecf5702e061dd7fd700943405b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 09:17:06 +0000

flight 184350 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184350/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6a01fb2ea5b3b142a98f3649b0947268f038f389
baseline version:
 ovmf                 f5b91c60ef24eecf5702e061dd7fd700943405b2

Last test of basis   184348  2024-01-15 01:56:07 Z    0 days
Testing same since   184350  2024-01-15 07:12:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Tuan Phan <tphan@ventanamicro.com>

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
   f5b91c60ef..6a01fb2ea5  6a01fb2ea5b3b142a98f3649b0947268f038f389 -> xen-tested-master

