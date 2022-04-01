Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A84EEB65
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297314.506418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEbz-00024j-1F; Fri, 01 Apr 2022 10:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297314.506418; Fri, 01 Apr 2022 10:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEby-000225-Tk; Fri, 01 Apr 2022 10:34:34 +0000
Received: by outflank-mailman (input) for mailman id 297314;
 Fri, 01 Apr 2022 10:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1naEbx-00021z-LK
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:34:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50fc3838-b1a7-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 12:34:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B10621A98;
 Fri,  1 Apr 2022 10:34:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 392DE132C1;
 Fri,  1 Apr 2022 10:34:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nlFiDDfVRmIvfAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Apr 2022 10:34:31 +0000
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
X-Inumbo-ID: 50fc3838-b1a7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648809271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnvunBp12WVZ5MfSOIaP/1IkLI2hQWFNdjbD04ScTMI=;
	b=OyZ81FAr1IYiPTY7vCte+heJfRr+Nlz9ePtE9rnkrn6urynuBgx+Q2m9O7jrMFAn43wtIz
	XY0RZFp3vrog3O+uAvux/2kybX+OyhCaCbUfMCf6fSuksgI8/be91kljxEL/UHY3bXly92
	a3WqIeMZdlv1DfNnesAaTiOEoxEZRTE=
Message-ID: <2b5ef30a-5164-c685-e3bb-24dd29ad4236@suse.com>
Date: Fri, 1 Apr 2022 12:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-5-sstabellini@kernel.org>
 <395710eb-ba51-eb67-1519-2a949326f699@xen.org>
 <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
 <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop>
 <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qUMytYHzjO0weO8DwlM069mT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qUMytYHzjO0weO8DwlM069mT
Content-Type: multipart/mixed; boundary="------------sl1yTNdcFLrfAQlxex87YKgm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2b5ef30a-5164-c685-e3bb-24dd29ad4236@suse.com>
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-5-sstabellini@kernel.org>
 <395710eb-ba51-eb67-1519-2a949326f699@xen.org>
 <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
 <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop>
 <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
In-Reply-To: <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>

--------------sl1yTNdcFLrfAQlxex87YKgm
Content-Type: multipart/mixed; boundary="------------CAz4mKPLj6aqvA3XUWVyA7OQ"

