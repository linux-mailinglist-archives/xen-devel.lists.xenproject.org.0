Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E0178E5C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:29:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RFB-00066j-Tb; Wed, 04 Mar 2020 10:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=usiQ=4V=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j9RFA-00066Z-EU
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:27:12 +0000
X-Inumbo-ID: b5b14d54-5e02-11ea-b52f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5b14d54-5e02-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 10:27:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9RF9-0003DF-Bc; Wed, 04 Mar 2020 10:27:11 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9RF9-0004Cz-2H; Wed, 04 Mar 2020 10:27:11 +0000
Date: Wed, 4 Mar 2020 10:27:08 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200304102708.an6op7my5neophob@debian>
References: <ddbffc40de3a8fc9f0104f66b9725fe3f2b6b6c8.1583241706.git.pawel@invisiblethingslab.com>
 <20200303155104.GB1229@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303155104.GB1229@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH v4] libxl: wait for console path before
 firing console_available
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
Cc: xen-devel@lists.xenproject.org,
 =?utf-8?B?UGF3ZcWC?= Marczewski <pawel@invisiblethingslab.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDM6NTE6MDRQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDI6Mjg6MjBQTSArMDEwMCwgUGF3ZcWC
IE1hcmN6ZXdza2kgd3JvdGU6Cj4gPiBJZiB0aGUgcGF0aCBkb2Vzbid0IGJlY29tZSBhdmFpbGFi
bGUgYWZ0ZXIgTElCWExfSU5JVF9USU1FT1VUCj4gPiBzZWNvbmRzLCBmYWlsIHRoZSBkb21haW4g
Y3JlYXRpb24uCj4gPiAKPiA+IElmIHdlIHNraXAgdGhlIGJvb3Rsb2FkZXIsIHRoZSBUVFkgcGF0
aCB3aWxsIGJlIHNldCBieSB4ZW5jb25zb2xlZC4KPiA+IEhvd2V2ZXIsIHRoZXJlIGlzIG5vIGd1
YXJhbnRlZSB0aGF0IHRoaXMgd2lsbCBoYXBwZW4gYnkgdGhlIHRpbWUgd2UKPiA+IHdhbnQgdG8g
Y2FsbCB0aGUgY29uc29sZV9hdmFpbGFibGUgY2FsbGJhY2ssIHNvIHdlIGhhdmUgdG8gd2FpdC4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIE1hcmN6ZXdza2kgPHBhd2VsQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkFwcGxpZWQuIFRoYW5r
cy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
