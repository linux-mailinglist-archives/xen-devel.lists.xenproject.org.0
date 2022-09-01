Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2C5A8E03
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 08:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396216.636280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTdQ7-0003GW-PD; Thu, 01 Sep 2022 06:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396216.636280; Thu, 01 Sep 2022 06:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTdQ7-0003EU-M4; Thu, 01 Sep 2022 06:11:19 +0000
Received: by outflank-mailman (input) for mailman id 396216;
 Thu, 01 Sep 2022 06:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oTdQ5-0003EO-Nl
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 06:11:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ec7e6b-29bc-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 08:11:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 85EDA2220C;
 Thu,  1 Sep 2022 06:11:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CBB813316;
 Thu,  1 Sep 2022 06:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8pIuDQNNEGOzFgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Sep 2022 06:11:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e1ec7e6b-29bc-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662012675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VwjjEEWAmElauXQdmYGb6IgD2uIj2ZCJy8zgBooVDS0=;
	b=BLuvu2/+KDFypumEfAm+6++gOqXyzbDQLToURHouElPTocYbazdQZKpnRQt+UI1e9zIcTZ
	kgZJ0fw/8aI2hwOBXgp1N3g35nZcjCv6uIhhpy7OiVuffLAKw6T5c9xOqUAgluyV0bFRvt
	U+8DaXUTQupfLDonBLPIvlcE9Z1QS6Q=
Message-ID: <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
Date: Thu, 1 Sep 2022 08:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
 <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
In-Reply-To: <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iD8FTriwzHoF0WFS9Mgi5KHi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iD8FTriwzHoF0WFS9Mgi5KHi
Content-Type: multipart/mixed; boundary="------------YWTmxJ1cljQfebUQjAm5lWlk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
 <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
In-Reply-To: <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>

--------------YWTmxJ1cljQfebUQjAm5lWlk
Content-Type: multipart/mixed; boundary="------------nKkNO7wJwbBBjIG6dh3OuPqV"

