Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AB6B5A09
	for <lists+xen-devel@lfdr.de>; Sat, 11 Mar 2023 10:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508664.783535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pavS4-00072o-Hh; Sat, 11 Mar 2023 09:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508664.783535; Sat, 11 Mar 2023 09:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pavS4-00070B-EL; Sat, 11 Mar 2023 09:23:44 +0000
Received: by outflank-mailman (input) for mailman id 508664;
 Sat, 11 Mar 2023 09:23:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pavS3-000701-4J; Sat, 11 Mar 2023 09:23:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pavS3-0006iw-0d; Sat, 11 Mar 2023 09:23:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pavS2-0007H3-IX; Sat, 11 Mar 2023 09:23:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pavS2-0007jI-IE; Sat, 11 Mar 2023 09:23:42 +0000
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
	bh=PgByT44Qn3lLWH2J6Ydu9RpQ3aVdfUqujR7Hv2ER0zs=; b=JeKgATavlNws1l0WQq/FqSE1eK
	qur/FCaMcXqjHTkXhecRDlyZfzzgbPNlqtUci0IeZi5xrJ1LZhcvvR1spZ7Tzn1X6wNYxrMcKR5Gl
	xkBLJoNfOvPdiyuF/frQBo9Dn+lcwHx9unJZ2UOqJy7HfjAzORee+F6u9Lr7bQqCbvq0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179552-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179552: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d2bfe289668e32940cca5da12bc201bf9b6c84d8
X-Osstest-Versions-That:
    ovmf=9b94ebb0c826ad9a747f93ee351d5d076e920f6e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Mar 2023 09:23:42 +0000

flight 179552 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179552/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d2bfe289668e32940cca5da12bc201bf9b6c84d8
baseline version:
 ovmf                 9b94ebb0c826ad9a747f93ee351d5d076e920f6e

Last test of basis   179537  2023-03-10 15:10:41 Z    0 days
Testing same since   179552  2023-03-11 06:49:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guillermo Antonio Palomino Sosa <guillermo.a.palomino.sosa@intel.com>
  Palomino Sosa, Guillermo A <guillermo.a.palomino.sosa@intel.com>

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
   9b94ebb0c8..d2bfe28966  d2bfe289668e32940cca5da12bc201bf9b6c84d8 -> xen-tested-master

