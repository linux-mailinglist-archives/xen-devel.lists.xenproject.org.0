Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFC42D8BE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 14:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209303.365722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mazRs-0008B0-Nq; Thu, 14 Oct 2021 12:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209303.365722; Thu, 14 Oct 2021 12:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mazRs-00088L-IN; Thu, 14 Oct 2021 12:03:00 +0000
Received: by outflank-mailman (input) for mailman id 209303;
 Thu, 14 Oct 2021 12:02:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mazRq-00088A-NY; Thu, 14 Oct 2021 12:02:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mazRq-0007s6-HN; Thu, 14 Oct 2021 12:02:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mazRq-00055u-A9; Thu, 14 Oct 2021 12:02:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mazRq-0007qT-9a; Thu, 14 Oct 2021 12:02:58 +0000
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
	bh=P7eDuRZp+6RcnynDzy23ap0pfF+/+lBsK0kU9u2Iajk=; b=S1mZ0gIuHk5Q1qQmG0sTzKVy8D
	0nFcDLBoUzIWC3OOH7livjqultUOJGfmrXS+ecrXQ0f1sLNKgD5dwwUyB7IRORlZFgkH4/qCHzHov
	tna7fOCpxk1qJbBcWD8ba6MkEpTvjdoWNX3lNj49KqXhode/yiCEu+dT49//ITpHBB50=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165505-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165505: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e0c23cba5eaeb6c934a10ecdabcb235ef5d63799
X-Osstest-Versions-That:
    ovmf=978d428ec3ca2520c217819901c8465235c45c5e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Oct 2021 12:02:58 +0000

flight 165505 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165505/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e0c23cba5eaeb6c934a10ecdabcb235ef5d63799
baseline version:
 ovmf                 978d428ec3ca2520c217819901c8465235c45c5e

Last test of basis   165502  2021-10-13 23:10:03 Z    0 days
Testing same since   165505  2021-10-14 07:10:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Hua Ma <hua.ma@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   978d428ec3..e0c23cba5e  e0c23cba5eaeb6c934a10ecdabcb235ef5d63799 -> xen-tested-master

