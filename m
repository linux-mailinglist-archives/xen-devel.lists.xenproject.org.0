Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8F330EA0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94906.178875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFIf-0008Jx-8H; Mon, 08 Mar 2021 12:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94906.178875; Mon, 08 Mar 2021 12:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFIf-0008JV-4Q; Mon, 08 Mar 2021 12:47:53 +0000
Received: by outflank-mailman (input) for mailman id 94906;
 Mon, 08 Mar 2021 12:47:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJFId-0008JM-RM; Mon, 08 Mar 2021 12:47:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJFId-0004EZ-It; Mon, 08 Mar 2021 12:47:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJFId-00086I-Aj; Mon, 08 Mar 2021 12:47:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lJFId-0003im-AF; Mon, 08 Mar 2021 12:47:51 +0000
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
	bh=KPUEZjMcnNo5l+Fk9BFSuvlimfrHIGe/POBODk84hHQ=; b=N7I4ixeUAc5v/iTn4Lj7RVI2CT
	HqeUJBZAtClgN5UYgkVW7MEpeJnvRBawIAu4A3ODiHZP5ipBhWvsPifKzM2JFi3s0KuggEHBeu/hK
	Qw5BdJsxmteYj8Bl3P8wOXJasYIDNV67R4Unci0K9OtG7P8sxCS1Q28+cd55iqBhUe9M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159866-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159866: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d28a68153492ce3e64fb0535674e11e7f46a88a8
X-Osstest-Versions-That:
    ovmf=b8a92fa2fea548dccacc2f228b607b7febdf81c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Mar 2021 12:47:51 +0000

flight 159866 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159866/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d28a68153492ce3e64fb0535674e11e7f46a88a8
baseline version:
 ovmf                 b8a92fa2fea548dccacc2f228b607b7febdf81c0

Last test of basis   159863  2021-03-08 01:39:46 Z    0 days
Testing same since   159866  2021-03-08 06:03:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   b8a92fa2fe..d28a681534  d28a68153492ce3e64fb0535674e11e7f46a88a8 -> xen-tested-master

