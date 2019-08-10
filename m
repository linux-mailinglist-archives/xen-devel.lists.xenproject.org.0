Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AA88BE6
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 17:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwTI5-0006j1-GM; Sat, 10 Aug 2019 15:28:21 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.45])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hwTI4-0006iw-3u
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 15:28:20 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 16/63-19057-292EE4D5;
 Sat, 10 Aug 2019 15:28:18 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-17.tower-264.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsWyw31vlO6ER36
 xBosbDC3uTXnP7sDosb1vF3sAYxRrZl5SfkUCa8bRu1vYCk6JV2z68ou1gbFVuIuRk4NXwE/i
 6Jyn7CA2o0CWxPklvWwgtrCAjcSay3+ZQWw2ASOJpoMfWEBsEQE5iRXz+4BsLg5mgc2MEpOeP
 AZrZhFQldiz+T5rFyMHB6eAi0TvhxSQGiGBLkaJna1zWUFqmAU0JVq3/warFxXQlZjQ85AZ4g
 hBiZMzn7BA1MhLbH87h3kCI+8sJC2zkJTNQlK2gJF5FaN5UlFmekZJbmJmjq6hgYGuoaGRrqG
 lqa65gV5ilW6iXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYNClFBx228E4b9YbvUOMkhxM
 SqK82//6xgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4GV86BcrJFiUmp5akZaZA4wAmLQEB4+SC
 O/dB0Bp3uKCxNzizHSI1ClGRSlxXgWQPgGQREZpHlwbLOouMcpKCfMyMjAwCPEUpBblZpagyr
 9iFOdgVBLmXQQyhSczrwRu+iugxUxAi7mf+IIsLklESEk1MPn2rfUTnSa6LH95xfZXTU2LNr1
 pnZhb3Hx/7j/+iXVVGip/lnR93pV8SC2k+oCix05n+RcPDX77ZE+adnWfadDqc2duvTX20Kmd
 +MSx89xZHwl5HQGfhOiNZ/zX3H3Hk7Ww9wrTbbYVpZqzuk0WbuGJcPCY+z9V/XKmM7eJesG7j
 5tOX7muvPCHVAuP4w1hth2cxxLt+v9MDFybdOhlmDNLqPIbK9bqteLCN2POtmeI2k160lfxuD
 Y+rP9UdbTGFd97Z5IvRZvEMKv1BsyO2uXPVzm/8meA4M6dcQ4xq4OkFsQ3Smxgvsa7vvBV7cb
 VkzN0zS2znav0/BmNF+os6XgdNOF8nwqHQZdtX+IaJZbijERDLeai4kQAgKlPLDUDAAA=
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-17.tower-264.messagelabs.com!1565450894!486642!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10844 invoked from network); 10 Aug 2019 15:28:16 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-17.tower-264.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Aug 2019 15:28:16 -0000
Message-ID: <649ecd21246e958320bd217fe846d0424b8c2801.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: Matt Wilson <msw@amzn.com>
Date: Sat, 10 Aug 2019 08:28:10 -0700
In-Reply-To: <20190810140135.GA22251@udb72c6a76a7559.ant.amazon.com>
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
 <20190810140135.GA22251@udb72c6a76a7559.ant.amazon.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen / EC2 release criteria proposal
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
Cc: devel@lists.fedoraproject.org,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 coreos@lists.fedoraproject.org, test@lists.fedoraproject.org,
 xen-devel@lists.xensource.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAyMDE5LTA4LTEwIGF0IDE3OjAxICswMzAwLCBNYXR0IFdpbHNvbiB3cm90ZToKPiBP
biBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwNTo1NjoxMVBNIC0wNzAwLCBBZGFtIFdpbGxpYW1zb24g
d3JvdGU6Cj4gWy4uLl0KPiA+IFNvIGl0IHNlZW1zIGxpa2UgdGhpcyB3b3VsZCBhbHNvIGJlIGEg
Z29vZCBvcHBvcnR1bml0eSB0byByZXZpc2l0IGFuZAo+ID4gbmFpbCBkb3duIG1vcmUgc3BlY2lm
aWNhbGx5IGV4YWN0bHkgd2hhdCBvdXIgY2xvdWQgcmVxdWlyZW1lbnRzIGFyZS4KPiA+IGJjb3R0
b24gc3VnZ2VzdGVkICB0aGF0IHdlIHJlcXVpcmUgdHdvIHNhbXBsZSBpbnN0YW5jZSB0eXBlcyB0
byBiZQo+ID4gdGVzdGVkLCBjNS5sYXJnZSAoS1ZNKSBhbmQgdDMubGFyZ2UgKFhlbikuIChJJ3Zl
IGFsc28gbWFpbGVkIFRob21hcwo+ID4gQ2FtZXJvbiwgZXgtb2YgUmVkIEhhdCwgbm93IG9mIEFt
YXpvbiwgZm9yIGhpcyBvcGluaW9uLCBhcyBpdCBzZWVtZWQKPiA+IGxpa2UgaXQgbWlnaHQgYmUg
d29ydGh3aGlsZSAtIGhlJ3MgcHJvbWlzZWQgdG8gZ2V0IGJhY2sgdG8gbWUpLgo+ID4gCj4gPiBT
bywgZm9yIG5vdywgbGV0IG1lIHByb3Bvc2UgdGhpcyBhcyBhIHRyaWFsIGJhbGxvb246IHdlIHJl
d3JpdGUgdGhlCj4gPiBhYm92ZSBjcml0ZXJpb24gdG8gc2F5Ogo+ID4gCj4gPiAiUmVsZWFzZS1i
bG9ja2luZyBjbG91ZCBkaXNrIGltYWdlcyBtdXN0IGJlIHB1Ymxpc2hlZCB0byBBbWF6b24gRUMy
IGFzCj4gPiBBTUlzLCBhbmQgdGhlc2UgbXVzdCBib290IHN1Y2Nlc3NmdWxseSBhbmQgbWVldCBv
dGhlciByZWxldmFudCByZWxlYXNlCj4gPiBjcml0ZXJpYSBvbiBjNS5sYXJnZSBhbmQgdDMubGFy
Z2UgaW5zdGFuY2UgdHlwZXMuIgo+IAo+IEhpIEFkYW0sCj4gCj4gVGhhbmtzIGZvciBicmluZ2lu
ZyB0aGlzIHVwLiBJdCdzIGdvb2QgdG8gcmV2aXNpdCB0aGluZ3MgZnJvbSB0aW1lIHRvCj4gdGlt
ZSBhcyB0aGUgd29ybGQgY2hhbmdlcy4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBNYXR0IQoK
PiBPZiB0aGUgdHdvIGluc3RhbmNlcyB0aGF0IHlvdSBwcm9wb3NlLCBuZWl0aGVyIHJ1bnMgb24g
WGVuLiBUaGUgVDIKPiBpbnN0YW5jZXMgcnVuIG9uIFhlbiwgYnV0IFQzIHVzZXMgdGhlIEtWTS1i
YXNlZCBOaXRybyBoeXBlcnZpc29yLgoKVGhhdCdsbCB0ZWFjaCBtZSB0byB0cnVzdCBCZW4uLi47
KQoKPiBUbyBlbnN1cmUgdGhhdCBhIExpbnV4IGJhc2VkIEFNSSBmdW5jdGlvbnMgYWNyb3NzIGFs
bCBvZiB0aGUgZGV2aWNlcwo+IGFuZCBvcGVyYXRpbmcgbW9kZXMgb2YgRUMyLCB5b3UgbmVlZCB0
byBjb3ZlcjoKPiAKPiB4ODYgcGxhdGZvcm1zCj4gLS0tLS0tLS0tLS0tLQo+ICogWGVuIGRvbVUg
d2l0aCBvbmx5IFBWIGludGVyZmFjZXMgKGUuZy4sIE0zIGluc3RhbmNlcykKPiAqIFhlbiBkb21V
IHdpdGggSW50ZWwgODI1OTkgdmlydHVhbCBmdW5jdGlvbnMgZm9yIEVuaGFuY2VkIE5ldHdvcmtp
bmcKPiAgIChlLmcuLCBDMyBpbnN0YW5jZXMgcnVubmluZyBpbiBhIFZQQykKPiAqIFhlbiBkb21V
IHdpdGggRW5oYW5jZWQgTmV0d29ya2luZyBBZGFwdGVyIChlLmcuLCBSNCBpbnN0YW5jZXMpCj4g
KiBYZW4gZG9tVSB3aXRoIE5WTWUgbG9jYWwgaW5zdGFuY2Ugc3RvcmFnZSAoZS5nLiwgdmlydHVh
bGl6ZWQgSTMKPiAgIGluc3RhbmNlcykKPiAqIFhlbiBkb21VIHdpdGggbW9yZSB0aGFuIDMyIHZD
UFVzIChlLmcuLCBjNC44eGxhcmdlKQo+ICogWGVuIGRvbVUgd2l0aCBmb3VyIE5VTUEgbm9kZXMg
KGUuZy4sIHgxLjMyeGxhcmdlKQo+ICogWGVuIGRvbVUgd2l0aCBtYXhpbXVtIFJBTSBhdmFpbGFi
bGUgaW4gRUMyICh4MWUuMzJ4bGFyZ2UpCj4gKiBLVk0gZ3Vlc3Qgd2l0aCBjb25zaXN0ZW50IHBl
cmZvcm1hbmNlIChlLmcuLCBjNS5sYXJnZSkKPiAqIEtWTSBndWVzdCB3aXRoIGJ1cnN0YWJsZSBw
ZXJmb3JtYW5jZSAoZS5nLiwgdDMubGFyZ2UpCj4gKiBLVk0gZ3Vlc3Qgd2l0aCBsb2NhbCBOVk1l
IHN0b3JhZ2UgKGUuZy4sIGM1ZC5sYXJnZSkKPiAqIEtWTSBndWVzdCB3aXRoIDEwMCBHYnBzIG5l
dHdvcmtpbmcgYW5kIEVsYXN0aWMgRmFicmljIEFkYXB0ZXIKPiAgIChjNW4uMTh4bGFyZ2UpCj4g
KiBLVk0gZ3Vlc3Qgb24gQU1EIHByb2Nlc3NvcnMgKGUuZy4sIG01YS5sYXJnZSkKPiAqIEtWTSBn
dWVzdCBvbiBBTUQgcHJvY2Vzc29ycyB3aXRoIG1heGltdW0gTlVNQSBub2RlcyAoZS5nLiwKPiAg
IG01YS4yNHhsYXJnZSkKPiAqIEJhcmUgbWV0YWwgQnJvYWR3ZWxsIChpMy5tZXRhbCkKPiAqIEJh
cmUgbWV0YWwgU2t5bGFrZSAobTUubWV0YWwpCj4gKiBCYXJlIG1ldGFsIENhc2NhZGUgTGFrZSAo
YzUubWV0YWwpCj4gCj4gQXJtIHBsYXRmb3Jtcwo+IC0tLS0tLS0tLS0tLS0KPiAqIEtWTSBndWVz
dCBvbiBBcm0gd2l0aCAxIENQVSBjbHVzdGVyIChhMS54bGFyZ2UpCj4gKiBLVk0gZ3Vlc3Qgb24g
QXJtIHdpdGggMiBDUFUgY2x1c3RlcnMgKGExLjJ4bGFyZ2UpCj4gKiBLVk0gZ3Vlc3Qgb24gQXJt
IHdpdGggNCBDUFUgY2x1c3RlcnMgKGExLjR4bGFyZ2UpCj4gCj4gTm90IGFsbCBvZiB0aGVzZSBh
cmUgZ29pbmcgdG8gY2F1c2UgYW4gaW1hZ2UgdG8gZmFpbCB0byBib290IHVwIHRvIHRoZQo+IHBv
aW50IHdoZXJlIGEgY3VzdG9tZXIgY2FuIFNTSCBpbi4gQnV0IGEgZ29vZCBudW1iZXIgb2YgdGhl
c2UgaGF2ZQo+IGNhdXNlZCBlYXJseSBib290IHByb2JsZW1zIGluIHRoZSBwYXN0IChlLmcuLCA+
MzIgdkNQVXMgb24gUFZIVk0gWGVuKS4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIGxpc3QsIGl0J3Mg
dmVyeSBoZWxwZnVsLiBJdCdzIGFsc28gdmVyeSBsb25nLAp0aG91Z2guIDpQIFN0aWxsLCB3ZSBj
YW4gY2VydGFpbmx5IHVzZSBpdCBhcyBhIGJhc2UuCi0tIApBZGFtIFdpbGxpYW1zb24KRmVkb3Jh
IFFBIENvbW11bml0eSBNb25rZXkKSVJDOiBhZGFtdyB8IFR3aXR0ZXI6IEFkYW1XX0ZlZG9yYSB8
IGlkZW50aS5jYTogYWRhbXdmZWRvcmEKaHR0cDovL3d3dy5oYXBweWFzc2Fzc2luLm5ldAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
