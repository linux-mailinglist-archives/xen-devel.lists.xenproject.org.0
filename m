Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096A11E19A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:06:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifhm7-0003ZM-Uc; Fri, 13 Dec 2019 10:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifhm6-0003ZH-CT
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:02:18 +0000
X-Inumbo-ID: 9fe2a9c2-1d8f-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fe2a9c2-1d8f-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 10:02:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81C2FB291;
 Fri, 13 Dec 2019 10:02:08 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>, David Miller <davem@davemloft.net>
References: <20191212135406.26229-1-pdurrant@amazon.com>
 <20191212.110513.1770889236741616001.davem@davemloft.net>
 <cefcf3a4-fc10-d62a-cac9-81f0e47710a8@suse.com>
 <9f6d296e94744ce48d3f72fe4d3fd136@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <39762aba-7c47-6b79-b931-771bc16195a2@suse.com>
Date: Fri, 13 Dec 2019 11:02:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <9f6d296e94744ce48d3f72fe4d3fd136@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTA6MjQsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMTMgRGVjZW1iZXIgMjAxOSAwNTo0MQo+PiBUbzogRGF2aWQgTWlsbGVyIDxkYXZlbUBk
YXZlbWxvZnQubmV0PjsgRHVycmFudCwgUGF1bAo+PiA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgd2VpLmxpdUBrZXJuZWwub3JnOyBs
aW51eC0KPj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIG5ldC1uZXh0XSB4ZW4tbmV0YmFjazog
Z2V0IHJpZCBvZiBvbGQgdWRldgo+PiByZWxhdGVkIGNvZGUKPj4KPj4gT24gMTIuMTIuMTkgMjA6
MDUsIERhdmlkIE1pbGxlciB3cm90ZToKPj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KPj4+IERhdGU6IFRodSwgMTIgRGVjIDIwMTkgMTM6NTQ6MDYgKzAwMDAKPj4+
Cj4+Pj4gSW4gdGhlIHBhc3QgaXQgdXNlZCB0byBiZSB0aGUgY2FzZSB0aGF0IHRoZSBYZW4gdG9v
bHN0YWNrIHJlbGllZCB1cG9uCj4+Pj4gdWRldiB0byBleGVjdXRlIGJhY2tlbmQgaG90cGx1ZyBz
Y3JpcHRzLiBIb3dldmVyIHRoaXMgaGFzIG5vdCBiZWVuIHRoZQo+Pj4+IGNhc2UgZm9yIG1hbnkg
cmVsZWFzZXMgbm93IGFuZCByZW1vdmFsIG9mIHRoZSBhc3NvY2lhdGVkIGNvZGUgaW4KPj4+PiB4
ZW4tbmV0YmFjayBzaG9ydGVucyB0aGUgc291cmNlIGJ5IG1vcmUgdGhhbiAxMDAgbGluZXMsIGFu
ZCByZW1vdmVzCj4+IG11Y2gKPj4+PiBjb21wbGV4aXR5IGluIHRoZSBpbnRlcmFjdGlvbiB3aXRo
IHRoZSB4ZW5zdG9yZSBiYWNrZW5kIHN0YXRlLgo+Pj4+Cj4+Pj4gTk9URTogeGVuLW5ldGJhY2sg
aXMgdGhlIG9ubHkgeGVuYnVzIGRyaXZlciB0byBoYXZlIGEgZnVuY3Rpb25hbAo+PiB1ZXZlbnQo
KQo+Pj4+ICAgICAgICAgbWV0aG9kLiBUaGUgb25seSBvdGhlciBkcml2ZXIgdG8gaGF2ZSBhIG1l
dGhvZCBhdCBhbGwgaXMKPj4+PiAgICAgICAgIHB2Y2FsbHMtYmFjaywgYW5kIGN1cnJlbnRseSBw
dmNhbGxzX2JhY2tfdWV2ZW50KCkgc2ltcGx5IHJldHVybnMKPj4gMC4KPj4+PiAgICAgICAgIEhl
bmNlIHRoaXMgcGF0Y2ggYWxzbyBmYWNpbGl0YXRlcyBmdXJ0aGVyIGNsZWFudXAuCj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+Pgo+
Pj4gSWYgdXNlcnNwYWNlIGV2ZXIgdXNlZCB0aGlzIHN0dWZmLCBJIHNlcmlvdXNseSBkb3VidCB5
b3UgY2FuIHJlbW92ZSB0aGlzCj4+PiBldmVuIGlmIGl0IGhhc24ndCBiZWVuIHVzZWQgaW4gNSsg
eWVhcnMuCj4+Cj4+IEhtbSwgZGVwZW5kcy4KPj4KPj4gVGhpcyBoYXMgYmVlbiB1c2VkIGJ5IFhl
biB0b29scyBpbiBkb20wIG9ubHkuIElmIHRoZSBsYXN0IHVzYWdlIGhhcyBiZWVuCj4+IGluIGEg
WGVuIHZlcnNpb24gd2hpY2ggaXMgbm8gbG9uZ2VyIGFibGUgdG8gcnVuIHdpdGggY3VycmVudCBM
aW51eCBpbgo+PiBkb20wIGl0IGNvdWxkIGJlIHJlbW92ZWQuIEJ1dCBJIGd1ZXNzIHRoaXMgd291
bGQgaGF2ZSB0byBiZSBhIHJhdGhlciBvbGQKPj4gdmVyc2lvbiBvZiBYZW4gKGxpa2UgMy54Pyku
Cj4+Cj4+IFBhdWwsIGNhbiB5b3UgZ2l2ZSBhIGhpbnQgc2luY2Ugd2hpY2ggWGVuIHZlcnNpb24g
dGhlIHRvb2xzdGFjayBubwo+PiBsb25nZXIgcmVsaWVzIG9uIHVkZXYgdG8gc3RhcnQgdGhlIGhv
dHBsdWcgc2NyaXB0cz8KPj4KPiAKPiBUaGUgdWRldiBydWxlcyB3ZXJlIGluIGEgZmlsZSBjYWxs
ZWQgdG9vbHMvaG90cGx1Zy9MaW51eC94ZW4tYmFja2VuZC5ydWxlcyAoaW4geGVuLmdpdCksIGFu
ZCBhIGNvbW1pdCBmcm9tIFJvZ2VyIHJlbW92ZWQgdGhlIE5JQyBydWxlcyBpbiAyMDEyOgo+IAo+
IGNvbW1pdCA1N2FkNmFmZTJhMDhhMDNjNDBiY2QzMzZiZmIyN2UwMDhlMWQzZTUzCgpYZW4gNC4y
Cgo+IFRoZSBsYXN0IGNvbW1pdCBJIGNvdWxkIGZpbmQgdG8gdGhhdCBmaWxlIG1vZGlmaWVkIGl0
cyBuYW1lIHRvIHhlbi1iYWNrZW5kLnJ1bGVzLmluLCBhbmQgdGhpcyB3YXMgZmluYWxseSByZW1v
dmVkIGJ5IEdlb3JnZSBpbiAyMDE1Ogo+IAo+IGNvbW1pdCAyYmEzNjhkMTM4OTM0MDJiMmYxZmIz
YzI4M2RkY2M3MTQ2NTlkZDliCgpYZW4gNC42Cgo+IFNvLCBJIHRoaW5rIHRoaXMgbWVhbnMgYW55
b25lIHVzaW5nIGEgdmVyc2lvbiBvZiB0aGUgWGVuIHRvb2xzIHdpdGhpbiByZWNlbnQgbWVtb3J5
IHdpbGwgYmUgaGF2aW5nIHRoZWlyIGhvdHBsdWcgc2NyaXB0cyBjYWxsZWQgZGlyZWN0bHkgYnkg
bGlieGwgKGFuZCBoYXZpbmcgdWRldiBydWxlcyBwcmVzZW50IHdvdWxkIGFjdHVhbGx5IGJlIGNv
dW50ZXItcHJvZHVjdGl2ZSwgYXMgR2VvcmdlJ3MgY29tbWl0IHN0YXRlcyBhbmQgYXMgSSBkaXNj
b3ZlcmVkIHRoZSBoYXJkIHdheSB3aGVuIHRoZSBjaGFuZ2Ugd2FzIG9yaWdpbmFsbHkgbWFkZSku
CgpUaGUgcHJvYmxlbSBhcmUgc3lzdGVtcyB3aXRoIGVpdGhlciBvbGQgWGVuIHZlcnNpb25zIChi
ZWZvcmUgWGVuIDQuMikgb3IKd2l0aCBvdGhlciB0b29sc3RhY2tzIChlLmcuIFhlbiA0LjQgd2l0
aCB4ZW5kKSB3aGljaCB3YW50IHRvIHVzZSBhIG5ldwpkb20wIGtlcm5lbC4KCkFuZCBJJ20gbm90
IHN1cmUgdGhlcmUgYXJlbid0IHN1Y2ggc3lzdGVtcyAoZXNwZWNpYWxseSBpbiBjYXNlIHNvbWVv
bmUKd2FudHMgdG8gc3RpY2sgd2l0aCB4ZW5kKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
