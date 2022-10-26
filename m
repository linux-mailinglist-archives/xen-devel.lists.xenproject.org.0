Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA060EBA2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 00:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430802.682897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onp3o-0002Mr-G7; Wed, 26 Oct 2022 22:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430802.682897; Wed, 26 Oct 2022 22:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onp3o-0002Jk-DA; Wed, 26 Oct 2022 22:39:44 +0000
Received: by outflank-mailman (input) for mailman id 430802;
 Wed, 26 Oct 2022 22:39:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onp3m-0002Ja-PM; Wed, 26 Oct 2022 22:39:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onp3m-00050e-Mj; Wed, 26 Oct 2022 22:39:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onp3m-00075r-By; Wed, 26 Oct 2022 22:39:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1onp3m-0002IG-BT; Wed, 26 Oct 2022 22:39:42 +0000
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
	bh=YHpg7lZ1gFWbcBndMhrgIfclQadDw6pLLbAtC5int5k=; b=0iSbpN3x4Ip9H8wsAJCMOldfRC
	XddqZTuv7zJtlCpZwEmlOACLYMS1VSCy0GOIkYEN44yYNKmrVbBOG0LzNoJm27uQb15y6KEGYjUJU
	ozwhGSiQ3XeEppbQGetPUtous0mz+9sDSAi8PeeRX4uFpfdJ/6EZOPxJ3aQfvbMn9B4s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174468-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174468: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b6efc505e4d6eb2055a39afd0a1ee67846a1e5f9
X-Osstest-Versions-That:
    ovmf=9e2c88b16ed3444ea9dfffb39a91d6c17071835d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Oct 2022 22:39:42 +0000

flight 174468 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174468/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b6efc505e4d6eb2055a39afd0a1ee67846a1e5f9
baseline version:
 ovmf                 9e2c88b16ed3444ea9dfffb39a91d6c17071835d

Last test of basis   174432  2022-10-26 04:14:08 Z    0 days
Testing same since   174468  2022-10-26 17:40:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   9e2c88b16e..b6efc505e4  b6efc505e4d6eb2055a39afd0a1ee67846a1e5f9 -> xen-tested-master

