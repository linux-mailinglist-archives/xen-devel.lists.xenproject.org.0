Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF977931D2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 00:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595870.929506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeHA-0003Ig-6C; Tue, 05 Sep 2023 22:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595870.929506; Tue, 05 Sep 2023 22:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeHA-0003Gq-2Q; Tue, 05 Sep 2023 22:12:00 +0000
Received: by outflank-mailman (input) for mailman id 595870;
 Tue, 05 Sep 2023 22:11:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdeH9-0003GN-2i; Tue, 05 Sep 2023 22:11:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdeH8-0004An-Ue; Tue, 05 Sep 2023 22:11:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdeH8-0006RE-Il; Tue, 05 Sep 2023 22:11:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qdeH8-0006TK-I6; Tue, 05 Sep 2023 22:11:58 +0000
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
	bh=cV7SXtkKn9BZ2pX2HmZpTAHWLZaFDbMFovq1KxuBoWs=; b=aLrLqDiNEbYl9MTx8OunLAEFVp
	5si/7XeJC8pSU+tt1w9v6A/qOmAbcG0yQn5IiS170nbQUU/dAe9/QWkswLfAqQaNj8XFGHBLaF6gd
	clro8GXtk0LwKa0UqPgkP2PMJxUJZsDIIEL2IzVH3gGIFdqClW1ES9Gbw/vS19Ie+0as=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182636-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182636: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8b66f9df1bb0fd5ebb743944d41cb33178cf2fdd
X-Osstest-Versions-That:
    ovmf=dfb941d32a2f38c9177729e39c6a6515abbbad48
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Sep 2023 22:11:58 +0000

flight 182636 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182636/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8b66f9df1bb0fd5ebb743944d41cb33178cf2fdd
baseline version:
 ovmf                 dfb941d32a2f38c9177729e39c6a6515abbbad48

Last test of basis   182617  2023-09-02 15:11:45 Z    3 days
Testing same since   182636  2023-09-05 14:12:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
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
   dfb941d32a..8b66f9df1b  8b66f9df1bb0fd5ebb743944d41cb33178cf2fdd -> xen-tested-master

