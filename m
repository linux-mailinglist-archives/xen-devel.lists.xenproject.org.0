Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E76AE563
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507566.781243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZbK-0005rW-8D; Tue, 07 Mar 2023 15:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507566.781243; Tue, 07 Mar 2023 15:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZbK-0005o4-4d; Tue, 07 Mar 2023 15:51:42 +0000
Received: by outflank-mailman (input) for mailman id 507566;
 Tue, 07 Mar 2023 15:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZZbI-0005nB-M0
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:51:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b8da98-bcff-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:51:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10E961F74D;
 Tue,  7 Mar 2023 15:51:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE01A13440;
 Tue,  7 Mar 2023 15:51:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WOv9MIpdB2S5MQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 15:51:38 +0000
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
X-Inumbo-ID: f2b8da98-bcff-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678204299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LXdDzUmA0yI2/W4CtE2UXMAJinJ9U3IvrLczIEJXVNE=;
	b=SmdhxDFqHk0BPzhvnQfgsfXAGtSNEwdFkKdYAbwTNVqapuXdrUg5ufu7Y3beqwUpIO7q61
	E9lsDB7CPVTSuXSJai/6buC3dLMAASuxeeyNJ6BRCxzfP4aHy/4QGwFpIg5D+aP6SlgYbU
	TqoJM/tZRjsMSddViFML+pWF1D1IMLo=
Message-ID: <8c16194b-e5a7-34d0-3260-c79a7d72945d@suse.com>
Date: Tue, 7 Mar 2023 16:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
 <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
 <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
 <e4298b1a-e8b4-61d8-1975-a78adf55bcdb@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e4298b1a-e8b4-61d8-1975-a78adf55bcdb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iACVGjxOOzUuIAEE2oBxDlIP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iACVGjxOOzUuIAEE2oBxDlIP
Content-Type: multipart/mixed; boundary="------------0Mn003f6O7HJVOAqqOxvB45x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <8c16194b-e5a7-34d0-3260-c79a7d72945d@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
 <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
 <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
 <e4298b1a-e8b4-61d8-1975-a78adf55bcdb@suse.com>
In-Reply-To: <e4298b1a-e8b4-61d8-1975-a78adf55bcdb@suse.com>

--------------0Mn003f6O7HJVOAqqOxvB45x
Content-Type: multipart/mixed; boundary="------------wC5jz0LEl60MsN0PGZ6FBC70"

