Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709D17FB9
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 20:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOR6F-0001y9-BA; Wed, 08 May 2019 18:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a52h=TI=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hOR6D-0001y4-61
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 18:15:25 +0000
X-Inumbo-ID: 3d1e1b92-71bd-11e9-a5de-530759baba37
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d1e1b92-71bd-11e9-a5de-530759baba37;
 Wed, 08 May 2019 18:15:20 +0000 (UTC)
Date: Wed, 08 May 2019 18:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557339319;
 bh=bifDvSAnGKm+IDFuhxGjcNsUUo77Jrwe8QXfS3RvAf0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=QcYmLO58EOPzGhzXM7iGscxKk6PxMJY71PjChRv1uEKqFAcnoKsUayogvgjWgtHbu
 aLEqxisgjkutxp+7TXzPwQT/Eiv/x2dVcvIxMP38AkhoQ7Gz1wT46lqMEBk2pEbX31
 fkWLagpEgWlurvf/Ef4mWxmClrZB/eSJOgsteNAM=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <FTd8DFPKd4lGuFiu2N-XQ2a_TVJ2mT4O_CrY6j3WivGfCwV9QV_HZ7Oh3_pfHmxWRggQ0yaK5RM_B08gfXPjbQvW4N9DZNuN_AWd4zqn4qw=@protonmail.com>
In-Reply-To: <328e2d6d-57da-cb40-3aba-35b10ab37dbf@citrix.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
 <JtM5mkq2NGVy1FZByrNH__YS8zpSo5mWd7ksop9Ns7mUipPKalor78NIFupEwb6a_vjRT5QxTSepTr_o3wqnPuNXL9BLZn5-EXCJ8pezVIQ=@protonmail.com>
 <83a9334a-3ef8-66b4-c197-724821a6be1a@citrix.com>
 <Gch727H7qupGUcfJT57AA7aqd6Mf5pLorJMsEceLbMt_iBEYztzTQZs1O7y1pOhnBlymAus25C69RoY9lpQACkfcHu9c14cbcp661Ba7rkU=@protonmail.com>
 <328e2d6d-57da-cb40-3aba-35b10ab37dbf@citrix.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgamV1ZGksIGF2cmlsIDI1LCAyMDE5IDk6MzQgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IGEgw6ljcml0wqA6Cgo+IE9uIDI1LzA0LzIwMTkgMDA6NDMsIE1h
