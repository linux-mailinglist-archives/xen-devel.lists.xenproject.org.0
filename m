Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA9551138D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314540.532636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd9i-00077N-QH; Wed, 27 Apr 2022 08:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314540.532636; Wed, 27 Apr 2022 08:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd9i-00074a-N8; Wed, 27 Apr 2022 08:36:14 +0000
Received: by outflank-mailman (input) for mailman id 314540;
 Wed, 27 Apr 2022 08:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njd9h-00074U-84
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:36:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a17fd1-c605-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 10:36:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B0901F388;
 Wed, 27 Apr 2022 08:36:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E40381323E;
 Wed, 27 Apr 2022 08:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g9JONnoAaWIFSAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 08:36:10 +0000
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
X-Inumbo-ID: 17a17fd1-c605-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651048571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NPK63+EPMrMO8igtS0GNvcuwQjx9S9Iq0VxYrpeJRoQ=;
	b=hz70znOIlxsgr9udWyXJYHyIs18NwtkS8giH1uHwfY3jayI73pGas96aJ94Z0geu+YnGC0
	7wT12iTDPEGjQWgyKZMcJ79r1wju0mJkbGMwUy5y2tR2qPp/ZL0iuiWPq/Mj13Y1RXCh1B
	9DlnQunKQtEziyXAvJ2YIoZZqyM4rGA=
Message-ID: <7e5759fa-739f-1311-ff00-1cc60729a9f3@suse.com>
Date: Wed, 27 Apr 2022 10:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <YmJ4NLuvA63Irow+@Air-de-Roger>
 <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
 <YmaeLc2iwxUPUAvF@Air-de-Roger>
 <57bfc576-48d5-9121-a32e-fa00be64d6a9@gmail.com>
 <Ymj+c1nmOgbiw/M8@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Ymj+c1nmOgbiw/M8@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FIzAwdqNMBmBZhiY9R8540FZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FIzAwdqNMBmBZhiY9R8540FZ
Content-Type: multipart/mixed; boundary="------------UCBgqSGYzC1zm4vGl5RGNWKQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <7e5759fa-739f-1311-ff00-1cc60729a9f3@suse.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <YmJ4NLuvA63Irow+@Air-de-Roger>
 <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
 <YmaeLc2iwxUPUAvF@Air-de-Roger>
 <57bfc576-48d5-9121-a32e-fa00be64d6a9@gmail.com>
 <Ymj+c1nmOgbiw/M8@Air-de-Roger>
In-Reply-To: <Ymj+c1nmOgbiw/M8@Air-de-Roger>

--------------UCBgqSGYzC1zm4vGl5RGNWKQ
Content-Type: multipart/mixed; boundary="------------8vDgqUOfvNFyTWrm7Ru4wXmJ"

