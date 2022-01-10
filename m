Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E24895D5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 10:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255255.437383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rQp-0004U0-8t; Mon, 10 Jan 2022 09:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255255.437383; Mon, 10 Jan 2022 09:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rQp-0004RA-5O; Mon, 10 Jan 2022 09:57:39 +0000
Received: by outflank-mailman (input) for mailman id 255255;
 Mon, 10 Jan 2022 09:57:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6rQo-0004R0-0P; Mon, 10 Jan 2022 09:57:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6rQn-0000zz-TL; Mon, 10 Jan 2022 09:57:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6rQn-0002oT-JS; Mon, 10 Jan 2022 09:57:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n6rQn-0003Mk-Ix; Mon, 10 Jan 2022 09:57:37 +0000
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
	bh=ec20NNekrUspC22nbMxs8XsnM0OCXd/2vAqVL3Piib8=; b=xJHXocdEC4RJMjrt+PTuCgypIR
	mptnxF5DD4rVymm+QjpyozSOx4rOVlQvbozzH0YkktbqsAIIwd4OuiPDrZa/FuoIUh99itSgE+0ev
	zAPI/O3cXsfose8IpgGl9XTBjVUFAHlAAKjm8HAnitmfKSvMb6kTPqsOabYIo+AYlqlw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167651-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167651: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6062002bd5a394fef46243dd866860c3480d918e
X-Osstest-Versions-That:
    ovmf=14a731096d388aa20c0afa9fe5af55c998082efb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Jan 2022 09:57:37 +0000

flight 167651 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167651/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6062002bd5a394fef46243dd866860c3480d918e
baseline version:
 ovmf                 14a731096d388aa20c0afa9fe5af55c998082efb

Last test of basis   167636  2022-01-08 04:11:46 Z    2 days
Testing same since   167651  2022-01-10 07:41:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Craig Edwards <craig.edwards@dell.com>
  Edwards, Craig <Craig.Edwards@dell.com>

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
   14a731096d..6062002bd5  6062002bd5a394fef46243dd866860c3480d918e -> xen-tested-master

