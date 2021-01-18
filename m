Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B462FA9D0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 20:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70022.125628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zxj-0004Qe-Sf; Mon, 18 Jan 2021 19:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70022.125628; Mon, 18 Jan 2021 19:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zxj-0004QA-Lp; Mon, 18 Jan 2021 19:13:15 +0000
Received: by outflank-mailman (input) for mailman id 70022;
 Mon, 18 Jan 2021 19:13:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Zxh-0004Py-CV; Mon, 18 Jan 2021 19:13:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Zxh-0000Cw-98; Mon, 18 Jan 2021 19:13:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Zxg-0001k4-WA; Mon, 18 Jan 2021 19:13:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1Zxg-00070M-Vi; Mon, 18 Jan 2021 19:13:12 +0000
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
	bh=ESZo1pe+Z/pLzdY3UPySY37nwxUL3BFUH+4VDZbVIYg=; b=vMz+v8Yf14iJeqFX9FiSvvjEsM
	dP5d2pH/CaH/Mt3sKsGKT9ILyoJo6OUL0Kd0azQAqyVKym20d0HKutKqnkqQBgCSFg1lYADsA8OjL
	tuUC00zK/hWPGPdpQ2nrzQQgPXWco9d0JBFDtV39Fb2uDSZjQgQ5YRiSW5u4x4AoeLqQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158489-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158489: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f214830ce02cf588baba9ae6e7becfd67e5748c
X-Osstest-Versions-That:
    ovmf=a7ef2a03b96c464c776a139c104471fb2b84e39b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Jan 2021 19:13:12 +0000

flight 158489 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158489/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f214830ce02cf588baba9ae6e7becfd67e5748c
baseline version:
 ovmf                 a7ef2a03b96c464c776a139c104471fb2b84e39b

Last test of basis   158484  2021-01-18 04:16:23 Z    0 days
Testing same since   158489  2021-01-18 13:09:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>

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
   a7ef2a03b9..4f214830ce  4f214830ce02cf588baba9ae6e7becfd67e5748c -> xen-tested-master

