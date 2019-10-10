Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE78D244D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 10:54:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIU6K-0002MV-Az; Thu, 10 Oct 2019 08:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIU6J-0002MO-E5
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 08:47:11 +0000
X-Inumbo-ID: 8c01b47a-eb3a-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c01b47a-eb3a-11e9-96dc-bc764e2007e4;
 Thu, 10 Oct 2019 08:47:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42DEDAD7B;
 Thu, 10 Oct 2019 08:47:09 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191009083321.1743-1-roger.pau@citrix.com>
 <1a82f6b0-e79f-261f-de6f-a88ab8cd53ee@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ddd34c29-8e2a-3d5f-ced8-493cfdba84a2@suse.com>
Date: Thu, 10 Oct 2019 10:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1a82f6b0-e79f-261f-de6f-a88ab8cd53ee@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] pci: clear {host/guest}_maskall field on
 assign
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stanislav Spassov <stanspas@amazon.de>, xen-devel@lists.xenproject.org,
 Chao Gao <chao.gao@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMTkgMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjEwLjIwMTkgMTA6
MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
b2YgaG9zdF9tYXNrYWxsIG1ha2VzIGl0IHN0aWNreSBhY3Jvc3MKPj4gYXNzaWduIGFuZCBkZWFz
c2lnbiBjYWxscywgd2hpY2ggbWVhbnMgdGhhdCBvbmNlIGEgZ3Vlc3QgZm9yY2VzIFhlbiB0bwo+
PiBzZXQgaG9zdF9tYXNrYWxsIHRoZSBtYXNrYWxsIGJpdCBpcyBub3QgZ29pbmcgdG8gYmUgY2xl
YXJlZCB1bnRpbCBhCj4+IGNhbGwgdG8gUEhZU0RFVk9QX3ByZXBhcmVfbXNpeCBpcyBwZXJmb3Jt
ZWQuIFN1Y2ggY2FsbCBob3dldmVyCj4+IHNob3VsZG4ndCBiZSBwYXJ0IG9mIHRoZSBub3JtYWwg
ZmxvdyB3aGVuIGRvaW5nIFBDSSBwYXNzdGhyb3VnaCwgYW5kCj4+IGhlbmNlIHRoZSBmbGFnIG5l
ZWRzIHRvIGJlIGNsZWFyZWQgd2hlbiBhc3NpZ25pbmcgaW4gb3JkZXIgdG8gcHJldmVudAo+PiBo
b3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBvdmVyIGZyb20gcHJldmlvdXMgYXNzaWduYXRpb25z
Lgo+Pgo+PiBOb3RlIHRoYXQgdGhlIGVudHJ5IG1hc2tiaXQgaXMgcmVzZXQgd2hlbiB0aGUgbXNp
eCBjYXBhYmlsaXR5IGlzCj4+IGluaXRpYWxpemVkLCBhbmQgdGhlIGd1ZXN0X21hc2thbGwgZmll
bGQgaXMgYWxzbyBjbGVhcmVkIHNvIHRoYXQgdGhlCj4+IGhhcmR3YXJlIHZhbHVlIG1hdGNoZXMg
WGVuJ3MgaW50ZXJuYWwgc3RhdGUgKGhhcmR3YXJlIG1hc2thbGwgPQo+PiBob3N0X21hc2thbGwg
fMKgZ3Vlc3RfbWFza2FsbCkuCj4+Cj4+IEFsc28gbm90ZSB0aGF0IGRvaW5nIHRoZSByZXNldCBv
ZiBob3N0X21hc2thbGwgdGhlcmUgd291bGQgYWxsb3cgdGhlCj4+IGd1ZXN0IHRvIHJlc2V0IHN1
Y2ggZmllbGQgYnkgZW5hYmxpbmcgYW5kIGRpc2FibGluZyBNU0lYLCB3aGljaCBpcyBub3QKPj4g
aW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gCj4gSSdtIGFsc28gQ2MtaW5nIErDvHJnZW4gZm9yIGEgcG9zc2libGUgcmVsZWFz
ZSBhY2sgZm9yIDQuMTMsIGJ1dAo+IEknZCBhbHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgSSdk
IHByZWZlciB0byB3YWl0IGEgbGl0dGxlIHdpdGgKPiBjb21taXR0aW5nIHRoaXMgdG8gZ2V0IGF0
IGxlYXN0IG9uZSBUZXN0ZWQtYnkuCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
