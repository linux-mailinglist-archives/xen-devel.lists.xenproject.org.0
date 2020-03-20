Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CA618CD00
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 12:28:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFFnF-0000HF-0f; Fri, 20 Mar 2020 11:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ak30=5F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jFFnD-0000HA-ED
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 11:26:23 +0000
X-Inumbo-ID: a07f740e-6a9d-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a07f740e-6a9d-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 11:26:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB537AC8F;
 Fri, 20 Mar 2020 11:26:21 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
Date: Fri, 20 Mar 2020 12:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAgMTI6MTksIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiBPbiBGcmksIDIwMjAt
MDMtMjAgYXQgMDc6MzQgKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IEhhdmUgeW91IHRo
b3VnaHQgYWJvdXQgdGhlIHBvc3NpYmlsaXR5IHRvIGRvIHRoZSBjb21wbGV0ZSBoYW5kbGluZyBp
biBhCj4+IHNpbmdsZSB0cmFuc2FjdGlvbj8gVGhpcyB3b3VsZCBlbnN1cmUgYSBjb21wbGV0ZSBj
b25zaXN0ZW50IHBpY3R1cmUKPj4gZnJvbSB0aGUgdGltZSB0aGUgb3BlcmF0aW9uIGhhcyBzdGFy
dGVkLiBBbnkgaW5jb25zaXN0ZW5jeSBzaG91bGQgYmUKPj4gcmVwb3J0ZWQgYXMgYW4gZXJyb3Ig
dGhlbi4KPiAKPiBIbSwgaG93IHdvdWxkIHRoYXQgd29yaz8gRG8gSSBoYXZlIHRvIGJ1ZmZlciAq
YWxsKiB0aGUgb3V0cHV0IGZyb20KPiBkb19scygpIGFuZCB0aGVuIG9ubHkgcHJpbnQgaXQgaWYv
d2hlbiB4c190cmFuc2FjdGlvbl9lbmQoKSBzdWNjZWVkcywKPiBlbHNlIHRyeSBhZ2Fpbj8KCk5v
LCB5b3UganVzdCBkb24ndCBjYXJlIGZvciB0aGUgdHJhbnNhY3Rpb24gdG8gc3VjY2VlZCBvciBm
YWlsIChJTU8gaXQKc2hvdWxkIG5ldmVyIGZhaWwgYXMgeW91IGFyZSByZWFkaW5nIG9ubHkpLgoK
U28ganVzdCB3cmFwIGV2ZXJ5dGhpbmcgaW50byBhIHRyYW5zYWN0aW9uLgoKSSBtaWdodCBiZSB3
cm9uZywgb2YgY291cnNlLiA6LSkKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
