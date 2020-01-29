Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7D14C994
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:28:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlU8-0002Cq-Ul; Wed, 29 Jan 2020 11:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GwGO=3S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwlU7-0002Cl-4R
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:26:15 +0000
X-Inumbo-ID: 2821bb92-428a-11ea-888e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2821bb92-428a-11ea-888e-12813bfff9fa;
 Wed, 29 Jan 2020 11:26:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDC19ABC4;
 Wed, 29 Jan 2020 11:26:12 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.co.uk>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a239c82563154aa7801fc9fa2ec70b1b@EX13D32EUC003.ant.amazon.com>
 <3e143e03-d67e-f626-22ba-792b5e96f70e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <67c77003-6cab-3dfb-c274-0200f6e100bf@suse.com>
Date: Wed, 29 Jan 2020 12:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3e143e03-d67e-f626-22ba-792b5e96f70e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.14 dates
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAgMTI6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjAxLjIwMjAgMTE6
NTUsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+ICAgIEknbSBub3QgYXdhcmUgb24gYW55IHByaW9y
IGRpc2N1c3Npb24gdy5yLnQuIGRhdGVzIGZvciBYZW4gNC4xNCBzbyBhcyBSTSBJJ2QgbGlrZSB0
byBwcm9wb3NlIHRoZSBmb2xsb3dpbmc6Cj4+Cj4+IExhc3QgcG9zdGluZzogTWF5IDFzdCAyMDIw
Cj4+IEhhcmQgRnJlZXplOiBNYXkgMjJuZCAyMDIwCj4+IFJlbGVhc2U6IEp1bmUgMjZ0aAo+IAo+
IFdhcyA0LjEzIHJlYWxseSBtb3JlIHRoYW4gMS41IG1vbnRocyBsYXRlPyBUaGUgYWJvdmUgd291
bGQgbWFrZQoKTmVhcmx5LiBQbGFubmVkIHJlbGVhc2Ugd2FzIE5vdiA3dGgsIGFjdHVhbCByZWxl
YXNlIHdhcyBEZWMgMTh0aC4KCj4gaXRzIG9yaWdpbmFsbHkgcGxhbm5lZCByZWxlYXNlIGRhdGUg
T2N0IDI2dGggKHRoZSBhY3R1YWwgb25lIHdhcwo+IERlYyAxOHRoKSB3aXRoIG91ciBjdXJyZW50
IDggbW9udGggY2FkZW5jZS4KClRoZSBwbGFubmVkIGRhdGVzIGZvciA0LjEyIGFuZCA0LjEzIHdl
cmUgYmFzZWQgb246CgpodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxOC0wNy9tc2cwMjI0MC5odG1sCgphbmQgdGhpcyB3b3VsZCByZXN1bHQgaW4gcm91Z2hs
eSB0aGUgZGF0ZXMgUGF1bCBwb3N0ZWQsIG1heWJlIDEgd2VlawpsYXRlci4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
