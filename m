Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69A11633CD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 22:05:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4A1a-0005Zc-Bd; Tue, 18 Feb 2020 21:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uj9=4G=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j4A1Y-0005ZW-VW
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 21:03:20 +0000
X-Inumbo-ID: 16543a26-5292-11ea-aa99-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16543a26-5292-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 21:03:19 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4A1O-0006ER-Ar; Tue, 18 Feb 2020 22:03:10 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id B684E100617; Tue, 18 Feb 2020 22:03:09 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
In-Reply-To: <20200218154712.25490-1-jgross@suse.com>
References: <20200218154712.25490-1-jgross@suse.com>
Date: Tue, 18 Feb 2020 22:03:09 +0100
Message-ID: <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [PATCH] x86/ioperm: add new paravirt function
 update_io_bitmap
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
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cj4gQ29tbWl0IDExMWU3YjE1
Y2YxMGY2ICgieDg2L2lvcGVybTogRXh0ZW5kIElPUEwgY29uZmlnIHRvIGNvbnRyb2wKPiBpb3Bl
cm0oKSBhcyB3ZWxsIikgcmV3b3JrZWQgdGhlIGlvcGwgc3lzY2FsbCB0byB1c2UgSS9PIGJpdG1h
cHMuCj4KPiBVbmZvcnR1bmF0ZWx5IHRoaXMgYnJva2UgWGVuIFBWIGRvbWFpbnMgdXNpbmcgdGhh
dCBzeXNjYWxsIGFzIHRoZXJlCj4gaXMgY3VycmVudGx5IG5vIEkvTyBiaXRtYXAgc3VwcG9ydCBp
biBQViBkb21haW5zLgo+Cj4gQWRkIEkvTyBiaXRtYXAgc3VwcG9ydCB2aWEgYSBuZXcgcGFyYXZp
cnQgZnVuY3Rpb24gdXBkYXRlX2lvX2JpdG1hcAo+IHdoaWNoIFhlbiBQViBkb21haW5zIGNhbiB1
c2UgdG8gdXBkYXRlIHRoZWlyIEkvTyBiaXRtYXBzIHZpYSBhCj4gaHlwZXJjYWxsLgo+Cj4gRml4
ZXM6IDExMWU3YjE1Y2YxMGY2ICgieDg2L2lvcGVybTogRXh0ZW5kIElPUEwgY29uZmlnIHRvIGNv
bnRyb2wgaW9wZXJtKCkgYXMgd2VsbCIpCj4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS41Cj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gVGVzdGVkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpEdWgsIHNvcnJ5IGFib3V0IHRoYXQgYW5kIHRoYW5rcyBm
b3IgZml4aW5nIGl0LgoKQlRXLCB3aHkgaXNuJ3Qgc3R1ZmYgbGlrZSB0aGlzIG5vdCBjYXRjaGVk
IGR1cmluZyBuZXh0IG9yIGF0IGxlYXN0CmJlZm9yZSB0aGUgZmluYWwgcmVsZWFzZT8gSXMgbm90
aGluZyBydW5uaW5nIENJIG9uIHVwc3RyZWFtIHdpdGggYWxsCnRoYXQgWEVOIG11Y2sgYWN0aXZl
PwoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
