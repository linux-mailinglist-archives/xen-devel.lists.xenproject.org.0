Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642A474398
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246738.425512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7zO-0004Eg-60; Tue, 14 Dec 2021 13:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246738.425512; Tue, 14 Dec 2021 13:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7zO-0004Bu-2C; Tue, 14 Dec 2021 13:37:06 +0000
Received: by outflank-mailman (input) for mailman id 246738;
 Tue, 14 Dec 2021 13:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mx7zN-0004Bk-A6; Tue, 14 Dec 2021 13:37:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mx7zN-0000F5-3j; Tue, 14 Dec 2021 13:37:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mx7zM-0002Fs-Oc; Tue, 14 Dec 2021 13:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mx7zM-0008Mc-O2; Tue, 14 Dec 2021 13:37:04 +0000
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
	bh=jJPgplJfZHpoLGeFcaVbsb+PHcraq6xcKqnwgvdIkVg=; b=vBY9RaIhCHlqc4LPncT6KG4dbu
	DL3KkGLfOOdlnhJ2IwPnrPHiJbI+7VFMIJULfG6dIGmGzDWqcPa+mfOGrkHIgtORN4ImXddeBBTRG
	zpnhhrL0EkoOJihlA2gUDcseseKbiBIDuZI6l2yu0aL8OQRqIbO9dgQTPYMqa2u7/Irw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167409-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167409: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c039fa7ff09729de07bc7ebcdd4878340bfaf252
X-Osstest-Versions-That:
    ovmf=7a6e6ae9332614d386446d2a73e34b74fe66446f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Dec 2021 13:37:04 +0000

flight 167409 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167409/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c039fa7ff09729de07bc7ebcdd4878340bfaf252
baseline version:
 ovmf                 7a6e6ae9332614d386446d2a73e34b74fe66446f

Last test of basis   167394  2021-12-13 16:12:39 Z    0 days
Testing same since   167409  2021-12-14 11:40:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@nuviainc.com>

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
   7a6e6ae933..c039fa7ff0  c039fa7ff09729de07bc7ebcdd4878340bfaf252 -> xen-tested-master

