Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A450357F4D5
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 13:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373967.606201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFZsw-0008HW-Ve; Sun, 24 Jul 2022 11:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373967.606201; Sun, 24 Jul 2022 11:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFZsw-0008Et-SG; Sun, 24 Jul 2022 11:34:58 +0000
Received: by outflank-mailman (input) for mailman id 373967;
 Sun, 24 Jul 2022 11:34:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFZsv-0008Ej-OA; Sun, 24 Jul 2022 11:34:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFZsv-0005lo-9A; Sun, 24 Jul 2022 11:34:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFZsv-0002rs-2B; Sun, 24 Jul 2022 11:34:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFZsv-0005Lu-1i; Sun, 24 Jul 2022 11:34:57 +0000
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
	bh=VuEOasJBu98+uYJ5gFiBYE3dv3NMy8SIAOtTJc/ajxo=; b=nqapMs3CcsN+S0Do05Xs+22m4I
	i6fQfwczZc5O7qFkz9hKcdP8/ood8YLwmqjlPYgxL7+9W6WY5/gp4i/2lbuv6Th0saetAhIhF8HZZ
	3DBC/ie+vay8yn6Rx+fi8ttAC7iXXp0TdykLsxUwvesMmB9cQ2bZZVc8dmMfRDvDRrVw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171834-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171834: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d32a84b5ad8eb5293710ca83dad2b4686479b653
X-Osstest-Versions-That:
    ovmf=6964b5c48c69e4961bad2dd9d6c02918f23c3be0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Jul 2022 11:34:57 +0000

flight 171834 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171834/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d32a84b5ad8eb5293710ca83dad2b4686479b653
baseline version:
 ovmf                 6964b5c48c69e4961bad2dd9d6c02918f23c3be0

Last test of basis   171800  2022-07-23 06:11:59 Z    1 days
Testing same since   171834  2022-07-24 07:10:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Li, Yi1 <yi1.li@intel.com>
  Yi Li <yi1.li@intel.com>

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
   6964b5c48c..d32a84b5ad  d32a84b5ad8eb5293710ca83dad2b4686479b653 -> xen-tested-master

