Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAF2B9CCB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 22:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31428.61796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfrLO-0003oR-4C; Thu, 19 Nov 2020 21:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31428.61796; Thu, 19 Nov 2020 21:19:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfrLN-0003nz-Ts; Thu, 19 Nov 2020 21:19:53 +0000
Received: by outflank-mailman (input) for mailman id 31428;
 Thu, 19 Nov 2020 21:19:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfrLM-0003nr-7D; Thu, 19 Nov 2020 21:19:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfrLL-0006En-K0; Thu, 19 Nov 2020 21:19:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kfrLL-00023b-Bs; Thu, 19 Nov 2020 21:19:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kfrLL-0000gI-BO; Thu, 19 Nov 2020 21:19:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfrLM-0003nr-7D; Thu, 19 Nov 2020 21:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=pumW8diOpeDag8yW+zUSFz80TUk9jtt1VthrU3md9SM=; b=UggZm+dAs8CBQLHw6nrXF/U5xW
	o+YQXYvUjtSUmQ1ad7XqJJ6qb89G1UAxsDCkiz+OSMmGj+415rXwumjFr4tUwd0QwvJwlP13Hsxzt
	BbXpkfDldXi1+hcRCJ4oz/+/gYGLYA0cH5Hl/UL6FG7C7xV6a6rmar6jiMyH+VtkD2Q0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfrLL-0006En-K0; Thu, 19 Nov 2020 21:19:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfrLL-00023b-Bs; Thu, 19 Nov 2020 21:19:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kfrLL-0000gI-BO; Thu, 19 Nov 2020 21:19:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156879-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156879: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6c8dd15c4ae42501438a525ec41299f365f223cb
X-Osstest-Versions-That:
    ovmf=6c4efc050974812d6ebee1cea711e3c81e4e4442
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Nov 2020 21:19:51 +0000

flight 156879 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156879/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6c8dd15c4ae42501438a525ec41299f365f223cb
baseline version:
 ovmf                 6c4efc050974812d6ebee1cea711e3c81e4e4442

Last test of basis   156869  2020-11-19 02:39:50 Z    0 days
Testing same since   156879  2020-11-19 11:39:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Nishant C Mistry <nishant.c.mistry@intel.com>
  Nishant Mistry <devel@edk2.groups.io>

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
   6c4efc0509..6c8dd15c4a  6c8dd15c4ae42501438a525ec41299f365f223cb -> xen-tested-master

