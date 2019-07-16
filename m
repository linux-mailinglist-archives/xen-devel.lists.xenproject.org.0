Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A541D6B0EA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:16:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUm9-0007Hv-03; Tue, 16 Jul 2019 21:14:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUm7-0007Hq-9B
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 21:14:15 +0000
X-Inumbo-ID: a8febe8e-a80e-11e9-9359-c7b7b3b333ce
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8febe8e-a80e-11e9-9359-c7b7b3b333ce;
 Tue, 16 Jul 2019 21:14:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563311653; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=+mqA6GRiQXnihLilbsGcv3FSSB0OpJZANOihuxpTfGE=;
 b=W/Z3mAIN3cMvJSrZUWexMm9trfuYJf5wywRjABzmlsn0bdiINTWEx0qDSdP9QsfErNGsQi2v
 zBDQFxXtTl/Gc6nr9UNg2sUNaFhtPNNMs0HZqQgPAWCdEyfB+lzOpxlhucRu0bYGj9hxR3N7
 CEKOIzGeLNpCYSV4RXPunaW5NNU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5d2e3e24.7f8af6edcfb0-smtp-out-n02;
 Tue, 16 Jul 2019 21:14:12 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id u25so9657076wmc.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 14:14:12 -0700 (PDT)
X-Gm-Message-State: APjAAAWPD66EpOa88ML9Ya0lLs70mMDFh8lWZYHt1GV6jTHGRzr3Raho
 tRgNOgxJc5zHSHI4eYrWKB7K3c8mWj29UGV62ps=
X-Google-Smtp-Source: APXvYqxtnri+yOHZoi2SdB24YSj+8R7n4+2keZXcYI/Zcy/aICP0e2f56Mm1KHR7B9jF0Q2nkYdwS8OpE6QTlnwvt4Y=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr33169911wmm.153.1563311651538; 
 Tue, 16 Jul 2019 14:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 15:13:35 -0600
X-Gmail-Original-Message-ID: <CABfawhmwc1Be6Fdt_stEhn+ydZwiE1d-wX8d7WG+vXS2+C2d8g@mail.gmail.com>
Message-ID: <CABfawhmwc1Be6Fdt_stEhn+ydZwiE1d-wX8d7WG+vXS2+C2d8g@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBJbiBoaWdoIHRocm91Z2hwdXQgaW50cm9z
cGVjdGlvbiBzY2VuYXJpb3Mgd2hlcmUgbG90cyBvZiBtb25pdG9yCj4gdm1fZXZlbnRzIGFyZSBn
ZW5lcmF0ZWQsIHRoZSByaW5nIGJ1ZmZlciBjYW4gZmlsbCB1cCBiZWZvcmUgdGhlIG1vbml0b3IK
PiBhcHBsaWNhdGlvbiBnZXRzIGEgY2hhbmNlIHRvIGhhbmRsZSBhbGwgdGhlIHJlcXVlc3RzIHRo
dXMgYmxvY2tpbmcKPiBvdGhlciB2Y3B1cyB3aGljaCB3aWxsIGhhdmUgdG8gd2FpdCBmb3IgYSBz
bG90IHRvIGJlY29tZSBhdmFpbGFibGUuCj4KPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3Ig
YSBkaWZmZXJlbnQgbWVjaGFuaXNtIHRvIGhhbmRsZSBzeW5jaHJvbm91cwo+IHZtX2V2ZW50IHJl
cXVlc3RzIC8gcmVzcG9uc2VzLiBBcyBlYWNoIHN5bmNocm9ub3VzIHJlcXVlc3QgcGF1c2VzIHRo
ZQo+IHZjcHUgdW50aWwgdGhlIGNvcnJlc3BvbmRpbmcgcmVzcG9uc2UgaXMgaGFuZGxlZCwgaXQg
Y2FuIGJlIHN0b3JlZCBpbgo+IGEgc2xvdHRlZCBtZW1vcnkgYnVmZmVyIChvbmUgcGVyIHZjcHUp
IHNoYXJlZCBiZXR3ZWVuIHRoZSBoeXBlcnZpc29yIGFuZAo+IHRoZSBjb250cm9sbGluZyBkb21h
aW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVm
ZW5kZXIuY29tPgoKU28gdGhpcyBpcyBxdWl0ZSBhIGxhcmdlIHBhdGNoLCBwZXJoYXBzIGl0IHdv
dWxkIGJlIGJldHRlciB0byBzcGxpdCBpdAppbnRvIGEgaHlwZXJ2aXNvci1zaWRlIHBhdGNoIGFu
ZCB0aGVuIGEgdG9vbHN0YWNrLXNpZGUgb25lLiBBbHNvLAp3b3VsZCBpdCBtYWtlIHNlbnNlIHRv
IGtlZXAgdGhlIHR3byBpbXBsZW1lbnRhdGlvbnMgaW4gc2VwYXJhdGUgZmlsZXMKd2l0aGluIFhl
biAoaWUuIGNvbW1vbi92bV9ldmVudC5jIGFuZCB2bV9ldmVudF9uZy5jKT8KClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
