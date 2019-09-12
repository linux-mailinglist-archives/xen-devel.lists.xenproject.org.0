Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41DB10D1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Pqo-0002TI-7r; Thu, 12 Sep 2019 14:13:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8Pqm-0002TD-Q0
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:13:32 +0000
X-Inumbo-ID: 7f718e80-d567-11e9-959a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f718e80-d567-11e9-959a-12813bfff9fa;
 Thu, 12 Sep 2019 14:13:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D23AAFA8;
 Thu, 12 Sep 2019 14:13:30 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190912140504.40853-1-paul.durrant@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b14165a4-9b70-589c-e8d3-5e48f7cd996b@suse.com>
Date: Thu, 12 Sep 2019 16:13:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912140504.40853-1-paul.durrant@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] public/xen.h: update the comment explaining
 'Wallclock time'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTY6MDUsIFBhdWwgRHVycmFudCB3cm90ZToKPiBTaW5jZSBjb21taXQgMDYy
OWFkZmQ4MGUgIkFjdHVhbGx5IHNldCBhIEhWTSBkb21haW4ncyB0aW1lIG9mZnNldCB3aGVuIGl0
Cj4gc2V0cyB0aGUgUlRDIiwgdGhlIGNvbW1lbnQgaW4gdGhlIHB1YmxpYyBoZWFkZXIgaGFzIGJl
ZW4gbWlzbGVhZGluZywgc2luY2UKPiBpdCBjbGFpbXMgdGhhdCB3YWxsY2xvY2sgdGltZSBpcyBv
bmx5IHVwZGF0ZWQgYnkgY29udHJvbCBzb2Z0d2FyZS4KPiBNb3Jlb3ZlciwgdGhlIGNvbW1lbnRz
IHN0YXRpbmcgdGhhdCB3Y19zZWMgYW5kIHdjX25zZWMgYXJlIHNlY29uZHMgYW5kCj4gbmFub3Nl
Y29uZHMgKHJlc3BlY3RpdmVseSkgaW4gVVRDIHNpbmNlIHRoZSBVbml4IGVwb2NoIGFyZSBib2d1
cy4gVGhlaXIKPiB2YWx1ZXMgYXJlIGFkanVzdGVkIGJ5IHRoZSBkb21haW4ncyB0aW1lX29mZnNl
dF9zZWNvbmRzIHZhbHVlLCB3aGljaCBpcwo+IHVwZGF0ZWQgYnkgYSBndWVzdCB3cml0ZSB0byB0
aGUgZW11bGF0ZWQgUlRDIGFuZCBoZW5jZSB0aGUgd2FsbGNsb2NrCj4gdGltZXpvbmUgaXMgdW5k
ZXIgZ3Vlc3QgY29udHJvbC4KPiAKPiBUaGlzIHBhdGNoIGF0dGVtcHRzIHRvIGJyaW5nIHRoZSBj
b21tZW50IGluIGxpbmUgd2l0aCByZWFsaXR5IHdoaWxzdAo+IGtlZXBpbmcgaXQgcmVhc29uYWJs
eSBzaG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+
Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KPiAtLS0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCB8IDEzICsrKysrKysrKy0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy94ZW4uaAo+IGluZGV4IGNlZjY1YzM4ZTcuLjI3NTVjNWFkNTQgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL3hlbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCj4g
QEAgLTc3NSwxMiArNzc1LDE3IEBAIHN0cnVjdCBzaGFyZWRfaW5mbyB7Cj4gICAgICAgeGVuX3Vs
b25nX3QgZXZ0Y2huX21hc2tbc2l6ZW9mKHhlbl91bG9uZ190KSAqIDhdOwo+ICAgCj4gICAgICAg
LyoKPiAtICAgICAqIFdhbGxjbG9jayB0aW1lOiB1cGRhdGVkIG9ubHkgYnkgY29udHJvbCBzb2Z0
d2FyZS4gR3Vlc3RzIHNob3VsZCBiYXNlCj4gLSAgICAgKiB0aGVpciBnZXR0aW1lb2ZkYXkoKSBz
eXNjYWxsIG9uIHRoaXMgd2FsbGNsb2NrLWJhc2UgdmFsdWUuCj4gKyAgICAgKiBXYWxsY2xvY2sg
dGltZTogdXBkYXRlZCBieSBjb250cm9sIHNvZnR3YXJlIG9yIFJUQyBlbXVsYXRpb24uCj4gKyAg
ICAgKiBHdWVzdHMgc2hvdWxkIGJhc2UgdGhlaXIgZ2V0dGltZW9mZGF5KCkgc3lzY2FsbCBvbiB0
aGlzCj4gKyAgICAgKiB3YWxsY2xvY2stYmFzZSB2YWx1ZS4KPiArICAgICAqIFRoZSB2YWx1cyBv
ZiB3Y19zZWMgYW5kIHdjX25zZWMgYXJlIG9mZnNldHMgZnJvbSB0aGUgVW5peCBlcG9jaAoKcy92
YWx1cy92YWx1ZXMvCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
