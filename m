Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE712FC976
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 04:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71218.127377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l24Ys-0008TU-96; Wed, 20 Jan 2021 03:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71218.127377; Wed, 20 Jan 2021 03:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l24Ys-0008T2-5G; Wed, 20 Jan 2021 03:53:38 +0000
Received: by outflank-mailman (input) for mailman id 71218;
 Wed, 20 Jan 2021 03:53:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l24Yq-0008Su-Qw; Wed, 20 Jan 2021 03:53:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l24Yq-00075n-IT; Wed, 20 Jan 2021 03:53:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l24Yq-000462-AW; Wed, 20 Jan 2021 03:53:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l24Yq-0000RF-9e; Wed, 20 Jan 2021 03:53:36 +0000
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
	bh=lsWkNH8HpIrSr1hgN7Uo2yKxGIHcTaHP5ciaUkIZxlY=; b=nBm0SEgWMpJvCc+PFj3v+SZQSO
	lQxUWbqK0lfAksYWwI1b1yctuGs7GfwGt92uC1F43MESXrA0ofFCqnYDO7C+jZf3xpNqWoNi4IrPt
	CdhQ2GAXPkMeYeYNzU4B5lF3uV+EzWRGYKIQUylYvEmLy6N9WdCtJVL/t2tjGCL4Q3f0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158531: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6e5586863148773c15399ead249711143a74d2d0
X-Osstest-Versions-That:
    ovmf=83facfd184021874f95a6a34b2e47e0ebb34a762
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jan 2021 03:53:36 +0000

flight 158531 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158531/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6e5586863148773c15399ead249711143a74d2d0
baseline version:
 ovmf                 83facfd184021874f95a6a34b2e47e0ebb34a762

Last test of basis   158522  2021-01-19 14:11:30 Z    0 days
Testing same since   158531  2021-01-19 22:15:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Laszlo Ersek <lersek@redhat.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   83facfd184..6e55868631  6e5586863148773c15399ead249711143a74d2d0 -> xen-tested-master

