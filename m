Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A607B65F47
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 20:02:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hldKc-00055a-EV; Thu, 11 Jul 2019 17:58:10 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.45])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hldKb-00055V-1t
 for xen-devel@lists.xensource.com; Thu, 11 Jul 2019 17:58:09 +0000
Received: from [85.158.142.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id C7/0D-10422-FA8772D5;
 Thu, 11 Jul 2019 17:58:07 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-22.tower-225.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsWyw31vlO76CvV
 Yg+kdTBb3prxnd2D02N63iz2AMYo1My8pvyKBNePUraWsBV8lKv5cXsnawPhUuIuRk4NXwE+i
 oeEZE4jNKJAlcX5JLxuILSzgKHFj+0dGEJtNwEii6eAHli5GLg4RgSWMEg0v5rCDOMwCT5kk3
 rTtYwWpYhFQlVjZeZkZxOYUsJN4//QBM0iRkEAHs0TP/2tgo/gFZCR2vOwDW8EsoCnRuv03O4
 gtKqArMe9wGyvESYISJ2c+YYGokZfY/nYO8wRGvllIWmYhKZuFpGwBI/MqRsukosz0jJLcxMw
 cXUMDA11DQ2NdY10jIyO9xCrdRL3UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYFCmFDLf
 28F4YeYbvUOMkhxMSqK8k/nUY4X4kvJTKjMSizPii0pzUosPMcpwcChJ8J4vB8oJFqWmp1akZ
 eYAIwQmLcHBoyTCKwOMEiHe4oLE3OLMdIjUKUZdjsvX5y1iFmLJy89LlRLn9QQpEgApyijNgx
 sBi9ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5WUAu4cnMK4Hb9AroCCagI1T91ECOKEl
 ESEk1MDlm+eteFf26o+JiReDl5Wb9uXXaMoybLhybPCn9V3BzZZPwDSVV/8JP/g9i0n3+7/Z7
 mXD+Z9Tbvwc9Fxi8D3iROLvb1jPi6Zwd0h8/HjPltwjq/Mx4VSBGPfyzy2ufLy2J7O8/SDUFn
 39Sxu0WaNpVY9Q0z3LeKrHlC7uOPHM76WAZ2XxWuePmiSW7XMz2bkn9amMUX11uGDK3V7sg+O
 Krn1e9JkyVKv6lvqZZvPRBZ/6pqe9eX5xsf+qfn8WCDX89w0UyBMzLixonZVbNMpQLqVq+aa1
 UuehmzdwEvnOT5XxTFzV9TLriEvk7vYXBeFORRJrxvlJl2ZgVdTpHc63SHHI5zjaVG06+y56t
 xFKckWioxVxUnAgA8QgRX1EDAAA=
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-22.tower-225.messagelabs.com!1562867885!497597!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29063 invoked from network); 11 Jul 2019 17:58:06 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-22.tower-225.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jul 2019 17:58:06 -0000
Message-ID: <1762aadf92b784edc79cb6ad4d9f0f243b1b8847.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, For testing and quality assurance of
 Fedora releases <test@lists.fedoraproject.org>, Lars Kurth
 <lars.kurth.xen@gmail.com>
