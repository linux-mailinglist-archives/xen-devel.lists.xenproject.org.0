Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F93CDC4A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 09:15:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHNCE-0004d9-DV; Mon, 07 Oct 2019 07:12:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHNCD-0004cz-BE
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 07:12:41 +0000
X-Inumbo-ID: d868dc8c-e8d1-11e9-97a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d868dc8c-e8d1-11e9-97a3-12813bfff9fa;
 Mon, 07 Oct 2019 07:12:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50610AEEE;
 Mon,  7 Oct 2019 07:12:38 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191006051907.GY12975@bitfolk.com>
 <07e968fc-4b3f-8f26-927d-3c0f349ba3f5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b8f1830-6d97-7f6e-4b57-dad0b44d9750@suse.com>
Date: Mon, 7 Oct 2019 09:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <07e968fc-4b3f-8f26-927d-3c0f349ba3f5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Xen-users] xenstat_domain_cpu_ns() occasionally
 returns a huge value
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
Cc: Andy Smith <andy@strugglers.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 xen-users@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTAuMjAxOSAxMTowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNi4xMC4xOSAw
NzoxOSwgQW5keSBTbWl0aCB3cm90ZToKPj4gSGksCj4+Cj4+IEkgd2FzIHdyaXRpbmcgYSBsaXR0
bGUgdXRpbGl0eSB0byBkdW1wIG91dCBkb21haW4gQ1BVIHRpbWVzIGFuZCBJCj4+IG5vdGljZWQg
dGhhdCBvY2Nhc2lvbmFsbHkgeGVuc3RhdF9kb21haW5fY3B1X25zKCkgcmV0dXJucyBhbgo+PiBl
cnJvbmVvdXMgaHVnZSB2YWx1ZSBsaWtlIDkyMjM0ODgwMzQ0Nzc0NTcwMTMuCj4+Cj4+IEF0dGFj
aGVkIGlzIGEgc21hbGwgdGVzdCBwcm9ncmFtIHRoYXQganVzdCByZXF1ZXN0cyBldmVyeSBkb21h
aW4ncwo+PiBDUFUgdGltZSBpbiBhIHRpZ2h0IGxvb3A7IGl0IHJlY2VpdmVkIHN1Y2ggYSByZXN1
bHQgYWZ0ZXIgbGVzcyB0aGFuCj4+IDMgbWludXRlcyBydW5uaW5nIGluIGRvbTAgb2YgYSBob3N0
IHdpdGggb25seSBkb20wIGFuZCB0d28gb3RoZXIgUFYKPj4gZG9tYWlucyBydW5uaW5nOgo+Pgo+
PiAkIG1ha2UgY3B1X3RpbWVfdGVzdAo+PiBjYyAtV2FsbCAgLWx4ZW5zdGF0IC1seWFqbCAtV2ws
LXJwYXRoLC91c3IvbGliL3hlbi00LjEyL2xpYiAtTC91c3IvbGliL3hlbi00LjEyL2xpYiAgY3B1
X3RpbWVfdGVzdC5jICAgLW8gY3B1X3RpbWVfdGVzdAo+PiAkIHN1ZG8gdGltZSAuL2NwdV90aW1l
X3Rlc3QKPj4gR290IGEgd2VpcmQgQ1BVIHRpbWUgOTIyMzQ4ODEwOC44NjczMDUgPjEwMCB5ZWFy
cyAoY3B1X25zPTkyMjM0ODgxMDg4NjczMDQ4MTgpCj4+IENvbW1hbmQgZXhpdGVkIHdpdGggbm9u
LXplcm8gc3RhdHVzIDEKPj4gODQuMDd1c2VyIDQxLjkwc3lzdGVtIDI6NDAuMjBlbGFwc2VkIDc4
JUNQVSAoMGF2Z3RleHQrMGF2Z2RhdGEgMzk3ODBtYXhyZXNpZGVudClrCj4+IDBpbnB1dHMrMG91
dHB1dHMgKDBtYWpvcis5NTQxbWlub3IpcGFnZWZhdWx0cyAwc3dhcHMKPj4KPj4gVGhlIGVycm9u
ZW91cyByZXN1bHRzIGFyZSBhbHdheXMgc29tZXdoZXJlIGFib3ZlIDkyMnh4eHh4eHh4eHh4eHh4
eHgKPj4gbmFub3NlY29uZHMgKHNvbWUgMjg1IHllYXJzIG9mIENQVSB0aW1lIGlmIGl0IHdlcmUg
Z2VudWluZSEpLiBUaGVuCj4+IHRoZSBuZXh0IHJlYWRpbmcgd2lsbCBiZSBub3JtYWwuIFZlcnkg
b2NjYXNpb25hbGx5IEkndmUgc2VlbiB0d28gaW4KPj4gYSByb3cuIEkgc2VlIHRoaXMgb24gYm90
aCA0LjEyIGFuZCA0LjEwLgo+Pgo+PiBNeSBDIGlzIHZlcnkgcnVzdHkgc28gSSd2ZSBwcm9iYWJs
eSBtYWRlIGEgc2ltcGxlIGVycm9yIGFuZCBkb24ndAo+PiB3YW50IHRvIGJvdGhlciB4ZW4tZGV2
ZWwgd2l0aCBpdDsgY2FuIHNvbWVvbmUgZmFtaWxpYXIgd2l0aCB1c2luZwo+PiB0aGUgeGVuc3Rh
dCBpbnRlcmZhY2UgcGxlYXNlIHRlbGwgbWUgd2hhdCBJJ3ZlIGRvbmUgd3JvbmcgaGVyZT8KPiAK
PiBJIGJlbGlldmUgY2hhbmNlcyBhcmUgcmF0aGVyIGhpZ2ggdGhpcyBpcyB0aGUgYnVnIHdoaWNo
IHdhcyBjb3JyZWN0ZWQKPiByZWNlbnRseSB3aXRoIFhlbiBjb21taXQgZjI4YzRjNGMxMGJkYWNi
Lgo+IAo+IEFuZHksIHlvdSBjYW4gZWFzaWx5IGF2b2lkIHRoYXQgcHJvYmxlbSBieSByZW1vdmlu
ZyB0aGUgaGlnaGVzdCBiaXQKPiBvZiB0aGUgcnVudGltZSB2YWx1ZSwgZS5nLgo+IAo+ICAgICBj
b3JyZWN0X3ZhbHVlID0gcmVwb3J0ZWRfcnVudGltZSAmIH4oMVVMTCA8PCA2Myk7Cj4gCj4gSmFu
LCBJIHRoaW5rIHRoYXQgcGF0Y2ggc2hvdWxkIGJlIGluY2x1ZGVkIGluIHN0YWJsZSB2ZXJzaW9u
cy4KCkkgaGF2ZSBpdCBxdWV1ZWQgYWxyZWFkeTsgSSd2ZSBtZXJlbHkgYmVlbiB3YWl0aW5nIGZv
ciBpdCB0byBwYXNzIHRoZQpwdXMgZ2F0ZSB0byBtYXN0ZXIuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
