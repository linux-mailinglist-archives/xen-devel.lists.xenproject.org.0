Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4833AFDD76
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVadB-0006tM-Pv; Fri, 15 Nov 2019 12:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVad9-0006tH-VM
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:23:15 +0000
X-Inumbo-ID: b12b4412-07a2-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12b4412-07a2-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 12:23:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24A6AAF76;
 Fri, 15 Nov 2019 12:23:12 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191115105739.20333-1-george.dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <eff4cd42-fb53-9e26-050f-6e1c5225613d@suse.com>
Date: Fri, 15 Nov 2019 13:23:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115105739.20333-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTE6NTcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gQ2hhbmdlc2V0IGNhMmVl
ZTkyZGY0NCAoIng4NiwgaHZtOiBFeHBvc2UgaG9zdCBjb3JlL0hUIHRvcG9sb2d5IHRvIEhWTQo+
IGd1ZXN0cyIpIGF0dGVtcHRlZCB0byAiZmFrZSB1cCIgYSB0b3BvbG9neSB3aGljaCB3b3VsZCBp
bmR1Y2UgZ3Vlc3QKPiBvcGVyYXRpbmcgc3lzdGVtcyB0byBub3QgdHJlYXQgdmNwdXMgYXMgc2li
bGluZyBoeXBlcnRocmVhZHMuICBUaGlzCj4gaW52b2x2ZWQgKGFtb25nIG90aGVyIHRoaW5ncykg
YWN0dWFsbHkgcmVwb3J0aW5nIGh5cGVydGhyZWFkaW5nIGFzCj4gYXZhaWxhYmxlLCBidXQgZ2l2
aW5nIHZjcHVzIGV2ZXJ5IG90aGVyIEFQSUNJRC4gIFRoZSByZXN1bHRpbmcgY3B1Cj4gZmVhdHVy
ZXNldCBpcyBpbnZhbGlkLCBidXQgbW9zdCBvcGVyYXRpbmcgc3lzdGVtcyBvbiBtb3N0IGhhcmR3
YXJlCj4gbWFuYWdlZCB0byBjb3BlIHdpdGggaXQuCj4gCj4gVW5mb3J0dW5hdGVseSwgV2luZG93
cyBydW5uaW5nIG9uIG1vZGVybiBBTUQgaGFyZHdhcmUgLS0gaW5jbHVkaW5nCj4gUnl6ZW4gM3h4
eCBzZXJpZXMgcHJvY2Vzc29ycywgYW5kIHJlcG9ydGVkbHkgRVBZQyAiUm9tZSIgY3B1cyAtLSBn
ZXRzCj4gY29uZnVzZWQgYnkgdGhlIHJlc3VsdGluZyBjb250cmFkaWN0b3J5IGZlYXR1cmUgYml0
cyBhbmQgY3Jhc2hlcwo+IGR1cmluZyBpbnN0YWxsYXRpb24uICAoTGludXggZ3Vlc3RzIGhhdmUg
c28gZmFyIGNvbnRpbnVlZCB0byBjb3BlLikKPiAKPiBBICJwcm9wZXIiIGZpeCBpcyBjb21wbGlj
YXRlZCBhbmQgaXQncyB0b28gbGF0ZSB0byBmaXggaXQgZWl0aGVyIGZvcgo+IDQuMTMsIG9yIHRv
IGJhY2twb3J0IHRvIHN1cHBvcnRlZCBicmFuY2hlcy4gIEFzIGEgc2hvcnQtdGVybSBmaXgsCj4g
aW1wbGVtZW50IGFuIG9wdGlvbiB0byBkaXNhYmxlIHRoaXMgIkZha2UgSFQiIG1vZGUuICBUaGUg
cmVzdWx0aW5nCj4gdG9wb2xvZ3kgcmVwb3J0ZWQgd2lsbCBub3QgYmUgY2Fub25pY2FsLCBidXQg
ZXhwZXJpbWVudGFsbHkgY29udGludWVzCj4gdG8gd29yayB3aXRoIFdpbmRvd3MgZ3Vlc3RzLgo+
IAo+IEhvd2V2ZXIsIGRpc2FibGluZyB0aGlzICJGYWtlIEhUIiBtb2RlIGhhcyBub3QgYmVlbiB3
aWRlbHkgdGVzdGVkLCBhbmQKPiB3aWxsIGFsbW9zdCBjZXJ0YWlubHkgYnJlYWsgbWlncmF0aW9u
IGlmIGFwcGxpZWQgaW5jb25zaXN0ZW50bHkuCj4gCj4gVG8gbWluaW1pemUgaW1wYWN0IHdoaWxl
IGFsbG93aW5nIGFkbWluaXN0cmF0b3JzIHRvIGRpc2FibGUgIkZha2UgSFQiCj4gb25seSBvbiBn
dWVzdHMgd2hpY2ggYXJlIGtub3duIG5vdCB0byB3b3JrIHdpdGhvdXQgaXQgKGkuZS4sIFdpbmRv
d3MKPiBndWVzdHMpIG9uIGFmZmVjdGVkIGhhcmR3YXJlLCBhZGQgYW4gZW52aXJvbm1lbnQgdmFy
aWFibGUgd2hpY2ggY2FuIGJlCj4gc2V0IHRvIGRpc2FibGUgdGhlICJGYWtlIEhUIiBtb2RlIG9u
IHN1Y2ggaGFyZHdhcmUuCgpIbW0sIGhvdyBpcyB0aGlzIGdvaW5nIHRvIHdvcmsgd2l0aCBsaWJ2
aXJ0PyBBRkFJSyBsaWJ2aXJ0ZCBydW5uaW5nIGFzCmEgc2luZ2xlIHByb2Nlc3MgaXMgY3JlYXRp
bmcgYWxsIGd1ZXN0cy4gU28gd2l0aCB0aGlzIGFwcHJvYWNoIHlvdSdkCmVpdGhlciBub3QgYmUg
YWJsZSB0byB1c2UgbGlidmlydGQsIG9yIHlvdSdkIGhhdmUgdG8gZGlzYWJsZSAiRmFrZSBIVCIK
Zm9yIGFsbCBndWVzdHMsIHByb2JhYmx5IGJ5IG1vZGlmeWluZyB0aGUgbGlidmlydGQgc2Vydmlj
ZSBkZWZpbml0aW9uLgoKPiBSZXBvcnRlZC1ieTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlk
LmF1Pgo+IFJlcG9ydGVkLWJ5OiBBbmRyZWFzIEtpbnpsZXIgPGhmcEBwb3N0ZW8uZGU+Cj4gU2ln
bmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IC0t
LQo+IFRoaXMgaGFzIGJlZW4gY29tcGlsZS10ZXN0ZWQgb25seTsgSSdtIHBvc3RpbmcgaXQgZWFy
bHkgdG8gZ2V0Cj4gZmVlZGJhY2sgb24gdGhlIGFwcHJvYWNoLgo+IAo+IFRPRE86IFByZXZlbnQg
c3VjaCBndWVzdHMgZnJvbSBiZWluZyBtaWdyYXRlZAo+IAo+IE9wZW4gcXVlc3Rpb25zOgo+IAo+
IC0gSXMgdGhpcyB0aGUgcmlnaHQgcGxhY2UgdG8gcHV0IHRoZSBgZ2V0ZW52YCBjaGVjaz8KPiAK
PiAtIElzIHRoZXJlIGFueSB3YXkgd2UgY2FuIG1ha2UgbWlncmF0aW9uIHdvcmssIGF0IGxlYXN0
IGluIHNvbWUgY2FzZXM/Cj4gCj4gLSBDYW4gd2UgY2hlY2sgZm9yIGtub3duLXByb2JsZW1hdGlj
IG1vZGVscywgYW5kIGF0IGxlYXN0IHJlcG9ydCBhCj4gICAgbW9yZSB1c2VmdWwgZXJyb3I/CgpD
YW4ndCB3ZSBqdXN0IGRpc2FibGUgIkZha2UgSFQiIGF1dG9tYXRpY2FsbHkgb24gdGhvc2UgbW9k
ZWxzPyBUaGlzCndvdWxkIGF1dG9tYWdpY2FsbHkgbWFrZSBtaWdyYXRpb24gd29yaywgdG9vLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
