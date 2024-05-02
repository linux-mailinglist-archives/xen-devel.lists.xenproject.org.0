Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2D8B9CD2
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715870.1117834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XlD-0006tF-2W; Thu, 02 May 2024 14:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715870.1117834; Thu, 02 May 2024 14:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XlC-0006r5-Ve; Thu, 02 May 2024 14:50:10 +0000
Received: by outflank-mailman (input) for mailman id 715870;
 Thu, 02 May 2024 14:50:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2XlB-0006qv-Dh; Thu, 02 May 2024 14:50:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2XlB-00054j-7b; Thu, 02 May 2024 14:50:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2XlA-0002r5-Q0; Thu, 02 May 2024 14:50:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s2XlA-0002CY-PO; Thu, 02 May 2024 14:50:08 +0000
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
	bh=lB41fuJP1dcyZbQ//RLuNDmHe8vbGQdf3MOf1p7Nopk=; b=MNMecqUGfg+WqlERWz2at6F+um
	/+yKpXJetou/0so1QOve95pU80zWpsU9V/Vz9G6Tg88004fL60Np4eg7iXA4XkF4f+n+EBvp3B5hn
	RmvvLyxCiJtGwfuFHhFIxuf89krPWXlft/4RWSBicasNDRLTcQSJx8UStgT+dM/U7oEs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185900-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185900: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fecf55a66a1cf908c2f906bedb79fe2e8362d50f
X-Osstest-Versions-That:
    ovmf=5d4c5253e8bbc0baa8837fcd868925212df85201
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 May 2024 14:50:08 +0000

flight 185900 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185900/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fecf55a66a1cf908c2f906bedb79fe2e8362d50f
baseline version:
 ovmf                 5d4c5253e8bbc0baa8837fcd868925212df85201

Last test of basis   185879  2024-04-30 11:12:53 Z    2 days
Testing same since   185900  2024-05-02 13:14:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Michael Roth <michael.roth@amd.com>

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
   5d4c5253e8..fecf55a66a  fecf55a66a1cf908c2f906bedb79fe2e8362d50f -> xen-tested-master

