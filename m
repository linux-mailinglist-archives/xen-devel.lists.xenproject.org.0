Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49D6BEA85
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 14:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511117.789962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdAZm-0000Ww-ST; Fri, 17 Mar 2023 13:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511117.789962; Fri, 17 Mar 2023 13:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdAZm-0000UO-Pc; Fri, 17 Mar 2023 13:56:58 +0000
Received: by outflank-mailman (input) for mailman id 511117;
 Fri, 17 Mar 2023 13:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pdAZk-0000UI-Id
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 13:56:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9159cab9-c4cb-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 14:56:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 095F821A73;
 Fri, 17 Mar 2023 13:56:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D23B11346F;
 Fri, 17 Mar 2023 13:56:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VVnrMaJxFGSkZwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 13:56:50 +0000
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
X-Inumbo-ID: 9159cab9-c4cb-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679061411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yVOY0plHPhTc7LHtuQdKGgltau9/WeTpX9ohIYDOpVQ=;
	b=kcbxcRoxySaSytoMSoGWzJb16IoQ67cbU4Snx8nE0p22UDvvF0o8QH4ZMbYAyPnd7fSjs0
	HAyaOP4n0mha+OZHospWN0rpL/vm0RZjHRtCVNsMBcfp4z+6SwREXOtK8jTFZ6gOdnauJ2
	P4YtSNvXeH+UeyDZCKrlNpe0ZfHi8BE=
Message-ID: <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
Date: Fri, 17 Mar 2023 14:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
In-Reply-To: <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I1eqOeL9SXpAQiAX4udrGX1n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I1eqOeL9SXpAQiAX4udrGX1n
Content-Type: multipart/mixed; boundary="------------oEwQRoGxzBIxN9egOnMCIBqT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
In-Reply-To: <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>

--------------oEwQRoGxzBIxN9egOnMCIBqT
Content-Type: multipart/mixed; boundary="------------Mi07Adk0EnXgDauMkV0Lgnog"

