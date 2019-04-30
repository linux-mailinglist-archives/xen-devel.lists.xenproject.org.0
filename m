Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB9FB97
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLToh-0008HN-K4; Tue, 30 Apr 2019 14:33:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5T1X=TA=citrix.com=prvs=016a56d21=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLTof-0008HI-NM
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:33:05 +0000
X-Inumbo-ID: dcb47523-6b54-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dcb47523-6b54-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 14:33:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,414,1549929600"; d="scan'208";a="84761532"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23752.23708.661076.214573@mariner.uk.xensource.com>
Date: Tue, 30 Apr 2019 15:33:00 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIGxpbnV4IDQuMTkgeGVuc3RvcmUg
bWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBSZTogW2xpbnV4LTQuMTkgdGVzdF0gMTM1NDIwOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBPbiAzMC4wNC4xOSBhdCAxNTowMiwgPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gSVNUTSB0aGF0IHRoZXJlIGFyZSAqdHdvKiBidWdzIGhl
cmU6Cj4gPiAKPiA+ICAxLiBXaGF0ZXZlciBjYXVzZWQgdGhlIG1lbW9yeSBhbGxvY2F0aW9uIGZh
aWx1cmUKPiAKPiBBbiBvcmRlci01IGFsbG9jYXRpb24gaXMgc2V0IHRvIGZhaWwgYXQgYW55IHRp
bWUgKGFmYWljdCkuIEkgZmluZCBpdAo+IHN1cnByaXNpbmcgdGhhdCBzdHJ1Y3QgYmxrZnJvbnRf
cmluZ19pbmZvIGluc3RhbmNlcyAoZXZlbiBhcnJheXMKPiBvZiB0aGVtIHdoZW4gdXNpbmcgbXVs
dGlwbGUgcmluZ3MpIGdldCBhbGxvY2F0ZWQgdXNpbmcga2NhbGxvYygpCj4gcmF0aGVyIHRoYW4g
a3ZjYWxsb2MoKSwgY29uc2lkZXJpbmcgdGhlIHNpemUgb2YgdGhlIHN0cnVjdHVyZQo+ICgweDE0
MEUwIGFjY29yZGluZyB0byB0aGUgZGlzYXNzZW1ibHkgb2YgdGhlIDUuMC4xIGRyaXZlciBJCj4g
aGFkIHRvIGhhbmQpLgoKSSB3aWxsIGxlYXZlIGFuc3dlcmluZyB0aGlzIHRvIHRoZSBibGtmcm9u
dC9saW51eCBmb2xrcy4uLgoKPiA+ICAyLiBUaGF0IGEgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVy
ZSBjYW4gY2F1c2UgcGVybWFuZW50IGxvc3Mgb2YgYQo+ID4gICAgICB4ZW5zdG9yZSB3YXRjaCBl
dmVudAo+IAo+IFdlbGwsIGlzbid0IGl0IHNvcnQgb2YgZXhwZWN0ZWQgdGhhdCBhbiBhbGxvY2F0
aW9uIGZhaWx1cmUgd2lsbCBsZWFkCj4gdG8gZnVydGhlciBwcm9ibGVtcz8KCkkgd291bGQgaGF2
ZSBob3BlZCB0aGF0IGl0IHdvdWxkIHJlc3VsdCBpbiBzb21ldGhpbmcgb3RoZXIgdGhhbiBhCmhh
bmcuICBBdCB3b3JzdCwgYmxrZnJvbnQgb3VnaHQgdG8gZ28gaW50byBhIHN0YXRlIHdoZXJlIGl0
ICprbm93cyoKdGhhdCBpdCBpcyB1dHRlcmx5IGJyb2tlbiBhbmQgcmVwb3J0cyB0aGlzIHByb3Bl
cmx5LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
