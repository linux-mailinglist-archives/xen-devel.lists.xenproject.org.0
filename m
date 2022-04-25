Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4350DFB4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312842.530233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixXC-0003Uy-FF; Mon, 25 Apr 2022 12:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312842.530233; Mon, 25 Apr 2022 12:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixXC-0003Se-Bk; Mon, 25 Apr 2022 12:09:42 +0000
Received: by outflank-mailman (input) for mailman id 312842;
 Mon, 25 Apr 2022 12:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y4oX=VD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nixXB-0003SY-D5
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:09:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f778c08-c490-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:09:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A29FE210E6;
 Mon, 25 Apr 2022 12:09:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52CF113AE1;
 Mon, 25 Apr 2022 12:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5iLnEoOPZmK/YwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 25 Apr 2022 12:09:39 +0000
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
X-Inumbo-ID: 8f778c08-c490-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650888579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/Tf26Emd3YPjxAeDv9s1PSKm4LldHI3cxTPdJi93NM=;
	b=Y3lez5qVB7s7aDPR6Kas6pisArEMHJ5VtWULiW8rVVdnWOTru0HPV7E1NzxrFU7c0mE+Dx
	fnLtsx1dOqCgmBPGu/xxVfeghhn6/1V8O9RQGKjBnMK8Onw79She54Tswwxaiw4yM5p1si
	yrH9mi2I5OV5+N5Ph69QhJDhe7Z+eEU=
Message-ID: <e657458d-d33e-a340-d9fe-152ec97eefec@suse.com>
Date: Mon, 25 Apr 2022 14:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
 <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
In-Reply-To: <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LHWQIBAnaq1gZu1OUg0MSNfJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LHWQIBAnaq1gZu1OUg0MSNfJ
Content-Type: multipart/mixed; boundary="------------3s00QFrS0Gro6Wx8qDIOt0sW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <e657458d-d33e-a340-d9fe-152ec97eefec@suse.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <6864c64b-246d-7ca4-371a-61d4953a781d@suse.com>
 <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>
In-Reply-To: <e6858f79-2cc2-2bfc-07db-8c46aa1dd81f@gmail.com>

--------------3s00QFrS0Gro6Wx8qDIOt0sW
Content-Type: multipart/mixed; boundary="------------YMyFqIogwEBzguV1hNA6Qq5o"