--------------Mi07Adk0EnXgDauMkV0Lgnog
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjMgMDk6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wMi4yMDIz
IDAxOjA3LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6DQo+Pg0KPj4gT24gMi8xNC8yMyA2OjUz
IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6DQo+Pj4NCj4+PiBPbiAyLzE0LzIzIDExOjEz
IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pg0KPj4+PiAtLS0gYS9hcmNoL3g4Ni9rZXJu
ZWwvY3B1L2J1Z3MuYw0KPj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYw0K
Pj4+PiBAQCAtMTgsNiArMTgsOCBAQA0KPj4+PiAgwqAgI2luY2x1ZGUgPGxpbnV4L3BndGFi
bGUuaD4NCj4+Pj4gIMKgICNpbmNsdWRlIDxsaW51eC9icGYuaD4NCj4+Pj4gIMKgICsjaW5j
bHVkZSA8eGVuL3hlbi5oPg0KPj4+PiArDQo+Pj4+ICDCoCAjaW5jbHVkZSA8YXNtL3NwZWMt
Y3RybC5oPg0KPj4+PiAgwqAgI2luY2x1ZGUgPGFzbS9jbWRsaW5lLmg+DQo+Pj4+ICDCoCAj
aW5jbHVkZSA8YXNtL2J1Z3MuaD4NCj4+Pj4gQEAgLTMyLDYgKzM0LDcgQEANCj4+Pj4gIMKg
ICNpbmNsdWRlIDxhc20vaW50ZWwtZmFtaWx5Lmg+DQo+Pj4+ICDCoCAjaW5jbHVkZSA8YXNt
L2U4MjAvYXBpLmg+DQo+Pj4+ICDCoCAjaW5jbHVkZSA8YXNtL2h5cGVydmlzb3IuaD4NCj4+
Pj4gKyNpbmNsdWRlIDxhc20veGVuL2h5cGVydmlzb3IuaD4NCj4+Pj4gIMKgICNpbmNsdWRl
IDxhc20vdGxiZmx1c2guaD4NCj4+Pj4gIMKgIMKgICNpbmNsdWRlICJjcHUuaCINCj4+Pj4g
QEAgLTkzNCw3ICs5MzcsOCBAQCBkb19jbWRfYXV0bzoNCj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsNCj4+Pj4gIMKgIMKgwqDCoMKgwqAgY2FzZSBSRVRCTEVFRF9NSVRJR0FU
SU9OX0lCUEI6DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4
Nl9GRUFUVVJFX0VOVFJZX0lCUEIpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCF4ZW5f
cHZfZG9tYWluKCkgfHwgeGVuX3ZtX2Fzc2lzdF9pYnBiKHRydWUpKQ0KPj4+DQo+Pj4NCj4+
PiBJcyB0aGlzIGdvaW5nIHRvIGNvbXBpbGUgd2l0aG91dCBDT05GSUdfWEVOPw0KPiANCj4g
WWVzLiBUaGUgZGVjbGFyYXRpb24gb2YgeGVuX3ZtX2Fzc2lzdF9pYnBiKCkgaXMgdmlzaWJs
ZSAoc2F0aXNmeWluZw0KPiB0aGUgY29tcGlsZXIpIGFuZCBEQ0Ugd2lsbCBlbGltaW5hdGUg
dGhlIGNhbGwgdG8gdGhlIGZ1bmN0aW9uIGR1ZSB0bw0KPiB4ZW5fcHZfZG9tYWluKCkgYmVp
bmcgY29uc3RhbnQgImZhbHNlIiBpbiB0aGF0IGNhc2UsIGF2b2lkaW5nIGFueQ0KPiBsaW5r
aW5nIGlzc3Vlcy4gVGhlIGludGVyZXN0aW5nIGNhc2UgaGVyZSByZWFsbHkgaXMgYnVpbGRp
bmcgd2l0aA0KPiBYRU4gYnV0IHdpdGhvdXQgWEVOX1BWOiBUaGF0J3Mgd2h5IEkgbmVlZGVk
IHRvIHB1dCB0aGUgZnVuY3Rpb24gaW4NCj4gZW5saWdodGVuLmMuIFRoaXMgd291bGRuJ3Qg
YmUgbmVlZGVkIGlmIHhlbl9wdl9kb21haW4oKSB3YXMgYWxzbw0KPiBjb25zdGFudCAiZmFs
c2UiIGluIHRoYXQgY2FzZSAoanVzdCBsaWtlIHhlbl9wdmhfZG9tYWluKCkgaXMgd2hlbg0K
PiAhWEVOX1BWSCkuDQo+IA0KPj4+IEkgYWxzbyB0aGluayB0aGVzZSB0d28gY29uZGl0aW9u
cyBzaG91bGQgYmUgd3JhcHBlZCBpbnRvIHNvbWV0aGluZyB0byBsaW1pdCBleHBvc3VyZSBv
ZiBub24tWGVuIGNvZGUgdG8gWGVuLXNwZWNpZmljIHByaW1pdGl2ZXMuDQo+IA0KPiBJIHdv
dWxkIGhhdmUgZG9uZSBzbywgaWYgSSBoYWQgYW55IGhhbGZ3YXkgc2Vuc2libGUgaWRlYSBv
biBob3cgdG8NCj4gZ28gYWJvdXQgZG9pbmcgc28gaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2Uu
IEluIHRoZSBhYnNlbmNlIG9mIHRoYXQgaXQNCj4gbG9va2VkIG9rYXktaXNoIHRvIG1lIHRv
IHJlZmVyZW5jZSBYZW4gZnVuY3Rpb25zIGRpcmVjdGx5IGhlcmUuDQo+IA0KPj4gT2gsIGFu
ZCB0aGlzIG5lZWRzIHg4NiBtYWludGFpbmVycy4NCj4gDQo+IEV2ZW50dWFsbHkgeWVzLiBC
dXQgSSB3b3VsZCBwcmVmZXIgdG8gc29ydCB0aGUgYWJvdmUgcXVlc3Rpb24gZmlyc3QNCj4g
KHdoaWNoIEknbSBzdXJlIHdvdWxkIGhhdmUgYmVlbiByYWlzZWQgYnkgdGhlbSwgaW4gcGVy
aGFwcyBtb3JlDQo+IGhhcnNoIGEgd2F5KSwgaGVuY2UgdGhlIGluaXRpYWxseSBsaW1pdGVk
IGV4cG9zdXJlLg0KDQpJJ2QgcmF0aGVyIGFkZCBfb25lXyBob29rIGZvciBYZW4tUFYgaW4g
Y2hlY2tfYnVncygpIGp1c3QgYmVmb3JlIHRoZSBjYWxsDQpvZiBhcmNoX3NtdF91cGRhdGUo
KS4gVGhpcyBjYW4gdGhlbiBjb3JyZWN0IGFueSBuZWVkZWQgbWl0aWdhdGlvbiBzZXR0aW5n
cy4NCg0KU28gc29tZXRoaW5nIGxpa2UgKG5vdGUgdGhhdCBkdWUgdG8gdXNpbmcgY3B1X2Zl
YXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9YRU5QVikNCkRDRSBpcyBoYXBwZW5pbmcgaW4g
Y2FzZSBDT05GSUdfWEVOX1BWIGlzbid0IGRlZmluZWQpIjoNCg0KLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20veGVuL2h5cGVydmlzb3IuaA0KKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20veGVuL2h5cGVydmlzb3IuaA0KQEAgLTYzLDQgKzYzLDcgQEAgdm9pZCBfX2luaXQgeGVu
X3B2aF9pbml0KHN0cnVjdCBib290X3BhcmFtcyAqYm9vdF9wYXJhbXMpOw0KICB2b2lkIF9f
aW5pdCBtZW1fbWFwX3ZpYV9oY2FsbChzdHJ1Y3QgYm9vdF9wYXJhbXMgKmJvb3RfcGFyYW1z
X3ApOw0KICAjZW5kaWYNCg0KK2ludCBfX2luaXQgeGVuX3ZtX2Fzc2lzdF9pYnBiKGJvb2wg
ZW5hYmxlKTsNCit2b2lkIF9faW5pdCB4ZW5fcHZfZml4X21pdGlnYXRpb25zKHZvaWQpOw0K
Kw0KICAjZW5kaWYgLyogX0FTTV9YODZfWEVOX0hZUEVSVklTT1JfSCAqLw0KLS0tIGEvYXJj
aC94ODYva2VybmVsL2NwdS9idWdzLmMNCisrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVn
cy5jDQpAQCAtMTgsNiArMTgsOCBAQA0KICAjaW5jbHVkZSA8bGludXgvcGd0YWJsZS5oPg0K
ICAjaW5jbHVkZSA8bGludXgvYnBmLmg+DQoNCisjaW5jbHVkZSA8eGVuL3hlbi5oPg0KKw0K
ICAjaW5jbHVkZSA8YXNtL3NwZWMtY3RybC5oPg0KICAjaW5jbHVkZSA8YXNtL2NtZGxpbmUu
aD4NCiAgI2luY2x1ZGUgPGFzbS9idWdzLmg+DQpAQCAtMTc3LDYgKzE3OSw5IEBAIHZvaWQg
X19pbml0IGNoZWNrX2J1Z3Modm9pZCkNCiAgICAgICAgIHNyYmRzX3NlbGVjdF9taXRpZ2F0
aW9uKCk7DQogICAgICAgICBsMWRfZmx1c2hfc2VsZWN0X21pdGlnYXRpb24oKTsNCg0KKyAg
ICAgICBpZiAoY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9YRU5QVikpDQorICAg
ICAgICAgICAgICAgeGVuX3B2X2ZpeF9taXRpZ2F0aW9ucygpOw0KKw0KICAgICAgICAgYXJj
aF9zbXRfdXBkYXRlKCk7DQoNCiAgI2lmZGVmIENPTkZJR19YODZfMzINCi0tLSBhL2FyY2gv
eDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9w
di5jDQpAQCAtMTQ3Niw2ICsxNDc2LDIzIEBAIHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVu
X3BsYXRmb3JtX3B2KHZvaWQpDQogICAgICAgICByZXR1cm4gMDsNCiAgfQ0KDQoraW50IF9f
aW5pdCB4ZW5fdm1fYXNzaXN0X2licGIoYm9vbCBlbmFibGUpDQorew0KKyAgICAgICAvKg0K
KyAgICAgICAgKiBOb3RlIHRoYXQgdGhlIFZNLWFzc2lzdCBpcyBhIGRpc2FibGUsIHNvIGEg
cmVxdWVzdCB0byBlbmFibGUgSUJQQg0KKyAgICAgICAgKiBvbiBvdXIgYmVoYWxmIG5lZWRz
IHRvIHR1cm4gdGhlIGZ1bmN0aW9uYWxpdHkgb2ZmIChhbmQgdmljZSB2ZXJzYSkuDQorICAg
ICAgICAqLw0KKyAgICAgICByZXR1cm4gSFlQRVJWSVNPUl92bV9hc3Npc3QoZW5hYmxlID8g
Vk1BU1NUX0NNRF9kaXNhYmxlDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgOiBWTUFTU1RfQ01EX2VuYWJsZSwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFZNQVNTVF9UWVBFX21vZGVfc3dpdGNoX25vX2licGIpOw0KK30NCisN
Cit2b2lkIF9faW5pdCB4ZW5fcHZfZml4X21pdGlnYXRpb25zKHZvaWQpDQorew0KKyAgICAg
ICBpZiAoIXhlbl92bV9hc3Npc3RfaWJwYih0cnVlKSkNCisgICAgICAgICAgICAgICBzZXR1
cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFUVVJFX0VOVFJZX0lCUEIpOw0KK30NCisNCiAgY29u
c3QgX19pbml0Y29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5fcHYg
PSB7DQogICAgICAgICAubmFtZSAgICAgICAgICAgICAgICAgICA9ICJYZW4gUFYiLA0KICAg
ICAgICAgLmRldGVjdCAgICAgICAgICAgICAgICAgPSB4ZW5fcGxhdGZvcm1fcHYsDQotLS0g
YS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVuLmgNCisrKyBiL2luY2x1ZGUveGVuL2ludGVy
ZmFjZS94ZW4uaA0KQEAgLTQxMyw3ICs0MTMsMTUgQEAgREVGSU5FX0dVRVNUX0hBTkRMRV9T
VFJVQ1QobW11ZXh0X29wKTsNCiAgICovDQogICNkZWZpbmUgVk1BU1NUX1RZUEVfcnVuc3Rh
dGVfdXBkYXRlX2ZsYWcgNQ0KDQotI2RlZmluZSBNQVhfVk1BU1NUX1RZUEUgNQ0KKy8qDQor
ICogeDg2LTY0IGd1ZXN0czogU3VwcHJlc3MgSUJQQiBvbiBndWVzdC11c2VyIHRvIGd1ZXN0
LWtlcm5lbCBtb2RlIHN3aXRjaC4NCisgKg0KKyAqIEJ5IGRlZmF1bHQgKG9uIGFmZmVjdGVk
IGFuZCBjYXBhYmxlIGhhcmR3YXJlKSBhcyBhIHNhZmV0eSBtZWFzdXJlIFhlbiwNCisgKiB0
byBjb3ZlciBmb3IgdGhlIGZhY3QgdGhhdCBndWVzdC1rZXJuZWwgYW5kIGd1ZXN0LXVzZXIg
bW9kZXMgYXJlIGJvdGgNCisgKiBydW5uaW5nIGluIHJpbmcgMyAoYW5kIGhlbmNlIHNoYXJl
IHByZWRpY3Rpb24gY29udGV4dCksIHdvdWxkIGlzc3VlIGENCisgKiBiYXJyaWVyIGZvciB1
c2VyLT5rZXJuZWwgbW9kZSBzd2l0Y2hlcyBvZiBQViBndWVzdHMuDQorICovDQorI2RlZmlu
ZSBWTUFTU1RfVFlQRV9tb2RlX3N3aXRjaF9ub19pYnBiICAzMw0KDQogICNpZm5kZWYgX19B
U1NFTUJMWV9fDQoNCg0KSnVlcmdlbg0KDQo=
--------------Mi07Adk0EnXgDauMkV0Lgnog
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Mi07Adk0EnXgDauMkV0Lgnog--

--------------oEwQRoGxzBIxN9egOnMCIBqT--

--------------I1eqOeL9SXpAQiAX4udrGX1n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQUcaIFAwAAAAAACgkQsN6d1ii/Ey9j
KAgAiG3OMwESvGIZ5EkygBdNCEvllbS1tnOz1xpJ/Tb50T3u2+hiZrrylXa0iiTKT7jDgXRMmCiD
72ID2B+rB7XngEqRbHIXiziEX0J0euIchqSG21T8G+QCSDJREU7CDzayBKoIuzAD74klhfWyP75g
7M3yZyUcQt8z+qFsw24Hb64u/k/7AURuiO3L46o7A2PpO2wFJBDhOXNt3chFPfIxdyTVXrISryNa
LSwZT+ain5A5bc3/4ZcY/NkyBDKgWyLwBF+fg98hKT2NOwUpxqoWjQ6m5e4L3wchnuaHchYEx8Uy
nHfCYmIYNY+TF6+MEYMr2GfBGG3RmXKw45Tqse3rYA==
=Lm5v
-----END PGP SIGNATURE-----

--------------I1eqOeL9SXpAQiAX4udrGX1n--

