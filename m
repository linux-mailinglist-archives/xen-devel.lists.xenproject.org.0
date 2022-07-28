Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAC58385B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 08:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376594.609467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwbV-0003qT-FS; Thu, 28 Jul 2022 06:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376594.609467; Thu, 28 Jul 2022 06:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwbV-0003mu-Bx; Thu, 28 Jul 2022 06:02:37 +0000
Received: by outflank-mailman (input) for mailman id 376594;
 Thu, 28 Jul 2022 06:02:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGwbT-0003mk-DS; Thu, 28 Jul 2022 06:02:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGwbT-0000fp-BZ; Thu, 28 Jul 2022 06:02:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGwbS-0006uK-SM; Thu, 28 Jul 2022 06:02:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGwbS-0003mI-Rs; Thu, 28 Jul 2022 06:02:34 +0000
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
	bh=ru04v/J9dAtXyQ/foJjDJNCmpeRukly8568107o2Xjs=; b=xgWEIfmW22lblAXr37FEu8glZ/
	KX908S4wnWipFr4BXGWJDMpTEXh8jYEJvs8Pk8Mm09fNY3B+u9c9Ui9ksX4vqxjFlUl0wg4xZExx2
	LLF8bGhhWnobZGYBn/JifiDgYR0KQfycHYmqGzAVGWSlpxXUFzgrzmFUrptFPXUGlb8o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171894-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171894: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e7add1d75fc75762208af84579e6809589ea6e5
X-Osstest-Versions-That:
    ovmf=1774a44ad91d01294bace32b0060ce26da2f0140
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Jul 2022 06:02:34 +0000

flight 171894 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171894/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e7add1d75fc75762208af84579e6809589ea6e5
baseline version:
 ovmf                 1774a44ad91d01294bace32b0060ce26da2f0140

Last test of basis   171892  2022-07-28 00:43:04 Z    0 days
Testing same since   171894  2022-07-28 03:43:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>

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
   1774a44ad9..0e7add1d75  0e7add1d75fc75762208af84579e6809589ea6e5 -> xen-tested-master