--------------nKkNO7wJwbBBjIG6dh3OuPqV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjIgMDA6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE2LzA4LzIw
MjIgMTE6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBDcHUgY3B1IHVucGx1Z2dpbmcg
aXMgY2FsbGluZyBzY2hlZHVsZV9jcHVfcm0oKSB2aWEgc3RvcF9tYWNoaW5lX3J1bigpDQo+
IA0KPiBDcHUgY3B1Lg0KPiANCj4+IHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwgdGh1cyBh
bnkgbWVtb3J5IGFsbG9jYXRpb24gb3IgZnJlZWluZyBtdXN0DQo+PiBiZSBhdm9pZGVkLg0K
Pj4NCj4+IFNpbmNlIGNvbW1pdCA1MDQ3Y2QxZDVkZWEgKCJ4ZW4vY29tbW9uOiBVc2UgZW5o
YW5jZWQNCj4+IEFTU0VSVF9BTExPQ19DT05URVhUIGluIHhtYWxsb2MoKSIpIHRoaXMgcmVz
dHJpY3Rpb24gaXMgYmVpbmcgZW5mb3JjZWQNCj4+IHZpYSBhbiBhc3NlcnRpb24sIHdoaWNo
IHdpbGwgbm93IGZhaWwuDQo+Pg0KPj4gQmVmb3JlIHRoYXQgY29tbWl0IGNwdSB1bnBsdWdn
aW5nIGluIG5vcm1hbCBjb25maWd1cmF0aW9ucyB3YXMgd29ya2luZw0KPj4ganVzdCBieSBj
aGFuY2UgYXMgb25seSB0aGUgY3B1IHBlcmZvcm1pbmcgc2NoZWR1bGVfY3B1X3JtKCkgd2Fz
IGRvaW5nDQo+PiBhY3RpdmUgd29yay4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgZW5hYmxlZCwg
aG93ZXZlciwgZmFpbHVyZXMgY291bGQNCj4+IHJlc3VsdCBmcm9tIG1lbW9yeSBhbGxvY2F0
aW9ucyBub3QgYmVpbmcgcHJvcGVybHkgcHJvcGFnYXRlZCB0byBvdGhlcg0KPj4gY3B1cycg
VExCcy4NCj4gDQo+IFRoaXMgaXNuJ3QgYWNjdXJhdGUsIGlzIGl0P8KgIFRoZSBwcm9ibGVt
IHdpdGggaW5pdGlhdGluZyBhIFRMQiBmbHVzaA0KPiB3aXRoIElSUXMgZGlzYWJsZWQgaXMg
dGhhdCB5b3UgY2FuIGRlYWRsb2NrIGFnYWluc3QgYSByZW1vdGUgQ1BVIHdoaWNoDQo+IGlz
IHdhaXRpbmcgZm9yIHlvdSB0byBlbmFibGUgSVJRcyBmaXJzdCB0byB0YWtlIGEgVExCIGZs
dXNoIElQSS4NCg0KQXMgbG9uZyBhcyBvbmx5IG9uZSBjcHUgaXMgdHJ5aW5nIHRvIGFsbG9j
YXRlL2ZyZWUgbWVtb3J5IGR1cmluZyB0aGUNCnN0b3BfbWFjaGluZV9ydW4oKSBhY3Rpb24g
dGhlIGRlYWRsb2NrIHdvbid0IGhhcHBlbi4NCg0KPiBIb3cgZG9lcyBhIG1lbW9yeSBhbGxv
Y2F0aW9uIG91dCBvZiB0aGUgeGVuaGVhcCByZXN1bHQgaW4gYSBUTEIgZmx1c2g/DQo+IEV2
ZW4gd2l0aCBzcGxpdCBoZWFwcywgeW91J3JlIG9ubHkgcG90ZW50aWFsbHkgYWxsb2NhdGlu
ZyBpbnRvIGEgbmV3DQo+IHNsb3Qgd2hpY2ggd2FzIHVudXNlZC4uLg0KDQpZZWFoLCB5b3Ug
YXJlIHJpZ2h0LiBUaGUgbWFpbiBwcm9ibGVtIHdvdWxkIG9jY3VyIG9ubHkgd2hlbiBhIHZp
cnR1YWwNCmFkZHJlc3MgaXMgY2hhbmdlZCB0byBwb2ludCBhdCBhbm90aGVyIHBoeXNpY2Fs
IGFkZHJlc3MsIHdoaWNoIHNob3VsZCBiZQ0KcXVpdGUgdW5saWtlbHkuDQoNCkkgY2FuIGRy
b3AgdGhhdCBwYXJhZ3JhcGgsIGFzIGl0IGRvZXNuJ3QgcmVhbGx5IGhlbHAuDQoNCj4gDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KPj4gaW5kZXggMjI4NDcwYWM0MS4uZmZiMmQ2MjAyYiAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KPj4gQEAgLTMyNjAsNiArMzI2MCwxNyBAQCBzdGF0aWMgc3RydWN0IGNw
dV9ybV9kYXRhICpzY2hlZHVsZV9jcHVfcm1fYWxsb2ModW5zaWduZWQgaW50IGNwdSkNCj4+
ICAgICAgIGlmICggIWRhdGEgKQ0KPj4gICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICANCj4+
ICsgICAgaWYgKCBhZmZfYWxsb2MgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoICF1
cGRhdGVfbm9kZV9hZmZfYWxsb2MoJmRhdGEtPmFmZmluaXR5KSApDQo+IA0KPiBJIHNwZW50
IGFnZXMgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGlzIHdhcyBkb2luZywgYmVmb3Jl
IHJlYWxpc2luZw0KPiB0aGUgcHJvYmxlbSBpcyB0aGUgZnVuY3Rpb24gbmFtZS4NCj4gDQo+
IGFsbG9jIChhcyB3aXRoIGZyZWUpIGlzIHRoZSBjcml0aWNhbCBwaWVjZSBvZiBpbmZvcm1h
dGlvbiBhbmQgbmVlZHMgdG8NCj4gY29tZSBmaXJzdC7CoCBUaGUgZmFjdCB3ZSB0eXBpY2Fs
bHkgcGFzcyB0aGUgcmVzdWx0IHRvDQo+IHVwZGF0ZV9ub2RlX2FmZihpbml0eSkgaXNuJ3Qg
cmVsZXZhbnQsIGFuZCBiZWNvbWVzIGFjdGl2ZWx5IHdyb25nIGhlcmUNCj4gd2hlbiB3ZSdy
ZSBub3doZXJlIG5lYXIuDQo+IA0KPiBQYXRjaCAxIG5lZWRzIHRvIG5hbWUgdGhlc2UgaGVs
cGVyczoNCj4gDQo+IGJvb2wgYWxsb2NfYWZmaW5pdHlfbWFza3Moc3RydWN0IGFmZmluaXR5
X21hc2tzICphZmZpbml0eSk7DQo+IHZvaWQgZnJlZV9hZmZpbml0eV9tYXNrcyhzdHJ1Y3Qg
YWZmaW5pdHlfbWFza3MgKmFmZmluaXR5KTsNCj4gDQo+IGFuZCB0aGVuIHBhdGNoZXMgMiBh
bmQgMyBiZWNvbWUgZmFyIGVhc2llciB0byBmb2xsb3cuDQo+IA0KPiBTaW1pbGFybHkgaW4g
cGF0Y2ggMiwgdGhlIG5ldyBoZWxwZXJzIG5lZWQgdG8gYmUNCj4ge2FsbG9jLGZyZWV9X2Nw
dV9ybV9kYXRhKCkgdG8gbWFrZSBzZW5zZS7CoCBUaGVzZSBoYXZlIG5vdGhpbmcgdG8gZG8g
d2l0aA0KPiBzY2hlZHVsaW5nLg0KPiANCj4gQWxzbywgeW91IHNob3VsZG4ndCBpbnRyb2R1
Y2UgdGhlIGhlbHBlcnMgc3RhdGljIGluIHBhdGNoIDIgYW5kIHRoZW4NCj4gdHVybiB0aGVt
IG5vbi1zdGF0aWMgaW4gcGF0Y2ggMy7CoCBUaGF0IGp1c3QgYWRkcyB1bm5lY2Vzc2FyeSBj
aHVybiB0bw0KPiB0aGUgY29tcGxpY2F0ZWQgcGF0Y2guDQoNCk9rYXkgdG8gYWxsIG9mIGFi
b3ZlLg0KDQo+IA0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIFhGUkVFKGRhdGEp
Ow0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9
DQo+PiArICAgIGVsc2UNCj4+ICsgICAgICAgIG1lbXNldCgmZGF0YS0+YWZmaW5pdHksIDAs
IHNpemVvZihkYXRhLT5hZmZpbml0eSkpOw0KPiANCj4gSSBob25lc3RseSBkb24ndCB0aGlu
ayBpdCBpcyB3b3J0aCBvcHRpbWlzaW5nIHh6YWxsb2MoKSAtPiB4bWFsbG9jKCkNCj4gZm9y
IHRoZSBjb2duaXRpdmUgY29tcGxleGl0eSBvZiBoYXZpbmcgdGhpcyBsb2dpYyBoZXJlLg0K
DQpJIGRvbid0IG1pbmQgZWl0aGVyIHdheS4gVGhpcyBsb2dpYyBpcyB0aGUgcmVzdWx0IG9m
IG9uZSBvZiBKYW4ncyBjb21tZW50cy4NCg0KPiANCj4+IGRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+PiBp
bmRleCA1OGUwODJlYjRjLi4yNTA2ODYxZTRmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1v
bi9zY2hlZC9jcHVwb29sLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5j
DQo+PiBAQCAtNDExLDIyICs0MTEsMjggQEAgaW50IGNwdXBvb2xfbW92ZV9kb21haW4oc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpDQo+PiAgIH0NCj4+ICAgDQo+PiAg
IC8qIFVwZGF0ZSBhZmZpbml0aWVzIG9mIGFsbCBkb21haW5zIGluIGEgY3B1cG9vbC4gKi8N
Cj4+IC1zdGF0aWMgdm9pZCBjcHVwb29sX3VwZGF0ZV9ub2RlX2FmZmluaXR5KGNvbnN0IHN0
cnVjdCBjcHVwb29sICpjKQ0KPj4gK3N0YXRpYyB2b2lkIGNwdXBvb2xfdXBkYXRlX25vZGVf
YWZmaW5pdHkoY29uc3Qgc3RydWN0IGNwdXBvb2wgKmMsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYWZmaW5pdHlfbWFza3MgKm1hc2tz
KQ0KPj4gICB7DQo+PiAtICAgIHN0cnVjdCBhZmZpbml0eV9tYXNrcyBtYXNrczsNCj4+ICsg
ICAgc3RydWN0IGFmZmluaXR5X21hc2tzIGxvY2FsX21hc2tzOw0KPj4gICAgICAgc3RydWN0
IGRvbWFpbiAqZDsNCj4+ICAgDQo+PiAtICAgIGlmICggIXVwZGF0ZV9ub2RlX2FmZl9hbGxv
YygmbWFza3MpICkNCj4+IC0gICAgICAgIHJldHVybjsNCj4+ICsgICAgaWYgKCAhbWFza3Mg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoICF1cGRhdGVfbm9kZV9hZmZfYWxsb2Mo
JmxvY2FsX21hc2tzKSApDQo+PiArICAgICAgICAgICAgcmV0dXJuOw0KPj4gKyAgICAgICAg
bWFza3MgPSAmbG9jYWxfbWFza3M7DQo+PiArICAgIH0NCj4+ICAgDQo+PiAgICAgICByY3Vf
cmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+PiAgIA0KPj4gICAgICAgZm9yX2Vh
Y2hfZG9tYWluX2luX2NwdXBvb2woZCwgYykNCj4+IC0gICAgICAgIGRvbWFpbl91cGRhdGVf
bm9kZV9hZmYoZCwgJm1hc2tzKTsNCj4+ICsgICAgICAgIGRvbWFpbl91cGRhdGVfbm9kZV9h
ZmYoZCwgbWFza3MpOw0KPj4gICANCj4+ICAgICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlz
dF9yZWFkX2xvY2spOw0KPj4gICANCj4+IC0gICAgdXBkYXRlX25vZGVfYWZmX2ZyZWUoJm1h
c2tzKTsNCj4+ICsgICAgaWYgKCBtYXNrcyA9PSAmbG9jYWxfbWFza3MgKQ0KPj4gKyAgICAg
ICAgdXBkYXRlX25vZGVfYWZmX2ZyZWUobWFza3MpOw0KPj4gICB9DQo+PiAgIA0KPj4gICAv
Kg0KPiANCj4gV2h5IGRvIHdlIG5lZWQgdGhpcyBhdCBhbGw/wqAgZG9tYWluX3VwZGF0ZV9u
b2RlX2FmZigpIGFscmVhZHkga25vd3Mgd2hhdA0KPiB0byBkbyB3aGVuIHBhc3NlZCBOVUxM
LCBzbyB0aGlzIHNlZW1zIGxpa2UgYW4gYXdmdWxseSBjb21wbGljYXRlZCBuby1vcC4NCg0K
WW91IGRvIHJlYWxpemUgdGhhdCB1cGRhdGVfbm9kZV9hZmZfZnJlZSgpIHdpbGwgZG8gc29t
ZXRoaW5nIGluIGNhc2UgbWFza3MNCndhcyBpbml0aWFsbHkgTlVMTD8NCg0KPiANCj4+IEBA
IC0xMDA4LDEwICsxMDE2LDIxIEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgY3B1X2NhbGxiYWNr
KA0KPj4gICB7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcp
aGNwdTsNCj4+ICAgICAgIGludCByYyA9IDA7DQo+PiArICAgIHN0YXRpYyBzdHJ1Y3QgY3B1
X3JtX2RhdGEgKm1lbTsNCj4+ICAgDQo+PiAgICAgICBzd2l0Y2ggKCBhY3Rpb24gKQ0KPj4g
ICAgICAgew0KPj4gICAgICAgY2FzZSBDUFVfRE9XTl9GQUlMRUQ6DQo+PiArICAgICAgICBp
ZiAoIHN5c3RlbV9zdGF0ZSA8PSBTWVNfU1RBVEVfYWN0aXZlICkNCj4+ICsgICAgICAgIHsN
Cj4+ICsgICAgICAgICAgICBpZiAoIG1lbSApDQo+PiArICAgICAgICAgICAgew0KPiANCj4g
U28sIHRoaXMgZG9lcyBjb21waWxlIChhbmQgaW5kZWVkIEkndmUgdGVzdGVkIHRoZSByZXN1
bHQpLCBidXQgSSBjYW4ndA0KPiBzZWUgaG93IGl0IHNob3VsZC4NCj4gDQo+IG1lbSBpcyBn
dWFyYW50ZWVkIHRvIGJlIHVuaW5pdGlhbGlzZWQgYXQgdGhpcyBwb2ludCwgYW5kIC4uLg0K
DQouLi4gaXQgaXMgZGVmaW5lZCBhcyAic3RhdGljIiwgc28gaXQgaXMgY2xlYXJseSBOVUxM
IGluaXRpYWxseS4NCg0KPiANCj4+ICsgICAgICAgICAgICAgICAgc2NoZWR1bGVfY3B1X3Jt
X2ZyZWUobWVtLCBjcHUpOw0KPj4gKyAgICAgICAgICAgICAgICBtZW0gPSBOVUxMOw0KPj4g
KyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICByYyA9IGNwdXBvb2xfY3B1X2FkZChj
cHUpOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiAgICAgICBjYXNl
IENQVV9PTkxJTkU6DQo+PiAgICAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPD0gU1lTX1NU
QVRFX2FjdGl2ZSApDQo+PiAgICAgICAgICAgICAgIHJjID0gY3B1cG9vbF9jcHVfYWRkKGNw
dSk7DQo+PiBAQCAtMTAxOSwxMiArMTAzOCwzMSBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGNw
dV9jYWxsYmFjaygNCj4+ICAgICAgIGNhc2UgQ1BVX0RPV05fUFJFUEFSRToNCj4+ICAgICAg
ICAgICAvKiBTdXNwZW5kL1Jlc3VtZSBkb24ndCBjaGFuZ2UgYXNzaWdubWVudHMgb2YgY3B1
cyB0byBjcHVwb29scy4gKi8NCj4+ICAgICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA8PSBT
WVNfU1RBVEVfYWN0aXZlICkNCj4+ICsgICAgICAgIHsNCj4+ICAgICAgICAgICAgICAgcmMg
PSBjcHVwb29sX2NwdV9yZW1vdmVfcHJvbG9ndWUoY3B1KTsNCj4+ICsgICAgICAgICAgICBp
ZiAoICFyYyApDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICBBU1NF
UlQoIW1lbSk7DQo+IA0KPiAuLi4gaGVyZSwgYW5kIGVhY2ggc3Vic2VxdWVudCBhc3NlcnRp
b24gdG9vLg0KPiANCj4gR2l2ZW4gdGhhdCBJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIGl0IGRv
ZXMgZml4IHRoZSBJUlEgYXNzZXJ0aW9uLCBJIGNhbg0KPiBvbmx5IGltYWdpbmUgdGhhdCBp
dCB3b3JrcyBieSBkZXRlcm1pbmlzdGljYWxseSBmaW5kaW5nIHN0YWNrIHJ1YmJsZQ0KPiB3
aGljaCBoYXBwZW5zIHRvIGJlIDAuDQoNCk5vdCByZWFsbHksIGFzIG1lbSBpc24ndCBvbiB0
aGUgc3RhY2suIDotKQ0KDQoNCkp1ZXJnZW4NCg==
--------------nKkNO7wJwbBBjIG6dh3OuPqV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------nKkNO7wJwbBBjIG6dh3OuPqV--

--------------YWTmxJ1cljQfebUQjAm5lWlk--

--------------iD8FTriwzHoF0WFS9Mgi5KHi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMQTQIFAwAAAAAACgkQsN6d1ii/Ey+l
IAf/f2QOgi6jLDcwLuIFyWAgb0wgX+ZrlMJ/GZow4dOX1n60rf+blnNTbCzKfjHZV6v7n2aGN0l3
qNitUdamy/o6WKgE6toUiw7d0lLlsGfVrjP/KczrAFue9b6Vy5EFpGRQndhOTKf+kPoD2MU7l6ns
HGNqdUMHzcjZQOPmjnjEe2MlD7L58NpqDkPeP4Sc16maf5prdCNhuaDHmXwZdY/DEN/yAb4D/A0T
nkWAGn4nEn94c8N41XA3AURxQAwPcf/HKZOSAa6vsb7JUO/LdiGdLmVp+CoYJ/Fn2tjykMCC3/Iu
NRe8l5Jvwh9iX7hetHvfwdlZ0BpSegyobQ4jytO7Bw==
=9PwV
-----END PGP SIGNATURE-----

--------------iD8FTriwzHoF0WFS9Mgi5KHi--

