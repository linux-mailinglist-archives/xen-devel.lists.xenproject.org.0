Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B09986621
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 20:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804487.1215489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWT0-0003P8-Dw; Wed, 25 Sep 2024 18:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804487.1215489; Wed, 25 Sep 2024 18:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWT0-0003NF-B0; Wed, 25 Sep 2024 18:10:22 +0000
Received: by outflank-mailman (input) for mailman id 804487;
 Wed, 25 Sep 2024 18:10:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stWSy-0003N0-O5; Wed, 25 Sep 2024 18:10:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stWSy-0007xS-Lo; Wed, 25 Sep 2024 18:10:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stWSy-0007WJ-94; Wed, 25 Sep 2024 18:10:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1stWSy-00062E-8Q; Wed, 25 Sep 2024 18:10:20 +0000
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
	bh=HdbQ2YFhPJOXmAKeP32CxA7KbPW+aJ2WDNbhHRHjdYo=; b=OtuesQYAOiRYYnMh5/+8ueyRsn
	tu4BbgGl6BEbTXGvd0N70U7uxOJLl0yXk17/rfADL5BGQ1N8j7yWnTWqc2wzxqlGF8VgnPtUSHQO1
	Ym+7OYpkT5b4zkRqEnWdm9u8Z9sNxjOb27DvdyAF/phrXBQb0T4MEcMU5r/vTydRo/lU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187858-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187858: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=39462fcd99349732ef561cda71c4c633b8ce8246
X-Osstest-Versions-That:
    ovmf=b8122cc9d8b6c9017905ac5f4c846b4c0f535d01
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Sep 2024 18:10:20 +0000

flight 187858 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187858/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 39462fcd99349732ef561cda71c4c633b8ce8246
baseline version:
 ovmf                 b8122cc9d8b6c9017905ac5f4c846b4c0f535d01

Last test of basis   187849  2024-09-24 17:13:39 Z    1 days
Testing same since   187858  2024-09-25 16:11:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   b8122cc9d8..39462fcd99  39462fcd99349732ef561cda71c4c633b8ce8246 -> xen-tested-master

