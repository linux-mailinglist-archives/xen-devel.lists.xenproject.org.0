Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5401D0DE9
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 11:57:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYo7Y-0002ui-Hk; Wed, 13 May 2020 09:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Rkd=63=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYo7W-0002ud-Jj
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 09:56:10 +0000
X-Inumbo-ID: f6597686-94ff-11ea-a348-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6597686-94ff-11ea-a348-12813bfff9fa;
 Wed, 13 May 2020 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a62biwheoBI6ysfMBsrQn60BIx2zFc34Ox37F90oYY4=; b=YBu1Ua2EeRwE+X7mLT9+hdDOt
 HSeoKrVjkyLpzRHq/RHAJhsPCLDmfHj5p9Z84xjnryur8zYl8Bxw2YPEEokoeKSPDJw+cgKbRU8EI
 at6UNgAOTPSGwFduV0tnq05avk0F6pSL9jxt7BmPfEjHdLW8IBHfl65M+zCKnWzxpHj2I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYo7R-0002pB-Ly; Wed, 13 May 2020 09:56:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYo7R-0000am-FA; Wed, 13 May 2020 09:56:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYo7R-0008CI-ET; Wed, 13 May 2020 09:56:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150157-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150157: all pass - PUSHED
X-Osstest-Versions-This: xen=a82582b1af6a4a57ca53bcfad9f71428cb5f9a54
X-Osstest-Versions-That: xen=e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 May 2020 09:56:05 +0000
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

flight 150157 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150157/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  a82582b1af6a4a57ca53bcfad9f71428cb5f9a54
baseline version:
 xen                  e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9

Last test of basis   150123  2020-05-10 09:19:05 Z    3 days
Testing same since   150157  2020-05-13 09:19:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   e0d92d9bd7..a82582b1af  a82582b1af6a4a57ca53bcfad9f71428cb5f9a54 -> coverity-tested/smoke

