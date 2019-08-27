Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D287F9E472
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Xpl-00013l-K9; Tue, 27 Aug 2019 09:32:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sv2a=WX=twosheds.srs.infradead.org=batv+d6b5d8d91af00b0fd28a+5847+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i2Xpk-00013g-4q
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:32:12 +0000
X-Inumbo-ID: 8aaf2d8c-c8ad-11e9-8980-bc764e2007e4
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aaf2d8c-c8ad-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tse1yOmX50P2M31yQvIU7vefbow4tyT9idNE6mCAdzU=; b=m1CUWOrofcJnpT1WMvNNDlhVI
 8u8ykFsursWifKTbw+8qEixZV/ZFidxUkQQy9ROKqaav+zrffidT56HFQ7eFF4g1XI4czqaVovCtL
 DoOidNTBgKqtaGcSQBzwOu2obAb2OEISgVQVXBomUDBl7BaDyyJPgohAoNbCcDr59ARrrGHAonA+i
 SLGXGlqYM5gdj4e76zEWNiEFD6I2wl+/uWz+Zvgmc9nOUXOaic/ROeL75inyMsSctCrOYtfx/xWAi
 Xu4P7KNw26VExzFoyvor+FvcCgOuoY4JONH2oUPuw1kJDs6EPbs1CLCUmZnYfaDh1upU2tyPE+Q23
 I0Q0Aaqew==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i2XpX-006sHn-4g; Tue, 27 Aug 2019 09:31:59 +0000
Received: from 2a01:4c8:100c:7dd1:5f27:ed70:63ce:f1e5
 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Tue, 27 Aug 2019 09:31:59 -0000
Message-ID: <4212ff6ae70fb09cd5517ac588317780.squirrel@twosheds.infradead.org>
In-Reply-To: <69fad9d8-dd8f-0982-3b87-de83be5b2ae2@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <759652afb52a3258f0da44de61ed28d0875774f8.camel@infradead.org>
 <6a051513-e462-e93a-3118-b722fa5ccdaa@suse.com>
 <35a8cd053ddf7129808c9e2755c4e7fe0d1a5c60.camel@infradead.org>
 <69fad9d8-dd8f-0982-3b87-de83be5b2ae2@suse.com>
