Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03F35EA43
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 03:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110188.210310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWUAn-00031q-Jh; Wed, 14 Apr 2021 01:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110188.210310; Wed, 14 Apr 2021 01:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWUAn-00031M-GB; Wed, 14 Apr 2021 01:18:29 +0000
Received: by outflank-mailman (input) for mailman id 110188;
 Wed, 14 Apr 2021 01:18:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWUAm-00031D-1N; Wed, 14 Apr 2021 01:18:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWUAl-0005Ou-T0; Wed, 14 Apr 2021 01:18:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWUAl-0002Y4-MS; Wed, 14 Apr 2021 01:18:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWUAl-0004KD-Ly; Wed, 14 Apr 2021 01:18:27 +0000
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
	bh=mfUMprzKHy5CUlTlErIBhz9ZgSkTGjqZh08zp2UTsUk=; b=j8aLOMlBH799T/M4yc1HzIr+Ev
	eeOvYYkW4E6rB5yjK0z0rnWMdXtn/XS/bYQG3s+VQgdbc6kENIwqm1/RiqWx/fZHWK4kePdK2vSBk
	sT5DISALKlFTxx18abtd5f6ZBtnp8lJgCT+Xg2Lv3+J9mumwKP9VowESbKepQtwgIP4c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161108: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=7cd8f381d0fe1736d00a568e1381956197e66699
X-Osstest-Versions-That:
    xtf=8ab15139728a8efd3ebbb60beb16a958a6a93fa1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Apr 2021 01:18:27 +0000

flight 161108 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  7cd8f381d0fe1736d00a568e1381956197e66699
baseline version:
 xtf                  8ab15139728a8efd3ebbb60beb16a958a6a93fa1

Last test of basis   156693  2020-11-12 00:13:53 Z  153 days
Testing same since   161108  2021-04-13 23:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christopher Clark <christopher.clark6@baesystems.com>
  Christopher Clark <christopher.w.clark@gmail.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   8ab1513..7cd8f38  7cd8f381d0fe1736d00a568e1381956197e66699 -> xen-tested-master

