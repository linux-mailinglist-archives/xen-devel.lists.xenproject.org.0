Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1256B0BB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:05:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUbd-0006Gr-4B; Tue, 16 Jul 2019 21:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUbb-0006Gm-AP
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 21:03:23 +0000
X-Inumbo-ID: 2390c0c2-a80d-11e9-a2c9-6f7512ac1138
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2390c0c2-a80d-11e9-a2c9-6f7512ac1138;
 Tue, 16 Jul 2019 21:03:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563310999; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=koJ6cpRotwR4+TTbdN3dxrWA7L0fCXn6pG/BvQAIcI4=;
 b=PowDUEenhhtK6HmFWoI9iFPRZ5TEHbuwqjG/EFDaRnT2lfTuMyOIcvy+GWYIjPyNiFT2eAy6
 6YkdDtVy4EA9KOoza2iIggopFx3ST8hQOwqJSErTiTaduZl5WsSdL0qP1FJ242XvbV4XwUm2
 z/Nkawny+KRx16X8xL79gxNOaGk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5d2e3b97.7f99bac5e670-smtp-out-n03;
 Tue, 16 Jul 2019 21:03:19 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id w9so17614848wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 14:03:19 -0700 (PDT)
X-Gm-Message-State: APjAAAUDOiEai/ngNqo3ZCdsH4LPxtKOjhFS+8nH8NHBu/gMXVfnXThL
 kOpeK30F4QqZL9kisrhdgYMXb0Rp4BTFyvd3Ai4=
X-Google-Smtp-Source: APXvYqzEDTZhGWrzsvfkf1KTxgcdd5yjYbqUM4alOOPNpB0H8PjwT/Prrt/35pBhUYtdUEFoczZy+eX4PI42V/ZNfmo=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr33144969wmm.153.1563310998326; 
 Tue, 16 Jul 2019 14:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <c7e5c600bbe00646d35eb3fa65b1894f7146e0df.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <c7e5c600bbe00646d35eb3fa65b1894f7146e0df.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 15:02:41 -0600
X-Gmail-Original-Message-ID: <CABfawhkqaiTngqq-xZ-Xw5B-i8pA_0wdy5aqUVu5VsDqde7F3w@mail.gmail.com>
Message-ID: <CABfawhkqaiTngqq-xZ-Xw5B-i8pA_0wdy5aqUVu5VsDqde7F3w@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 03/10] vm_event: Add 'struct domain'
 backpointer to vm_event_domain.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJj
YWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgoKQWNrZWQtYnk6IFRhbWFzIEsgTGVu
Z3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
