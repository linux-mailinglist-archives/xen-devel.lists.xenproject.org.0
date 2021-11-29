Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BDC461034
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 09:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234331.406684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrc5H-0003KV-8s; Mon, 29 Nov 2021 08:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234331.406684; Mon, 29 Nov 2021 08:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrc5H-0003Hx-4f; Mon, 29 Nov 2021 08:32:23 +0000
Received: by outflank-mailman (input) for mailman id 234331;
 Mon, 29 Nov 2021 08:32:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrc5F-0003Hn-V0; Mon, 29 Nov 2021 08:32:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrc5F-0004dp-PP; Mon, 29 Nov 2021 08:32:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrc5F-0005ho-GF; Mon, 29 Nov 2021 08:32:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mrc5F-00042C-Fk; Mon, 29 Nov 2021 08:32:21 +0000
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
	bh=qgovrrNN0IQ2fckBt3K5hNeh9mnCIBU+mnUF+/QGciM=; b=cHBvXOO7oZEYgzgjPU6+u/EgvX
	kBsb5t8PC/mArSKtPYaz33iKRjwO3MnQ4P9xeusuvjWOAnaTkIXdN7dt+GDTsWPedxpAXlFUTmXtm
	17D5ZOlDmyqqxBRkm6kHS/JsCw+kYTiRFhGCzbQwnSXDJQn/luwa6aSilOW71mtchx7A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166949-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166949: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ef9a059cdb15844fe52a49af2bf7d86b9dd3e9bf
X-Osstest-Versions-That:
    ovmf=bb1bba3d776733c41dbfa2d1dc0fe234819a79f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Nov 2021 08:32:21 +0000

flight 166949 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166949/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef9a059cdb15844fe52a49af2bf7d86b9dd3e9bf
baseline version:
 ovmf                 bb1bba3d776733c41dbfa2d1dc0fe234819a79f2

Last test of basis   166826  2021-11-26 09:11:08 Z    2 days
Testing same since   166949  2021-11-29 06:11:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   bb1bba3d77..ef9a059cdb  ef9a059cdb15844fe52a49af2bf7d86b9dd3e9bf -> xen-tested-master

