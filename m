Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E782C82385
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 19:03:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hugKk-0005Oy-Ef; Mon, 05 Aug 2019 16:59:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iDR0=WB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hugKj-0005Ot-67
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:59:41 +0000
X-Inumbo-ID: 6952ec75-b7a2-11e9-8980-bc764e045a96
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6952ec75-b7a2-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 16:59:40 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v18so79821194ljh.6
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 09:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mm7tjrM6/CEHbpTfAxJrUzCt7pqDuEFbtsmoDWQB1uQ=;
 b=OqsAmKBBRE0jI0wI5gZ8E/ACIL7gNPm5USUZJhhPeYPd9aIZMDhqJ7gjzIRShtiCa1
 KsDLGRptvO3JAGWuLUDV7AO/AXp8/PrEK79Qz2cicHGIDAWBZ0SkFN9l1Ea3numd3XSC
 yF1DSIxzIWJH/pPXPraeJ3bDrc+gduqx73RPO7cANKb2Om9sUWR1N+xU6w/jEjGrZtuB
 ele+4th3QdNX02EItLFptfVmDhtP1sh4K1OL8BMnGk29Yl6FS0He7hwx8WwCjECpn/Pb
 WzJysf1RuH5ZqV6u1zcEnxcqw7MHAgfLT9vInYXBo8m/O2Dxpl5A1Q5mKTgHRtb9TuH6
 mPPg==
X-Gm-Message-State: APjAAAUlF/U5egDhxSHmonENUzS4RGhDLzhx9+I3UjycUHgPf6/gXNv4
 eBufp2LBPE0pIxS7ZCeru+42BeNlJMQ=
X-Google-Smtp-Source: APXvYqzdWFOzZ5OIZutRhMLysIITsDJ8bbdjXx7AkKT9TlYCw/Cxe9x9Uz9L4Qf1IR+6htsDYZL3Uw==
X-Received: by 2002:a05:651c:1b8:: with SMTP id c24mr210972ljn.2.1565024378517; 
 Mon, 05 Aug 2019 09:59:38 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id k124sm15083765lfd.60.2019.08.05.09.59.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 09:59:38 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id x25so79956362ljh.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 09:59:37 -0700 (PDT)
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr15261022ljj.162.1565024377757; 
 Mon, 05 Aug 2019 09:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <156417922934.29470.16776755402986910394.stgit@Palanthas>
 <20190728105536.fezkzvqmie7zgdml@debian>
 <23880.15729.688038.327874@mariner.uk.xensource.com>
In-Reply-To: <23880.15729.688038.327874@mariner.uk.xensource.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 5 Aug 2019 17:59:21 +0100
X-Gmail-Original-Message-ID: <CAK9nU=o_Fmdof2P5h=EJ36gr7KyJKVkVAgtenkd__Z0ZtrH63g@mail.gmail.com>
Message-ID: <CAK9nU=o_Fmdof2P5h=EJ36gr7KyJKVkVAgtenkd__Z0ZtrH63g@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools: ipxe: update for fixing build with
 GCC9
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA1IEF1ZyAyMDE5IGF0IDE1OjMwLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gd3JvdGU6Cj4KPiBXZWkgTGl1IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFU
Q0hdIHRvb2xzOiBpcHhlOiB1cGRhdGUgZm9yIGZpeGluZyBidWlsZCB3aXRoIEdDQzkiKToKPiA+
IE9uIFNhdCwgSnVsIDI3LCAyMDE5IGF0IDEyOjEzOjQ5QU0gKzAyMDAsIERhcmlvIEZhZ2dpb2xp
IHdyb3RlOgo+ID4gPiBCdWlsZGluZyB3aXRoIEdDQzkgKG9uIG9wZW5TVVNFIFR1Ym1sZXdlZWQp
IGdlbmVyYXRlcyBhIGxvdCBvZiBlcnJvcnMgb2YKPiA+ID4gdGhlICJ0YWtpbmcgYWRkcmVzcyBv
ZiBwYWNrZWQgbWVtYmVyIG9mIC4uLiBtYXkgcmVzdWx0IGluIGFuIHVuYWxpZ25lZAo+ID4gPiBw
b2ludGVyIHZhbHVlIiBraW5kLgo+ID4gPgo+ID4gPiBVcGRhdGluZyB0byB1cHN0cmVhbSBjb21t
aXQgMWRkNTZkYmQxMTA4MiAoIltidWlsZF0gV29ya2Fyb3VuZCBjb21waWxhdGlvbgo+ID4gPiBl
cnJvciB3aXRoIGdjYyA5LjEiKSBzZWVtcyB0byBmaXggdGhlIHByb2JsZW0uCj4gPiA+Cj4gPiA+
IEZvciBtb3JlIGluZm8sIHNlZToKPiAuLi4KPiA+IFllcyB0aGlzIGlzIHdoYXQgd2Ugbm9ybWFs
bHkgZG8uCj4gPgo+ID4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4KPiBUaGFua3Mg
YWxsLiAgU2hvdWxkIHRoaXMgYmUgYmFja3BvcnRlZCBhbnl3aGVyZSA/ICBJJ20gaW5jbGluZWQg
dG8gc2F5Cj4gIm5vIiBiZWNhdXNlIHNvbWVvbmUgd2hvIHdhbnRzIHRoaXMgY2FuIGVhc2lseSBj
aGFuZ2UgaXQgdGhlbXNlbHZlcywKPiBhbmQgd2UgZG9uJ3Qgd2FudCB0byBkaXN0dXJiIHN0YWJs
ZSB1c2VycyB3aXRoIGFuIGlweGUgdmVyc2lvbiB1cGRhdGUuCj4KCkFncmVlZC4gSSBkb24ndCB0
aGluayB0aGlzIG5lZWRzIHRvIGJlIGJhY2twb3J0ZWQuCgpXZWkuCgo+IEJ1dCBJJ20gb3BlbiB0
byBvcGluaW9ucy4KPgo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