--------------CAz4mKPLj6aqvA3XUWVyA7OQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDQuMjIgMTI6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgU3RlZmFubywN
Cj4gDQo+IE9uIDAxLzA0LzIwMjIgMDE6MzUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToN
Cj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoCAvKiBBbGxvYyBtYWdpYyBwYWdlcyAqLw0KPj4+
Pj4+ICvCoMKgwqAgaWYgKGFsbG9jX21hZ2ljX3BhZ2VzKGluZm8sICZkb20pICE9IDApIHsN
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJvciBvbiBhbGxvYyBtYWdpYyBw
YWdlc1xuIik7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0KPj4+Pj4+ICvC
oMKgwqAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIHhjX2RvbV9nbnR0YWJfaW5pdCgm
ZG9tKTsNCj4+Pj4+DQo+Pj4+PiBUaGlzIGNhbGwgYXMgdGhlIHJpc2sgdG8gYnJlYWsgdGhl
IGd1ZXN0IGlmIHRoZSBkb20wIExpbnV4IGRvZXNuJ3Qgc3VwcG9ydA0KPj4+Pj4gdGhlDQo+
Pj4+PiBhY3F1aXJlIGludGVyZmFjZS4gVGhpcyBpcyBiZWNhdXNlIGl0IHdpbGwgcHVuY2gg
YSBob2xlIGluIHRoZSBkb21haW4NCj4+Pj4+IG1lbW9yeQ0KPj4+Pj4gd2hlcmUgdGhlIGdy
YW50LXRhYmxlIG1heSBoYXZlIGFscmVhZHkgYmVlbiBtYXBwZWQuDQo+Pj4+Pg0KPj4+Pj4g
QWxzbywgdGhpcyBmdW5jdGlvbiBjb3VsZCBmYWlscy4NCj4+Pj4NCj4+Pj4gSSdsbCBjaGVj
ayBmb3IgcmV0dXJuIGVycm9ycy4gRG9tMGxlc3MgaXMgZm9yIGZ1bGx5IHN0YXRpYw0KPj4+
PiBjb25maWd1cmF0aW9ucyBzbyBJIHRoaW5rIGl0IGlzIE9LIHRvIHJldHVybiBlcnJvciBh
bmQgYWJvcnQgaWYNCj4+Pj4gc29tZXRoaW5nIHVuZXhwZWN0ZWQgaGFwcGVuczogZG9tMGxl
c3MnIG1haW4gcmVhc29uIGZvciBiZWluZyBpcyB0aGF0DQo+Pj4+IHRoZXJlIGlzIG5vdGhp
bmcgdW5leHBlY3RlZCA6LSkNCj4+PiBEb2VzIHRoaXMgbWVhbiB0aGUgY2FsbGVyIHdpbGwg
aGF2ZSB0byByZWJvb3QgdGhlIHN5c3RlbSBpZiB0aGVyZSBpcyBhbiBlcnJvcj8NCj4+PiBJ
T1csIHdlIGRvbid0IGV4cGVjdCB0aGVtIHRvIGNhbGwgLi9pbml0LWRvbTBsZXNzIHR3aWNl
Lg0KPj4NCj4+IFllcywgZXhhY3RseS4gSSB0aGluayBpbml0LWRvbTBsZXNzIGNvdWxkIGV2
ZW4gcGFuaWMuIE15IG1lbnRhbCBtb2RlbCBpcw0KPj4gdGhhdCB0aGlzIGlzIGFuICJleHRl
bnNpb24iIG9mIGNvbnN0cnVjdF9kb21VLiBPdmVyIHRoZXJlIHdlIGp1c3QgcGFuaWMNCj4+
IGlmIHNvbWV0aGluZyBpcyB3cm9uZyBhbmQgaGVyZSBpdCB3b3VsZCBiZSBzaW1pbGFyLiBU
aGUgdXNlciBwcm92aWRlZCBhDQo+PiB3cm9uZyBjb25maWcgYW5kIHNob3VsZCBmaXggaXQu
DQo+IA0KPiBPay4gSSB0aGluayB3ZSBzaG91bGQgbWFrZSBleHBsaWNpdCBob3cgaXQgY2Fu
IGJlIHVzZWQuDQo+IA0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIGxpYnhsX3V1aWRfZ2Vu
ZXJhdGUoJnV1aWQpOw0KPj4+Pj4+ICvCoMKgwqAgeGNfZG9tYWluX3NldGhhbmRsZShkb20u
eGNoLCBpbmZvLT5kb21pZCwNCj4+Pj4+PiBsaWJ4bF91dWlkX2J5dGVhcnJheSgmdXVpZCkp
Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIHJjID0gZ2VuX3N0dWJfanNvbl9jb25maWco
aW5mby0+ZG9taWQsICZ1dWlkKTsNCj4+Pj4+PiArwqDCoMKgIGlmIChyYykNCj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgZXJyKDEsICJnZW5fc3R1Yl9qc29uX2NvbmZpZyIpOw0KPj4+Pj4+
ICsNCj4+Pj4+PiArwqDCoMKgIHJjID0gcmVzdG9yZV94ZW5zdG9yZSh4c2gsIGluZm8sIHV1
aWQsIGRvbS54ZW5zdG9yZV9ldnRjaG4pOw0KPj4+Pj4+ICvCoMKgwqAgaWYgKHJjKQ0KPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIoMSwgIndyaXRpbmcgdG8geGVuc3RvcmUiKTsNCj4+
Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoCB4c19pbnRyb2R1Y2VfZG9tYWluKHhzaCwgaW5mby0+
ZG9taWQsDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKEdVRVNUX01BR0lDX0JB
U0UgPj4gWENfUEFHRV9TSElGVCkgKyBYRU5TVE9SRV9QRk5fT0ZGU0VULA0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbS54ZW5zdG9yZV9ldnRjaG4pOw0KPj4+Pj4NCj4+
Pj4+IHhzX2ludHJvZHVjZV9kb21haW4oKSBjYW4gdGVjaG5pY2FsbHkgZmFpbHMuDQo+Pj4+
DQo+Pj4+IE9LDQo+Pj4+DQo+Pj4+DQo+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+Pj4+
PiArfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArLyogQ2hlY2sgaWYgZG9tYWluIGhhcyBiZWVuIGNv
bmZpZ3VyZWQgaW4gWFMgKi8NCj4+Pj4+PiArc3RhdGljIGJvb2wgZG9tYWluX2V4aXN0cyhz
dHJ1Y3QgeHNfaGFuZGxlICp4c2gsIGludCBkb21pZCkNCj4+Pj4+PiArew0KPj4+Pj4+ICvC
oMKgwqAgcmV0dXJuIHhzX2lzX2RvbWFpbl9pbnRyb2R1Y2VkKHhzaCwgZG9taWQpOw0KPj4+
Pj4+ICt9DQo+Pj4+Pg0KPj4+Pj4gV291bGQgbm90IHRoaXMgbGVhZCB0byBpbml0aWFsaXpl
IGEgZG9tYWluIHdpdGggUFYgZHJpdmVyIGRpc2FibGVkPw0KPj4+Pg0KPj4+PiBJIGFtIG5v
dCBzdXJlIEkgdW5kZXJzdG9vZCB5b3VyIHF1ZXN0aW9uLCBidXQgSSdsbCB0cnkgdG8gYW5z
d2VyIGFueXdheS4NCj4+Pj4gVGhpcyBjaGVjayBpcyBwdXJlbHkgdG8gZGlzdGluZ3Vpc2gg
ZG9tMGxlc3MgZ3Vlc3RzLCB3aGljaCBuZWVkcyBmdXJ0aGVyDQo+Pj4+IGluaXRpYWxpemF0
aW9ucywgZnJvbSByZWd1bGFyIGd1ZXN0cyAoZS5nLiB4bCBndWVzdHMpIHRoYXQgZG9uJ3Qg
bmVlZA0KPj4+PiBhbnkgYWN0aW9ucyB0YWtlbiBoZXJlLg0KPj4+DQo+Pj4gRG9tMGxlc3Mg
ZG9tVXMgY2FuIGJlIGRpdmlkZWQgaW4gdHdvIGNhdGVnb3JpZXMgYmFzZWQgb24gd2hldGhl
ciB0aGV5IGFyZSB4ZW4NCj4+PiBhd2FyZSAoZS5nLiB4ZW4sZW5oYW5jZWQgaXMgc2V0KS4N
Cj4+Pg0KPj4+IExvb2tpbmcgYXQgdGhpcyBzY3JpcHQsIGl0IHNlZW1zIHRvIGFzc3VtZSB0
aGF0IGFsbCBkb20wbGVzcyBkb21VcyBhcmUgWGVuDQo+Pj4gYXdhcmUuIFNvIGl0IHdpbGwg
ZW5kIHVwIHRvIGFsbG9jYXRlIFhlbnN0b3JlIHJpbmcgYW5kIGNhbGwNCj4+PiB4c19pbnRy
b2R1Y2VfZG9tYWluKCkuIEkgc3VzcGVjdCB0aGUgY2FsbCB3aWxsIGVuZCB1cCB0byBmYWls
IGJlY2F1c2UgdGhlDQo+Pj4gZXZlbnQgY2hhbm5lbCB3b3VsZCBiZSAwLg0KPj4+DQo+Pj4g
U28gZGlkIHlvdSB0cnkgdG8gdXNlIHRoaXMgc2NyaXB0IG9uIGEgcGxhdGZvcm0gd2hlcmUg
dGhlcmUgb25seSB4ZW4gYXdhcmUNCj4+PiBkb21VIGFuZC9vciBhIG1peD8NCj4+DQo+PiBH
b29kIGlkZWEgb2YgYXNraW5nIGZvciB0aGlzIHRlc3QuIEkgdGhvdWdodCBJIGFscmVhZHkg
cmFuIHRoYXQgdGVzdCwNCj4+IGJ1dCBJIGRpZCBpdCBhZ2FpbiB0byBiZSBzdXJlLiBFdmVy
eXRoaW5nIHdvcmtzIE9LIChhbHRob3VnaCB0aGUNCj4+IHhlbnN0b3JlIHBhZ2UgYWxsb2Nh
dGlvbiBpcyB1bm5lZWRlZCkuIHhzX2ludHJvZHVjZV9kb21haW4gZG9lcyBub3QNCj4gID4g
ZmFpbDoNCj4gDQo+IEFyZSB5b3Ugc3VyZT8gSWYgSSBwYXNzIDAgYXMgdGhlIDR0aCBhcmd1
bWVudCAoZXZlbnQgY2hhbm5lbCksIHRoZSBjb21tYW5kIHdpbGwgDQo+IHJldHVybiBFSU5W
QUwuIEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIGNvZGUgeW91IGFyZSBub3QgY2hlY2tpbmcg
dGhlIHJldHVybiBmb3IgDQo+IHRoZSBjYWxsLiBTbyB5b3Ugd2lsbCBjb250aW51ZSBhcyBp
ZiBpdCB3ZXJlIHN1Y2Nlc3NmdWwuDQo+IA0KPiBTbyB5b3Ugd2lsbCBlbmQgdXAgdG8gd3Jp
dGUgbm9kZXMgZm9yIGEgZG9tYWluIFhlbnN0b3JlZCBpcyBub3QgYXdhcmUgYW5kIGFsc28g
DQo+IHNldCBIVk1fUEFSQU1fU1RPUkVfUEZOIHdoaWNoIG1heSBmdXJ0aGVyIGNvbmZ1c2Ug
dGhlIGd1ZXN0IGFzIGl0IG1heSB0cnkgdG8gDQo+IGluaXRpYWxpemUgWGVuc3RvcmVkIGl0
IGRpc2NvdmVycyB0aGUgcGFnZS4NCj4gDQo+PiBJIHRoaW5rIHRoYXQncyBiZWNhdXNlIGl0
IGlzIHVzdWFsbHkgY2FsbGVkIG9uIGFsbCBkb21haW5zIGJ5IHRoZQ0KPj4gdG9vbHN0YWNr
LCBldmVuIHRoZSBvbmVzIHdpdGhvdXQgeGVuc3RvcmUgc3VwcG9ydCBpbiB0aGUga2VybmVs
Lg0KPiANCj4gVGhlIHRvb2xzdGFjayB3aWxsIGFsd2F5cyBhbGxvY2F0ZSB0aGUgZXZlbnQg
Y2hhbm5lbCBpcnJlc3BlY3RpdmUgdG8gd2hldGhlciB0aGUgDQo+IGd1ZXN0IHdpbGwgdXNl
IFhlbnN0b3JlLiBTbyBib3RoIHRoZSBzaGFyZWQgcGFnZSBhbmQgdGhlIGV2ZW50IGNoYW5u
ZWwgYXJlIA0KPiBhbHdheXMgdmFsaWQgdG9kYXkuDQo+IA0KPiBXaXRoIHlvdXIgc2VyaWVz
LCB0aGlzIHdpbGwgY2hhbmdlIGFzIHRoZSBldmVudCBjaGFubmVsIHdpbGwgbm90IGJlIGFs
bG9jYXRlZCANCj4gd2hlbiAieGVuLGVuaGFuY2VkIiBpcyBub3Qgc2V0Lg0KPiANCj4gSW4g
eW91ciBjYXNlLCBJIHRoaW5rIHdlIG1heSB3YW50IHRvIHJlZ2lzdGVyIHRoZSBkb21haW4g
dG8geGVuc3RvcmUgYnV0IHNheSANCj4gdGhlcmUgYXJlIG5vIGNvbm5lY3Rpb24gYXZhaWxh
YmxlIGZvciB0aGUgZG9tYWluLiBKdWVyZ2VuLCB3aGF0IGRvIHlvdSB0aGluaz8NCg0KSW4g
bXkgb3BpbmlvbiBzdWNoIGEgZG9tYWluIHNob3VsZCBub3QgYmUgcmVnaXN0ZXJlZCB3aXRo
IFhlbnN0b3JlLg0KDQpBdCBsZWFzdCBDLXhlbnN0b3JlZCBzaG91bGQgd29yayBtb3N0bHkg
Y29ycmVjdGx5LiBJIHRoaW5rIHRoZQ0KImludHJvZHVjZWQiIHN0YXR1cyBpcyB0ZXN0ZWQg
ZXZlcnl3aGVyZSBpdCBzaG91bGQgYmUgdGVzdGVkLg0KDQpCYXNpY2FsbHkgdGhpcyBpcyBz
aW1pbGFyIHRvIHRvZGF5J3Mgc3RhdHVzIG9mIHhlbnN0b3JlLXN0dWJkb206IGl0DQppcyBu
ZXZlciBpbnRyb2R1Y2VkLCBidXQgWGVuc3RvcmUgaXRzZWxmIGlzIGhhcHB5IHdpdGggaXQg
ZXhpc3RpbmcuIDotKQ0KDQpBbmQgZXZlbiB0b2RheSB0aGUgZmlyc3Qgbm9kZXMgZm9yIGEg
bmV3IGRvbWFpbiBhcmUgYmVpbmcgY3JlYXRlZA0KYmVmb3JlIHRoZSBkb21haW4gaXMgb2Zm
aWNpYWxseSBpbnRyb2R1Y2VkLg0KDQoNCkp1ZXJnZW4NCg==
--------------CAz4mKPLj6aqvA3XUWVyA7OQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CAz4mKPLj6aqvA3XUWVyA7OQ--

--------------sl1yTNdcFLrfAQlxex87YKgm--

--------------qUMytYHzjO0weO8DwlM069mT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJG1TYFAwAAAAAACgkQsN6d1ii/Ey/M
egf/SLJGHdxMdLVsN0djz8pDiFxUGVrrRHjz9COtCURsIg1s6t8jTE8sknZRn9W4nZhVOOi6OI3C
9z+ZIX8WjgY76PJfCcuJtigqrbf7HshUDT0Y/z+dNQ5Conxd3O2IN6jftG94tTbFlk+5jq/9MCZL
zOGDzttE+cWS64+5YQNaM7sYxzI57QnH9J3US5d0H6lRCoKXo2HoKeD2aQwRHBZR/+pMG45rMjTD
dOej4NAUnTUR5aWNS2/E++wWgsln1Dl2+ojE/YtFN3IqqKlitfiKxKH7F3Qb+MVjwHOKx6BPIefy
BEaVPrHtINux63eJI+8Tg5JeXBSyO3Lf5dGdu4V7HQ==
=BzoV
-----END PGP SIGNATURE-----

--------------qUMytYHzjO0weO8DwlM069mT--

