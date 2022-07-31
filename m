Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB85586060
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jul 2022 20:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378389.611628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIDn1-0004Vn-Gd; Sun, 31 Jul 2022 18:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378389.611628; Sun, 31 Jul 2022 18:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIDn1-0004Tu-Dm; Sun, 31 Jul 2022 18:35:47 +0000
Received: by outflank-mailman (input) for mailman id 378389;
 Sun, 31 Jul 2022 18:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIDmz-0004Tk-Qz; Sun, 31 Jul 2022 18:35:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIDmz-0002ZE-Np; Sun, 31 Jul 2022 18:35:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIDmz-0003Pz-5L; Sun, 31 Jul 2022 18:35:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oIDmz-0001oA-4r; Sun, 31 Jul 2022 18:35:45 +0000
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
	bh=PlQEllz02+T1qnp1U+z5lzzIbk8o46agiDXIJ9iZmIM=; b=QCGwMVrYYiKzS1dgsZggHTFFpf
	/qbCaGJnDnb8uxlEgkPEzN4B9RFQQdZwICSLuH/iT4buaeBLf0P1BaM2azxHAw6lQRQfHkIRVH6yV
	bZOkzsAZHi+MwbwT9EOHC/P1RPKocUm6l+gYbNr6GaGvZfVUclP0s6r9Cj480tyOxbfc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172050-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172050: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6f4e10d6db316c279ed90036c9a206a1b89f0878
X-Osstest-Versions-That:
    ovmf=e9150618ec91f79e70a1719ac8c198bee34a99be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Jul 2022 18:35:45 +0000

flight 172050 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172050/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6f4e10d6db316c279ed90036c9a206a1b89f0878
baseline version:
 ovmf                 e9150618ec91f79e70a1719ac8c198bee34a99be

Last test of basis   171929  2022-07-29 19:42:00 Z    1 days
Testing same since   172050  2022-07-31 16:40:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qi Zhang <qi1.zhang@intel.com>
  Swapnil Patil <S.Keshavrao.Patil@dell.com>

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
   e9150618ec..6f4e10d6db  6f4e10d6db316c279ed90036c9a206a1b89f0878 -> xen-tested-master

