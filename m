Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455D79A881
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:13:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599486.934938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhez-0003aE-9f; Mon, 11 Sep 2023 14:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599486.934938; Mon, 11 Sep 2023 14:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhez-0003Z7-6o; Mon, 11 Sep 2023 14:13:05 +0000
Received: by outflank-mailman (input) for mailman id 599486;
 Mon, 11 Sep 2023 14:13:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfhex-0003Yx-Pf; Mon, 11 Sep 2023 14:13:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfhex-0000S9-Mw; Mon, 11 Sep 2023 14:13:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfhex-00024W-CN; Mon, 11 Sep 2023 14:13:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qfhex-0006tt-Bw; Mon, 11 Sep 2023 14:13:03 +0000
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
	bh=0Xb2p/d3ChXEQFyqwvOR+NxQl5w/dNHcZrtDqdVNWsg=; b=tmz8X1D9o4CG1zFkVWjdWCy03l
	y4GT+MZpOp8EdQlxRZ+SVv7bsDMKACMp91AFBknEcNvQ9r1ahtAKQE7xJAyKcMyUG8nLfyfmy1pj1
	jMZ0Fh/8CSERSHa9lWBgOSi1xg5p2ToqtheGfn4MKkFnkLMSb3R5JbEiXXVaczE/RP7s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182940-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182940: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a5cbb5990593559eb9d93ebd1df1e8da0fa5d72b
X-Osstest-Versions-That:
    ovmf=cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Sep 2023 14:13:03 +0000

flight 182940 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182940/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a5cbb5990593559eb9d93ebd1df1e8da0fa5d72b
baseline version:
 ovmf                 cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a

Last test of basis   182916  2023-09-11 03:51:19 Z    0 days
Testing same since   182940  2023-09-11 12:42:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>

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
   cc26a2cb31..a5cbb59905  a5cbb5990593559eb9d93ebd1df1e8da0fa5d72b -> xen-tested-master

