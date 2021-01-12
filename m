Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC12F2D4B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65592.116230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHP2-0002i3-3g; Tue, 12 Jan 2021 10:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65592.116230; Tue, 12 Jan 2021 10:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHP2-0002he-0P; Tue, 12 Jan 2021 10:59:56 +0000
Received: by outflank-mailman (input) for mailman id 65592;
 Tue, 12 Jan 2021 10:59:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzHP0-0002hW-SQ; Tue, 12 Jan 2021 10:59:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzHP0-0002Ek-LH; Tue, 12 Jan 2021 10:59:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzHP0-0008HR-9P; Tue, 12 Jan 2021 10:59:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kzHP0-0002rE-8w; Tue, 12 Jan 2021 10:59:54 +0000
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
	bh=26jZUcZIr6CVEDCB7PWPfsvA/ucwFAIyPk7i+2dRRzw=; b=KsuSCMHgcq3j3nu6vYCGXxxI0q
	ZxixB+pr8bqS43fo+Dt5NSCkOZbGTg5MvZwppaLW+nolv/YVEH8DyqrIcdWD3Jx5lOGQFD2zRfdAe
	SO3O/ng889eaP7oMUQLFD7nzf6B+GFgHE8c84SOkabO5+ZmgsxCFkKN5MIa6gf0HZUlk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158375-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158375: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ebfe2d3eb5ac7fd92d74011edb31303a181920c7
X-Osstest-Versions-That:
    ovmf=e992cc3f4859f653d6a42c4d600c80378759901a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Jan 2021 10:59:54 +0000

flight 158375 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158375/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ebfe2d3eb5ac7fd92d74011edb31303a181920c7
baseline version:
 ovmf                 e992cc3f4859f653d6a42c4d600c80378759901a

Last test of basis   158356  2021-01-11 09:41:35 Z    1 days
Testing same since   158375  2021-01-12 06:40:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  James Bottomley <jejb@linux.ibm.com>
  Laszlo Ersek <lersek@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   e992cc3f48..ebfe2d3eb5  ebfe2d3eb5ac7fd92d74011edb31303a181920c7 -> xen-tested-master

