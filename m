Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4FFB7C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLThx-0007HN-9m; Tue, 30 Apr 2019 14:26:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLThv-0007HI-QM
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:26:07 +0000
X-Inumbo-ID: e3306528-6b53-11e9-86d9-33446dbc7a9e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3306528-6b53-11e9-86d9-33446dbc7a9e;
 Tue, 30 Apr 2019 14:26:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 08:26:04 -0600
Message-Id: <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 08:26:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
In-Reply-To: <23752.18285.3998.815201@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
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

Pj4+IE9uIDMwLjA0LjE5IGF0IDE1OjAyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSVNUTSB0aGF0IHRoZXJlIGFyZSAqdHdvKiBidWdzIGhlcmU6Cj4gCj4gIDEuIFdoYXRldmVy
IGNhdXNlZCB0aGUgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZQoKQW4gb3JkZXItNSBhbGxvY2F0
aW9uIGlzIHNldCB0byBmYWlsIGF0IGFueSB0aW1lIChhZmFpY3QpLiBJIGZpbmQgaXQKc3VycHJp
c2luZyB0aGF0IHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gaW5zdGFuY2VzIChldmVuIGFycmF5
cwpvZiB0aGVtIHdoZW4gdXNpbmcgbXVsdGlwbGUgcmluZ3MpIGdldCBhbGxvY2F0ZWQgdXNpbmcg
a2NhbGxvYygpCnJhdGhlciB0aGFuIGt2Y2FsbG9jKCksIGNvbnNpZGVyaW5nIHRoZSBzaXplIG9m
IHRoZSBzdHJ1Y3R1cmUKKDB4MTQwRTAgYWNjb3JkaW5nIHRvIHRoZSBkaXNhc3NlbWJseSBvZiB0
aGUgNS4wLjEgZHJpdmVyIEkKaGFkIHRvIGhhbmQpLgoKPiAgMi4gVGhhdCBhIG1lbW9yeSBhbGxv
Y2F0aW9uIGZhaWx1cmUgY2FuIGNhdXNlIHBlcm1hbmVudCBsb3NzIG9mIGEKPiAgICAgIHhlbnN0
b3JlIHdhdGNoIGV2ZW50CgpXZWxsLCBpc24ndCBpdCBzb3J0IG9mIGV4cGVjdGVkIHRoYXQgYW4g
YWxsb2NhdGlvbiBmYWlsdXJlIHdpbGwgbGVhZAp0byBmdXJ0aGVyIHByb2JsZW1zPwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
