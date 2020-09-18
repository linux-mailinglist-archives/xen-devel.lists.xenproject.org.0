Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC826F4C9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 05:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJ7G7-0004z3-8K; Fri, 18 Sep 2020 03:40:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb7v=C3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kJ7G6-0004yy-0g
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 03:40:26 +0000
X-Inumbo-ID: 864f98ff-bf45-4e5b-bd14-766c7e81774c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 864f98ff-bf45-4e5b-bd14-766c7e81774c;
 Fri, 18 Sep 2020 03:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=lHzUe86C1NfcWbIai6E4kmK/6A1PD2jVFkikuu3j9nA=; b=4ON7OdPjv0miS0rpW5Gs8Fqtm+
 8md2EsmCN1eMbPsvyWtlzKQsOMJ3Bt66UnUxWYrKuRSyP9AKxwMEQm4QGFXhaTE6t0rb5gvh2uK5k
 WJdcNiYGOjcVUSp1qKhLZOI2KfYXnAvchdsApD/GWbCm21LISVgp5NTaiDWFX5tlcXkI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ7G4-0002BJ-1R; Fri, 18 Sep 2020 03:40:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ7G3-0005Yo-Od; Fri, 18 Sep 2020 03:40:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ7G3-0000zk-O7; Fri, 18 Sep 2020 03:40:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154446-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154446: all pass - PUSHED
X-Osstest-Versions-This: ovmf=32b0a492d505434c6f5e6c3578cd34fee39cd25e
X-Osstest-Versions-That: ovmf=5648836987cab28ca988dfe5af94413cfa480a92
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Sep 2020 03:40:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154446 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154446/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 32b0a492d505434c6f5e6c3578cd34fee39cd25e
baseline version:
 ovmf                 5648836987cab28ca988dfe5af94413cfa480a92

Last test of basis   154429  2020-09-17 12:10:35 Z    0 days
Testing same since   154446  2020-09-18 01:39:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   5648836987..32b0a492d5  32b0a492d505434c6f5e6c3578cd34fee39cd25e -> xen-tested-master

