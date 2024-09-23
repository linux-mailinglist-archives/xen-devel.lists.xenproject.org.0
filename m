Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82C97E7EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 10:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801722.1211703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssemp-00069p-Nf; Mon, 23 Sep 2024 08:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801722.1211703; Mon, 23 Sep 2024 08:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssemp-00067I-L9; Mon, 23 Sep 2024 08:51:15 +0000
Received: by outflank-mailman (input) for mailman id 801722;
 Mon, 23 Sep 2024 08:51:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssemo-000678-Ng; Mon, 23 Sep 2024 08:51:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssemo-0001IQ-MC; Mon, 23 Sep 2024 08:51:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssemo-0001Lz-7t; Mon, 23 Sep 2024 08:51:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssemo-0007iS-7T; Mon, 23 Sep 2024 08:51:14 +0000
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
	bh=J9HPpFMlv7CROd4Yh6nAw+jv1eOdgp32vJlF07wVyow=; b=vwXhge/o1TT/o6Z92uCNqNKdtV
	AB89o4JgovgOUE099gBqXK6ryIyBpAHadtC65ZDBi6fHjJo9UkSntAVUIsvy5usNRKgjDnDGNCKzv
	nFYRHMu39hhoh9gutPN9jqbgTOnW+EwZPqjN22WlQiFNhuGOdSqSpOEViXZZjCW3sfwc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187824-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187824: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1a89c690a1df8a22bd2157be72d438b741c96854
X-Osstest-Versions-That:
    ovmf=6820004b3e2b6997b8ad8663c548fb3da2fcb3b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 08:51:14 +0000

flight 187824 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187824/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1a89c690a1df8a22bd2157be72d438b741c96854
baseline version:
 ovmf                 6820004b3e2b6997b8ad8663c548fb3da2fcb3b2

Last test of basis   187821  2024-09-23 05:13:20 Z    0 days
Testing same since   187824  2024-09-23 06:43:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   6820004b3e..1a89c690a1  1a89c690a1df8a22bd2157be72d438b741c96854 -> xen-tested-master

