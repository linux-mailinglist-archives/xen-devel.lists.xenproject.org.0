Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A624E6D0E8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho87i-0002Um-Vb; Thu, 18 Jul 2019 15:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho87h-0002UV-9E
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:15:09 +0000
X-Inumbo-ID: d1b81d46-a96e-11e9-b1fc-532bfc0264f0
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b81d46-a96e-11e9-b1fc-532bfc0264f0;
 Thu, 18 Jul 2019 15:15:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563462904; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=nsk0Qu3qDgl3elv38wjZ5/Gla0euqfNG76ZtyBBkvVY=;
 b=Fd9HxHVqlnbZCV14YxOW5lZh/e4LwNYBmKY0HP2KgsYRHpk1E7JnzEc8MjiDXkV1a+NAB0lx
 JylAFWqfgoy/QMBh4y5zObpX3w13onpT1DC07clOJwngRQlBlBQCdS/GGN6C/qI2kvSroBOd
 cdhaJOyQkgEr2XdYSQBDEcpe9Jc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5d308cf7.7f302eec3270-smtp-out-n03;
 Thu, 18 Jul 2019 15:15:03 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s3so25981352wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 08:15:03 -0700 (PDT)
X-Gm-Message-State: APjAAAVmPzC7G+SWEcTFQaEHm4jGwPkZLGw/gKbYnez/RSEhQ7iv8nV1
 WWRuKuaQIZ+yXm2xmtWzR+r4Qu45YUC3I3QKoes=
X-Google-Smtp-Source: APXvYqzhWRIjZS0LPnevNzi7Os4j3OEys0cOnqKf1nIeI0pdHSoRzqeC1qBXlIB3sL1kHyeH8rrmPgaWqZmaCXH35sU=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr43190901wmj.128.1563462902147; 
 Thu, 18 Jul 2019 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