Date: Thu, 11 Jul 2019 10:58:03 -0700
In-Reply-To: <e0145933-8563-8a45-40a6-7f192c7b9d80@cardoe.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <e0145933-8563-8a45-40a6-7f192c7b9d80@cardoe.com>
Organization: Fedora Project
User-Agent: Evolution 3.33.3 (3.33.3-2.fc31) 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA3LTExIGF0IDA5OjU3IC0wNTAwLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToK
PiBPbiA3LzgvMTkgMTE6MTEgQU0sIEFkYW0gV2lsbGlhbXNvbiB3cm90ZToKPiA+IE9uIFR1ZSwg
MjAxOS0wNS0yMSBhdCAxMToxNCAtMDcwMCwgQWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+ID4gPiA+
ID4gPiA+ICJUaGUgcmVsZWFzZSBtdXN0IGJvb3Qgc3VjY2Vzc2Z1bGx5IGFzIFhlbiBEb21VIHdp
dGggcmVsZWFzZXMgcHJvdmlkaW5nCj4gPiA+ID4gPiA+ID4gYSBmdW5jdGlvbmFsLCBzdXBwb3J0
ZWQgWGVuIERvbTAgYW5kIHdpZGVseSB1c2VkIGNsb3VkIHByb3ZpZGVycwo+ID4gPiA+ID4gPiA+
IHV0aWxpemluZyBYZW4uIgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGFuZCBjaGFuZ2Ug
dGhlICdtaWxlc3RvbmUnIGZvciB0aGUgdGVzdCBjYXNlIC0KPiA+ID4gPiA+ID4gPiBodHRwczov
L2ZlZG9yYXByb2plY3Qub3JnL3dpa2kvUUE6VGVzdGNhc2VfQm9vdF9NZXRob2RzX1hlbl9QYXJh
X1ZpcnQgLQo+ID4gPiA+ID4gPiA+IGZyb20gRmluYWwgdG8gT3B0aW9uYWwuCj4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gVGhvdWdodHM/IENvbW1lbnRzPyBUaGFua3MhCj4gPiA+ID4gPiA+
IEkgd291bGQgcHJlZmVyIGZvciBpdCB0byByZW1haW4gYXMgaXQgaXMuCj4gPiA+ID4gPiBUaGlz
IGlzIG9ubHkgcHJhY3RpY2FsIGlmIGl0J3MgZ29pbmcgdG8gYmUgdGVzdGVkLCBhbmQgdGVzdGVk
IHJlZ3VsYXJseQo+ID4gPiA+ID4gLSBub3QgKm9ubHkqIG9uIHRoZSBmaW5hbCByZWxlYXNlIGNh
bmRpZGF0ZSwgcmlnaHQgYmVmb3JlIHdlIHNpZ24gb2ZmCj4gPiA+ID4gPiBvbiB0aGUgcmVsZWFz
ZS4gSXQgbmVlZHMgdG8gYmUgdGVzdGVkIHJlZ3VsYXJseSB0aHJvdWdob3V0IHRoZSByZWxlYXNl
Cj4gPiA+ID4gPiBjeWNsZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJlICJub21pbmF0ZWQgZm9y
IHRlc3RpbmciLgo+ID4gPiA+IFdvdWxkIHRoZSBwcm9wb3NhbCBhYm92ZSB3b3JrIGZvciB5b3U/
IEkgdGhpbmsgaXQgc2F0aXNmaWVzIHdoYXQgeW91IGFyZQo+ID4gPiA+IGxvb2tpbmcgZm9yLiBX
ZSB3b3VsZCBhbHNvIGhhdmUgc29tZW9uZSB3aG8gbW9uaXRvcnMgdGhlc2UgdGVzdCByZXN1bHRz
Cj4gPiA+ID4gcHJvLWFjdGl2ZWx5Lgo+ID4gPiBJbiB0aGVvcnksIHllYWgsIGJ1dCBnaXZlbiB0
aGUgaGlzdG9yeSBoZXJlIEknbSBzb21ld2hhdCBzY2VwdGljYWwuIEknZAo+ID4gPiBhbHNvIHNh
eSB3ZSBzdGlsbCBoYXZlbid0IHJlYWxseSBnb3QgYSBjb252aW5jaW5nIGNhc2UgZm9yIHdoeSB3
ZQo+ID4gPiBzaG91bGQgY29udGludWUgdG8gYmxvY2sgdGhlIHJlbGVhc2UgKGF0IGxlYXN0IGlu
IHRoZW9yeSkgb24gRmVkb3JhCj4gPiA+IHdvcmtpbmcgaW4gWGVuIHdoZW4gd2UgZG9uJ3QgYmxv
Y2sgb24gYW55IG90aGVyIHZpcnQgc3RhY2sgYXBhcnQgZnJvbQo+ID4gPiBvdXIgJ29mZmljaWFs
JyBvbmUsIGFuZCB3ZSBkb24ndCBibG9jayBvbiBhbGwgc29ydHMgb2Ygb3RoZXIgc3R1ZmYgd2Un
ZAo+ID4gPiAibGlrZSB0byBoYXZlIHdvcmtpbmciIGVpdGhlci4gUmVnYXJkbGVzcyBvZiB0aGUg
dGVzdGluZyBpc3N1ZXMsIEknZAo+ID4gPiBsaWtlIHRvIHNlZSB0aGF0IHRvbyBpZiB3ZSdyZSBn
b2luZyB0byBrZWVwIGJsb2NraW5nIG9uIFhlbi4uLgo+ID4gU28sIHRoaXMgZGllZCBoZXJlLiBB
cyB0aGluZ3Mgc3RhbmQ6IEkgcHJvcG9zZWQgcmVtb3ZpbmcgdGhlIFhlbgo+ID4gY3JpdGVyaW9u
LCBMYXJzIG9wcG9zZWQsIHdlIGRpc2N1c3NlZCB0aGUgdGVzdGluZyBzaXR1YXRpb24gYSBiaXQs
IGFuZAo+ID4gSSBzYWlkIG92ZXJhbGwgSSdtIHN0aWxsIGluY2xpbmVkIHRvIHJlbW92ZSB0aGUg
Y3JpdGVyaW9uIGJlY2F1c2UKPiA+IHRoZXJlJ3Mgbm8gY2xlYXIganVzdGlmaWNhdGlvbiBmb3Ig
aXQgZm9yIEZlZG9yYSBhbnkgbW9yZS4gWGVuIHdvcmtpbmcKPiA+IChvciByYXRoZXIsIEZlZG9y
YSB3b3JraW5nIG9uIFhlbikgaXMganVzdCBub3QgYSBrZXkgcmVxdWlyZW1lbnQgZm9yCj4gPiBG
ZWRvcmEgYXQgcHJlc2VudCwgQUZBSUNTLgo+ID4gCj4gPiBJdCdzIHdvcnRoIG5vdGluZyB0aGF0
IGF0IGxlYXN0IHBhcnQgb2YgdGhlIGp1c3RpZmljYXRpb24gZm9yIHRoZQo+ID4gY3JpdGVyaW9u
IGluIHRoZSBmaXJzdCBwbGFjZSB3YXMgdGhhdCBBbWF6b24gd2FzIHVzaW5nIFhlbiBmb3IgRUMy
LCBidXQKPiA+IHRoYXQgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlLCBtb3N0IGlmIG5vdCBhbGwgRUMy
IGluc3RhbmNlIHR5cGVzIG5vCj4gPiBsb25nZXIgdXNlIFhlbi4gQW5vdGhlciBjb25zaWRlcmF0
aW9uIGlzIHRoYXQgdGhlcmUgd2FzIGEgdGltZSB3aGVuIEtWTQo+ID4gd2FzIHN0aWxsIHByZXR0
eSBuZXcgc3R1ZmYgYW5kIFZpcnR1YWxCb3ggd2FzIG5vdCBhcyBwb3B1bGFyIGFzIGl0IGlzCj4g
PiBub3csIGFuZCBYZW4gd2FzIHN0aWxsIHdpZGVseSB1c2VkIGZvciBnZW5lcmFsIGhvYmJ5aXN0
IHZpcnR1YWxpemF0aW9uCj4gPiBwdXJwb3NlczsgSSBkb24ndCBiZWxpZXZlIHRoYXQncyByZWFs
bHkgdGhlIGNhc2UgYW55IG1vcmUuCj4gCj4gU28gSSdsbCBqdXN0IHBvaW50IG91dCB0aGlzIGlz
IGZhbHNlLiBBbWF6b24gdmVyeSBtdWNoIHVzZXMgWGVuIHN0aWxsIAo+IGFuZCBpcyBpbnZlc3Rp
bmcgaW4gWGVuIHN0aWxsLiBJbiBmYWN0IEknbSB3cml0aW5nIHRoaXMgZW1haWwgZnJvbSB0aGUg
Cj4gWGVuU3VtbWl0IHdoZXJlIEFtYXpvbiBpcyBjdXJyZW50bHkgZGlzY3Vzc2luZyB0aGVpciBm
dXR1cmUgZGV2ZWxvcG1lbnQgCj4gZWZmb3J0cyBmb3IgdGhlIFhlbiBQcm9qZWN0LgoKU29ycnkg
YWJvdXQgdGhhdCwgaXQgd2FzIGp1c3QgYmFzZWQgb24gbXkgYmVzdCBlZmZvcnRzIGF0IHRyeWlu
ZyB0bwpmaWd1cmUgaXQgb3V0OyBBbWF6b24gaW5zdGFuY2UgdHlwZXMgZG9uJ3QgYWxsIGV4cGxp
Y2l0bHkgc3RhdGUgZXhhY3RseQpob3cgdGhleSB3b3JrLgoKV2hpY2ggRUMyIGluc3RhbmNlIHR5
cGVzIHN0aWxsIHVzZSBYZW4/Ci0tIApBZGFtIFdpbGxpYW1zb24KRmVkb3JhIFFBIENvbW11bml0
eSBNb25rZXkKSVJDOiBhZGFtdyB8IFR3aXR0ZXI6IEFkYW1XX0ZlZG9yYSB8IFhNUFA6IGFkYW13
IEFUIGhhcHB5YXNzYXNzaW4gLiBuZXQKaHR0cDovL3d3dy5oYXBweWFzc2Fzc2luLm5ldAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
