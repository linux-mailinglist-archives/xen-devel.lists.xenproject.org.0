Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F4E6E84
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 09:51:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP0gN-0007qg-QA; Mon, 28 Oct 2019 08:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1/kY=YV=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1iP0gN-0007qb-5w
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 08:47:23 +0000
X-Inumbo-ID: 8ce14288-f95f-11e9-beca-bc764e2007e4
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ce14288-f95f-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 08:47:19 +0000 (UTC)
Received: from [IPv6:2601:646:8600:3281:9f1:c5fc:f434:6a14]
 ([IPv6:2601:646:8600:3281:9f1:c5fc:f434:6a14]) (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x9S8kpgE2149778
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 28 Oct 2019 01:46:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x9S8kpgE2149778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1572252419;
 bh=Skodpi7nxzjzM78bU7LUUKImk5EIuBVZg2w//InSrlA=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=GIY6FWFqmb/JHimgI8SsfdgfiZRpBb8TM+vQmDCQ0kUqXCIe4S/ENEhbqQVuGqto5
 gDJonHp5mnnv6Ju3KmVvKLu+QRoSef5OlryrIP5fvx3DFH+E431DcFy7AONIRcNvZv
 wuuFPG90IHiSRZTdUfVItRzn81mywuogRuHtFk2zf1cmwM9DLcKEzWfbI/IqkzhFiq
 VqhApkc+x4e7aBFZnq28V+oJE5hI4rt3Ooyne4Z2Y1h/TsIDelXli3wQJM1AtTQb0t
 M+xwLznPWjg0KdCruXHQQYKi6cVJajz7FcXAsVqgaj+bZuaxbHLlHlI4/WS/+WR03j
 R1rS8Fx+2oBqA==
Date: Mon, 28 Oct 2019 01:46:43 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <20191025073858.15081-1-jgross@suse.com>
References: <20191025073858.15081-1-jgross@suse.com>
MIME-Version: 1.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
From: hpa@zytor.com
Message-ID: <088E9605-9FFA-42B7-BAB2-89D9DF0756BB@zytor.com>
Subject: Re: [Xen-devel] [PATCH] xen: issue deprecation warning for 32-bit
 pv guest
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
Cc: Borislav Petkov <bp@alien8.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gT2N0b2JlciAyNSwgMjAxOSAxMjozODo1OCBBTSBQRFQsIEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj5TdXBwb3J0IGZvciB0aGUga2VybmVsIGFzIFhlbiAzMi1iaXQg
UFYgZ3Vlc3Qgd2lsbCBzb29uIGJlIHJlbW92ZWQuCj5Jc3N1ZSBhIHdhcm5pbmcgd2hlbiBib290
ZWQgYXMgc3VjaC4KPgo+U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+LS0tCj4gYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgOCArKysrKysrKwo+IDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+aW5kZXggNThm
NzlhYjMyMzU4Li41YmZlYTM3NGExNjAgMTAwNjQ0Cj4tLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX3B2LmMKPisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+QEAgLTExNyw2ICsx
MTcsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IHhlbl9iYW5uZXIodm9pZCkKPiAJcHJpbnRrKEtF
Uk5fSU5GTyAiWGVuIHZlcnNpb246ICVkLiVkJXMlc1xuIiwKPiAJICAgICAgIHZlcnNpb24gPj4g
MTYsIHZlcnNpb24gJiAweGZmZmYsIGV4dHJhLmV4dHJhdmVyc2lvbiwKPgkgICAgICAgeGVuX2Zl
YXR1cmUoWEVORkVBVF9tbXVfcHRfdXBkYXRlX3ByZXNlcnZlX2FkKSA/ICIKPihwcmVzZXJ2ZS1B
RCkiIDogIiIpOwo+Kwo+KyNpZmRlZiBDT05GSUdfWDg2XzMyCj4rCXByX3dhcm4oIldBUk5JTkch
IFdBUk5JTkchIFdBUk5JTkchIFdBUk5JTkchIFdBUk5JTkchIFdBUk5JTkchCj5XQVJOSU5HIVxu
Igo+KwkJIlN1cHBvcnQgZm9yIHJ1bm5pbmcgYXMgMzItYml0IFBWLWd1ZXN0IHVuZGVyIFhlbiB3
aWxsIHNvb24gYmUKPnJlbW92ZWRcbiIKPisJCSJmcm9tIHRoZSBMaW51eCBrZXJuZWwhXG4iCj4r
CQkiUGxlYXNlIHVzZSBlaXRoZXIgYSA2NC1iaXQga2VybmVsIG9yIHN3aXRjaCB0byBIVk0gb3Ig
UFZIIG1vZGUhXG4iCj4rCQkiV0FSTklORyEgV0FSTklORyEgV0FSTklORyEgV0FSTklORyEgV0FS
TklORyEgV0FSTklORyEgV0FSTklORyFcbiIpOwo+KyNlbmRpZgo+IH0KPiAKPiBzdGF0aWMgdm9p
ZCBfX2luaXQgeGVuX3B2X2luaXRfcGxhdGZvcm0odm9pZCkKCkFuZCB0aGVyZSB3YXMgbXVjaCBy
ZWpvaWNpbmcuCgpZYWF5LgotLSAKU2VudCBmcm9tIG15IEFuZHJvaWQgZGV2aWNlIHdpdGggSy05
IE1haWwuIFBsZWFzZSBleGN1c2UgbXkgYnJldml0eS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
