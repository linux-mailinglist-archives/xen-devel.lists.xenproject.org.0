Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFD1867E4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 10:29:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDm1P-0006vU-H1; Mon, 16 Mar 2020 09:26:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hZOJ=5B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jDm1N-0006vP-Ps
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 09:26:53 +0000
X-Inumbo-ID: 44c3367e-6768-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44c3367e-6768-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 09:26:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 262A2AE78;
 Mon, 16 Mar 2020 09:26:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Pawe=c5=82_Marczewski?= <pawel@invisiblethingslab.com>
References: <8cddf6ca-277f-6317-9bf6-1c2202c6a651@suse.com>
 <7be49e30-b705-6b34-5def-d4e8f79cf598@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c2d0fe59-cb22-fc88-f0e3-4c62763932b4@suse.com>
Date: Mon, 16 Mar 2020 10:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7be49e30-b705-6b34-5def-d4e8f79cf598@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Commit 0d99c909d7e1 introduced bug
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDMuMjAgMTA6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTYvMDMvMjAyMCAw
ODo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gQ29tbWl0IDBkOTljOTA5ZDdlMSAoImxpYnhs
OiB3YWl0IGZvciBjb25zb2xlIHBhdGggYmVmb3JlIGZpcmluZwo+PiBjb25zb2xlX2F2YWlsYWJs
ZSIpIGludHJvZHVjZWQgYSBidWc6IHdoZW4gdHJ5aW5nIHRvIHN0YXJ0IGEgZ3Vlc3QKPj4gZnJv
bSBhIGNvbmZpZyBmaWxlIHdoZW4gaXQgaXMgYWxyZWFkeSBydW5uaW5nLCBJIGdldDoKPj4KPj4g
eGwgY3JlYXRlIC1jIG1pbmlvcy5wdgo+PiBQYXJzaW5nIGNvbmZpZyBmcm9tIG1pbmlvcy5wdgo+
PiBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjgxOmxpYnhsX19kb21haW5fcmVuYW1lOiBE
b21haW4gODpEb21haW4KPj4gd2l0aCBuYW1lICJtaW5pb3MiIGFscmVhZHkgZXhpc3RzLgo+PiBs
aWJ4bDogZXJyb3I6IGxpYnhsX2NyZWF0ZS5jOjExODA6aW5pdGlhdGVfZG9tYWluX2NyZWF0ZTog
RG9tYWluCj4+IDg6Y2Fubm90IG1ha2UgZG9tYWluOiAtNgo+PiBTZWdtZW50YXRpb24gZmF1bHQg
KGNvcmUgZHVtcGVkKQo+Pgo+PiBUaGUgc2VnZmF1bHQgaXMgZHVlIHRvOgo+Pgo+PiAjMMKgIDB4
MDAwMDdmZmZmNzAxMjdkMSBpbiBfX3N0cmxlbl9hdngyICgpIGZyb20gL2xpYjY0L2xpYmMuc28u
Ngo+PiAjMcKgIDB4MDAwMDdmZmZmNjYzODVmOCBpbiB4c191bndhdGNoIChoPTB4NjQ0MTQwLCBw
YXRoPTB4MCwKPj4gdG9rZW49MHg2NDdjYzAgIjAvMCIpIGF0IHhzLmM6OTkzCj4+ICMywqAgMHgw
MDAwN2ZmZmY3OTA3YWFkIGluIGxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXIgKGdjPTB4NjQ1
M2QwLAo+PiB3PTB4NjQ3OWUwKSBhdCBsaWJ4bF9ldmVudC5jOjg1Mwo+PiAjM8KgIDB4MDAwMDdm
ZmZmNzhmN2IyMiBpbiBsaWJ4bF9feHN3YWl0X3N0b3AgKGdjPTB4NjQ1M2QwLAo+PiB4c3dhPTB4
NjQ3OTU4KSBhdCBsaWJ4bF9hb3V0aWxzLmM6MzQKPj4gIzTCoCAweDAwMDA3ZmZmZjc4Y2RlMDkg
aW4gZG9tY3JlYXRlX2NvbXBsZXRlIChlZ2M9MHg3ZmZmZmZmZmQ5MjAsCj4+IGRjcz0weDY0NTQ5
MCwgcmM9LTMpIGF0IGxpYnhsX2NyZWF0ZS5jOjE4NjAKPj4KPj4gIyMjIyMjIyBeIHRoaXMgY2Fs
bCB0byBsaWJ4bF9feHN3YWl0X3N0b3AoKSB3YXMgYWRkZWQgd2l0aCBzYWlkIGNvbW1pdAo+Pgo+
PiAjNcKgIDB4MDAwMDdmZmZmNzhjYmZhZSBpbiBpbml0aWF0ZV9kb21haW5fY3JlYXRlIChlZ2M9
MHg3ZmZmZmZmZmQ5MjAsCj4+IGRjcz0weDY0NTQ5MCkgYXQgbGlieGxfY3JlYXRlLmM6MTI0NAo+
PiAjNsKgIDB4MDAwMDdmZmZmNzhjZTM2OCBpbiBkb19kb21haW5fY3JlYXRlIChjdHg9MHg2NDM4
NjAsCj4+IGRfY29uZmlnPTB4N2ZmZmZmZmZkYWQwLCBkb21pZD0weDdmZmZmZmZmZGZhYywgcmVz
dG9yZV9mZD0tMSwKPj4gc2VuZF9iYWNrX2ZkPS0xLCBwYXJhbXM9MHgwLAo+PiAgwqDCoMKgIGFv
X2hvdz0weDAsIGFvcF9jb25zb2xlX2hvdz0weDdmZmZmZmZmZGE2MCkgYXQgbGlieGxfY3JlYXRl
LmM6MTk3Nwo+PiAjN8KgIDB4MDAwMDdmZmZmNzhjZWZkZiBpbiBsaWJ4bF9kb21haW5fY3JlYXRl
X25ldyAoY3R4PTB4NjQzODYwLAo+PiBkX2NvbmZpZz0weDdmZmZmZmZmZGFkMCwgZG9taWQ9MHg3
ZmZmZmZmZmRmYWMsIGFvX2hvdz0weDAsCj4+IGFvcF9jb25zb2xlX2hvdz0weDdmZmZmZmZmZGE2
MCkKPj4gIMKgwqDCoCBhdCBsaWJ4bF9jcmVhdGUuYzoyMTkyCj4+ICM4wqAgMHgwMDAwMDAwMDAw
NDI4ZmM4IGluIGNyZWF0ZV9kb21haW4gKGRvbV9pbmZvPTB4N2ZmZmZmZmZlMGIwKSBhdAo+PiB4
bF92bWNvbnRyb2wuYzo5MzYKPj4gIznCoCAweDAwMDAwMDAwMDA0MjljNGQgaW4gbWFpbl9jcmVh
dGUgKGFyZ2M9MywgYXJndj0weDdmZmZmZmZmZTI5MCkgYXQKPj4geGxfdm1jb250cm9sLmM6MTI0
Ngo+PiAjMTAgMHgwMDAwMDAwMDAwNDBhZDBiIGluIG1haW4gKGFyZ2M9MywgYXJndj0weDdmZmZm
ZmZmZTI5MCkgYXQgeGwuYzo0MjUKPiAKPiBXaGF0IGFib3V0IHRoZSB0b3AgY29tbWl0LCBkMDk0
ZTk1ZmI3YzYxYyB3aGljaCBzZWVtcyB0byBiZSBhIGJ1Z2ZpeCBmb3IKPiB0aGlzPwoKT2gsIHNv
cnJ5LCBtaXNzZWQgdGhhdCEKCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