--------------wC5jz0LEl60MsN0PGZ6FBC70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDE2OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDMuMjMgMTU6MzQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAzLjIwMjMgMTU6MjMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA3LjAzLjIzIDE1OjE4LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDA3LjAzLjIwMjMgMTU6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gT24gMDcuMDMuMjMgMTE6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAw
Ny4wMy4yMDIzIDA3OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4gLS0tIGEv
eGVuL0tjb25maWcuZGVidWcNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+
Pj4+Pj4+PiBAQCAtMTUsOCArMTUsMTEgQEAgY29uZmlnIERFQlVHX0lORk8NCj4+Pj4+Pj4+
ICAgICAgCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcgaW5mbyINCj4+Pj4+Pj4+ICAg
ICAgCWRlZmF1bHQgREVCVUcNCj4+Pj4+Pj4+ICAgICAgCS0tLWhlbHAtLS0NCj4+Pj4+Pj4+
IC0JICBJZiB5b3Ugc2F5IFkgaGVyZSB0aGUgcmVzdWx0aW5nIFhlbiB3aWxsIGluY2x1ZGUg
ZGVidWdnaW5nIGluZm8NCj4+Pj4+Pj4+IC0JICByZXN1bHRpbmcgaW4gYSBsYXJnZXIgYmlu
YXJ5IGltYWdlLg0KPj4+Pj4+Pj4gKwkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gYnVp
bGQgWGVuIHdpdGggZGVidWcgaW5mb3JtYXRpb24uIFRoaXMNCj4+Pj4+Pj4+ICsJICBpbmZv
cm1hdGlvbiBpcyBuZWVkZWQgZS5nLiBmb3IgZG9pbmcgY3Jhc2ggZHVtcCBhbmFseXNpcyBv
ZiB0aGUNCj4+Pj4+Pj4+ICsJICBoeXBlcnZpc29yIHZpYSB0aGUgImNyYXNoIiB0b29sLg0K
Pj4+Pj4+Pj4gKwkgIFNheWluZyBZIHdpbGwgaW5jcmVhc2UgdGhlIHNpemUgb2YgeGVuLXN5
bXMgYW5kIHRoZSBidWlsdCBFRkkNCj4+Pj4+Pj4+ICsJICBiaW5hcnkuDQo+Pj4+Pj4+DQo+
Pj4+Pj4+IExhcmdlbHkgZmluZSB3aXRoIG1lLCBqdXN0IG9uZSBxdWVzdGlvbjogV2h5IGRv
IHlvdSBtZW50aW9uIHhlbi1zeW1zIGJ5DQo+Pj4+Pj4+IG5hbWUsIGJ1dCB0aGVuIHZlcmJh
bGx5IGRlc2NyaWJlIHhlbi5lZmk/IEFuZCBzaW5jZSwgdW5saWtlIGZvciB4ZW4tc3ltcywN
Cj4+Pj4+Pg0KPj4+Pj4+IEZvciB4ZW4tc3ltcyBJIGNvdWxkbid0IGZpbmQgYW4gZWFzaWx5
IHVuZGVyc3RhbmRhYmxlIHdvcmRpbmcuIEknZCBiZSBmaW5lDQo+Pj4+Pj4gd2l0aCBqdXN0
IHNheWluZyAieGVuLmVmaSIuDQo+Pj4+Pj4NCj4+Pj4+Pj4gdGhpcyBhZmZlY3RzIHRoZSBp
bnN0YWxsZWQgYmluYXJ5IGFjdHVhbGx5IHVzZWQgZm9yIGJvb3RpbmcgKHdoaWNoIG1heQ0K
Pj4+Pj4+PiBiZSBwbGFjZWQgb24gYSBzcGFjZSBjb25zdHJhaW5lZCBwYXJ0aXRpb24pLCBp
dCBtYXkgYmUgcHJ1ZGVudCB0bw0KPj4+Pj4+PiBtZW50aW9uIElOU1RBTExfRUZJX1NUUklQ
IGhlcmUgKGFzIGEgd2F5IHRvIHJlZHVjZSB0aGUgYmluYXJ5IHNpemUgb2YNCj4+Pj4+Pj4g
d2hhdCBlbmRzIHVwIG9uIHRoZSBFRkkgcGFydGl0aW9uLCBldmVuIGlmIHRoYXQgd291bGRu
J3QgYWZmZWN0IHRoZQ0KPj4+Pj4+PiAibm9ybWFsIiB3YXkgb2YgcHV0dGluZyB0aGUgYmlu
YXJ5IG9uIHRoZSBFRkkgcGFydGl0aW9uIC0gcGVvcGxlIHdvdWxkDQo+Pj4+Pj4+IHN0aWxs
IG5lZWQgdG8gdGFrZSBjYXJlIG9mIHRoYXQgaW4gdGhlaXIgZGlzdHJvcykuDQo+Pj4+Pj4N
Cj4+Pj4+PiBXaGF0IGFib3V0IGFkZGluZyBhIHJlbGF0ZWQgS2NvbmZpZyBvcHRpb24gaW5z
dGVhZD8NCj4+Pj4+DQo+Pj4+PiBIb3cgd291bGQgYSBLY29uZmlnIG9wdGlvbiBwb3NzaWJs
eSBhZmZlY3QgdGhpcz8gWW91IHdhbnQgZGVidWcgaW5mbw0KPj4+Pj4gaW4gdGhlIHhlbi5l
ZmkgaW4gaXRzIHN0YW5kYXJkIGluc3RhbGwgbG9jYXRpb24gKG91dHNpZGUgb2YgdGhlIEVG
SQ0KPj4+Pj4gcGFydGl0aW9uKTsgb3IgZWxzZSBpZiB5b3UgZG9uJ3Qgd2FudCBpdCB0aGVy
ZSB3aHkgd291bGQgeW91IHdhbnQgaXQNCj4+Pj4+IGluIHhlbi1zeW1zPyBJdCBpcyB0aGUg
c3RlcCBvZiBwb3B1bGF0aW5nIHRoZSBFRkkgcGFydGl0aW9uIGZyb20gdGhlDQo+Pj4+PiBz
dGFuZGFyZCBpbnN0YWxsIGxvY2F0aW9uIHdoZXJlIHNvbWUgZXF1aXZhbGVudCBvZiBJTlNU
QUxMX0VGSV9TVFJJUA0KPj4+Pj4gd291bGQgY29tZSBpbnRvIHBsYXkuIFRoYXQgc3RlcCBp
cyBkb25lIG91dHNpZGUgb2YgWGVuJ3MgYnVpbGQNCj4+Pj4+IHN5c3RlbSBhbmQgaGVuY2Ug
b3V0c2lkZSBvZiBhbnkgS2NvbmZpZyBjb250cm9sLg0KPj4+Pg0KPj4+PiBXZSBoYXZlIDIg
YmluYXJpZXMgZm9yIHRoZSBub24tRUZJIGh5cGVydmlzb3IgKHhlbi1zeW1zIGFuZCB4ZW5b
Lmd6XSkuDQo+Pj4+IFdoeSBjYW4ndCB3ZSBoYXZlIHRoZSBzYW1lIGZvciBFRkk/IEUuZy4g
eGVuLXN5bXMuZWZpIGFuZCB4ZW4uZWZpLg0KPj4+PiBUaGUgZm9ybWVyIHdvdWxkIGhhdmUg
dGhlIGRlYnVnLWluZm8sIHRoZSBsYXR0ZXIgY291bGQgYmUgaW5zdGFsbGVkDQo+Pj4+IGlu
dG8gdGhlIEVGSSBwYXJ0aXRpb24uDQo+Pj4NCj4+PiBJIHZpZXcgdGhlIHR3by1iaW5hcmll
cyBtb2RlbCBvZiB0aGUgbm9uLUVGSSBjYXNlIGFzIG1lcmVseSBhbg0KPj4+IGltcGxlbWVu
dGF0aW9uIGRldGFpbDsNCj4+DQo+PiBUaGUgYWJpbGl0eSB0byBkbyBjcmFzaCBkdW1wIGFu
YWx5c2lzIGlzIG1vcmUgdGhhbiBhbiBpbXBsZW1lbnRhdGlvbg0KPj4gZGV0YWlsIElNSE8u
IEl0IGlzIGEgZmVhdHVyZSBhbmQgYXMgc3VjaCB0aGUgYXZhaWxhYmlsaXR5IG9mIHhlbi1z
eW1zDQo+PiBzaG91bGQgYmUgc2VlbiBhcyBhbiBpbnRlcmZhY2Ugd2hpY2ggZnVuY3Rpb25h
bGl0eSBzaG91bGQgYmUga2VwdC4NCj4gDQo+IFRoYXQgeW91J3JlIGxvb2tpbmcgdGhlIG9w
cG9zaXRlIHdheSBhdCB0aGluZ3M6IFRoZSBvZGRpdHkgaXMgdGhhdCB3ZQ0KPiBjYW4ndCB1
c2UgeGVuLXN5bXMgZGlyZWN0bHkgZm9yIGJvb3RpbmcgKHdoaWNoIGlzIGFsc28gd2h5IGl0
IGhhcyB0aGlzDQo+IHNwZWNpZmljIG5hbWU7IG90aGVyd2lzZSAieGVuIiB3b3VsZCBiZSB3
aGF0IHRoZSBsaW5rZXIgcHJvZHVjZXMpLg0KPiANCj4+PiBpdCBqdXN0IHNvIGhhcHBlbnMg
dGhhdCB0aGVyZSdzIGxpdHRsZSBwb2ludA0KPj4+IGluIG1rZWxmMzIgcmV0YWluaW5nIGRl
YnVnIGluZm8uIEkgdGhlcmVmb3JlIGRvbid0IHZpZXcgaXQgYXMgdmVyeQ0KPj4+IHJlYXNv
bmFibGUgdG8gYXJ0aWZpY2lhbGx5IGludHJvZHVjZSB5ZXQgYW5vdGhlciBiaW5hcnkuDQo+
Pg0KPj4gSW4gY2FzZSB0aGVyZSBpcyBubyBvdGhlciB3YXkgdG8gZW5hYmxlIGh5cGVydmlz
b3IgY3Jhc2ggZHVtcCBhbmFseXNpcw0KPj4gSSBkb24ndCBzZWUgdGhpcyBhcyBhbiB1bnJl
YXNvbmFibGUgYXBwcm9hY2guDQo+Pg0KPj4gSXQgc2hvdWxkIGJlIHZlcmlmaWVkIHRoYXQg
dGhpcyBhcHByb2FjaCBpcyByZWFsbHkgZW5hYmxpbmcgdGhlIGNyYXNoDQo+PiBkdW1wIGFu
YWx5c2lzIG9mIGEgY3Jhc2ggZHVtcCBmcm9tIGEgeGVuLmVmaSBib290ZWQgc3lzdGVtLCBv
ZiBjb3Vyc2UuDQo+IA0KPiBSaWdodC4gRmlyc3QgcXVlc3Rpb24gd291bGQgYmUgd2hldGhl
ciB0aGV5IG1hbmFnZSB0byBjb25zdW1lIER3YXJmDQo+IGRlYnVnIGluZm8gZnJvbSBhIFBF
L0NPRkYgZXhlY3V0YWJsZS4gUG9zc2libHkgdGhlIHdheSB0byBnbyBpcyB0bw0KPiBzZXBh
cmF0ZSBEd2FyZiBkYXRhIG91dCBvZiB4ZW4uZWZpIGludG8gYW4gRUxGICJjb250YWluZXIi
OyBJIGhhdmUgbm8NCj4gaWRlYSB3aGV0aGVyIG9iamNvcHkgY291bGQgYmUgdXNlZCBmb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4NCg0KSSB0cmllZDoNCg0KID4gb2JqY29weSAtLXJlbW92
ZS1zZWN0aW9uPS50ZXh0IC0tcmVtb3ZlLXNlY3Rpb249LnJvZGF0YSANCi0tcmVtb3ZlLXNl
Y3Rpb249LmluaXQuKiAtLXJlbW92ZS1zZWN0aW9uPS5kYXRhIC0tcmVtb3ZlLXNlY3Rpb249
LmRhdGEuKiANCi0tcmVtb3ZlLXNlY3Rpb249LmJzcyAtLW91dHB1dC10YXJnZXQ9ZWxmNjQt
eDg2LTY0IHhlbi5lZmkgeGVuLWRlYnVnDQoNCmFuZCB0aGUgcmVzdWx0IHdhczoNCg0KID4g
b2JqZHVtcCAtaCB4ZW4tZGVidWcNCg0KeGVuLWRlYnVnOiAgICAgZmlsZSBmb3JtYXQgZWxm
NjQteDg2LTY0DQoNClNlY3Rpb25zOg0KSWR4IE5hbWUgICAgICAgICAgU2l6ZSAgICAgIFZN
QSAgICAgICAgICAgICAgIExNQSAgICAgICAgICAgICAgIEZpbGUgb2ZmICBBbGduDQogICAw
IC5idWlsZGlkICAgICAgMDAwMDAwMzUgIGZmZmY4MmQwNDA0ODZmYjggIGZmZmY4MmQwNDA0
ODZmYjggIDAwMDAwZmI4ICAyKioyDQogICAgICAgICAgICAgICAgICAgQ09OVEVOVFMsIEFM
TE9DLCBMT0FELCBSRUFET05MWSwgREFUQQ0KICAgMSAuaW5pdCAgICAgICAgIDAwMGEyMzQw
ICBmZmZmODJkMDQwNjAwMDAwICBmZmZmODJkMDQwNjAwMDAwICAwMDAwMTAwMCAgMioqMg0K
ICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBBTExPQywgTE9BRCwgQ09ERQ0KICAgMiAu
cmVsb2MgICAgICAgIDAwMDAxNjU4ICBmZmZmODJkMDQwOTRkNWEwICBmZmZmODJkMDQwOTRk
NWEwICAwMDBhMzVhMCAgMioqMg0KICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBBTExP
QywgTE9BRCwgUkVBRE9OTFksIERBVEENCiAgIDMgLmRlYnVnX2FiYnJldiAwMDA5MWY2YiAg
ZmZmZjgyZDA0MDk0ZWJmOCAgZmZmZjgyZDA0MDk0ZWJmOCAgMDAwYTRiZjggIDIqKjANCiAg
ICAgICAgICAgICAgICAgICBDT05URU5UUywgUkVBRE9OTFksIERFQlVHR0lORywgT0NURVRT
DQogICA0IC5kZWJ1Z19pbmZvICAgMDBmZDdhZjQgIGZmZmY4MmQwNDA5ZTBiNjMgIGZmZmY4
MmQwNDA5ZTBiNjMgIDAwMTM2YjYzICAyKiowDQogICAgICAgICAgICAgICAgICAgQ09OVEVO
VFMsIFJFQURPTkxZLCBERUJVR0dJTkcsIE9DVEVUUw0KICAgNSAuZGVidWdfc3RyICAgIDAw
ODQzMzk1ICBmZmZmODJkMDQxOWI4NjU3ICBmZmZmODJkMDQxOWI4NjU3ICAwMTEwZTY1NyAg
MioqMA0KICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBSRUFET05MWSwgREVCVUdHSU5H
LCBPQ1RFVFMNCiAgIDYgLmRlYnVnX2xpbmUgICAwMDExZGJhNSAgZmZmZjgyZDA0MjFmYjll
YyAgZmZmZjgyZDA0MjFmYjllYyAgMDE5NTE5ZWMgIDIqKjANCiAgICAgICAgICAgICAgICAg
ICBDT05URU5UUywgUkVBRE9OTFksIERFQlVHR0lORywgT0NURVRTDQogICA3IC5kZWJ1Z19m
cmFtZSAgMDAwM2ZkN2MgIGZmZmY4MmQwNDIzMTk1OTQgIGZmZmY4MmQwNDIzMTk1OTQgIDAx
YTZmNTkxICAyKiowDQogICAgICAgICAgICAgICAgICAgQ09OVEVOVFMsIFJFQURPTkxZLCBE
RUJVR0dJTkcsIE9DVEVUUw0KICAgOCAuZGVidWdfbG9jICAgIDAwNDdmY2ZkICBmZmZmODJk
MDQyMzU5MzEwICBmZmZmODJkMDQyMzU5MzEwICAwMWFhZjMwZCAgMioqMA0KICAgICAgICAg
ICAgICAgICAgIENPTlRFTlRTLCBSRUFET05MWSwgREVCVUdHSU5HLCBPQ1RFVFMNCiAgIDkg
LmRlYnVnX3JhbmdlcyAwMDBkMjY1MCAgZmZmZjgyZDA0MjdkOTAxMCAgZmZmZjgyZDA0Mjdk
OTAxMCAgMDFmMmYwMGEgIDIqKjANCiAgICAgICAgICAgICAgICAgICBDT05URU5UUywgUkVB
RE9OTFksIERFQlVHR0lORywgT0NURVRTDQogIDEwIC5kZWJ1Z19hcmFuZ2VzIDAwMDE1YmQw
ICBmZmZmODJkMDQyOGFiNjYwICBmZmZmODJkMDQyOGFiNjYwICAwMjAwMTY1YSAgMioqMA0K
ICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBSRUFET05MWSwgREVCVUdHSU5HLCBPQ1RF
VFMNCg0KVGhpcyBzZWVtcyB0byBiZSBhIHJlYXNvbmFibGUgb3V0cHV0LiBXaGV0aGVyIGNy
YXNoIGlzIGhhcHB5IHdpdGggdGhhdCBmaWxlIGlzDQphbm90aGVyIHF1ZXN0aW9uLCBvZiBj
b3Vyc2UuDQoNCg0KSnVlcmdlbg0K
--------------wC5jz0LEl60MsN0PGZ6FBC70
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------wC5jz0LEl60MsN0PGZ6FBC70--

--------------0Mn003f6O7HJVOAqqOxvB45x--

--------------iACVGjxOOzUuIAEE2oBxDlIP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHXYoFAwAAAAAACgkQsN6d1ii/Ey//
xAf/WGyjgDKdvVHu/wy6inNZaZSDG4ziPDHRjQ9J1IM8zbfh5kLS7QXHpDGlDPBLmXioQbKu/UoN
rs+iNnXTCjhG0d2mtaTAbgZebttAQLMm0uXHeayHYd9SOL6LcObztBryrv+ly4ZSKHnzsVzXtNvN
iKMdQgNq6qJOb0+3LSSoxd0j3U8i4M5QSEGUDPTDLRblfB6xpW3j8hgCcTT0ZRRpQVMoVLXqGX/P
dkFDL0AP+4FeqjBVgx6PDwly5my1mbIzxvn7yblXKh6gzWDSCAMTT3YzNFk0er6nRXzqC9DXiDX8
qHFNu2l6w+3eRLUQRuCfZLYDxfr/lHmUkhXOW6mRXw==
=R7HI
-----END PGP SIGNATURE-----

--------------iACVGjxOOzUuIAEE2oBxDlIP--

