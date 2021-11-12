Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08244E25E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 08:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224977.388548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlQwB-00048j-DJ; Fri, 12 Nov 2021 07:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224977.388548; Fri, 12 Nov 2021 07:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlQwB-00046u-9L; Fri, 12 Nov 2021 07:25:27 +0000
Received: by outflank-mailman (input) for mailman id 224977;
 Fri, 12 Nov 2021 07:25:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlQw9-00046k-5f; Fri, 12 Nov 2021 07:25:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlQw9-0002GX-0g; Fri, 12 Nov 2021 07:25:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlQw8-00048E-Kz; Fri, 12 Nov 2021 07:25:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mlQw8-0008Sa-KU; Fri, 12 Nov 2021 07:25:24 +0000
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
	bh=EQB7KMhlvfI4ekyTf6T0siAvEUw/Xg7hbh8u/SPf1WU=; b=FX7UJBtiZo3uCF0WFbc/Jv4vvw
	tpp5Qg3ctNtJUSaakKSr87e5LjkyqRKoshvIU/FpJriSslQyeUsAb8hGax7b8Unjh3n8OYioIlm4a
	p/VT5xRBAVXXeH8GztttfKdJ8w+gQvJOnHgnGzvre/ua/Rdm/AbOaDtSj2n6ovr96vBA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166120-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166120: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a92559671a3bbdbc154429cf66edf4f490bbe218
X-Osstest-Versions-That:
    ovmf=22c3b5a865ec800b7eecf43de336ad5e2d917a08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Nov 2021 07:25:24 +0000

flight 166120 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166120/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a92559671a3bbdbc154429cf66edf4f490bbe218
baseline version:
 ovmf                 22c3b5a865ec800b7eecf43de336ad5e2d917a08

Last test of basis   166114  2021-11-11 08:41:16 Z    0 days
Testing same since   166120  2021-11-11 23:10:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
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
   22c3b5a865..a92559671a  a92559671a3bbdbc154429cf66edf4f490bbe218 -> xen-tested-master

