Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91552963677
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 01:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785293.1194719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSTG-00018P-3F; Wed, 28 Aug 2024 23:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785293.1194719; Wed, 28 Aug 2024 23:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSTG-00015c-0b; Wed, 28 Aug 2024 23:53:02 +0000
Received: by outflank-mailman (input) for mailman id 785293;
 Wed, 28 Aug 2024 23:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjSTE-00015S-LC; Wed, 28 Aug 2024 23:53:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjSTE-0005Zn-Fl; Wed, 28 Aug 2024 23:53:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjSTE-0000ts-7r; Wed, 28 Aug 2024 23:53:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjSTE-0005l9-7G; Wed, 28 Aug 2024 23:53:00 +0000
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
	bh=qUihrtU5rb09XYnO7Oa2HTNGD1mICpI4MITuacq0zOI=; b=qx81IuHDsrZZcdMLCFrd6wIWqL
	aWgM0AtzH/ERYIdbFcQX3QWQYldaCH6+Ztq+5T17N5jUxqCW0AM+MoKkH5Fk9c06O9HCQPQjXXZJM
	jB4Km0ATTQhy1dVJOm5UG5nA3hjn7Wa7qO7lh+4pVCjDfqUYrepcCESKPDfaWajqqQfA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187389-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187389: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7cde720e5126a47dadfb63ec9fd11b637620102d
X-Osstest-Versions-That:
    ovmf=319835abb8517fde84bff31740fb1e61b33a3ae8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 23:53:00 +0000

flight 187389 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187389/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7cde720e5126a47dadfb63ec9fd11b637620102d
baseline version:
 ovmf                 319835abb8517fde84bff31740fb1e61b33a3ae8

Last test of basis   187387  2024-08-28 19:11:27 Z    0 days
Testing same since   187389  2024-08-28 21:41:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  HoraceX Lien <horacex.lien@intel.com>

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
   319835abb8..7cde720e51  7cde720e5126a47dadfb63ec9fd11b637620102d -> xen-tested-master

