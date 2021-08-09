Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8E3E44B8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 13:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164969.301452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD3Np-0000Oh-BQ; Mon, 09 Aug 2021 11:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164969.301452; Mon, 09 Aug 2021 11:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD3Np-0000Me-6z; Mon, 09 Aug 2021 11:23:53 +0000
Received: by outflank-mailman (input) for mailman id 164969;
 Mon, 09 Aug 2021 11:23:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD3Nm-0000MU-TI; Mon, 09 Aug 2021 11:23:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD3Nm-0003Y0-Oy; Mon, 09 Aug 2021 11:23:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD3Nm-0004Go-CR; Mon, 09 Aug 2021 11:23:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mD3Nm-0005av-By; Mon, 09 Aug 2021 11:23:50 +0000
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
	bh=iWutBMRxdqFZC6dZ4QSL9ZXWu1jf0KltG0nP+l0Z0FU=; b=JD7PHg+TFwnBNVB2zxW9pFWy1m
	xwqOQo84uwBMyLv6e4odTLT1oAatoI8ncQjc7pPbni3gvS5RMpoUvqwzBiewjo6QGyvvvFaU7cTJO
	oxaFEKW+7JoKTGLDYR+ayV6PSVESEU99fn85HVj1IGY9L0qu0WQhnCz3YUelLxn+zrV0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164139-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164139: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4de77ae9890d241271f543e9195ab3516f3abec6
X-Osstest-Versions-That:
    ovmf=97fdcbda4e69d6f085ec3f2bd9d29a04af2b50a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Aug 2021 11:23:50 +0000

flight 164139 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164139/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4de77ae9890d241271f543e9195ab3516f3abec6
baseline version:
 ovmf                 97fdcbda4e69d6f085ec3f2bd9d29a04af2b50a4

Last test of basis   164114  2021-08-05 21:40:02 Z    3 days
Testing same since   164139  2021-08-09 03:11:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Lou, Yun <Yun.Lou@intel.com>

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
   97fdcbda4e..4de77ae989  4de77ae9890d241271f543e9195ab3516f3abec6 -> xen-tested-master

