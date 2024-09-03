Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6A9692DA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 06:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788581.1197997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slL8d-0005A1-PF; Tue, 03 Sep 2024 04:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788581.1197997; Tue, 03 Sep 2024 04:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slL8d-00057j-Ll; Tue, 03 Sep 2024 04:27:31 +0000
Received: by outflank-mailman (input) for mailman id 788581;
 Tue, 03 Sep 2024 04:27:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slL8c-00057Z-7f; Tue, 03 Sep 2024 04:27:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slL8b-00038x-T9; Tue, 03 Sep 2024 04:27:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slL8b-00016U-H8; Tue, 03 Sep 2024 04:27:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slL8b-0008OC-Ge; Tue, 03 Sep 2024 04:27:29 +0000
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
	bh=FsTnNPQuw+B8m6+xCXDc7RicbYrKcduyeQ1xHC2qdjY=; b=dJHQqlDIOOxEVG8V5Z1GY+cMO5
	radJW4Nodr7OvvfmeIKV0L1AsTOXDfuqDnxUuLf9f3A9wJpsZ4SkKkmh6kg04hTtPhWn/ueE28UL+
	dyxZ8atP5it8JSIzmbs2w13HdrWnQo6WTjHEFg6kqjQWjfQklEMI6OH1ZImVvCDBojTU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187463-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187463: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=909849be87a7f931f9fb627522cc664c06987712
X-Osstest-Versions-That:
    ovmf=5b6ec1a7f487404504991c33918a6b02516f778a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 04:27:29 +0000

flight 187463 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187463/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 909849be87a7f931f9fb627522cc664c06987712
baseline version:
 ovmf                 5b6ec1a7f487404504991c33918a6b02516f778a

Last test of basis   187462  2024-09-03 00:12:05 Z    0 days
Testing same since   187463  2024-09-03 02:42:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   5b6ec1a7f4..909849be87  909849be87a7f931f9fb627522cc664c06987712 -> xen-tested-master

