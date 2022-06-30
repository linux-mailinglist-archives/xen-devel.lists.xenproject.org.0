Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CD561A47
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 14:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358477.587718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tDy-0007yl-Lz; Thu, 30 Jun 2022 12:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358477.587718; Thu, 30 Jun 2022 12:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tDy-0007wG-Id; Thu, 30 Jun 2022 12:24:46 +0000
Received: by outflank-mailman (input) for mailman id 358477;
 Thu, 30 Jun 2022 12:24:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gQTH=XF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o6tDw-0007ZO-QY
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 12:24:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ef08ed2-f86f-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 14:24:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F9F721DD4;
 Thu, 30 Jun 2022 12:24:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDFAB13A5C;
 Thu, 30 Jun 2022 12:24:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yPlbNAqWvWLcMgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Jun 2022 12:24:42 +0000
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
X-Inumbo-ID: 9ef08ed2-f86f-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656591883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uXa+FRlzYJYmyF3LIiIDI9DG8qyh1K9uMBsWxDl2nRM=;
	b=CtN7UkTwywTxvzvfNX6zoOXWzTuUCeNKvW4yloLm2ReYh8SnNMXcrxmaqz5mRL+x2937vC
	ZtAeiHVOA2aBwNk7uFB04S8NQjheWNUZkpgSyUOcBpPuY/Uv8dE7d/sJZTPtQHf/V+Wffg
	34W92Ra4pzpS1clb0txqBoiwR/Vf/w8=
Message-ID: <43cafa48-1cef-ad0f-654e-5296cff15018@suse.com>
Date: Thu, 30 Jun 2022 14:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>, George Dunlap
 <George.Dunlap@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
In-Reply-To: <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------or0G17J0FHgXlHhgEmNHKuk0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------or0G17J0FHgXlHhgEmNHKuk0
Content-Type: multipart/mixed; boundary="------------SoJtpuNNnpGoH97jtfddOXYV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr <olekstysh@gmail.com>, George Dunlap
 <George.Dunlap@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <43cafa48-1cef-ad0f-654e-5296cff15018@suse.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
In-Reply-To: <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>

--------------SoJtpuNNnpGoH97jtfddOXYV
Content-Type: multipart/mixed; boundary="------------eyobLM2s4wBBTle5dihHL9n8"

