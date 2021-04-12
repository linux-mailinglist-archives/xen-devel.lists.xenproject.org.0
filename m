Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1435C53E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109010.208065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVupz-0005G5-Ag; Mon, 12 Apr 2021 11:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109010.208065; Mon, 12 Apr 2021 11:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVupz-0005FY-53; Mon, 12 Apr 2021 11:34:39 +0000
Received: by outflank-mailman (input) for mailman id 109010;
 Mon, 12 Apr 2021 11:34:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVupx-0005FP-7z; Mon, 12 Apr 2021 11:34:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVupx-0003ql-1o; Mon, 12 Apr 2021 11:34:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVupw-0004l9-Jm; Mon, 12 Apr 2021 11:34:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lVupw-0000cb-JE; Mon, 12 Apr 2021 11:34:36 +0000
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
	bh=g5iQXEbhcdf1QKydEsCpsbe1/F+FbAiwl45o8/07Fa0=; b=vlKuAP9GjrZQNtdNQRr4HaTWer
	nYq7ZSeVSalJdK8OoYEMpwSN/AnTPNOCwlLD77P0MJi03grjIKyR/rcd1BUFwhMWno2AmLskNUG21
	Isa+91LKUO/PrB1tTaSxtcuwDIIuB5pxGt1HzcaNr8maqJVP4fQWzOeinsYKdLefvbEs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161033-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161033: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=97336fdee4f9847e164639f06616ce1139ef9a15
X-Osstest-Versions-That:
    ovmf=efa7f4df0f3b9e70d49dc41b397ec8400c1ad374
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Apr 2021 11:34:36 +0000

flight 161033 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161033/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 97336fdee4f9847e164639f06616ce1139ef9a15
baseline version:
 ovmf                 efa7f4df0f3b9e70d49dc41b397ec8400c1ad374

Last test of basis   160859  2021-04-09 10:33:55 Z    3 days
Testing same since   161033  2021-04-12 02:41:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@nuviainc.com>

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
   efa7f4df0f..97336fdee4  97336fdee4f9847e164639f06616ce1139ef9a15 -> xen-tested-master