--------------8vDgqUOfvNFyTWrm7Ru4wXmJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDQuMjIgMTA6MjcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwg
QXByIDI3LCAyMDIyIGF0IDExOjIwOjA0QU0gKzAzMDAsIE9sZWtzYW5kciB3cm90ZToNCj4+
DQo+PiBPbiAyNS4wNC4yMiAxNjoxMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+DQo+
Pg0KPj4gSGVsbG8gUm9nZXINCj4+DQo+Pg0KPj4+IE9uIFNhdCwgQXByIDIzLCAyMDIyIGF0
IDEwOjM5OjE0QU0gKzAzMDAsIE9sZWtzYW5kciB3cm90ZToNCj4+Pj4gT24gMjIuMDQuMjIg
MTI6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IEhlbGxv
IFJvZ2VyDQo+Pj4+DQo+Pj4+PiBPbiBGcmksIEFwciAwOCwgMjAyMiBhdCAwOToyMTowNFBN
ICswMzAwLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBGcm9tOiBPbGVr
c2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+
Pj4gLS0tIGEvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kLmluDQo+Pj4+
Pj4gKysrIGIvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kLmluDQo+Pj4+
Pj4gQEAgLTIzMiw3ICsyMzIsNyBAQCBTcGVjaWZpZXMgdGhlIGJhY2tlbmQgaW1wbGVtZW50
YXRpb24gdG8gdXNlDQo+Pj4+Pj4gICAgID1pdGVtIFN1cHBvcnRlZCB2YWx1ZXMNCj4+Pj4+
PiAtcGh5LCBxZGlzaw0KPj4+Pj4+ICtwaHksIHFkaXNrLCBvdGhlcg0KPj4+Pj4+ICAgICA9
aXRlbSBNYW5kYXRvcnkNCj4+Pj4+PiBAQCAtMjQ0LDExICsyNDQsMTMgQEAgQXV0b21hdGlj
YWxseSBkZXRlcm1pbmUgd2hpY2ggYmFja2VuZCB0byB1c2UuDQo+Pj4+Pj4gICAgID1iYWNr
DQo+Pj4+Pj4gLVRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZSBndWVzdCdzIHZpZXcgb2YgdGhl
IGRldmljZS4gIEl0IGNvbnRyb2xzDQo+Pj4+Pj4gLXdoaWNoIHNvZnR3YXJlIGltcGxlbWVu
dGF0aW9uIG9mIHRoZSBYZW4gYmFja2VuZCBkcml2ZXIgaXMgdXNlZC4NCj4+Pj4+PiArSXQg
Y29udHJvbHMgd2hpY2ggc29mdHdhcmUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGJhY2tlbmQg
ZHJpdmVyIGlzIHVzZWQuDQo+Pj4+Pj4gK0RlcGVuZGluZyBvbiB0aGUgInByb3RvY29sIiBv
cHRpb24gdGhpcyBtYXkgYWZmZWN0IHRoZSBndWVzdCdzIHZpZXcNCj4+Pj4+PiArb2YgdGhl
IGRldmljZS4NCj4+Pj4+PiAgICAgTm90IGFsbCBiYWNrZW5kIGRyaXZlcnMgc3VwcG9ydCBh
bGwgY29tYmluYXRpb25zIG9mIG90aGVyIG9wdGlvbnMuDQo+Pj4+Pj4gLUZvciBleGFtcGxl
LCAicGh5IiBkb2VzIG5vdCBzdXBwb3J0IGZvcm1hdHMgb3RoZXIgdGhhbiAicmF3Ii4NCj4+
Pj4+PiArRm9yIGV4YW1wbGUsICJwaHkiIGFuZCAib3RoZXIiIGRvIG5vdCBzdXBwb3J0IGZv
cm1hdHMgb3RoZXIgdGhhbiAicmF3IiBhbmQNCj4+Pj4+PiArIm90aGVyIiBkb2VzIG5vdCBz
dXBwb3J0IHByb3RvY29scyBvdGhlciB0aGFuICJ2aXJ0aW8tbW1pbyIuDQo+Pj4+Pj4gICAg
IE5vcm1hbGx5IHRoaXMgb3B0aW9uIHNob3VsZCBub3QgYmUgc3BlY2lmaWVkLCBpbiB3aGlj
aCBjYXNlIGxpYnhsIHdpbGwNCj4+Pj4+PiAgICAgYXV0b21hdGljYWxseSBkZXRlcm1pbmUg
dGhlIG1vc3Qgc3VpdGFibGUgYmFja2VuZC4NCj4+Pj4+PiBAQCAtMzQ0LDggKzM0NiwzNSBA
QCBjYW4gYmUgdXNlZCB0byBkaXNhYmxlICJob2xlIHB1bmNoaW5nIiBmb3IgZmlsZSBiYXNl
ZCBiYWNrZW5kcyB3aGljaA0KPj4+Pj4+ICAgICB3ZXJlIGludGVudGlvbmFsbHkgY3JlYXRl
ZCBub24tc3BhcnNlIHRvIGF2b2lkIGZyYWdtZW50YXRpb24gb2YgdGhlDQo+Pj4+Pj4gICAg
IGZpbGUuDQo+Pj4+Pj4gKz1pdGVtIEI8cHJvdG9jb2w+PUk8UFJPVE9DT0w+DQo+Pj4+Pj4g
Kw0KPj4+Pj4+ICs9b3ZlciA0DQo+Pj4+Pj4gKw0KPj4+Pj4+ICs9aXRlbSBEZXNjcmlwdGlv
bg0KPj4+Pj4+ICsNCj4+Pj4+PiArU3BlY2lmaWVzIHRoZSBjb21tdW5pY2F0aW9uIHByb3Rv
Y29sIHRvIHVzZSBmb3IgdGhlIGNob3NlbiAiYmFja2VuZHR5cGUiIG9wdGlvbg0KPj4+Pj4+
ICsNCj4+Pj4+PiArPWl0ZW0gU3VwcG9ydGVkIHZhbHVlcw0KPj4+Pj4+ICsNCj4+Pj4+PiAr
eGVuLCB2aXJ0aW8tbW1pbw0KPj4+Pj4gICAgRnJvbSBhIHVzZXIgUG9WLCBJIHRoaW5rIGl0
IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IHNlbGVjdCB4ZW4gb3INCj4+Pj4+IHZpcnRpbyBo
ZXJlLCBidXQgbm90IHRoZSB1bmRlcmx5aW5nIGNvbmZpZ3VyYXRpb24gbWVjaGFuaXNtIHVz
ZWQgdG8NCj4+Pj4+IGV4cG9zZSB0aGUgZGV2aWNlcyB0byB0aGUgZ3Vlc3QuDQo+Pj4+IEkg
Z290IHlvdXIgcG9pbnQuDQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+PiBXZSB3b3VsZCBsaWtl
bHkgbmVlZCB0byBhZGQgYSBkaWZmZXJlbnQgb3B0aW9uIHRvIHNlbGVjdCBtbWlvIG9yIHBj
aQ0KPj4+Pj4gdGhlbiwgYnV0IHRoYXQgc2hvdWxkIGJlIHNldCBieSBkZWZhdWx0IGJhc2Vk
IG9uIGFyY2hpdGVjdHVyZS9ndWVzdA0KPj4+Pj4gdHlwZS4gIEZvciBleGFtcGxlIG9uIHg4
NiBpdCBzaG91bGQgZGVmYXVsdCB0byBwY2ksIHdoaWxlIG9uIEFybSBJDQo+Pj4+PiBndWVz
cyBpdCB3aWxsIGRlcGVuZCBvbiB3aGV0aGVyIHRoZSBndWVzdCBoYXMgUENJIG9yIG5vdD8N
Cj4+Pj4+DQo+Pj4+PiBJbiBhbnkgY2FzZSwgSSB0aGluayB3ZSBzaG91bGQgb2ZmZXIgYW4g
b3B0aW9uIHRoYXQncyBzZWxlY3RpbmcNCj4+Pj4+IGJldHdlZW4geGVuIG9yIHZpcnRpbyBw
cm90b2NvbCwgYW5kIHRoZSB3YXkgdG8gZXhwb3NlIHRoZQ0KPj4+Pj4gY29uZmlndXJhdGlv
biBvZiB0aGUgZGV2aWNlIHNob3VsZG4ndCBuZWVkIHRvIGJlIGV4cGxpY2l0bHkgc2VsZWN0
ZWQNCj4+Pj4+IGJ5IHRoZSB1c2VyLg0KPj4+Pg0KPj4+PiBvaywgZm9yIG5vdyBJIHdpbGwg
dXNlICJ4ZW4gYW5kIHZpcnRpbyIgdmFsdWVzIGZvciB0aGUgInByb3RvY29sIiBvcHRpb24s
DQo+Pj4+IHRoZW4gaW50ZXJuYWxseSB0b29sc3RhY2sgd2lsbCBhc3N1bWUgdGhhdCAidmly
dGlvIiByZWFsbHkgbWVhbnMNCj4+Pj4gInZpcnRpby1tbWlvIi4NCj4+Pj4NCj4+Pj4gV2hl
biB0aGVyZSBpcyBhIG5lZWQgdG8gZXhwYW5kIHRoYXQgc3VwcG9ydCB0byAidmlydGlvLXBj
aSIsIHdlIHdpbGwgc2VlIGhvdw0KPj4+PiB0byBkZWFsIHdpdGggaXQgZnJvbSB0aGUgY29u
ZmlndXJhdGlvbiBQb1YsIHByb2JhYmx5IGxpa2UgeW91IHN1Z2dlc3RlZA0KPj4+PiBhYm92
ZSBieSBhZGRpbmcgYW5vdGhlciBvcHRpb24gKGUuZy4gInRyYW5zcG9ydCIpIHdpdGggZGVm
YXVsdCB2YWx1ZXMgYmFzZWQNCj4+Pj4gb24gdGhlIGFyY2hpdGVjdHVyZS9ndWVzdCB0eXBl
Lg0KPj4+IEkgdGhpbmsgdGhpcyBsaWtlbHkgYWxzbyB3YW50cyB0byBiZSBhIHNlcGFyYXRl
IGZpZWxkIGluIGxpYnhsX2RldmljZV9kaXNrLA0KPj4+IHdoaWNoIGNvdWxkIGJlIGxlZnQg
ZW1wdHkgYW5kIGxpYnhsIHdpbGwgYXR0ZW1wdCB0byBzZXQgYSBkZWZhdWx0Lg0KPj4+IEZv
ciBleGFtcGxlIGhhdmUgdGhlIGZvbGxvd2luZyBpbiBsaWJ4bF90eXBlcy5pZGw6DQo+Pj4N
Cj4+PiBsaWJ4bF9kZXZpY2VfcHJvdG9jb2wgPSBFbnVtZXJhdGlvbigiZGV2aWNlX3Byb3Rv
Y29sIiwgWw0KPj4+ICAgICAgICgwLCAiVU5LTk9XTiIpLA0KPj4+ICAgICAgICgxLCAiWEVO
IiksDQo+Pj4gICAgICAgKDIsICJWSVJUSU8iKSwNCj4+PiAgICAgICBdKQ0KPj4+DQo+Pj4g
bGlieGxfZGV2aWNlX2NvbmZpZ3VyYXRpb24gPSBFbnVtZXJhdGlvbigiZGV2aWNlX2NvbmZp
Z3VyYXRpb24iLCBbDQo+Pj4gICAgICAgKDAsICJVTktOT1dOIiksDQo+Pj4gICAgICAgKDEs
ICJYRU5CVVMiKSwNCj4+PiAgICAgICAoMiwgIk1NSU8iKSwNCj4+PiAgICAgICBdKQ0KPj4+
DQo+Pj4gbGlieGxfZGV2aWNlX2Rpc2sgPSBTdHJ1Y3QoImRldmljZV9kaXNrIiwgWw0KPj4+
ICAgICAgICgicHJvdG9jb2wiLCBsaWJ4bF9kZXZpY2VfcHJvdG9jb2wpLA0KPj4+ICAgICAg
ICgiY29uZmlndXJhdGlvbiIsIGxpYnhsX2RldmljZV9jb25maWd1cmF0aW9uKSwNCj4+PiAg
ICAgICBdKQ0KPj4+DQo+Pj4gSSBkb24ndCBsaWtlIGxpYnhsX2RldmljZV9jb25maWd1cmF0
aW9uIG11Y2gsIEkgdGhpbmsgaXMgdG9vIGdlbmVyaWMsDQo+Pj4gYnV0IEkgY2FuJ3QgdGhp
bmsgb2YgYW55dGhpbmcgYmV0dGVyLiAgTWF5YmUgb3RoZXJzIGNhbiBwcm92aWRlIGJldHRl
cg0KPj4+IG5hbWVzLg0KPj4NCj4+DQo+PiBIZXJlIFsxXSB3ZSBoYWQgYSBkaXNjdXNzaW9u
IHJlZ2FyZGluZyB1c2VyIGNvbmZpZ3VyYXRpb24gb3B0aW9ucy4NCj4+ICJwcm90b2NvbCIg
Y2Fubm90IGJlIHVzZWQgYXMgaXQgd2lsbCBsZWFkIHRvIHRoZSBjb25mdXNpb24gKGF0IGxl
YXN0IHdpdGgNCj4+IFhlbiBQViBibG9jayBkZXZpY2Ugd2hpY2ggYWxyZWFkeSBoYXMgInBy
b3RvY29sIiBmcm9udGVuZCdzIGVudHJ5IGluDQo+PiBYZW5zdG9yZSkuDQo+Pg0KPj4gUHJl
bGltaW5hcnksIHdlIGhhZCBhZ3JlZWQgb24gdGhlIGZvbGxvd2luZyBuYW1lczoNCj4+IDEu
IHNwZWNpZmljYXRpb246IHhlbiBvciB2aXJ0aW8NCj4+IDIuIHRyYW5zcG9ydDogbW1pbyBv
ciBwY2kNCj4+DQo+PiBQbGVhc2UgdGVsbCBtZSwgYXJlIHlvdSBPSyB3aXRoIHRoZW0/DQo+
IA0KPiBZZXMsIHRoYXQncyBmaW5lLiBNeSBtYWluIHBvaW50IGlzIHRoYXQgbGlieGxfZGV2
aWNlX2Rpc2sgc2hvdWxkDQo+IGNvbnRhaW4gYm90aCBmaWVsZHMsIHNvIGEgM3JkIHBhcnR5
IHRvb2xzdGFjayBjYW4gc2V0ICdzcGVjaWZpY2F0aW9uID0NCj4gdmlydGlvJyBhbmQgbGV0
IFhlbiBkZWNpZGUgdGhlIHRyYW5zcG9ydCB0byB1c2UuDQo+IA0KPiBJJ20gZHViaW91cyB3
aGV0aGVyIHdlIHdhbnQgdG8gaGF2ZSBhIHhlbmJ1cyB0cmFuc3BvcnQgZm9yIHhlbg0KPiBz
cGVjaWZpY2F0aW9uIHRvIHVzZSwgYnV0IEkgZ3Vlc3MgaXQncyBmaW5lIHRvIHNheSB0aGF0
IGZvcg0KPiBzcGVjaWZpY2F0aW9uID09IHhlbiB0cmFuc3BvcnQgaXMgaWdub3JlZC4NCg0K
QXQgbGVhc3QgZm9yIG5vdywgSSBndWVzcy4gSXQgbWlnaHQgYmUgYSB0aGluZyBpbiBjYXNl
IHNvbWVvbmUgZGVjaWRlcw0KdG8gYWRkIGFyZ28gc3VwcG9ydC4NCg0KDQpKdWVyZ2VuDQo=

