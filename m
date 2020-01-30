Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2414DE34
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:50:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixC2l-0000yn-Uh; Thu, 30 Jan 2020 15:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XJj3=3T=neclab.eu=simon.kuenzer@srs-us1.protection.inumbo.net>)
 id 1ixC0m-0000wC-Dz
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:45:44 +0000
X-Inumbo-ID: 8eb30fd0-4377-11ea-8396-bc764e2007e4
Received: from mailer1.neclab.eu (unknown [195.37.70.40])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8eb30fd0-4377-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 15:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mailer1.neclab.eu (Postfix) with ESMTP id EF329103928;
 Thu, 30 Jan 2020 16:45:35 +0100 (CET)
X-Virus-Scanned: Amavisd on Debian GNU/Linux (atlas-a.office.hd)
Received: from mailer1.neclab.eu ([127.0.0.1])
 by localhost (atlas-a.office.hd [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZIKRvAsfLTk; Thu, 30 Jan 2020 16:45:35 +0100 (CET)
X-ENC: Last-Hop-TLS-encrypted
X-ENC: Last-Hop-TLS-encrypted
Received: from puck.office.hd (puck.office.hd [192.168.24.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailer1.neclab.eu (Postfix) with ESMTPS id C235A100EE5;
 Thu, 30 Jan 2020 16:45:35 +0100 (CET)
Received: from puck.office.hd (192.168.24.91) by puck.office.hd
 (192.168.24.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jan
 2020 16:45:35 +0100
Received: from puck.office.hd ([192.168.126.12]) by puck.office.hd
 ([192.168.126.12]) with mapi id 15.01.1713.009; Thu, 30 Jan 2020 16:45:35
 +0100
From: Simon Kuenzer <simon.kuenzer@neclab.eu>
To: Ian Jackson <ian.jackson@citrix.com>, "xen-announce@lists.xenproject.org"
 <xen-announce@lists.xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>
Thread-Topic: [Minios-devel] Lars Kurth
Thread-Index: AQHV130sRzQIxU10IUmG/iaW6sMkfqgDWaMA
Date: Thu, 30 Jan 2020 15:45:35 +0000
Message-ID: <3EA84662-71C6-4993-B287-28C777F1EEBF@neclab.eu>
References: <24114.60930.12664.525976@mariner.uk.xensource.com>
In-Reply-To: <24114.60930.12664.525976@mariner.uk.xensource.com>
Accept-Language: en-GB, gl-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.12.200112
x-originating-ip: [192.168.24.96]
Content-ID: <467018B3D47B2640AA8432FC65F231EC@office.hd>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Jan 2020 15:47:45 +0000
Subject: Re: [Xen-devel] [Minios-devel] Lars Kurth
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBhbSBkZWVwbHkgc2hvY2tlZCBieSB0aGUgbmV3cy4gSSB3b3VsZCBsaWtlIHRvIGV4cHJlc3Mg
bXkgZGVlcGVzdCBjb25kb2xlbmNlcyB0byBMYXJzJyBmYW1pbHkgYW5kIGZyaWVuZHMuIExhcnMg
aGFzIGFsd2F5cyBiZWVuIGEgdmVyeSBvcGVuLW1pbmRlZCBhbmQgc3VwcG9ydGl2ZSBwZXJzb24u
IEhlIHdhcyBkZWZpbml0ZWx5IGEgYmlnIHdpbiBmb3IgdGhlIFhlbiBQcm9qZWN0IGFuZCBpdHMg
Y29tbXVuaXR5LiBJIGZlZWwgaG9ub3JlZCB0byBoYXZlIGhhZCB0aGUgY2hhbmNlIHRvIHdvcmsg
d2l0aCBoaW0uDQoNCkkgYW0gdmVyeSBzb3JyeSBmb3IgdGhlIGxvc3MuIEhlIHdpbGwgYmUgZ3Jl
YXRseSBtaXNzZWQuDQoNClNpbW9uDQoNCu+7v09uIDMwLjAxLjIwLCAxNTo1NCwgIk1pbmlvcy1k
ZXZlbCBvbiBiZWhhbGYgb2YgSWFuIEphY2tzb24iIDxtaW5pb3MtZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZyBvbiBiZWhhbGYgb2YgaWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3Jv
dGU6DQoNCiAgICBJJ20gdmVyeSBzYWQgdG8gaW5mb3JtIHlvdSB0aGF0IExhcnMgS3VydGggcGFz
c2VkIGF3YXkgZWFybGllciB0aGlzDQogICAgd2Vlay4gIE1hbnkgb2YgdXMgcmVnYXJkZWQgTGFy
cyBhcyBhIHBlcnNvbmFsIGZyaWVuZCwgYW5kIGhpcyBsb3NzIGlzIGENCiAgICBncmVhdCBsb3Nz
IHRvIHRoZSBYZW4gUHJvamVjdC4NCiAgICANCiAgICBXZSBwbGFuIHRvIGhhdmUgYSB0cmlidXRl
IHRvIExhcnMgb24gdGhlIFhlblByb2plY3QgYmxvZyBpbiB0aGUgbmVhcg0KICAgIGZ1dHVyZS4g
IFRob3NlIHdobyBhcmUgYXR0ZW5kaW5nIEZPU0RFTSBtYXkgd2lzaCB0byBhdHRlbmQgdGhlIHNo
b3J0DQogICAgdHJpYnV0ZSB3ZSBwbGFuIGZvciBTdW5kYXkgbW9ybmluZzoNCiAgICAgIGh0dHBz
Oi8vZm9zZGVtLm9yZy8yMDIwL3NjaGVkdWxlL2V2ZW50L3ZhaV9tZW1vcnlfb2ZfbGFyc19rdXJ0
aC8NCiAgICANCiAgICBGb3IgdGhlIG1vbWVudCwgTGFycydzIG1haWwgYWxpYXNlcyBAeGVucHJv
amVjdC5vcmcsIGFuZCB0aGUNCiAgICBjb21tdW5pdHkubWFuYWdlckB4ZW5wcm9qZWN0IGFsaWFz
LCB3aWxsIGJlIGZvcndhcmRlZCB0byBteXNlbGYNCiAgICBhbmQvb3IgR2VvcmdlIER1bmxhcC4N
CiAgICANCiAgICBJYW4gSmFja3Nvbi4NCiAgICANCiAgICBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KICAgIE1pbmlvcy1kZXZlbCBtYWlsaW5nIGxpc3QN
CiAgICBNaW5pb3MtZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCiAgICBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vbWluaW9zLWRldmVsDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
