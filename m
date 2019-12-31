Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7112DC15
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 23:20:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imPpo-00052Z-OD; Tue, 31 Dec 2019 22:17:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KUxF=2V=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1imPpm-00052U-Ok
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 22:17:50 +0000
X-Inumbo-ID: 61a15b64-2c1b-11ea-a1e1-bc764e2007e4
Received: from mail-qt1-x82e.google.com (unknown [2607:f8b0:4864:20::82e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61a15b64-2c1b-11ea-a1e1-bc764e2007e4;
 Tue, 31 Dec 2019 22:17:50 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id d5so32349559qto.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 14:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=uW+u2t2ycURuFIXG7RieqEan1nN7PiqILtS3BIz0Lo8=;
 b=FkSy/NiB9mKN7PahAOMGrAYmPxEZm/vRPKxbU4fh99Og0K9NBBg4KRJ/8KLVHmiLPA
 a7F14H9XBkgiPQBjeuoSs+DbikUU9QBA6kQhX/F2XPkQ/1AShgbNwcgq5Nge7GE72E5U
 ZaGcq6XcIJrbeMqhcCH+YQkTzwY/Hq5Hv3wzR6LnB90B8GldC4EM9B3+WvmqKIf8t7SI
 B3K8TzBCxrl/iZfEQVlbKbXbmVvDqLPj+5ECItlGghqjBKnNU5tp8NQ89e9cYuUi6GNS
 wSlSssjRMq5Y7wEDUIeZvSF91VU4sfHgqBfmMM0hSPACSjqPwvF8ptNtSORSjQBWr4CW
 SigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uW+u2t2ycURuFIXG7RieqEan1nN7PiqILtS3BIz0Lo8=;
 b=NYLiqpJ7cR82QQBt0I4FyWFrfSlChjG0hiQVcWkefyEivP9JyUu9JTROVI6mgzKdBu
 RNiz+e3Bwi4Yh4i3Rr5LzT/vH+5jVXgIr7AmYAMtyqPS8y7/qWMR1lVBiuljQevu7H8t
 xsyCM7cAt5MLuMIStuOVkBkow63PbR9xXfWVQjk7owWHVPBBh0sICICYgRvtuQ6itZJ+
 FVSICkM4Cf4ywE/ZVdM1xvjf0ZQegjXvpxmCKxiTa5XNbT5RnbDyj3NL2ExTLe4gtgoz
 kLeYMYd4G/EM+RB/hDXna8QgexkDZV9jMmhegPDgrhBKlW13l41upZHB0EQg52rzygLF
 zSBg==
X-Gm-Message-State: APjAAAXWXrePUmHVpaoB8mNqBvPG0HXvMY3OVp3YP+fesATrw/7u6scy
 7rDxm/jlbPRP40QslTKwnT5q83IDwEEsUklmmswnUK1u
X-Google-Smtp-Source: APXvYqzwOXqEf4hJZfP+qAMIuJDRWwYg1vproUeQHAn/Nk6B3M0FHkbOcGpjxYapaqAaBzYOYVrlpzooQLGsgZ2w4gI=
X-Received: by 2002:ac8:7158:: with SMTP id h24mr53439392qtp.63.1577830669718; 
 Tue, 31 Dec 2019 14:17:49 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 31 Dec 2019 14:17:38 -0800
Message-ID: <CAMmSBy9x9mjae1tGBS4-BiUTnB5S=2=cHoXFiPku3Gffv7a=6g@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Where's Xen VGA console kbd driver?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpoZXJlJ3MgYSBzaWxseSBxdWVzdGlvbjogd2hlbmV2ZXIgWGVuIGlzIHByb3ZpZGVkIHdp
dGggYSBWR0EgY29uc29sZSwKd2hlcmUncyB0aGUga2V5Ym9hcmQgZHJpdmVyIGNvbWluZyBmcm9t
PyBRdWljayB0byBteSBzdXJwcmlzZSwgbXkKY2FzdWFsIGluc3BlY3Rpb24gb2YgdGhlIGRyaXZl
cnMvIGZvbGRlciBkaWRuJ3QgcmV2ZWFsIG11Y2guCgpEaWQgSSBtaXNzIHNvbWV0aGluZyBvYnZp
b3VzPwoKVGhhbmtzLApSb21hbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
