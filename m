Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14614B560
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:53:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRHF-0007Wz-QQ; Tue, 28 Jan 2020 13:51:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwRHE-0007WD-Gq
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:51:36 +0000
X-Inumbo-ID: 4c104575-41d5-11ea-86c7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c104575-41d5-11ea-86c7-12813bfff9fa;
 Tue, 28 Jan 2020 13:51:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRHD-0000iF-IL; Tue, 28 Jan 2020 13:51:35 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRHD-0003Cg-8S; Tue, 28 Jan 2020 13:51:35 +0000
Date: Tue, 28 Jan 2020 13:51:32 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200128135132.r5hmfpi5tmtj3uls@debian>
References: <20200128125216.709-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128125216.709-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/apic: Improve current_local_apic_mode()
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTI6NTI6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfWDJBUElDKSBkb2Vzbid0IG5lZWQgY2hl
Y2tpbmcgdG8gaW50ZXJwcmV0Cj4gQVBJQ19CQVNFX0VYVEQuCj4gCj4gQWxzbyB0YWtlIHRoZSBv
cHBvcnR1bml0eSB0byBvcHRpbWlzZSB0aGUgZ2VuZXJhdGVkIGFzc2VtYmx5IGJ5IG5vdCB1c2lu
Zwo+IHJkbXNybCgpLiAgR0NDIGlzbid0IGNsZXZlciBlbm91Z2ggdG8gc3BvdCB0aGF0IGl0IGNh
biBkcm9wIHRoZSBzaGlmdCBhbmQgb3IKPiB0byBwdXQgJWVheCBpbiB0aGUgaGlnaGVyIGhhbGYg
b2YgbXNyX2NvbnRlbnRzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
