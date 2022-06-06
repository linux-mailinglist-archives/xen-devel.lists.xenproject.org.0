Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E015853DFBA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 04:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342142.567200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny2Yo-0006HM-OU; Mon, 06 Jun 2022 02:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342142.567200; Mon, 06 Jun 2022 02:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny2Yo-0006Eo-Kh; Mon, 06 Jun 2022 02:33:42 +0000
Received: by outflank-mailman (input) for mailman id 342142;
 Mon, 06 Jun 2022 02:33:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ny2Yn-0006Ee-5g; Mon, 06 Jun 2022 02:33:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ny2Yn-0000kc-3n; Mon, 06 Jun 2022 02:33:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ny2Ym-0007WI-HG; Mon, 06 Jun 2022 02:33:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ny2Ym-00048W-Gp; Mon, 06 Jun 2022 02:33:40 +0000
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
	bh=kyr6ZfGbvyG3lbYEJ1tgYS0JtrXQVyQJdMbK0LF+j2c=; b=iPxMFDsNfYDxNInYFhqJAG6NNf
	Hxl7dX+eGgkulZYbNeY0KO9hkQXzSrvGBTmdtysIF7hBNRHg7uQdoLkKld0inQ6PehSH/XNbwsDch
	WJqYB0uwwF/lgPeH/9Zh+kojao566foavE87ldJqoZVcsUIS7tk/H8SeTV1DFFDjsh9U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170839-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170839: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0b36dea3f8b71ddddc4fdf3a5d2edf395115568b
X-Osstest-Versions-That:
    ovmf=0a4019ec9de64c6565ea545dc8d847afe2b30d6c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Jun 2022 02:33:40 +0000

flight 170839 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170839/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0b36dea3f8b71ddddc4fdf3a5d2edf395115568b
baseline version:
 ovmf                 0a4019ec9de64c6565ea545dc8d847afe2b30d6c

Last test of basis   170819  2022-06-03 12:40:25 Z    2 days
Testing same since   170839  2022-06-06 00:11:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jake Garver <jake@nvidia.com>

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
   0a4019ec9d..0b36dea3f8  0b36dea3f8b71ddddc4fdf3a5d2edf395115568b -> xen-tested-master

