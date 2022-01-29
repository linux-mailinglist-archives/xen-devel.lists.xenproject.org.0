Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DC4A31A8
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 20:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262314.454507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDtbY-0002Me-Dn; Sat, 29 Jan 2022 19:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262314.454507; Sat, 29 Jan 2022 19:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDtbY-0002Jx-AB; Sat, 29 Jan 2022 19:41:48 +0000
Received: by outflank-mailman (input) for mailman id 262314;
 Sat, 29 Jan 2022 19:41:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDtbX-0002Jm-6F; Sat, 29 Jan 2022 19:41:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDtbX-0000YD-4F; Sat, 29 Jan 2022 19:41:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDtbW-0000Gs-P0; Sat, 29 Jan 2022 19:41:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDtbW-0003YO-OW; Sat, 29 Jan 2022 19:41:46 +0000
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
	bh=6dKBpfSM2T6+K/rvTBxJn4EoOI44q+PpwG81BmD0JMA=; b=ZnLf4/IAecjXhUl/VD4Ij7esvr
	2RPfI+OTA2aFRMKrSk8IJO3XT9OTM7wYigXxWpMM/6fbjYI34mAmLj7q/EO8WyOxLi1TyaJQQUPxO
	VEuOj2AmqpY358TvOQAmqe883fbPA0EyEbPYQGPoRK5WP77Z4+0cM1MKWOPTP/eJE7vg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167946: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae35314e7b86417c166eb873eb26df012ae3787a
X-Osstest-Versions-That:
    ovmf=8542fc5f956821841154d4c11851c5484847ac0d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jan 2022 19:41:46 +0000

flight 167946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167946/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae35314e7b86417c166eb873eb26df012ae3787a
baseline version:
 ovmf                 8542fc5f956821841154d4c11851c5484847ac0d

Last test of basis   167940  2022-01-29 01:41:58 Z    0 days
Testing same since   167946  2022-01-29 15:43:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Sami Mujawar <sami.mujawar@arm.com>

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
   8542fc5f95..ae35314e7b  ae35314e7b86417c166eb873eb26df012ae3787a -> xen-tested-master

