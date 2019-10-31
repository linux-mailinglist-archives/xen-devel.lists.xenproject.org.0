Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D89EAB27
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 08:55:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ5FQ-0001NS-DW; Thu, 31 Oct 2019 07:52:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ5FO-0001Mi-QP
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 07:51:58 +0000
X-Inumbo-ID: 4fb83456-fbb3-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fb83456-fbb3-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 07:51:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F329ABBD;
 Thu, 31 Oct 2019 07:51:56 +0000 (UTC)
To: "Bell, Oren" <oren.bell@wustl.edu>
References: <SN6PR02MB47196DB277CAFEA9B4D5FD51F6670@SN6PR02MB4719.namprd02.prod.outlook.com>
 <813aaa3e-1c79-24ac-256e-4e74aafad46c@suse.com>
 <SN6PR02MB4719855FA1DA7CE9AC457497F6600@SN6PR02MB4719.namprd02.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <218e01d9-635a-920b-6e55-b3e9db762fc7@suse.com>
Date: Thu, 31 Oct 2019 08:51:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4719855FA1DA7CE9AC457497F6600@SN6PR02MB4719.namprd02.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxOToyNCwgQmVsbCwgT3JlbiB3cm90ZToKPiBSdW5uaW5nIFhlbiBEb20w
LWxlc3MgbGVhdmVzIHRoZSBOSUMgaW50YWN0LCBzbyB5b3UncmUgY29ycmVjdCBpbiBhc3Nlc3Np
bmcgdGhhdCBYZW4gYnkgaXRzZWxmIGlzIG5vdCB0aGUgY2F1c2UuCj4gQXMgZm9yIHJ1bm5pbmcg
d2l0aG91dCB0aGUgZHJpdmVyLCBJJ20gbm90IHN1cmUgdGhhdCdzIHBvc3NpYmxlIChhdCBsZWFz
dCBmb3IgbXkgY29tcGV0ZW5jeSkuIEl0IHVzZXMgdGhlIEludGVsIEJhc2UgR2lnYWJpdCBkcml2
ZXIgdGhhdCdzIGJ1aWx0IGludG8gdGhlIGtlcm5lbC4KCldlbGwsIGlmIHRoZXJlJ3MgYSBrZXJu
ZWwgc2lkZSBhc3BlY3QgdG8gaXQgKHdoaWNoIG5vdyBzZWVtcwpwcmV0dHkgbGlrZWx5KSwgdGhl
biBwbGF5aW5nIHdpdGggdGhlIGtlcm5lbCB3aWxsIGJlIHVuYXZvaWRhYmxlLgpBIGZpcnN0IHN0
ZXAgd291bGQgYmUgdG8gYnVpbGQgYSBrZXJuZWwgd2l0aCB0aGUgZHJpdmVyIG5vdCBidWlsdApp
biwgYnV0IGFzIGEgbW9kdWxlLCBzdWNoIHRoYXQgaXRzIGxvYWRpbmcgY291bGQgYmUgcHJldmVu
dGVkIChhbgphbHRlcm5hdGl2ZSB3b3VsZCBiZSBhIGtlcm5lbCB3aXRob3V0IHRoZSBkcml2ZXIp
LiBUaGVuIGFnYWluIEkKc2VlbSB0byB2YWd1ZWx5IHJlY2FsbCB0aGVyZSBiZWluZyBtZWFucyB0
byBzdXBwcmVzcyB0aGUgYmluZGluZwpvZiBhIGRyaXZlciB0byBwYXJ0aWN1bGFyIGRldmljZXMg
dmlhIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLiBJJ20Kbm90IGdvaW5nIHRvIGV4Y2x1ZGUgdGhv
dWdoIHRoYXQgdGhpcyBtaWdodCBiZSBkaXN0cm8gc3BlY2lmaWMsIG9yCmJlIHJlc3RyaWN0ZWQg
dG8gZXZlbiBtb3JlIHNwZWNpYWwgY2FzZXMgbGlrZSBkaXN0cm8gaW5zdGFsbGF0aW9uLgoKPiBB
bmQgcnVubmluZyB0aGUgbWFjaGluZSB3aXRob3V0IHVzaW5nIHRoZSBOSUMgd2lsbCBzdGlsbCBi
cmVhayBpdC4KPiAKPiBBcyBmb3IgdGhlIElPTU1VIHN1Z2dlc3Rpb246IHdlIHN0aWxsIGdvdCBi
YXNpYyBwaW5naW5nIHRvIHdvcmssIGFzc3VtaW5nIGFuIElQIGFkZHJlc3Mgd2FzIHN0YXRpY2Fs
bHkgYWxsb2NhdGVkLCBzbyBJIGRvbid0IHRoaW5rIElPTU1VIGlzIGEgdmFsaWQgcm91dGUgZm9y
IGludmVzdGlnYXRpb24sIGFzIGFueSBhYmVycmF0aW9ucyB0aGVyZSBzaG91bGQgbGVhdmUgdGhl
IE5JQyB0b3RhbGx5IG5vbi1mdW5jdGlvbmFsLgoKSSdtIGNvbmZ1c2VkIC0gYmFzaWMgcGluZ2lu
ZyBzZWVtcyB0byBjb250cmFkaWN0IHlvdXIgdW5jb25kaXRpb25hbAoiYnJpY2tzIiBzdGF0ZW1l
bnQuIFRoaXMgd291bGQgcmF0aGVyIHN1Z2dlc3Qgc29tZXRoaW5nIGR1cmluZwpub3JtYWwgb3Bl
cmF0aW9uIGJyZWFrcyB0aGluZ3MsIHJhdGhlciB0aGFuIChhcyBhc3N1bWVkIHNvIGZhcikgYQpz
cGVjaWZpYyBpbml0aWFsaXphdGlvbiBzdGVwLiBZZXQgZXZlbiBhYm92ZSB5b3Ugc3RhdGUgIkFu
ZCBydW5uaW5nCnRoZSBtYWNoaW5lIHdpdGhvdXQgdXNpbmcgdGhlIE5JQyB3aWxsIHN0aWxsIGJy
ZWFrIGl0IiAtIHRoaXMgYWdhaW4Kc3VnZ2VzdHMgc29tZSBzZXR1cCBzdGVwIHRvIGJlIGF0IGZh
dWx0LiBPciBwZXJoYXBzIHdlIGRvbid0IHNoYXJlCmFuIHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCAi
bm90IHVzaW5nIHRoZSBOSUMiIG1lYW5zOiBJIGltcGx5IGhlcmUKdGhhdCB0aGUgTklDIGRvZXNu
J3QgZ2V0IGluaXRpYWxpemVkLCBqdXN0IGl0cyBkcml2ZXIgbG9hZGVkIChpLmUuCm5vIElQIGFk
ZHJlc3MgYXNzaWduZWQsIGFuZCBoZW5jZSBpbiBwYXJ0aWN1bGFyIGFsc28gbm8gd29ya2luZwpw
aW5ncykuCgpBbmQgYnR3IC0gcGxlYXNlIGRvbid0IHRvcC1wb3N0LgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