--------------8vDgqUOfvNFyTWrm7Ru4wXmJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8vDgqUOfvNFyTWrm7Ru4wXmJ--

--------------UCBgqSGYzC1zm4vGl5RGNWKQ--

--------------FIzAwdqNMBmBZhiY9R8540FZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJpAHoFAwAAAAAACgkQsN6d1ii/Ey8g
oQgAie06/soLud4Jt3AcwaPweRfZESO0pcsU4WEeuIm4PMm38KbvEIKdcqZSmD1Xn95U6bLKrQse
1wttyLFYAsmDmRK1BO8umW9th+O3rO8hfMG4+zAVxwI8lwn9vrMNo/VSCnMprSf1+X6ePQEgCI8y
SRrXru3t7YmOiqZnLUkFAsB5ReY3O7WBSCngBpzrx8SJZn+G83b56cEDhT44qnk3EAuJ43IBByCc
3h2B7ZVYlNdTciaYnVTdAVYpi6yIq9W6PC5ASdvDfdlIDRCCtcqkXodCF1mR5yi/xQwl7rCxebgU
nZYqGYZWMg/UquNq/blVm261AF9H23rXm3mUA9n11g==
=u7OG
-----END PGP SIGNATURE-----

--------------FIzAwdqNMBmBZhiY9R8540FZ--