In-Reply-To: <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 09:14:25 -0600
X-Gmail-Original-Message-ID: <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
Message-ID: <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgOTowMiBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gQWRkaW5nIExhcnMsIEFydGVtIGFu
ZCBJdXJpaS4gSXVyaWkgaGFzIGJlZW4gd29ya2luZyBvbiBhIHZlcnNpb24gZm9yCj4gY2xhbmct
Zm9ybWF0IHJlY2VudGx5Lgo+Cj4gT24gNy8xOC8xOSAzOjQzIFBNLCBUYW1hcyBLIExlbmd5ZWwg
d3JvdGU6Cj4gPiBVc2luZyBhc3R5bGUgKGh0dHA6Ly9hc3R5bGUuc291cmNlZm9yZ2UubmV0KSBj
YW4gZ3JlYXRseSByZWR1Y2UgdGhlIG92ZXJoZWFkIG9mCj4gPiBtYW51YWxseSBjaGVja2luZyBh
bmQgYXBwbHlpbmcgc3R5bGUtZml4ZXMgdG8gc291cmNlLWNvZGUuIFRoZSBpbmNsdWRlZAo+ID4g
LmFzdHlsZXJjIGlzIHRoZSBjbG9zZXN0IGFwcHJveGltYXRpb24gb2YgdGhlIGVzdGFibGlzaGVk
IFhlbiBzdHlsZSAoaW5jbHVkaW5nCj4gPiBzdHlsZXMgbm90IGZvcm1hbGx5IHNwZWxsZWQgb3V0
IGJ5IENPRElOR19TVFlMRSBidXQgY29tbW9ubHkgcmVxdWVzdGVkKS4KPiA+Cj4gPiBDaGVja2lu
ZyB0aGUgY29tbWVudCBzdHlsZXMgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXV0b21hdGlvbi4K
PiA+Cj4gPiBJbmNvcnBvcmF0aW5nIFhlbidzIGV4Y2VwdGlvbiB0byB0aGUgZG8td2hpbGUgc3R5
bGUgaXMgb25seSBwYXJ0aWFsbHkgcG9zc2libGUsCj4gPiB0aHVzIGEgY2hhbmdlIGlzIHByb3Bv
c2VkIHRvIHRoZSBDT0RJTkdfU1RZTEUgb2YgbW92aW5nIHRoZSBicmFjZSBmcm9tICJkbyB7Igo+
ID4gdG8gdGhlIG5leHQgbGluZS4KPiA+Cj4gPiBNb3N0IG9mIFhlbidzIGNvZGUtYmFzZSBpcyBu
b24tY29uZm9ybWluZyBhdCB0aGUgbW9tZW50OiAyODkgZmlsZXMgcGFzcwo+ID4gdW5jaGFuZ2Vk
LCA4NzYgaGF2ZSBzb21lIHN0eWxlIGlzc3Vlcy4KPiA+Cj4gPiBJZGVhbGx5IHdlIGNhbiBzbG93
bHkgbWlncmF0ZSB0aGUgZW50aXJlIGNvZGUtYmFzZSB0byBiZSBjb25mb3JtaW5nLCB0aHVzCj4g
PiBlbGltaW5hdGluZyB0aGUgbmVlZCBvZiBkaXNjdXNzaW5nIGFuZCBlbmZvcmNpbmcgc3R5bGUg
aXNzdWVzIG1hbnVhbGx5IG9uIHRoZQo+ID4gbWFpbGluZ2xpc3QuCj4KPiBJIHF1aXRlIGxpa2Ug
dGhlIGlkZWEgb2YgYW4gYXV0b21hdGljIGNvZGluZyBzdHlsZSBjaGVja2VyLiBIb3dldmVyLCBp
dAo+IGlzIGEgYml0IGNvbmNlcm5pbmcgdGhhdCBub3QgZXZlbiBhIDEvMyBvZiB0aGUgZmlsZXMg
YXJlIGFibGUgdG8gcGFzcwo+IHRoZSBjb2Rpbmcgc3R5bGUgeW91IHN1Z2dlc3QuIENvdWxkIHlv
dSBleHBsYWluIHdoZXRoZXIgdGhpcyBpcyBiZWNhdXNlCj4gdGhlIGZpbGVzIGRvZXMgbm90IGFs
cmVhZHkgZm9sbG93IFhlbiBjb2Rpbmcgc3R5bGUgb3IgaXMgaXQganVzdCB0aGUKPiBkaWZmZXJl
bmNlIHdpdGggYXN0eWxlPwo+Cj4gV2hhdCBhcmUgdGhlIG1haW4gc3R5bGUgaXNzdWVzPwoKTG9v
a3MgbGlrZSBhIGxvdCBvZiBmaWxlcyB0aGF0IGRvbid0IGZvbGxvdyB0aGUgWGVuIGNvZGluZyBz
dHlsZQphcy1pcy4gQWxpZ25tZW50IGlzc3VlcyBzZWVtIHRvIG1lIHRvIGJlIHRoZSBtb3N0IGNv
bW1vbiBlcnJvcnMuIFNlZQp0aGUgZnVsbCBkaWZmIGhlcmU6CgpodHRwczovL2dpc3QuZ2l0aHVi
LmNvbS90a2xlbmd5ZWwvYzVjYWMxNGEwZDU3ZjExOWRkNzc0N2ExYmU2ZmIyNjAKCldlIGNhbiBw
ZXJoYXBzIHR1bmUgc29tZSBhc3BlY3RzIG9mIGl0IHdlIGRpc2FncmVlIHdpdGggdGhlIGFzdHls
ZQpnZW5lcmF0ZWQgc3R5bGUgYW5kIHRyeSB0byBvdmVycmlkZSBpdC4gSSBkaWQgbXkgYmVzdCB0
byBtYWtlIGl0CmNvbmZvcm0gdG8gdGhlIGV4aXN0aW5nIFhlbiBzdHlsZSBidXQgY2VydGFpbmx5
IHRoZXJlIGNvdWxkIGJlIG90aGVyCnR3ZWFrcyBtYWRlIHRvIHJlZHVjZSB0aGUgY2h1cm4uCgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4KPiA+IC0tLQo+ID4gICAuYXN0eWxlcmMgICAgfCAxNCArKysrKysrKysrKysrKwo+ID4gICBD
T0RJTkdfU1RZTEUgfCAxOCArKysrKysrKysrKysrKystLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgLmFzdHlsZXJjCj4gPgo+ID4gZGlmZiAtLWdpdCBhLy5hc3R5bGVyYyBiLy5hc3R5bGVyYwo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmJiZDFkNTVkZGQK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiLy5hc3R5bGVyYwo+ID4gQEAgLTAsMCArMSwxNCBA
QAo+ID4gK3N0eWxlPWJzZAo+ID4gK3N1ZmZpeD1ub25lCj4gPiArYWxpZ24tcG9pbnRlcj1uYW1l
Cj4gPiArYWxpZ24tcmVmZXJlbmNlPW5hbWUKPiA+ICtpbmRlbnQ9c3BhY2VzPTQKPiA+ICttYXgt
Y29kZS1sZW5ndGg9ODAKPiA+ICttaW4tY29uZGl0aW9uYWwtaW5kZW50PTAKPiA+ICthdHRhY2gt
Y2xvc2luZy13aGlsZQo+ID4gK3JlbW92ZS1icmFjZXMKPiA+ICtpbmRlbnQtc3dpdGNoZXMKPiA+
ICticmVhay1vbmUtbGluZS1oZWFkZXJzCj4gPiAra2VlcC1vbmUtbGluZS1ibG9ja3MKPiA+ICtw
YWQtY29tbWEKPiA+ICtwYWQtaGVhZGVyCj4gPiBkaWZmIC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIv
Q09ESU5HX1NUWUxFCj4gPiBpbmRleCA2Y2M1Yjc3NGNmLi4wYjM3ZjdhZTRkIDEwMDY0NAo+ID4g
LS0tIGEvQ09ESU5HX1NUWUxFCj4gPiArKysgYi9DT0RJTkdfU1RZTEUKPiA+IEBAIC02MCw4ICs2
MCw4IEBAIEJyYWNpbmcKPiA+ICAgLS0tLS0tLQo+ID4KPiA+ICAgQnJhY2VzICgneycgYW5kICd9
JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9uIGEgbGluZSBvZiB0aGVpciBvd24sIGV4Y2VwdAo+ID4g
LWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51eCBjb2Rpbmcg
c3R5bGUgYW5kCj4gPiAtdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBhbiBleGNlcHRp
b24uIGUuZy46Cj4gPiArZm9yIHRoZSB3aGlsZS1wYXJ0IG9mIGRvL3doaWxlIGxvb3BzLiAgVGhp
cyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBzdHlsZQo+ID4gK2FuZCB1bmxpa2UgSyZSLiAg
ZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoKPiA+Cj4gPiAgIGlmICggY29u
ZGl0aW9uICkKPiA+ICAgewo+ID4gQEAgLTc3LDcgKzc3LDggQEAgd2hpbGUgKCBjb25kaXRpb24g
KQo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAgIH0KPiA+Cj4gPiAtZG8gewo+ID4gK2Rv
Cj4gPiArewo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAgIH0gd2hpbGUgKCBjb25kaXRp
b24gKTsKPiA+Cj4gPiBAQCAtMTIwLDMgKzEyMSwxNCBAQCB0aGUgZW5kIG9mIGZpbGVzLiAgSXQg
c2hvdWxkIGJlOgo+ID4gICAgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKPiA+ICAgICogRW5kOgo+
ID4gICAgKi8KPiA+ICsKPiA+ICtBdXRvbWF0ZWQgc3R5bGUgZm9ybWF0dGluZyB1c2luZyBhc3R5
bGUKPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICsKPiA+
ICtUaGUgLmFzdHlsZXJjIGluY2x1ZGVkIGluIHRoZSBYZW4gdHJlZSBpbmNvcnBvcmF0ZXMgbW9z
dCBvZiBYZW4ncwo+ID4gK3N0eWxlIHJlcXVpcmVtZW50cywgZXhjZXB0IHRoZSBmb3JtYXR0aW5n
IG9mIGNvbW1lbnRzLgo+ID4gKwo+ID4gK1RoZSBzdGVwcyB0byBhdXRvbWF0aWNhbGx5IGZvcm1h
dCBhIGZpbGUgYXJlOgo+ID4gKwo+ID4gK2V4cG9ydCBBUlRJU1RJQ19TVFlMRV9PUFRJT05TPSIu
YXN0eWxlcmMiCj4gPiArYXN0eWxlIDxzb3VyY2Ugb3IgaGVhZGVyIGZpbGU+Cj4KPiBJIHRoaW5r
IHlvdSB3YW50IHRvIHByb3ZpZGUgZWFzeSB3YXkgZm9yIHRoZSB1c2VyIHRvIGluc3RhbGwvY29t
cGlsZSBpdC4KPiBTbyB0aGVyZSBhcmUgYW4gaGlnaGVyIGNoYW5jZSBmb3IgdGhlbSB0byB1c2Ug
aXQuCgpJdCBpcyBnZW5lcmFsbHkgaW5jbHVkZWQgaW4gYWxsIG1ham9yIGRpc3RyaWJ1dGlvbnMs
IEkganVzdCBkbyBhcHQtZ2V0Cmluc3RhbGwgYXN0eWxlIG9uIGRlYmlhbi91YnVudHUuCgo+Cj4g
TG9uZy10ZXJtIHdlIHByb2JhYmx5IHdhbnQgdG8gZ2V0IHRoaXMgaG9va2VkIHRvIHRoZSBDSSBs
b29wLgoKSW5kZWVkLiBJIGFscmVhZHkgZG8gdGhhdCBpbiBteSBwcm9qZWN0J3MgQ0kgdXNpbmcg
VHJhdmlzIGFuZCBpdCBoYXMKYmVlbiBhd2Vzb21lIChodHRwczovL2dpdGh1Yi5jb20vdGtsZW5n
eWVsL2RyYWt2dWYvYmxvYi9tYXN0ZXIvLnRyYXZpcy55bWwjTDI4KS4KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
