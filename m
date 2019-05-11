Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C691A8F7
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 20:01:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPWFw-0001n3-J7; Sat, 11 May 2019 17:57:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fBT8=TL=citrix.com=prvs=02799eec4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hPWFu-0001my-Gi
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 17:57:54 +0000
X-Inumbo-ID: 4bea335e-7416-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4bea335e-7416-11e9-8980-bc764e045a96;
 Sat, 11 May 2019 17:57:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,458,1549929600"; d="scan'208";a="85357342"
Date: Sat, 11 May 2019 18:57:50 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190511175750.GA3977@zion.uk.xensource.com>
References: <osstest-135931-mainreport@xen.org>
 <96bb5da0-4d57-1238-fbc4-53a02e1848c8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96bb5da0-4d57-1238-fbc4-53a02e1848c8@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [xen-unstable test] 135931: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMDI6Mjk6NTNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxMS8wNS8yMDE5IDEzOjIwLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6
Cj4gPiBmbGlnaHQgMTM1OTMxIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTkzMS8KPiA+IAo+ID4g
UmVncmVzc2lvbnMgOi0oCj4gPiAKPiA+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQg
YXJlIGJsb2NraW5nLAo+ID4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46
Cj4gPiAgdGVzdC1hbWQ2NC1pMzg2LXhsICAgICAgICAgICAyMyBsZWFrLWNoZWNrL2NoZWNrICAg
ICAgICAgZmFpbCBSRUdSLiB2cy4gMTM0NzYzCj4gCj4gRG9lc24ndCBsb29rIGxpa2UgYSByZWFs
IGZhaWx1cmUgdG8gbWUuIElhbj8KCk5vdCBhIHJlYWwgZmFpbHVyZS4gVGhlIGxlYWsgd2FzIGR1
ZSB0byBsaW5nZXJpbmcgY3JvbiBwcm9jZXNzZXMuCgpUaGlzIGp1c3RpZmllcyBhIGZvcmNlLXB1
c2ggdG8gbWFzdGVyLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