dGhpZXUgVGFycmFsIHdyb3RlOgo+Cj4gPiBPbiBXZWRuZXNkYXkgMjQgQXByaWwgMjAxOSAxNDow
MCwgQW5kcmV3IENvb3BlciBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tIHdyb3RlOgo+ID4KPiA+
ID4gT24gMjMvMDQvMjAxOSAyMjo1OSwgTWF0aGlldSBUYXJyYWwgd3JvdGU6Cj4gPiA+Cj4gPiA+
ID4gPiA+IFRoZSBmdW5ueSB0aGluZyBpcyB0aGF0IGl0J3MgYWx3YXlzIGF0IHRoZSBzYW1lIGlu
c3RydWN0aW9uIHRoYXQgaXQgZmFpbHMsIHRoZSAxMDZ0aCBzaW5nbGVzdGVwLAo+ID4gPiA+ID4g
PiBhdCAweDgwNmQzMmRjOgo+ID4gPiA+ID4gPiBbMHg3YzkwZTUxNF0+IHMgMHg4MDZkMzJkYwo+
ID4gPiA+ID4gPiBbMHg4MDZkMzJkY10+IHBkIDEwCj4gPiA+ID4gPiA+IDB4ODA2ZDMyZGMgODkw
ZDgwMDBmZWZmIG1vdiBkd29yZCBbMHhmZmZlMDA4MF0sIGVjeAo+ID4gPiA+ID4gPiBUaGlzIGlz
IGEgcmVhZCBvZiB0aGUgQVBJQyBUUFIsIHdoaWNoIGlzIHZlcnkgY29tbW9ubHkgYW4gb3BlcmF0
aW9uCj4gPiA+ID4gPiA+IGFjY2VsZXJhdGVkIGJ5IGhhcmR3YXJlIChiZWNhdXNlIHdpdGhvdXQg
aXQsIHZpcnR1YWxpc2luZyB3aW5kb3dzIFhQIGlzCj4gPiA+ID4gPiA+IGV4Y2VlZGluZ2x5IHNs
b3cpLgo+ID4gPiA+ID4gPiBXaGF0IGlzIHlvdXIgQ1BVLCBhbmQgaG93IGV4YWN0bHkgYXJlIHlv
dSB0cnlpbmcgdG8gc2luZ2xlc3RlcC7CoCBJcyBpdAo+ID4gPiA+ID4gPiB3aXRoIE1URiwgb3Ig
dXNpbmcgdGhlIHRyYXAgZmxhZyBpbnNpZGUgdGhlIGd1ZXN0Pwo+ID4gPiA+ID4gPiBNeSBDUFUg
aXMgYW4gSW50ZWwgaTctODc1MEguCj4gPiA+ID4gPiA+IEknbSB1c2luZyB0aGUgbGlidm1pIEFQ
SSwgd2hpY2ggaXMgZW5hYmxpbmcgdGhlIE1URiBmbGFnIHRvIHNpbmdsZXN0ZXAsIGlmIGkganVk
Z2UgYnkgdGhlIGRlYnVnIGxvZ3MuCj4gPiA+ID4gPiA+IE9rIC0gdGhhdCBpcyBhIENvZmZlZUxh
a2UuCj4gPiA+Cj4gPiA+IEkndmUgaGFkIGEgcXVpY2sgcGxheSB3aXRoIGEgc2ltcGxlIGV4YW1w
bGUgKFhURiB0ZXN0IGFuZCB4ZW4tYWNjZXNzKQo+ID4gPiBhbmQgTVRGIGRvZXMgYXBwZWFyIHRv
IHdvcmsgZmluZSB3aXRoIGJvdGggVFBSIHNoYWRvd2luZyBhbmQgZnVsbCBBUElDCj4gPiA+IHZp
cnR1YWxpc2F0aW9uLsKgIEkndmUgdHJpZWQgb24gSGFzd2VsbCwgS2FieUxha2UgYW5kIENvZmZl
ZUxha2UuCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGVzdGluZy4KPiA+Cj4gPiA+IENhbiB5b3UgZGVz
Y3JpYmUgdGhlIGV4YWN0IFZNSSBjb25maWd1cmF0aW9uIHlvdSd2ZSBnb3QgZW5hYmxlZCAtCj4g
PiA+IHNwZWNpZmljYWxseSB3aGljaCBvdGhlciBpbnRlcmNlcHRzIGFyZSBhY3RpdmU/Cj4gPiA+
IE15IEJyZWFrcG9pbnRNYW5hZ2VyIGNsYXNzIGlzIGRlYWxpbmcgd2l0aCBWTUkgZXZlbnRzLgo+
ID4gPiBJdCByZWdpc3RlcnMgMyBldmVudHM6Cj4gPgo+ID4gLSAgIGludDMKPiA+IC0gICBkZWJ1
ZyBldmVudCAoZm9yIGhhcmR3YXJlIGJyZWFrcG9pbnRzKQo+ID4gLSAgIHNpbmdsZXN0ZXAgZXZl
bnQgKGZvciBicmVha3BvaW50IHJlY29pbCBvbiBpbnQzKQo+ID4KPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9XZW56ZWwvcHl2bWlkYmcvYmxvYi8xYTJlOTdjMjM4YTk2Yzk4YzE5Y2RiYmRlZmE2MDQ3
YmUyNDZlNTA0L3ZtaWRiZy9icmVha3BvaW50LnB5I0wyMAo+Cj4gV2hhdCBhYm91dCBjb250cm9s
IHJlZ2lzdGVyIGludGVyY2VwdHMsIG9yIG1lbW9yeSBwZXJtaXNzaW9uIHJlc3RyaWN0aW9ucz8K
CkknbSBub3QgdXNpbmcgdGhlbSwgbm90IENSMyBpbnRlcmNlcHRzLCBvciBtZW1fZXZlbnRzIHJl
Z2lzdGVyZWQuCgo+IEkgZXhwZWN0IHRoaW5ncyBhcmUgZ29pbmcgd3Jvbmcgd2hlbiB0aGUgVFBS
IGFjY2VzcyBpcyBlbXVsYXRlZCBieSBYZW4sCj4gcmF0aGVyIHRoYW4gY29tcGxldGVkIGRpcmVj
dGx5IGJ5IGhhcmR3YXJlLCBidXQgSSBjYW4ndCBleHBsYWluIGhvdwo+IHlvdSdkIGJlIGdldHRp
bmcgaW50byB0aGF0IHNpdHVhdGlvbiB3aXRob3V0IHNvbWUgb3RoZXIgVk1JIHNldHRpbmdzCj4g
YmVpbmcgYWN0aXZlIGF0IHRoZSBzYW1lIHRpbWUuCkkgZG9uJ3QgcmVhbGx5IGtub3cgWGVuLCBz
byBJJyBjYW4ndCBleHBsYWluIGl0IG15c2VsZi4KSG93IGNhbiBJIGRlYnVnIHRoaXMgPwpEbyB5
b3Ugd2FudCBtZSB0byBhZGQgYSBwcmludGsgc29tZXdoZXJlID8KCk1hdGhpZXUKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