--------------YMyFqIogwEBzguV1hNA6Qq5o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDQuMjIgMTQ6MDIsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IE9uIDI1LjA0LjIy
IDEwOjQzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiANCj4gDQo+IEhlbGxvIEp1ZXJnZW4N
Cj4gDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+PiBPbiAwOC4w
NC4yMiAyMDoyMSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4gRnJvbTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
DQo+Pj4gVGhpcyBwYXRjaCBhZGRzIGJhc2ljIHN1cHBvcnQgZm9yIGNvbmZpZ3VyaW5nIGFu
ZCBhc3Npc3RpbmcgdmlydGlvLW1taW8NCj4+PiBiYXNlZCB2aXJ0aW8tZGlzayBiYWNrZW5k
IChlbXVhbGF0b3IpIHdoaWNoIGlzIGludGVuZGVkIHRvIHJ1biBvdXQgb2YNCj4+PiBRZW11
IGFuZCBjb3VsZCBiZSBydW4gaW4gYW55IGRvbWFpbi4NCj4+PiBBbHRob3VnaCB0aGUgVmly
dGlvIGJsb2NrIGRldmljZSBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0cmFkaXRpb25hbA0K
Pj4+IFhlbiBQViBibG9jayBkZXZpY2UgKHZiZCkgZnJvbSB0aGUgdG9vbHN0YWNrJ3MgcG9p
bnQgb2YgdmlldzoNCj4+PiDCoCAtIGFzIHRoZSBmcm9udGVuZCBpcyB2aXJ0aW8tYmxrIHdo
aWNoIGlzIG5vdCBhIFhlbmJ1cyBkcml2ZXIsIG5vdGhpbmcNCj4+PiDCoMKgwqAgd3JpdHRl
biB0byBYZW5zdG9yZSBhcmUgZmV0Y2hlZCBieSB0aGUgZnJvbnRlbmQgKHRoZSB2ZGV2IGlz
IG5vdA0KPj4+IMKgwqDCoCBwYXNzZWQgdG8gdGhlIGZyb250ZW5kKQ0KPj4NCj4+IEkgdGhv
dWdodCBhYm91dCB0aGUgZnV0dXJlIHN1cHBvcnQgb24geDg2Lg0KPj4NCj4+IFRoZXJlIHdl
IGRvbid0IGhhdmUgYSBkZXZpY2UgdHJlZSAoYW5kIEkgZG9uJ3Qgd2FudCB0byBpbnRyb2R1
Y2UgaXQpLA0KPj4gc28gdGhlIG9ubHkgd2F5cyB0byBzcGVjaWZ5IHRoZSBiYWNrZW5kIGRv
bWFpbiBpZCB3b3VsZCBiZSB0bzoNCj4+DQo+PiAtIGFkZCBzb21lIGluZm9ybWF0aW9uIHRv
IEFDUEkgdGFibGVzDQo+PiAtIHVzZSBib290IHBhcmFtZXRlcnMNCj4+IC0gdXNlIFhlbnN0
b3JlDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCwgYW5kIGFncmVlDQo+IA0KPiANCj4+IFRo
aW5raW5nIGZ1cnRoZXIgb2YgaG90cGx1Z2dpbmcgdmlydGlvIGRldmljZXMsIFhlbnN0b3Jl
IHNlZW1zIHRvIGJlIHRoZQ0KPj4gb25seSByZWFsIHN1aXRhYmxlIGFsdGVybmF0aXZlLiBV
c2luZyB2aXJ0aW8gbWVjaGFuaXNtcyBkb2Vzbid0IHNlZW0NCj4+IGFwcHJvcHJpYXRlLCBh
cyBzdWNoIGluZm9ybWF0aW9uIHNob3VsZCBiZSByZXRyaWV2ZWQgaW4gInBsYXRmb3JtDQo+
PiBzcGVjaWZpYyIgd2F5cyAoc2VlIGUuZy4gc3BlY2lmeWluZyBhbiAiZW5kcG9pbnQiIGlu
IHRoZSB2aXJ0aW8gSU9NTVUNCj4+IGRldmljZSBbMV0sIFsyXSkuIEkgdGhpbmsgdGhlIFhl
bnN0b3JlIGluZm9ybWF0aW9uIGZvciB0aGF0IHB1cnBvc2UNCj4+IGNvdWxkIGJlIHJhdGhl
ciBtaW5pbWFsIGFuZCBpdCBzaG91bGQgYmUgZGV2aWNlLXR5cGUgYWdub3N0aWMuIEhhdmlu
Zw0KPj4ganVzdCBhIGRpcmVjdG9yeSB3aXRoIGVuZHBvaW50cyBhbmQgYXNzb2NpYXRlZCBi
YWNrZW5kIGRvbWlkcyB3b3VsZA0KPj4gcHJvYmFibHkgYmUgZW5vdWdoIChub3QgbmVlZGVk
IGluIHRoaXMgc2VyaWVzLCBvZiBjb3Vyc2UpLg0KPiANCj4gSnVzdCB0byBtYWtlIGl0IGNs
ZWFyLCB3ZSBhcmUgc3BlYWtpbmcgYWJvdXQgdGhlIHBvc3NpYmxlIHdheXMgdG8gY29tbXVu
aWNhdGUgDQo+IGJhY2tlbmQgZG9taWQgZm9yIGFub3RoZXIgc2VyaWVzIFsxXSwgc28gYWJv
dXQgdGhlIHg4NidzIGFsdGVybmF0aXZlIG9mIA0KPiBkZXZpY2UtdHJlZSBiaW5kaW5ncyAi
eGVuLGRldi1kb21pZCIgWzJdLg0KPiBJIHdhcyB0aGlua2luZyB3ZSBjb3VsZCBhdm9pZCB1
c2luZyBYZW5zdG9yZSBhdCB0aGUgZ3Vlc3Qgc2lkZSBmb3IgdGhhdCBwdXJwb3NlLCANCj4g
YnV0IEkgZGlkbid0IHRoaW5rIGFib3V0IGhvdHBsdWcuLi4NCj4gSSBhc3N1bWUsIGFsbCBY
ZW5zdG9yZSBiaXRzIHdvdWxkbid0IGdvIHRoZSBvdXRzaWRlIFhlbiBncmFudCBETUEtbWFw
cGluZyBsYXllciANCj4gKGdyYW50LWRtYS1vcHMuYyk/DQoNCkkgdGhpbmsgaXQgd291bGQg
YmUgYW5vdGhlciBkcml2ZXIgdW5kZXIgZHJpdmVycy94ZW4vIHdpdGhvdXQgdGhlIG5lZWQg
dG8NCnRvdWNoIGFueSBvdGhlciBmcm9udGVuZCByZWxhdGVkIGZpbGUgb3IgWGVuLXJlbGF0
ZWQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljDQpjb2RlLg0KDQo+PiBBbmQgd2l0aCB0aGUgaG90
cGx1ZyBvcHRpb24gaW4gbWluZCBJIHN0YXJ0IHRvIGZlZWwgdW51ZWFzeSB3aXRoIG5hbWlu
Zw0KPj4gdGhlIG5ldyBYZW5zdG9yZSBub2RlICJwcm90b2NvbCIsIGFzIHRoZSBmcm9udGVu
ZCBkaXNrIG5vZGVzIGZvciAibm9ybWFsIg0KPj4gZGlza3MgYWxyZWFkeSBoYXZlIGEgInBy
b3RvY29sIiBlbnRyeSBzcGVjaWZ5aW5nIDY0LSBvciAzMi1iaXQgcHJvdG9jb2wuDQo+IA0K
PiANCj4gSSBub3RpY2VkIHRoZSAicHJvdG9jb2wiIG5vZGUgYXQgdGhlIGZyb250ZW5kIHNp
ZGUgZm9yIHRyYWRpdGlvbmFsIFhlbiBQViBibG9jayANCj4gZGV2aWNlIHdoaWNoIGhhbmRs
ZXMgeWV0IGFub3RoZXIgcHVycG9zZSwgYnV0IEkgZGlkbid0IHRoaW5rIG11Y2ggYWJvdXQg
aXQNCj4gc2luY2UgdGhlIG5ldyAicHJvdG9jb2wiIG5vZGUgaW4gb25seSBmb3IgdGhlIGJh
Y2tlbmQncyB1c2UuIElmIHdlIHN0YXJ0IA0KPiB0aGlua2luZyBvZiBmcm9udGVuZCdzIFhl
bnN0b3JlIG5vZGVzLCB0aGVuIHllcywgd2lsbCBjbGFzaC4uLg0KPiANCj4+DQo+Pg0KPj4g
TWF5YmUgd2Ugc2hvdWxkIHJlYWxseSBuYW1lIGl0ICJ0cmFuc3BvcnQiIGluc3RlYWQ/DQo+
IA0KPiAuLi4gRm9yIG1lIHRoZSAidHJhbnNwb3J0IiBuYW1lIGlzIGFzc29jaWF0ZWQgd2l0
aCB2aXJ0aW8gdHJhbnNwb3J0czogbW1pbywgcGNpLCANCj4gY2N3LiBCdXQsIEkgd291bGQg
YmUgb2sgd2l0aCB0aGF0IG5hbWUuIEFub3RoZXIgcG9zc2libGUgbmFtZSBjb3VsZCBiZSAN
Cj4gInNwZWNpZmljYXRpb24iLg0KDQpZZWFoLCBsb29raW5nIGF0IHRoZSB2aXJ0aW8gc3Bl
YyB0aGlzIG1ha2VzIHNlbnNlLg0KDQpTbyBJIHdvdWxkIGJlIGZpbmUgd2l0aCAic3BlY2lm
aWNhdGlvbiIuDQoNCj4+PiAtIEFkZCBuZXcgZGV2aWNlIGtpbmQgKExJQlhMX19ERVZJQ0Vf
S0lORF9WSVJUSU9fRElTSykgYXMgY3VycmVudA0KPj4+IMKgwqAgb25lIChMSUJYTF9fREVW
SUNFX0tJTkRfVkJEKSBkb2Vzbid0IGZpdCBpbnRvIFZpcnRpbyBkaXNrIG1vZGVsDQo+Pj4N
Cj4+PiBBbiBleGFtcGxlIG9mIGRvbWFpbiBjb25maWd1cmF0aW9uIGZvciBWaXJ0aW8gZGlz
azoNCj4+PiBkaXNrID0gWyAncGh5Oi9kZXYvbW1jYmxrMHAzLCB4dmRhMSwgYmFja2VuZHR5
cGU9b3RoZXIsIHByb3RvY29sPXZpcnRpby1tbWlvJ10NCj4+DQo+PiBXaXRoIFJvZ2VyJ3Mg
ZmVlZGJhY2sgdGhpcyB3b3VsZCB0aGVuIGJlICJ0cmFuc3BvcnQ9dmlydGlvIiwgdGhlICJt
bWlvIg0KPj4gcGFydCBzaG91bGQgdGhlbiBiZSBzb21ldGhpbmcgbGlrZSAiYWRhcHRlcj1t
bWlvIiAoaW4gY29udHJhc3QgdG8NCj4+ICJhZGFwdGVyPXBjaSIpLCBhbmQgImFkYXB0ZXIi
IG9ubHkgbmVlZGVkIGluIGNhc2Ugb2YgYSBkZXZpY2UgdHJlZSBhbmQNCj4+IFBDSSBiZWlu
ZyBhdmFpbGFibGUuDQo+IA0KPiBvaywgd2lsbCByZW5hbWUuIENhbiB3ZSBhZGQgImFkYXB0
ZXIiIChvciB3aGVuZXZlciB0aGUgbmFtZSB3b3VsZCBiZSkgb3B0aW9uIA0KPiBsYXRlciwg
d2hlbiB0aGVyZSBpcyBhIHJlYWwgbmVlZD8gRm9yIG5vdywgSSBtZWFuIHdpdGhpbiB0aGUg
Y3VycmVudCBzZXJpZXMgDQo+IHdoaWNoIGFkZHMgb25seSB2aXJ0aW8tbW1pbyBiaXRzIG9u
IEFybSwgd2UgY2FuIGFzc3VtZSB0aGF0ICJ0cmFuc3BvcnQ9dmlydGlvIiANCj4gaW1wbGll
cyB1c2luZyB2aXJ0aW8tbW1pby4NCg0KWWVzLCB3ZSBzaG91bGQgYWRkIGl0IG9ubHkgd2hl
biBuZWVkZWQuDQoNCj4gDQo+IEJUVywgaWYgd2UgbmFtZWQgdGhlIG1haW4gb3B0aW9uICJz
cGVjaWZpY2F0aW9uIiwgdGhlIHNlY29uZGFyeSBvcHRpb24gDQo+ICJ0cmFuc3BvcnQiIHdv
dWxkIGdvb2QgZml0IGZyb20gbXkgUG9WLg0KPiBGb3IgZXhhbXBsZToNCj4gZGlzayA9IFsg
J3BoeTovZGV2L21tY2JsazBwMywgeHZkYTEsIGJhY2tlbmR0eXBlPW90aGVyLCBzcGVjaWZp
Y2F0aW9uPXZpcnRpbywgDQo+IHRyYW5zcG9ydD1tbWlvJ10NCg0KRmluZSB3aXRoIG1lLg0K
DQoNCkp1ZXJnZW4NCg==
--------------YMyFqIogwEBzguV1hNA6Qq5o
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YMyFqIogwEBzguV1hNA6Qq5o--

--------------3s00QFrS0Gro6Wx8qDIOt0sW--

--------------LHWQIBAnaq1gZu1OUg0MSNfJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJmj4IFAwAAAAAACgkQsN6d1ii/Ey+r
+wgAighZes82dQ96i/zPzrJc+9wxnH/3ZfjP0k0NdbiJExzsqj6IwC00xM+MlvyXfWc8kj5BMrlB
PWDbNqgbbxZhq1tj0BGVLlLN4uS2/BDOCsUq0hRZ71B3+WiLHDd9HNQ2UpRRM9v5xmCwDDD2LmvR
aRNjyvkAUXKIyAev+Nl4rHOTQaWh6knX8acdO0yg86d87PwJKqNFubAvpF99BlArm+n+aEDi767z
1bJaZmysfiDInN1anFlkwXzjUEfjdvbFTQwwf5mV8HU7cufRZZntiJRbuBktZaUotfJRryCGoHKL
FruWUGc66hxGCIroiKv/lpiYKPeQxbqa4Mc757x2pQ==
=zXYt
-----END PGP SIGNATURE-----

--------------LHWQIBAnaq1gZu1OUg0MSNfJ--

