Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447F870988
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 19:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688492.1072680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhD3B-0003g6-Eb; Mon, 04 Mar 2024 18:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688492.1072680; Mon, 04 Mar 2024 18:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhD3B-0003eX-AP; Mon, 04 Mar 2024 18:28:33 +0000
Received: by outflank-mailman (input) for mailman id 688492;
 Mon, 04 Mar 2024 18:28:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhD39-0003eN-SN; Mon, 04 Mar 2024 18:28:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhD39-0005Yw-O4; Mon, 04 Mar 2024 18:28:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhD39-0003mt-Gt; Mon, 04 Mar 2024 18:28:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rhD39-00007g-GP; Mon, 04 Mar 2024 18:28:31 +0000
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
	bh=X40WUB8RzlHnxTKSl0RspQKBKKfcyjyam8kBpGG57jA=; b=ZC7mV8OyrWkJBlUJ7n0hc8cn3I
	YYf+4FBmQDYVbxYrjDeoGfGjkG04ATJXue0kKuTe8viRAnzersgDF2YqtZEc6BOt28FIULv5sGTG5
	vN7+WEoWIJQ5qMHnCjOYV0hDa8T7UYPV4JBh4QuewDfzcxspNBKSeWCjixT7T9NL7BdY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184899-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184899: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bff9815b616669f1cf743e412bc0000efe22dfb4
X-Osstest-Versions-That:
    ovmf=1ae5bee967bffcd6dbbabca913ea3c65d8f09c76
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Mar 2024 18:28:31 +0000

flight 184899 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184899/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bff9815b616669f1cf743e412bc0000efe22dfb4
baseline version:
 ovmf                 1ae5bee967bffcd6dbbabca913ea3c65d8f09c76

Last test of basis   184892  2024-03-04 10:11:18 Z    0 days
Testing same since   184899  2024-03-04 16:43:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   1ae5bee967..bff9815b61  bff9815b616669f1cf743e412bc0000efe22dfb4 -> xen-tested-master

