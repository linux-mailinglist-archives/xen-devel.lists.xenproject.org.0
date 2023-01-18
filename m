Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55096720F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 16:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480723.745265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIABF-00069I-Sq; Wed, 18 Jan 2023 15:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480723.745265; Wed, 18 Jan 2023 15:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIABF-000671-Nt; Wed, 18 Jan 2023 15:16:49 +0000
Received: by outflank-mailman (input) for mailman id 480723;
 Wed, 18 Jan 2023 15:16:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIABE-00066r-CO; Wed, 18 Jan 2023 15:16:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIABE-00040Z-2v; Wed, 18 Jan 2023 15:16:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIABD-00064g-KV; Wed, 18 Jan 2023 15:16:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIABD-0000Mb-K4; Wed, 18 Jan 2023 15:16:47 +0000
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
	bh=7yKv0y2ab+Sg05H+oOpJkFSQxem68oVzjtgrP3OqrBw=; b=6vkscTzA9L9hq+wPxcn+rMCWer
	HdwL+YaQBkakiw8nyfqIx6STjQVrTlrK4eO1nV09PAIG3a9vZlDMXx6KozJSxGxssbQOiS4XtSmTk
	JvCW5xi56sUCQ3xrCbE3qwYNo5mxkYXNprJrhaKsh9SyQsrQNqhgQ3dRMIvrvQjzmXzQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175960-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175960: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=998ebe5ca0ae5c449e83ede533bee872f97d63af
X-Osstest-Versions-That:
    ovmf=9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Jan 2023 15:16:47 +0000

flight 175960 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175960/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 998ebe5ca0ae5c449e83ede533bee872f97d63af
baseline version:
 ovmf                 9d70d8f20d0feee1d232cbf86fc87147ce92c2cb

Last test of basis   175747  2023-01-12 16:10:44 Z    5 days
Failing since        175860  2023-01-15 07:11:07 Z    3 days   41 attempts
Testing same since   175955  2023-01-18 10:40:51 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Ard Biesheuvel <ardb+tianocore@kernel.org>
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiangang He <jiangang.he@amd.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Oliver Steffen <osteffen@redhat.com>
  Prakash K <prakashk@ami.com>
  Prakash.K <prakashk@ami.com>

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
   9d70d8f20d..998ebe5ca0  998ebe5ca0ae5c449e83ede533bee872f97d63af -> xen-tested-master

