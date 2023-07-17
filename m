Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F9755A9D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 06:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564149.881406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLFqg-0002AQ-K0; Mon, 17 Jul 2023 04:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564149.881406; Mon, 17 Jul 2023 04:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLFqg-00028j-DB; Mon, 17 Jul 2023 04:28:38 +0000
Received: by outflank-mailman (input) for mailman id 564149;
 Mon, 17 Jul 2023 04:28:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLFqe-00028Z-Q5; Mon, 17 Jul 2023 04:28:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLFqe-0007Zn-HR; Mon, 17 Jul 2023 04:28:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLFqe-0001xo-1L; Mon, 17 Jul 2023 04:28:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qLFqe-00070K-0s; Mon, 17 Jul 2023 04:28:36 +0000
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
	bh=tzt2vjZdTWSxmvYrLg/JaHQ8AmmDwBPcJIwI5GwCRtg=; b=IOtV2K8vvjqwxh7AbmRC0KS5zd
	/S+ru+WwtYPjEyND5SIW48qorhtlJpc1dGpJlUKhlQxCYzbYcfx1jOieyl6vMYDPGfQR3VSXXFwBv
	BbUOy68c1yTsKHx1gEoaw9aKHc3PGEWuknImrt+aw69204K7K/1K5IO8eHofvYlH1dAw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181829: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dd49d448b0815c65847241a3faa957e3b4605001
X-Osstest-Versions-That:
    ovmf=f220dcbba86bfc1222180c61bbd31dd6023433db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jul 2023 04:28:36 +0000

flight 181829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181829/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dd49d448b0815c65847241a3faa957e3b4605001
baseline version:
 ovmf                 f220dcbba86bfc1222180c61bbd31dd6023433db

Last test of basis   181824  2023-07-15 14:12:20 Z    1 days
Testing same since   181829  2023-07-17 02:43:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ranbir Singh <Ranbir.Singh3@Dell.com>
  Ranbir Singh <rsingh@ventanamicro.com>

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
   f220dcbba8..dd49d448b0  dd49d448b0815c65847241a3faa957e3b4605001 -> xen-tested-master

