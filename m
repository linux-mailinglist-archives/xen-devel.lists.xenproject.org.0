Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646BB78AB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAus5-0004HL-6T; Thu, 19 Sep 2019 11:45:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAus4-0004HG-5T
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:45:12 +0000
X-Inumbo-ID: efb719f6-dad2-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id efb719f6-dad2-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 11:45:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D653828;
 Thu, 19 Sep 2019 04:45:10 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130453F67D;
 Thu, 19 Sep 2019 04:45:09 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fd0e0580-2796-40c8-1f53-642e56d2c98e@arm.com>
Date: Thu, 19 Sep 2019 12:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IFRoZSBJUE1NVS1WTVNBIGlzIFZNU0EtY29tcGF0aWJsZSBJL08gTWVt
b3J5IE1hbmFnZW1lbnQgVW5pdCAoSU9NTVUpCj4gd2hpY2ggcHJvdmlkZXMgYWRkcmVzcyB0cmFu
c2xhdGlvbiBhbmQgYWNjZXNzIHByb3RlY3Rpb24gZnVuY3Rpb25hbGl0aWVzCj4gdG8gcHJvY2Vz
c2luZyB1bml0cyBhbmQgaW50ZXJjb25uZWN0IG5ldHdvcmtzLgo+IAo+IFBsZWFzZSBub3RlLCBj
dXJyZW50IGRyaXZlciBpcyBzdXBwb3NlZCB0byB3b3JrIG9ubHkgd2l0aCBuZXdlc3QKPiBSLUNh
ciBHZW4zIFNvQ3MgcmV2aXNpb25zIHdoaWNoIElQTU1VIGhhcmR3YXJlIHN1cHBvcnRzIHN0YWdl
IDIgdHJhbnNsYXRpb24KPiB0YWJsZSBmb3JtYXQgYW5kIGlzIGFibGUgdG8gdXNlIENQVSdzIFAy
TSB0YWJsZSBhcyBpcyBpZiBvbmUgaXMKPiAzLWxldmVsIHBhZ2UgdGFibGUgKHVwIHRvIDQwIGJp
dCBJUEEpLgo+IAo+IFRoZSBtYWpvciBkaWZmZXJlbmNlcyBjb21wYXJlIHRvIHRoZSBMaW51eCBk
cml2ZXIgYXJlOgo+IAo+IDEuIFN0YWdlIDEvU3RhZ2UgMiB0cmFuc2xhdGlvbi4gTGludXggZHJp
dmVyIHN1cHBvcnRzIFN0YWdlIDEKPiB0cmFuc2xhdGlvbiBvbmx5ICh3aXRoIFN0YWdlIDEgdHJh
bnNsYXRpb24gdGFibGUgZm9ybWF0KS4gSXQgbWFuYWdlcwo+IHBhZ2UgdGFibGUgYnkgaXRzZWxm
LiBCdXQgWGVuIGRyaXZlciBzdXBwb3J0cyBTdGFnZSAyIHRyYW5zbGF0aW9uCj4gKHdpdGggU3Rh
Z2UgMiB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpIHRvIGJlIGFibGUgdG8gc2hhcmUgdGhlIFAy
TQo+IHdpdGggdGhlIENQVS4gU3RhZ2UgMSB0cmFuc2xhdGlvbiBpcyBhbHdheXMgYnlwYXNzZWQg
aW4gWGVuIGRyaXZlci4KPiAKPiBTbywgWGVuIGRyaXZlciBpcyBzdXBwb3NlZCB0byBiZSB1c2Vk
IHdpdGggbmV3ZXN0IFItQ2FyIEdlbjMgU29DIHJldmlzaW9ucwo+IG9ubHkgKEgzIEVTMy4wLCBN
My1XKywgZXRjLikgd2hpY2ggSVBNTVUgSC9XIHN1cHBvcnRzIHN0YWdlIDIgdHJhbnNsYXRpb24K
PiB0YWJsZSBmb3JtYXQuCj4gCj4gMi4gQUFyY2g2NCBzdXBwb3J0LiBMaW51eCBkcml2ZXIgdXNl
cyBWTVNBdjgtMzIgbW9kZSwgd2hpbGUgWGVuIGRyaXZlcgo+IGVuYWJsZXMgQXJtdjggVk1TQXY4
LTY0IG1vZGUgdG8gY292ZXIgdXAgdG8gNDAgYml0IGlucHV0IGFkZHJlc3MuCj4gCj4gMy4gQ29u
dGV4dCBiYW5rIChzZXRzIG9mIHBhZ2UgdGFibGUpIHVzYWdlLiBJbiBYZW4sIGVhY2ggY29udGV4
dCBiYW5rIGlzCj4gbWFwcGVkIHRvIG9uZSBYZW4gZG9tYWluLiBTbywgYWxsIGRldmljZXMgYmVp
bmcgcGFzcyB0aHJvdWdoZWQgdG8gdGhlCj4gc2FtZSBYZW4gZG9tYWluIHNoYXJlIHRoZSBzYW1l
IGNvbnRleHQgYmFuay4KPiAKPiA0LiBJUE1NVSBkZXZpY2UgdHJhY2tpbmcuIEluIFhlbiwgYWxs
IElPTU1VIGRldmljZXMgYXJlIG1hbmFnZWQKPiBieSBzaW5nbGUgZHJpdmVyIGluc3RhbmNlLiBT
bywgZHJpdmVyIHVzZXMgZ2xvYmFsIGxpc3QgdG8ga2VlcCB0cmFjawo+IG9mIHJlZ2lzdGVyZWQg
SVBNTVUgZGV2aWNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8
b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gQ0M6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9k
YS51aEByZW5lc2FzLmNvbT4KClRoZSBYZW4gc3BlY2lmaWMgYml0cyBsb29rcyBnb29kIG5vdy4g
QXNzdW1pbmcgWW9zaGloaXJvIHdpbGwgZ2l2ZSBoaXMgCnJldmlld2VkLWJ5L2Fja2VkLWJ5OgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