--------------eyobLM2s4wBBTle5dihHL9n8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDYuMjIgMTQ6MTgsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IERlYXIgYWxsLg0K
PiANCj4gDQo+IE9uIDI1LjA2LjIyIDE3OjMyLCBPbGVrc2FuZHIgd3JvdGU6DQo+Pg0KPj4g
T24gMjQuMDYuMjIgMTU6NTksIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pg0KPj4gSGVsbG8g
R2VvcmdlDQo+Pg0KPj4+DQo+Pj4+IE9uIDE3IEp1biAyMDIyLCBhdCAxNzoxNCwgT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBh
bS5jb20+DQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBiYXNpYyBzdXBwb3J0IGZvciBj
b25maWd1cmluZyBhbmQgYXNzaXN0aW5nIHZpcnRpby1tbWlvDQo+Pj4+IGJhc2VkIHZpcnRp
by1kaXNrIGJhY2tlbmQgKGVtdWxhdG9yKSB3aGljaCBpcyBpbnRlbmRlZCB0byBydW4gb3V0
IG9mDQo+Pj4+IFFlbXUgYW5kIGNvdWxkIGJlIHJ1biBpbiBhbnkgZG9tYWluLg0KPj4+PiBB
bHRob3VnaCB0aGUgVmlydGlvIGJsb2NrIGRldmljZSBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJv
bSB0cmFkaXRpb25hbA0KPj4+PiBYZW4gUFYgYmxvY2sgZGV2aWNlICh2YmQpIGZyb20gdGhl
IHRvb2xzdGFjaydzIHBvaW50IG9mIHZpZXc6DQo+Pj4+IC0gYXMgdGhlIGZyb250ZW5kIGlz
IHZpcnRpby1ibGsgd2hpY2ggaXMgbm90IGEgWGVuYnVzIGRyaXZlciwgbm90aGluZw0KPj4+
PiDCoMKgIHdyaXR0ZW4gdG8gWGVuc3RvcmUgYXJlIGZldGNoZWQgYnkgdGhlIGZyb250ZW5k
IGN1cnJlbnRseSAoInZkZXYiDQo+Pj4+IMKgwqAgaXMgbm90IHBhc3NlZCB0byB0aGUgZnJv
bnRlbmQpLiBCdXQgdGhpcyBtaWdodCBuZWVkIHRvIGJlIHJldmlzZWQNCj4+Pj4gwqDCoCBp
biBmdXR1cmUsIHNvIGZyb250ZW5kIGRhdGEgbWlnaHQgYmUgd3JpdHRlbiB0byBYZW5zdG9y
ZSBpbiBvcmRlciB0bw0KPj4+PiDCoMKgIHN1cHBvcnQgaG90cGx1Z2dpbmcgdmlydGlvIGRl
dmljZXMgb3IgcGFzc2luZyB0aGUgYmFja2VuZCBkb21haW4gaWQNCj4+Pj4gwqDCoCBvbiBh
cmNoIHdoZXJlIHRoZSBkZXZpY2UtdHJlZSBpcyBub3QgYXZhaWxhYmxlLg0KPj4+PiAtIHRo
ZSByaW5nLXJlZi9ldmVudC1jaGFubmVsIGFyZSBub3QgdXNlZCBmb3IgdGhlIGJhY2tlbmQ8
LT5mcm9udGVuZA0KPj4+PiDCoMKgIGNvbW11bmljYXRpb24sIHRoZSBwcm9wb3NlZCBJUEMg
Zm9yIFZpcnRpbyBpcyBJT1JFUS9ETQ0KPj4+PiBpdCBpcyBzdGlsbCBhICJibG9jayBkZXZp
Y2UiIGFuZCBvdWdodCB0byBiZSBpbnRlZ3JhdGVkIGluIGV4aXN0aW5nDQo+Pj4+ICJkaXNr
IiBoYW5kbGluZy4gU28sIHJlLXVzZSAoYW5kIGFkYXB0KSAiZGlzayIgcGFyc2luZy9jb25m
aWd1cmF0aW9uDQo+Pj4+IGxvZ2ljIHRvIGRlYWwgd2l0aCBWaXJ0aW8gZGV2aWNlcyBhcyB3
ZWxsLg0KPj4+Pg0KPj4+PiBGb3IgdGhlIGltbWVkaWF0ZSBwdXJwb3NlIGFuZCBhbiBhYmls
aXR5IHRvIGV4dGVuZCB0aGF0IHN1cHBvcnQgZm9yDQo+Pj4+IG90aGVyIHVzZS1jYXNlcyBp
biBmdXR1cmUgKFFlbXUsIHZpcnRpby1wY2ksIGV0YykgcGVyZm9ybSB0aGUgZm9sbG93aW5n
DQo+Pj4+IGFjdGlvbnM6DQo+Pj4+IC0gQWRkIG5ldyBkaXNrIGJhY2tlbmQgdHlwZSAoTElC
WExfRElTS19CQUNLRU5EX09USEVSKSBhbmQgcmVmbGVjdA0KPj4+PiDCoCB0aGF0IGluIHRo
ZSBjb25maWd1cmF0aW9uDQo+Pj4+IC0gSW50cm9kdWNlIG5ldyBkaXNrICJzcGVjaWZpY2F0
aW9uIiBhbmQgInRyYW5zcG9ydCIgZmllbGRzIHRvIHN0cnVjdA0KPj4+PiDCoCBsaWJ4bF9k
ZXZpY2VfZGlzay4gQm90aCBhcmUgd3JpdHRlbiB0byB0aGUgWGVuc3RvcmUuIFRoZSB0cmFu
c3BvcnQNCj4+Pj4gwqAgZmllbGQgaXMgb25seSB1c2VkIGZvciB0aGUgc3BlY2lmaWNhdGlv
biAidmlydGlvIiBhbmQgaXQgYXNzdW1lcw0KPj4+PiDCoCBvbmx5ICJtbWlvIiB2YWx1ZSBm
b3Igbm93Lg0KPj4+PiAtIEludHJvZHVjZSBuZXcgInNwZWNpZmljYXRpb24iIG9wdGlvbiB3
aXRoICJ4ZW4iIGNvbW11bmljYXRpb24NCj4+Pj4gwqAgcHJvdG9jb2wgYmVpbmcgZGVmYXVs
dCB2YWx1ZS4NCj4+Pj4gLSBBZGQgbmV3IGRldmljZSBraW5kIChMSUJYTF9fREVWSUNFX0tJ
TkRfVklSVElPX0RJU0spIGFzIGN1cnJlbnQNCj4+Pj4gwqAgb25lIChMSUJYTF9fREVWSUNF
X0tJTkRfVkJEKSBkb2Vzbid0IGZpdCBpbnRvIFZpcnRpbyBkaXNrIG1vZGVsDQo+Pj4+DQo+
Pj4+IEFuIGV4YW1wbGUgb2YgZG9tYWluIGNvbmZpZ3VyYXRpb24gZm9yIFZpcnRpbyBkaXNr
Og0KPj4+PiBkaXNrID0gWyAncGh5Oi9kZXYvbW1jYmxrMHAzLCB4dmRhMSwgYmFja2VuZHR5
cGU9b3RoZXIsIHNwZWNpZmljYXRpb249dmlydGlvJ10NCj4+Pj4NCj4+Pj4gTm90aGluZyBo
YXMgY2hhbmdlZCBmb3IgZGVmYXVsdCBYZW4gZGlzayBjb25maWd1cmF0aW9uLg0KPj4+Pg0K
Pj4+PiBQbGVhc2Ugbm90ZSwgdGhpcyBwYXRjaCBpcyBub3QgZW5vdWdoIGZvciB2aXJ0aW8t
ZGlzayB0byB3b3JrDQo+Pj4+IG9uIFhlbiAoQXJtKSwgYXMgZm9yIGV2ZXJ5IFZpcnRpbyBk
ZXZpY2UgKGluY2x1ZGluZyBkaXNrKSB3ZSBuZWVkDQo+Pj4+IHRvIGFsbG9jYXRlIFZpcnRp
byBNTUlPIHBhcmFtcyAoSVJRIGFuZCBtZW1vcnkgcmVnaW9uKSBhbmQgcGFzcw0KPj4+PiB0
aGVtIHRvIHRoZSBiYWNrZW5kLCBhbHNvIHVwZGF0ZSBHdWVzdCBkZXZpY2UtdHJlZS4gVGhl
IHN1YnNlcXVlbnQNCj4+Pj4gcGF0Y2ggd2lsbCBhZGQgdGhlc2UgbWlzc2luZyBiaXRzLiBG
b3IgdGhlIGN1cnJlbnQgcGF0Y2gsDQo+Pj4+IHRoZSBkZWZhdWx0ICJpcnEiIGFuZCAiYmFz
ZSIgYXJlIGp1c3Qgd3JpdHRlbiB0byB0aGUgWGVuc3RvcmUuDQo+Pj4+IFRoaXMgaXMgbm90
IGFuIGlkZWFsIHNwbGl0dGluZywgYnV0IHRoaXMgd2F5IHdlIGF2b2lkIGJyZWFraW5nDQo+
Pj4+IHRoZSBiaXNlY3RhYmlsaXR5Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVr
c2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4g
T0ssIEkgYW0gKnJlYWxseSogc29ycnkgZm9yIGNvbWluZyBpbiBoZXJlIGF0IHRoZSBsYXN0
IG1pbnV0ZSBhbmQgcXVpYmJsaW5nIA0KPj4+IGFib3V0IHRoaW5ncy4NCj4+DQo+Pg0KPj4g
bm8gcHJvYmxlbQ0KPj4NCj4+DQo+Pj4gwqAgQnV0IHRoaXMgaW50cm9kdWNlcyBhIHB1Ymxp
YyBpbnRlcmZhY2Ugd2hpY2ggbG9va3MgcmVhbGx5IHdyb25nIHRvIG1lLiAgDQo+Pj4gSeKA
mXZlIHJlcGxpZWQgdG8gdGhlIG1haWwgZnJvbSBEZWNlbWJlciB3aGVyZSBKdWVyZ2VuIHBy
b3Bvc2VkIHRoZSDigJxPdGhlcuKAnSANCj4+PiBwcm90b2NvbC4NCj4+Pg0KPj4+IEhvcGVm
dWxseSB0aGlzIHdpbGwgYmUgYSBzaW1wbGUgbWF0dGVyIG9mIGZpbmRpbmcgYSBiZXR0ZXIg
bmFtZSB0aGFuIA0KPj4+IOKAnG90aGVy4oCdLsKgIChPciB5b3UgZ3V5cyBjb252aW5jaW5n
IG1lIHRoYXQg4oCcb3RoZXLigJ0gaXMgcmVhbGx5IHRoZSBiZXN0IG5hbWUgZm9yIA0KPj4+
IHRoaXMgdmFsdWU7IG9yIGV2ZW4gQW50aG9ueSBhc3NlcnRpbmcgaGlzIHJpZ2h0IGFzIGEg
bWFpbnRhaW5lciB0byBvdmVycnVsZSANCj4+PiBteSBvYmplY3Rpb24gaWYgaGUgdGhpbmtz
IEnigJltIG91dCBvZiBsaW5lLikNCj4+DQo+Pg0KPj4gSSBzYXcgeW91ciByZXBseSB0byBW
NiBhbmQgSnVlcmdlbidzIGFuc3dlci4gSSBzaGFyZSBKdWVyZ2VuJ3Mgb3BpbmlvbiBhcyB3
ZWxsIA0KPj4gYXMgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4gSSB0aGluaywgdGhpcyBp
cyBleGFjdGx5IHRoZSBzaXR1YXRpb24gd2hlbiANCj4+IGZpbmRpbmcgYSBwZXJmZWN0IG5h
bWUgKG9idmlvdXMsIHNob3J0LCBldGMpIGZvciB0aGUgYmFja2VuZHR5cGUgKGluIG91ciAN
Cj4+IHBhcnRpY3VsYXIgY2FzZSkgaXMgcmVhbGx5IGRpZmZpY3VsdC4NCj4+DQo+PiBQZXJz
b25hbGx5IEkgdGVuZCB0byBsZWF2ZSAib3RoZXIiLCBiZWNhdXNlIHRoZXJlIGlzIG5vIGJl
dHRlciBhbHRlcm5hdGl2ZSANCj4+IGZyb20gbXkgUG9WLiBBbHNvIEkgbWlnaHQgYmUgY29t
cGxldGVseSB3cm9uZyBoZXJlLCBidXQgSSBkb24ndCB0aGluayB3ZSB3aWxsIA0KPj4gaGF2
ZSB0byBleHRlbmQgdGhlICJiYWNrZW5kdHlwZSIgZm9yIHN1cHBvcnRpbmcgb3RoZXIgcG9z
c2libGUgdmlydGlvIGJhY2tlbmQgDQo+PiBpbXBsZW1lbnRhdGlvbnMgaW4gdGhlIGZvcmVz
ZWVhYmxlIGZ1dHVyZToNCj4+DQo+PiAtIHdoZW4gUWVtdSBnYWlucyB0aGUgcmVxdWlyZWQg
c3VwcG9ydCB3ZSB3aWxsIGNob29zZSBxZGlzazogYmFja2VuZHR5cGUgcWRpc2sgDQo+PiBz
cGVjaWZpY2F0aW9uIHZpcnRpbw0KPj4gLSBmb3IgdGhlIHBvc3NpYmxlIHZpcnRpbyBhbHRl
cm5hdGl2ZSBvZiB0aGUgYmxrYmFjayB3ZSB3aWxsIGNob29zZSBwaHk6IA0KPj4gYmFja2Vu
ZHR5cGUgcGh5IHNwZWNpZmljYXRpb24gdmlydGlvDQo+Pg0KPj4gSWYgdGhlcmUgd2lsbCBi
ZSBhIG5lZWQgdG8ga2VlcCB2YXJpb3VzIGltcGxlbWVudGF0aW9uLCB3ZSB3aWxsIGJlIGFi
bGUgdG8gDQo+PiBkZXNjcmliZSB0aGF0IGJ5IHVzaW5nICJ0cmFuc3BvcnQiIChtbWlvLCBw
Y2ksIHhlbmJ1cywgYXJnbywgd2hhdGV2ZXIpLg0KPj4gQWN0dWFsbHkgdGhpcyBpcyB3aHkg
d2UgYWxzbyBpbnRyb2R1Y2VkICJzcGVjaWZpY2F0aW9uIiBhbmQgInRyYW5zcG9ydCIuDQo+
Pg0KPj4gSUlSQywgdGhlcmUgd2VyZSBvdGhlciAoc3VnZ2VzdGVkPykgbmFtZXMgZXhjZXB0
ICJvdGhlciIgd2hpY2ggYXJlICJleHRlcm5hbCIgDQo+PiBhbmQgImRhZW1vbiIuIElmIHlv
dSB0aGluayB0aGF0IG9uZSBvZiB0aGVtIGlzIGJldHRlciB0aGFuICJvdGhlciIsIEkgd2ls
bCANCj4+IGhhcHB5IHRvIHVzZSBpdC4NCj4gDQo+IA0KPiBDb3VsZCB3ZSBwbGVhc2UgbWFr
ZSBhIGRlY2lzaW9uIG9uIHRoaXM/DQo+IA0KPiBJZiAib3RoZXIiIGlzIG5vdCB1bmFtYmln
dW91cywgdGhlbiBtYXliZSB3ZSBjb3VsZCBjaG9vc2UgImRhZW1vbiIgdG8gZGVzY3JpYmUg
DQo+IGFyYml0cmFyeSB1c2VyLWxldmVsIGJhY2tlbmRzLCBhbnkgdGhvdWdodD8NCg0KSU1P
IHRoaXMgd291bGQgZXhjbHVkZSBvdGhlciBjYXNlcywgbGlrZSBzcGVjaWFsIGtlcm5lbCBk
cml2ZXJzLg0KDQpNYXliZSAic3RhbmRhbG9uZSI/ICJvbmx5LXJlbHlpbmctb24teGVuc3Rv
cmUtZGF0YSIgd291bGQgYmUgYSBiaXQNCmV4YWdnZXJhdGVkLCB3aGlsZSBjb252ZXlpbmcg
dGhlIGlkZWEgcXVpdGUgbmljZWx5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------eyobLM2s4wBBTle5dihHL9n8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------eyobLM2s4wBBTle5dihHL9n8--

--------------SoJtpuNNnpGoH97jtfddOXYV--

--------------or0G17J0FHgXlHhgEmNHKuk0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK9lgoFAwAAAAAACgkQsN6d1ii/Ey9O
RwgAnToxqTFsJCoutQxpg3dHN9B84RgitlJlXnRjnGld2JxkNDrL+Q84VuvyosCudXsPveJTyL/G
1gjlCoaHlZcERh2njS+AUqmL491mUZdMQS5cm63P+7dhLL3omYGGEjt/GgWYtXLGES3Hn169KQOz
z+QKKeEgod83NZzkR93x0g1Hy+M02DbXyd49Gqk+k2TheNDv9lKmQetRzjpxypoiHgzIrGfCoGfC
vDeZkuUqIhbo+DVHl5GYVvoZygc5GNX1L/QbfkaVorjx8PukBxPFA/Ugqqtk/+oqkGMZoCm0Cw1f
9l3Wi7YvGBCbUzuJp7CsMqz50La3vJbaNrBqm5wiJw==
=D7G0
-----END PGP SIGNATURE-----

--------------or0G17J0FHgXlHhgEmNHKuk0--

