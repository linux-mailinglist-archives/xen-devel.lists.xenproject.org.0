Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D823FDA4
	for <lists+xen-devel@lfdr.de>; Sun,  9 Aug 2020 12:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4iO4-00032n-G3; Sun, 09 Aug 2020 10:17:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJHn=BT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k4iO3-00032f-Oz
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2020 10:17:07 +0000
X-Inumbo-ID: ce537349-fdce-4b7d-9fca-0d7de0236493
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce537349-fdce-4b7d-9fca-0d7de0236493;
 Sun, 09 Aug 2020 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0bUMA6z1R9U9Bdj4emisFkOg4Wa9YaIYWUUjvnVf3s=; b=6GZJa4sNlGeVZm812jH3ztJTG
 aQPSEG5zVTpcHmLgKA0Ur0+IYw8aDUehhLZ+Np8BR5q4CXV8lu04zIQMjBuw16zF93pAIxE4MwjLu
 KeyrTdJWyJ/HBVIUCSmIUL8vPbvTde/I6Uy/6HghgHjYfA0Q4WAkeuWQUhQH49FU+BhNo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4iO1-0008Mm-Pj; Sun, 09 Aug 2020 10:17:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4iO1-0004gU-Gw; Sun, 09 Aug 2020 10:17:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k4iO1-0007sI-GU; Sun, 09 Aug 2020 10:17:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152543-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152543: all pass - PUSHED
X-Osstest-Versions-This: xen=90c7eee53fcc0b48bd51aa3a7d1d0d9980ce1a7a
X-Osstest-Versions-That: xen=c9f9a7258dc07735e2da2b6d0b51a0218c76a51f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Aug 2020 10:17:05 +0000
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

flight 152543 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152543/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  90c7eee53fcc0b48bd51aa3a7d1d0d9980ce1a7a
baseline version:
 xen                  c9f9a7258dc07735e2da2b6d0b51a0218c76a51f

Last test of basis   152488  2020-08-05 09:18:39 Z    4 days
Testing same since   152543  2020-08-09 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   c9f9a7258d..90c7eee53f  90c7eee53fcc0b48bd51aa3a7d1d0d9980ce1a7a -> coverity-tested/smoke

