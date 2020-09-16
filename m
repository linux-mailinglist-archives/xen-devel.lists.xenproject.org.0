Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8A26C190
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 12:23:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIUae-00040A-Ay; Wed, 16 Sep 2020 10:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJNc=CZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIUac-0003zq-Qk
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 10:23:02 +0000
X-Inumbo-ID: f4c795de-5df4-4ed9-a9f1-d3cf804f87e6
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4c795de-5df4-4ed9-a9f1-d3cf804f87e6;
 Wed, 16 Sep 2020 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=w+0oSx7H2Mth9xcRPYQHtHPHqXuBSiEnrwD0UpKU0JU=; b=36q12ImkqlQXrJvwlr0L72IUBH
 62+T4gF8rMmfUiw7NZVCzkCa/onIqYjlLgGk4JCas577E+7woOlgxlRfHqAsSo2WLYiRuqxKYXlra
 l/4kw+M/J5mnsMhKI1OlH7PmpB9yfSyhHRzrIbvBGcNfyk8E6tqMwXIFapi1lcT+ngek=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIUaW-00034Q-F7; Wed, 16 Sep 2020 10:22:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIUaW-0004ex-6B; Wed, 16 Sep 2020 10:22:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIUaW-0005DA-5k; Wed, 16 Sep 2020 10:22:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154380-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154380: all pass - PUSHED
X-Osstest-Versions-This: xen=51526576219f122ec7ccfd55dea95afbca70d330
X-Osstest-Versions-That: xen=6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Sep 2020 10:22:56 +0000
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

flight 154380 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154380/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  51526576219f122ec7ccfd55dea95afbca70d330
baseline version:
 xen                  6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6

Last test of basis   154260  2020-09-13 09:20:39 Z    3 days
Testing same since   154380  2020-09-16 09:19:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Don Slutz <don.slutz@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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
   6c5fb129e8..5152657621  51526576219f122ec7ccfd55dea95afbca70d330 -> coverity-tested/smoke

