Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35E3262A1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 13:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90277.170809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFc6L-0004oQ-3F; Fri, 26 Feb 2021 12:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90277.170809; Fri, 26 Feb 2021 12:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFc6K-0004o0-UU; Fri, 26 Feb 2021 12:20:08 +0000
Received: by outflank-mailman (input) for mailman id 90277;
 Fri, 26 Feb 2021 12:20:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFc6I-0004k2-O7; Fri, 26 Feb 2021 12:20:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFc6I-0002p2-Fz; Fri, 26 Feb 2021 12:20:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFc6I-0007XW-7S; Fri, 26 Feb 2021 12:20:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFc6I-0002Gs-6y; Fri, 26 Feb 2021 12:20:06 +0000
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
	bh=8htBbgjrKD065zae/JVwgjmkfF+OMh/6oqB3mbRrojs=; b=U0oEZiNal6PB0N4nFbAZB9VSKY
	pgvN4vG/CNndLgvbrZSL1IPjhJaUmjvM+rnA6QNx9gbcX+WBbLdeVV7sQI2S2NnYJykcBHnS52KcU
	2NSIV6d10BONmjAkqogqVnnn+9mNn5h9sGRd8gBGdoLZwmPzA4hcW7ylaXRu3FJDLiFE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159695-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159695: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6ffbb3581ab7c25a35041bac03b760af54f852bf
X-Osstest-Versions-That:
    ovmf=7f34681c488aee2563eaa2afcc6a2c8aa7c5b912
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Feb 2021 12:20:06 +0000

flight 159695 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159695/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ffbb3581ab7c25a35041bac03b760af54f852bf
baseline version:
 ovmf                 7f34681c488aee2563eaa2afcc6a2c8aa7c5b912

Last test of basis   159676  2021-02-25 16:11:45 Z    0 days
Testing same since   159695  2021-02-26 06:09:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   7f34681c48..6ffbb3581a  6ffbb3581ab7c25a35041bac03b760af54f852bf -> xen-tested-master

