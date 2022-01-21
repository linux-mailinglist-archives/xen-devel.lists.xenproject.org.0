Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26560495EF7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 13:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259327.447521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAsy0-0004CP-NH; Fri, 21 Jan 2022 12:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259327.447521; Fri, 21 Jan 2022 12:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAsy0-00049m-Jz; Fri, 21 Jan 2022 12:24:32 +0000
Received: by outflank-mailman (input) for mailman id 259327;
 Fri, 21 Jan 2022 12:24:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAsxz-00049c-JC; Fri, 21 Jan 2022 12:24:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAsxz-00042E-G5; Fri, 21 Jan 2022 12:24:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAsxz-0004dK-64; Fri, 21 Jan 2022 12:24:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nAsxz-0001IU-5c; Fri, 21 Jan 2022 12:24:31 +0000
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
	bh=vtXpQLCovnYP3SNTc3VuDm/ZSMmbmHVFLWpliUBPguY=; b=FCvN1EIY+qWddCx8J7X/kiUhQE
	Rl21qybpEQ9s0DXHDAPRAKFjE5Ob7Eq9RVOJwJFu+B4VDtxzpGhY3q+4FuRkkckrOfuTNJaVROu6W
	GotvSGTS2PL2q1XKsxBPaF5XYC3zM0rf0+rkJW+KVmdYq81LiVBQudM4hkC5b1RVaqdA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167775-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167775: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=21320ef66989f8af5a9e9b57df73d20a70bea85f
X-Osstest-Versions-That:
    ovmf=7709988dd8f9a69eea456869f468120f1f0fc7cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jan 2022 12:24:31 +0000

flight 167775 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167775/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21320ef66989f8af5a9e9b57df73d20a70bea85f
baseline version:
 ovmf                 7709988dd8f9a69eea456869f468120f1f0fc7cb

Last test of basis   167760  2022-01-20 13:43:03 Z    0 days
Testing same since   167775  2022-01-21 02:42:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunny Wang <sunny.wang@arm.com>

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
   7709988dd8..21320ef669  21320ef66989f8af5a9e9b57df73d20a70bea85f -> xen-tested-master

