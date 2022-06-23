Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E055766F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354699.581948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ixn-0003ua-L0; Thu, 23 Jun 2022 09:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354699.581948; Thu, 23 Jun 2022 09:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ixn-0003so-Hz; Thu, 23 Jun 2022 09:17:23 +0000
Received: by outflank-mailman (input) for mailman id 354699;
 Thu, 23 Jun 2022 09:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4Ixl-0003sg-Cu
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:17:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4898cf99-f2d5-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:17:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E772C1FD84;
 Thu, 23 Jun 2022 09:17:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C41A613461;
 Thu, 23 Jun 2022 09:17:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ExVYLp8vtGLGIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:17:19 +0000
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
X-Inumbo-ID: 4898cf99-f2d5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655975839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MunLjHPNnWTbeY1RX6E4zRAG5HofK+3ZOjdJc3Vj4Fo=;
	b=qsfBFn5eXgks19pMelSmtpynHTCpiYHbmCUHEWv+p+SvuDz1xxQlCO1gGMdkHihrDlJnKE
	/evSEscOMknToG9rcafQwraHn3TpflC+c9tRDAld03eOKuOVnyxOUbA7Z1+zOuq61F2PBb
	8oHDzIpwaBKpbKjkYh8AAU5ALqHSPXQ=
Message-ID: <9eba3e4a-f420-4024-fe5f-607b5b6677b4@suse.com>
Date: Thu, 23 Jun 2022 11:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Problem loading linux 5.19 as PV dom0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
 <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
 <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
 <03ba839e-4249-b18b-81bf-86b98cb319b5@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <03ba839e-4249-b18b-81bf-86b98cb319b5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wa9i16KM0SYF2M0tZg1Q0ZvM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wa9i16KM0SYF2M0tZg1Q0ZvM
Content-Type: multipart/mixed; boundary="------------Fxzc9x3xaB5Kh5ovmqmwFIw3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <9eba3e4a-f420-4024-fe5f-607b5b6677b4@suse.com>
Subject: Re: Problem loading linux 5.19 as PV dom0
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
 <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
 <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
 <03ba839e-4249-b18b-81bf-86b98cb319b5@suse.com>
In-Reply-To: <03ba839e-4249-b18b-81bf-86b98cb319b5@suse.com>

--------------Fxzc9x3xaB5Kh5ovmqmwFIw3
Content-Type: multipart/mixed; boundary="------------Bm50bso9g0bAJKDrSANDU400"

