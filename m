Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803596D5D1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 12:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791012.1200771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9dk-0000RV-Cg; Thu, 05 Sep 2024 10:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791012.1200771; Thu, 05 Sep 2024 10:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9dk-0000PY-9N; Thu, 05 Sep 2024 10:23:00 +0000
Received: by outflank-mailman (input) for mailman id 791012;
 Thu, 05 Sep 2024 10:22:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm9dj-0000PL-Jy; Thu, 05 Sep 2024 10:22:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm9dj-0006Gm-Bk; Thu, 05 Sep 2024 10:22:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm9di-0006hC-Sw; Thu, 05 Sep 2024 10:22:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sm9di-00014J-ST; Thu, 05 Sep 2024 10:22:58 +0000
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
	bh=Ez7ExB/A5crMdBDs8k8PWweR9i+CtczDFmzDgYLbfuE=; b=b+HQdKY5/BvcAQDRuBAnODS8l0
	fWuOu01wI4EFqLUrAFBFhz0BUGjIzESD4cOhwEpOcjcoc0eOKJJvVAZJyiitSKiA3NY1G3YUyLzPH
	Hu8RJDTPi9yr1m5fa/awN39Oe1EM9IJjMEUBZmAEjUP5RguCwLA+IkFnjM4C5ndQqlZM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187503-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187503: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3151798123e1419e74ebef1df73e9d651f1fcd3e
X-Osstest-Versions-That:
    ovmf=03bc4252fb68f0dcba72a19e1b2a861a5d6c927e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Sep 2024 10:22:58 +0000

flight 187503 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187503/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3151798123e1419e74ebef1df73e9d651f1fcd3e
baseline version:
 ovmf                 03bc4252fb68f0dcba72a19e1b2a861a5d6c927e

Last test of basis   187502  2024-09-05 06:43:27 Z    0 days
Testing same since   187503  2024-09-05 08:15:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Carsten Haitzler <carsten.haitzler@foss.arm.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>

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
   03bc4252fb..3151798123  3151798123e1419e74ebef1df73e9d651f1fcd3e -> xen-tested-master

