Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8EE8ADB7B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 03:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710266.1109424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz4rR-0004b8-OB; Tue, 23 Apr 2024 01:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710266.1109424; Tue, 23 Apr 2024 01:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz4rR-0004Yl-LW; Tue, 23 Apr 2024 01:22:17 +0000
Received: by outflank-mailman (input) for mailman id 710266;
 Tue, 23 Apr 2024 01:22:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rz4rQ-0004YW-BA; Tue, 23 Apr 2024 01:22:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rz4rP-0002zX-Uw; Tue, 23 Apr 2024 01:22:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rz4rP-0000Kb-Lj; Tue, 23 Apr 2024 01:22:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rz4rP-0007D3-LE; Tue, 23 Apr 2024 01:22:15 +0000
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
	bh=0MuRUBl9KU/RY4rXYRxkJ3mOeN+almhSjugwKk5CsRc=; b=jP33Wva/CmddJVhY4ntsUHK5Ct
	603G1gYJXUeaXLpV/v6pvmG29rvdLGohchIJarczxRLQhJIH0fTNipNU+MLCbuchmv9VFJu1ssreU
	/o3iHLlSUvnOIvwKbYZgMb/0E26Ncw3yhnPWFkbqh19cPQP763mW4ffBYieZ7jFnpw/U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185764-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185764: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=86c8d69146310f24069701053a27153ae536ebba
X-Osstest-Versions-That:
    ovmf=7dd7b890582b4d696ca5fd436dbc5fb4bc30e385
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2024 01:22:15 +0000

flight 185764 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185764/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 86c8d69146310f24069701053a27153ae536ebba
baseline version:
 ovmf                 7dd7b890582b4d696ca5fd436dbc5fb4bc30e385

Last test of basis   185759  2024-04-22 13:14:40 Z    0 days
Testing same since   185764  2024-04-22 23:12:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   7dd7b89058..86c8d69146  86c8d69146310f24069701053a27153ae536ebba -> xen-tested-master

