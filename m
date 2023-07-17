Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E0756EA6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 22:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564849.882581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVIK-0001Ze-IT; Mon, 17 Jul 2023 20:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564849.882581; Mon, 17 Jul 2023 20:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVIK-0001Xz-Fa; Mon, 17 Jul 2023 20:58:12 +0000
Received: by outflank-mailman (input) for mailman id 564849;
 Mon, 17 Jul 2023 20:58:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLVIJ-0001Xp-3E; Mon, 17 Jul 2023 20:58:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLVII-00038w-O3; Mon, 17 Jul 2023 20:58:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLVII-0002ox-AA; Mon, 17 Jul 2023 20:58:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qLVII-0004uS-9l; Mon, 17 Jul 2023 20:58:10 +0000
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
	bh=Jp0+G/xcAxEC7ZSVju1zs5xQOg6jqYnKbBI6yTIO8cc=; b=uPKo12jI79Gs3FOrUyO+QLJs2C
	bh1LjNk1jKYChGCOVrJnL/87V9WHCEjT2hgBdwjmyuc8oD7Qw1orEOyPOKCeE55oYr5KrX4lWsRwb
	WzwDFgaU4mxXhxtGFadHj+uz6sc8Y2g3S65Wa3o3UrINbcVUmSvkNbCidSHXj0wVveNE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181847-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181847: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4d1014093fbf1ae2788caaad8e70eabb15720ce4
X-Osstest-Versions-That:
    ovmf=39ded59c09a38cb17cee498fca9f390c4deca98a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jul 2023 20:58:10 +0000

flight 181847 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181847/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4d1014093fbf1ae2788caaad8e70eabb15720ce4
baseline version:
 ovmf                 39ded59c09a38cb17cee498fca9f390c4deca98a

Last test of basis   181833  2023-07-17 06:40:44 Z    0 days
Testing same since   181847  2023-07-17 14:10:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>
  Abner Chang <abner.chang@amd.com>

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
   39ded59c09..4d1014093f  4d1014093fbf1ae2788caaad8e70eabb15720ce4 -> xen-tested-master