--------------Bm50bso9g0bAJKDrSANDU400
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMTE6MDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNi4yMDIy
IDExOjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjMuMDYuMjIgMTA6NDcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA2LjIwMjIgMTA6MDYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIzLjA2LjIyIDA5OjU1LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIyLjA2LjIwMjIgMTg6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gQSBMaW51eCBrZXJuZWwgNS4xOSBjYW4gb25seSBiZSBsb2FkZWQgYXMgZG9tMCwgaWYg
aXQgaGFzIGJlZW4NCj4+Pj4+PiBidWlsdCB3aXRoIENPTkZJR19BTURfTUVNX0VOQ1JZUFQg
ZW5hYmxlZC4gVGhpcyBpcyBkdWUgdG8gdGhlDQo+Pj4+Pj4gZmFjdCB0aGF0IG90aGVyd2lz
ZSB0aGUgKHJlbGV2YW50KSBsYXN0IHNlY3Rpb24gb2YgdGhlIGJ1aWx0DQo+Pj4+Pj4ga2Vy
bmVsIGhhcyB0aGUgTk9MT0FEIGZsYWcgc2V0IChpdCBpcyBzdGlsbCBtYXJrZWQgd2l0aA0K
Pj4+Pj4+IFNIRl9BTExPQykuDQo+Pj4+Pj4NCj4+Pj4+PiBJIHRoaW5rIGF0IGxlYXN0IHRo
ZSBoeXBlcnZpc29yIG5lZWRzIHRvIGJlIGNoYW5nZWQgdG8gc3VwcG9ydA0KPj4+Pj4+IHRo
aXMgbGF5b3V0LiBPdGhlcndpc2UgaXQgd2lsbCBwdXQgdGhlIGluaXRpYWwgcGFnZSB0YWJs
ZXMgZm9yDQo+Pj4+Pj4gZG9tMCBhdCB0aGUgc2FtZSBwb3NpdGlvbiBhcyB0aGlzIGxhc3Qg
c2VjdGlvbiwgbGVhZGluZyB0bw0KPj4+Pj4+IGVhcmx5IGNyYXNoZXMuDQo+Pj4+Pg0KPj4+
Pj4gSXNuJ3QgWGVuIHVzaW5nIHRoZSBiekltYWdlIGhlYWRlciB0aGVyZSwgcmF0aGVyIHRo
YW4gYW55IEVMRg0KPj4+Pj4gb25lPyBJbiB3aGljaCBjYXNlIGl0IHdvdWxkIG1hdHRlciBo
b3cgdGhlIE5PTE9BRCBzZWN0aW9uIGlzDQo+Pj4+DQo+Pj4+IEZvciBhIFBWIGtlcm5lbD8g
Tm8sIEkgZG9uJ3QgdGhpbmsgc28uDQo+Pj4NCj4+PiBBY3R1YWxseSBpdCdzIGEgbWl4IChh
bmQgdGhlIHNhbWUgZm9yIFBWIGFuZCBQVkgpIC0gdGhlIGJ6SW1hZ2UNCj4+PiBoZWFkZXIg
aXMgcGFyc2VkIHRvIGdldCBhdCB0aGUgZW1iZWRkZWQgRUxGIGhlYWRlci4gWGVub0xpbnV4
IHdhcw0KPj4+IHdoYXQgd291bGQvY291bGQgYmUgbG9hZGVkIGFzIHBsYWluIEVMRi4NCj4+
Pg0KPj4+Pj4gYWN0dWFsbHkgcmVwcmVzZW50ZWQgaW4gdGhhdCBoZWFkZXIuIENhbiB5b3Ug
cHJvdmlkZSBhIGR1bXAgKG9yDQo+Pj4+PiBiaW5hcnkgcmVwcmVzZW50YXRpb24pIG9mIGJv
dGggaGVhZGVycz8NCj4+Pj4NCj4+Pj4gUHJvZ3JhbSBIZWFkZXI6DQo+Pj4+ICAgICAgICBM
T0FEIG9mZiAgICAweDAwMDAwMDAwMDAyMDAwMDAgdmFkZHIgMHhmZmZmZmZmZjgxMDAwMDAw
IHBhZGRyDQo+Pj4+IDB4MDAwMDAwMDAwMTAwMDAwMCBhbGlnbiAyKioyMQ0KPj4+PiAgICAg
ICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAxNDVlMTE0IG1lbXN6IDB4MDAwMDAwMDAwMTQ1
ZTExNCBmbGFncyByLXgNCj4+Pj4gICAgICAgIExPQUQgb2ZmICAgIDB4MDAwMDAwMDAwMTgw
MDAwMCB2YWRkciAweGZmZmZmZmZmODI2MDAwMDAgcGFkZHINCj4+Pj4gMHgwMDAwMDAwMDAy
NjAwMDAwIGFsaWduIDIqKjIxDQo+Pj4+ICAgICAgICAgICAgIGZpbGVzeiAweDAwMDAwMDAw
MDA2YjcwMDAgbWVtc3ogMHgwMDAwMDAwMDAwNmI3MDAwIGZsYWdzIHJ3LQ0KPj4+PiAgICAg
ICAgTE9BRCBvZmYgICAgMHgwMDAwMDAwMDAyMDAwMDAwIHZhZGRyIDB4MDAwMDAwMDAwMDAw
MDAwMCBwYWRkcg0KPj4+PiAweDAwMDAwMDAwMDJjYjcwMDAgYWxpZ24gMioqMjENCj4+Pj4g
ICAgICAgICAgICAgZmlsZXN6IDB4MDAwMDAwMDAwMDAzMTJhOCBtZW1zeiAweDAwMDAwMDAw
MDAwMzEyYTggZmxhZ3MgcnctDQo+Pj4+ICAgICAgICBMT0FEIG9mZiAgICAweDAwMDAwMDAw
MDIwZTkwMDAgdmFkZHIgMHhmZmZmZmZmZjgyY2U5MDAwIHBhZGRyDQo+Pj4+IDB4MDAwMDAw
MDAwMmNlOTAwMCBhbGlnbiAyKioyMQ0KPj4+PiAgICAgICAgICAgICBmaWxlc3ogMHgwMDAw
MDAwMDAwMWZkMDAwIG1lbXN6IDB4MDAwMDAwMDAwMDMxNzAwMCBmbGFncyByd3gNCj4+Pg0K
Pj4+IDIwZTkwMDAgKyAzMTcwMDAgPSAyNDAwMDANCj4+Pg0KPj4+PiAgICAgICAgTk9URSBv
ZmYgICAgMHgwMDAwMDAwMDAxNjVkZjEwIHZhZGRyIDB4ZmZmZmZmZmY4MjQ1ZGYxMCBwYWRk
cg0KPj4+PiAweDAwMDAwMDAwMDI0NWRmMTAgYWxpZ24gMioqMg0KPj4+PiAgICAgICAgICAg
ICBmaWxlc3ogMHgwMDAwMDAwMDAwMDAwMjA0IG1lbXN6IDB4MDAwMDAwMDAwMDAwMDIwNCBm
bGFncyAtLS0NCj4+Pj4NCj4+Pj4NCj4+Pj4gU2VjdGlvbnM6DQo+Pj4+IElkeCBOYW1lICAg
ICAgICAgIFNpemUgICAgICBWTUEgICAgICAgICAgICAgICBMTUEgICAgICAgICAgICAgICBG
aWxlIG9mZiAgQWxnbg0KPj4+PiAuLi4NCj4+Pj4gICAgIDMwIC5zbXBfbG9ja3MgICAgMDAw
MDkwMDAgIGZmZmZmZmZmODJlZGMwMDAgIDAwMDAwMDAwMDJlZGMwMDAgIDAyMmRjMDAwICAy
KioyDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBBTExPQywgTE9BRCwg
UkVBRE9OTFksIERBVEENCj4+Pj4gICAgIDMxIC5kYXRhX25vc2F2ZSAgMDAwMDEwMDAgIGZm
ZmZmZmZmODJlZTUwMDAgIDAwMDAwMDAwMDJlZTUwMDAgIDAyMmU1MDAwICAyKioyDQo+Pj4+
ICAgICAgICAgICAgICAgICAgICAgIENPTlRFTlRTLCBBTExPQywgTE9BRCwgREFUQQ0KPj4+
PiAgICAgMzIgLmJzcyAgICAgICAgICAwMDExYTAwMCAgZmZmZmZmZmY4MmVlNjAwMCAgMDAw
MDAwMDAwMmVlNjAwMCAgMDIyZTYwMDAgIDIqKjEyDQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgIEFMTE9DDQo+Pj4NCj4+PiAyZWU2MDAwICsgMTFhMDAwID0gMjQwMDAwDQo+Pj4NCj4+
Pj4gICAgIDMzIC5icmsgICAgICAgICAgMDAwMjYwMDAgIGZmZmZmZmZmODMwMDAwMDAgIGZm
ZmZmZmZmODMwMDAwMDAgIDAwMDAwMDAwICAyKiowDQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgIEFMTE9DDQo+Pj4NCj4+PiBUaGlzIHNwYWNlIGlzbid0IGNvdmVyZWQgYnkgYW55IHBy
b2dyYW0gaGVhZGVyLiBXaGljaCBpbiB0dXJuIG1heSBiZSBhDQo+Pj4gcmVzdWx0IG9mIGl0
cyBMTUEgbWF0Y2hpbmcgaXRzIFZNQSwgdW5saWtlIGZvciBhbGwgb3RoZXIgc2VjdGlvbnMu
DQo+Pj4gTG9va3MgbGlrZSBhIGxpbmtlciBzY3JpcHQgb3IgbGlua2VyIGlzc3VlIHRvIG1l
OiBXaGlsZSAuLi4NCj4+Pg0KPj4+PiBBbmQgdGhlIHJlbGF0ZWQgbGlua2VyIHNjcmlwdCBw
YXJ0Og0KPj4+Pg0KPj4+PiAgICAgICAgICAgIF9fZW5kX29mX2tlcm5lbF9yZXNlcnZlID0g
LjsNCj4+Pj4NCj4+Pj4gICAgICAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4+Pj4g
ICAgICAgICAgICAuYnJrIChOT0xPQUQpIDogQVQoQUREUiguYnJrKSAtIExPQURfT0ZGU0VU
KSB7DQo+Pj4NCj4+PiAuLi4gdGhpcyBBVCgpIGxvb2tzIGNvcnJlY3QgdG8gbWUsIEknbSB1
bmNlcnRhaW4gb2YgdGhlIHVzZSBvZiBOT0xPQUQuDQo+Pj4gTm90ZSB0aGF0IC5ic3MgZG9l
c24ndCBoYXZlIE5PTE9BRCwgbWF0Y2hpbmcgdGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhlDQo+
Pj4gbGlua2VyIHNjcmlwdHMgbGQgaXRzZWxmIGhhcy4NCj4+DQo+PiBZZWFoLCBidXQgdGhl
IGZpbGVzeiBhbmQgbWVtc3ogdmFsdWVzIG9mIHRoZSAuYnNzIHJlbGF0ZWQgcHJvZ3JhbSBo
ZWFkZXINCj4+IGRpZmZlciBhIGxvdCAoYmFzaWNhbGx5IGJ5IHRoZSAuYnNzIHNpemUgcGx1
cyBzb21lIGFsaWdubWVudCksDQo+IA0KPiBUaGF0J3MgdGhlIHZlcnkgbmF0dXJlIG9mIC5i
c3MgLSBubyBkYXRhIHRvIGJlIGxvYWRlZCBmcm9tIHRoZSBmaWxlLg0KPiANCj4+IGFuZCB0
aGUNCj4+IC5ic3Mgc2VjdGlvbiBmbGFncyBjbGVhcmx5IHNheSB0aGF0IGl0cyBhdHRyaWJ1
dGVzIG1hdGNoIHRob3NlIG9mIC5icmsuDQo+Pg0KPj4gSSdtIG5vdCBzdXJlIHdoeSB0aGUg
bGlua2VyIHdvdWxkbid0IGFkZCAuYnJrIHRvIHRoZSBzYW1lIHBncm9ncmFtDQo+PiBoZWFk
ZXIgZW50cnkgYXMgLmJzcywgYnV0IG1heWJlIHRoYXQgaXMgc29tZSAuYnNzIHNwZWNpYWwg
aGFuZGxpbmcuDQo+IA0KPiBJIGRvbid0IGtub3cgZWl0aGVyLCBidXQgSSBzdXNwZWN0IHRo
aXMgdG8gYmUgYW4gZWZmZWN0IG9mIHVzaW5nIE5PTE9BRA0KPiAod2l0aG91dCBtZWFuaW5n
IHRvIGRlY2lkZSB5ZXQgd2hldGhlciBpdCdzIGEgd3JvbmcgdXNlIG9mIHRoZQ0KPiBhdHRy
aWJ1dGUgb3IgYmFkIGhhbmRsaW5nIG9mIGl0IGluIGxkKS4NCg0KSSBqdXN0IGRpZCBhIHRl
c3Q6IGRyb3BwaW5nIHRoZSAiKE5PTE9BRCkiIGZvciAuYnJrIGluIHRoZSBsaW5rZXIgc2Ny
aXB0DQp3aWxsIHJlc3VsdCBpbiB0aGUgLmJyayBzZWN0aW9uIHRvIGJlIGluY2x1ZGVkIGlu
IHRoZSBzYW1lIHByb2dyYW0gaGVhZGVyDQphcyB0aGUgLmJzcyBzZWN0aW9uLg0KDQpJJ2xs
IHN0YXJ0IGFuIHVwc3RyZWFtIGRpc2N1c3Npb24gdG8gZHJvcCBpdCAoSSBjb3VsZCBpbWFn
aW5lIHByb2JsZW1zDQplLmcuIHdoZW4gdXNpbmcgZ3J1YiwgYXMgZ3J1YiBtaWdodCBwbGFj
ZSB0aGUgaW5pdHJkIG92ZXJsYXBwaW5nIHRoZSAuYnJrDQpzZWN0aW9uIHdoZW4gbm90IHVz
aW5nIGEgY29tcHJlc3NlZCBrZXJuZWwpLg0KDQoNCkp1ZXJnZW4NCg==
--------------Bm50bso9g0bAJKDrSANDU400
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Bm50bso9g0bAJKDrSANDU400--

--------------Fxzc9x3xaB5Kh5ovmqmwFIw3--

--------------Wa9i16KM0SYF2M0tZg1Q0ZvM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0L58FAwAAAAAACgkQsN6d1ii/Ey+8
VAf/e0JzVYOJiY8a/KROmbwbVn81vi9tyVvYGpkOp0wVE1/jS8T6sa9qwvRKFV4RhsTllh7kwhl/
T+Kt4W5p87CP+F78eC8WyYgxd1BW+bgLBZx2166E1wQtPACBP2aIZgHs6elodL39khMcrJKcFqEr
vu/dAlDIcHdqQG3cjHR3PhiPl30H4O+B3AsXDaR2zepARzL0jZ7abOtZ9gyr5eKWnyJ5zVAu6DWF
DyXRD3x98Qa1m9dFjCekekA0jDr5wKusGQbge/AKClEqLaus2mhlJY2HiWyDYhp441nKm40tq0cG
j/N/xDpjPZZtdnDQTcK5YLvld4pLIB68jB66VXbMUw==
=KV39
-----END PGP SIGNATURE-----

--------------Wa9i16KM0SYF2M0tZg1Q0ZvM--