Date: Tue, 27 Aug 2019 09:31:59 -0000
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Jan Beulich" <jbeulich@suse.com>
User-Agent: SquirrelMail/1.4.23 [SVN]-1.fc30.20180816
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/boot: Rename trampoline_{start,
 end} to boot_trampoline_{start, end}
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?IlJvZ2VyIFBhdSBNb25uw6ki?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE5LjA4LjIwMTkgMTc6MjQsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gTW9u
LCAyMDE5LTA4LTEyIGF0IDExOjU1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA5
LjA4LjIwMTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+PiBGcm9tOiBEYXZpZCBX
b29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+Pj4+Cj4+Pj4gSW4gcHJlcGFyYXRpb24gZm9y
IHNwbGl0dGluZyB0aGUgYm9vdCBhbmQgcGVybWFuZW50IHRyYW1wb2xpbmVzIGZyb20KPj4+PiBl
YWNoIG90aGVyLiBTb21lIG9mIHRoZXNlIHdpbGwgY2hhbmdlIGJhY2ssIGJ1dCBtb3N0IGFyZSBi
b290IHNvIGRvCj4+Pj4gdGhlCj4+Pj4gcGxhaW4gc2VhcmNoL3JlcGxhY2UgdGhhdCB3YXkgZmly
c3QsIHRoZW4gYSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwKPj4+PiBleHRyYWN0Cj4+Pj4gdGhlIHBl
cm1hbmVudCB0cmFtcG9saW5lIGNvZGUuCj4+Pgo+Pj4gVG8gYmUgaG9uZXN0IEkgZG9uJ3Qgdmll
dyBpdCBhcyBoZWxwZnVsIHRvIGRvIHRoaW5ncyBpbiB0aGlzIG9yZGVyLgo+Pj4gSWYgeW91IGZp
cnN0IHJlLWFycmFuZ2VkIHRoZSBvcmRlcmluZyBvZiBpdGVtcyB3aXRoaW4gdGhlIHRyYW1wb2xp
bmUsCj4+PiB3ZSdkIHRoZW4gbm90IGVuZCB1cCB3aXRoIGFuIGludGVybWVkaWF0ZSBzdGF0ZSB3
aGVyZSB0aGUgbGFiZWxzIGFyZQo+Pj4gbWlzbGVhZGluZy4gSXMgdGhlcmUgYSByZWFzb24gdGhp
bmdzIGNhbid0IHNlbnNpYmx5IGJlIGRvbmUgdGhlIG90aGVyCj4+PiB3YXkgYXJvdW5kPwo+Pgo+
PiBPYnZpb3VzbHkgSSBkaWQgYWxsIHRoaXMgaW4gYSB3b3JraW5nIHRyZWUgZmlyc3QsIHN3b3Jl
IGF0IGl0IGEgbG90IGFuZAo+PiBmaW5hbGx5IGdvdCBpdCB3b3JraW5nLCB0aGVuIGF0dGVtcHRl
ZCB0byBzcGxpdCBpdCB1cCBpbnRvIHNlcGFyYXRlCj4+IG1lYW5pbmdmdWwgY29tbWl0cyB3aGlj
aCBpbmRpdmlkdWFsbHkgbWFkZSBzZW5zZS4gVGhlcmUgaXMgcGxlbnR5IG9mCj4+IHJvb20gZm9y
IHN1YmplY3Rpdml0eSBpbiB0aGUgY2hvaWNlcyBJIG1hZGUgaW4gdGhhdCBsYXN0IHN0ZXAuCj4+
Cj4+IEknbSBub3Qgc3VyZSBJIHF1aXRlIHNlZSB3aHkgeW91IHNheSB0aGUgbGFiZWxzIGFyZSBt
aXNsZWFkaW5nLiBNeQo+PiBpbnRlbnQgd2FzIHRvIGFwcGx5IGxhYmVscyBiYXNlZCBvbiB3aGF0
IGVhY2ggb2JqZWN0IGlzICp1c2VkKiBmb3IsCj4+IGRlc3BpdGUgdGhlIGZhY3QgdGhhdCB0byBz
dGFydCB3aXRoIHRoZXkncmUgYWxsIGFjdHVhbGx5IGluIHRoZSBzYW1lCj4+IHBsYWNlLiBBbmQg
dGhlbiB0byBhY3R1YWxseSBtb3ZlIGVhY2ggZGlmZmVyZW50IHR5cGUgb2Ygc3ltYm9sIGludG8g
aXRzCj4+IHNlcGFyYXRlIHNlY3Rpb24vbG9jYXRpb24gdG8gY2xlYW4gdGhpbmdzIHVwLgo+Pgo+
PiBJcyBpdCBqdXN0IHRoZSBjb2RlIGNvbW1lbnRzIGF0IHRoZSBzdGFydCBvZiB0cmFtcG9saW5l
LlMgdGhhdCB5b3UgZmluZAo+PiBtaXNsZWFkaW5nIGluIHRoZSBpbnRlcmltIHN0YWdlPyBCZWNh
dXNlIHRob3NlICpkb24ndCogcHVyZWx5IHRhbGsKPj4gYWJvdXQgd2hhdCBib290c3ltL2Jvb3Rk
YXRhc3ltL3RyYW1wc3ltL3RyYW1wMzJzeW0gYXJlIHVzZWQgZm9yOyB0aGV5Cj4+IGRvIHNheSBo
b3cgdGhleSBhcmUgKGV2ZW50dWFsbHkpIHJlbG9jYXRlZC4gSSBzdXBwb3NlIEkgY291bGQgcmlw
IHRoYXQKPj4gY29kZSBjb21tZW50IG91dCBvZiBwYXRjaCAjMyBjb21wbGV0ZWx5IGFuZCBhZGQg
aXQgYWdhaW4gaW4gYSBsYXRlcgo+PiBjb21taXQuLi4gb3IganVzdCBqdXN0IGFkZCBpdCBhZ2Fp
bi4gSSB3cml0ZSBjb2RlIGNvbW1lbnRzIGluIGFuCj4+IGF0dGVtcHQgdG8gYmUgaGVscGZ1bCB0
byB0aG9zZSB3aG8gY29tZSBhZnRlciBtZSAoZXNwZWNpYWxseSB3aGVuCj4+IHRoYXQncyBhY3R1
YWxseSBteXNlbGYpIGJ1dCBpZiB0aGV5J3JlIGdvaW5nIHRvIGNhdXNlIHByb2JsZW1zLCB0aGVu
Cj4+IG1heWJlIHRoZXkncmUgbW9yZSBoYXNzbGUgdGhhbiB0aGV5J3JlIHdvcnRoPwo+Cj4gTm8s
IGl0J3MgYWN0dWFsbHkgdGhlIGxhYmVsIG5hbWVzOiBUaGUgImJvb3QiIHRoYXQgdGhpcyBwYXRj
aCBwcmVmaXhlcwo+IHRvIHRoZW0gaXNuJ3QgY29ycmVjdCB1bnRpbCBhbGwgcG9zdC1ib290IChp
LmUuIEFQIGJyaW5ndXApIHBhcnRzCj4gaGF2ZSBiZWVuIG1vdmVkIG91dCBvZiB0aGUgZnJhbWVk
IGJsb2NrIG9mIGNvZGUuCgpIbSwgT0suIEFGSyBhdCB0aGlzIG1vbWVudCBidXQgSSdsbCB0YWtl
IGFub3RoZXIgbG9vay4gQmFzaWNhbGx5IHRoZXJlCndhc24ndCBhIHBlcmZlY3Qgd2F5IHRvIGxh
YmVsIGFuZCBtb3ZlIHRoaW5nczsgZWl0aGVyIHdheSB0aGVyZSB3ZXJlCmdsaXRjaGVzIGR1cmlu
ZyB0aGUgdHJhbnNpdGlvbiBhbmQgbXkgcmVjb2xsZWN0aW9uIHdhcyB0aGF0IEkgcHJlZmVycmVk
CnRoaXMgb25lIGJlY2F1c2UgaXQgd2FzIHB1cmVseSBjb3NtZXRpYyBhbmQgb25seSBsYXN0ZWQg
Zm9yIGEgY29tbWl0IG9yCnR3by4KCldpbGwgc2VlIGlmIEkgY2FuIGNvbWUgdXAgd2l0aCBzb21l
dGhpbmcgbmljZXIgd2l0aGluIHRoZSBhbW91bnQgb2YgdGltZQppdCBpcyByZWFzb25hYmxlIHRv
IHNwZW5kIG9uIHN1Y2ggYSB0cmFuc2l0aW9uYWwgaXNzdWUuCgoKLS0gCmR3bXcyCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
