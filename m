Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3CC21836
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRc1m-0007gr-GT; Fri, 17 May 2019 12:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRc1k-0007gi-PK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:31:56 +0000
X-Inumbo-ID: c0c72db0-789f-11e9-8c22-c7dcf97b7e43
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0c72db0-789f-11e9-8c22-c7dcf97b7e43;
 Fri, 17 May 2019 12:31:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Andrew.Cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Andrew.Cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ebibKs6sHZI1MAFHGPxfbtsceeCcPbP683f04kd72XCefuu5okYt0tA48oHjO+PspxE2U05eUN
 Nz2h5nJkqRl6V2z09jle5GKyd2QAMQo2WKCxbZkmXATikj2iGyoF5OdJHyYiJAS0YzUVbzZM92
 s0GowqWCIHduFIK7InncSUDlKw42KIHjU4pNdT43wMahVpy8ENJ0tW27gIoXk5hOFHOVUFM8FC
 95XUpYQmnCK8wqnQ13qMrKN6TcUOMBgbrEP4AkMVqIk8fsJVmiUxxjBYQ9WDSUNKMBMT1VwPFa
 aFY=
X-SBRS: 2.7
X-MesageID: 566921
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="566921"
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Juergen Gross <jgross@suse.com>, 
 Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: libxc: Casting of xen virtual address type xen_vaddr_t to signed
 int64 type: (int64_t)vaddr
Thread-Index: AQHVDKNLbaUXJsozW0O2CLvRshxhxaZvPqPw
Date: Fri, 17 May 2019 12:31:50 +0000
Message-ID: <1558096310831.98741@citrix.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
In-Reply-To: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KEFwb2xvZ2llcyBmb3IgdGhlIHVzZSBvZiBvdXRsb29rIC0gSSdtIGhhdmluZyBlbWFpbCBwcm9i
bGVtcyBhdG0pLgoKQSBjYW5vbmljYWwgYWRkcmVzcyBpbiB4ODYgaXMgb25lIHdoaWNoIGlzIGNv
cnJlY3RseSBzaWduIGV4dGVuZGVkIGZyb20gYml0IDQ3IHRvIGJpdCA2My4KCldoYXQgaXMgdW5k
ZWZpbmVkIGFib3V0IHNoaWZ0aW5nIGludDY0X3QgYnkgNjMgYml0cz8gIFRoZSBhbnN3ZXIgaXMg
LTEgb3IgMCwgcHJlc2VydmluZyB0aGUgc2lnbiBiaXQgYWxvbmUgKHdoaWNoIGlzIHRoZSBwb2lu
dCBvZiB0aGUgY29tcGFyaXNvbikuCgp+QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJvbTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwu
Y29tPgpTZW50OiAxNyBNYXkgMjAxOSAxMjoyNQpUbzogSnVlcmdlbiBHcm9zczsgQW5kcmV3IENv
b3BlcjsgV2VpIExpdTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBWb2xvZHlt
eXIgQmFiY2h1awpTdWJqZWN0OiBsaWJ4YzogQ2FzdGluZyBvZiB4ZW4gdmlydHVhbCBhZGRyZXNz
IHR5cGUgeGVuX3ZhZGRyX3QgdG8gc2lnbmVkIGludDY0IHR5cGU6IChpbnQ2NF90KXZhZGRyCgpI
aSBBbGwsCgpXaGlsZSBsb29raW5nIGF0IGNvZGUgaW4gdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94
ODZfcHYuYywKd2Ugc2VlIHRoYXQgdGhlcmUgaXMgY2FzdGluZyBvZiB4ZW4gdmlydHVhbCBhZGRy
ZXNzIHR5cGUgeGVuX3ZhZGRyX3QKdG8gc2lnbmVkIGludDY0IHR5cGUuCkluIGNvbW1pdDogN2Jm
NzQ1ODJiMzQzNjAzY2IwODI2ZDgwOGNkN2RhNDMzMjY0NTJhNQoKKy8qIENoZWNrIGEgNjQgYml0
IHZpcnR1YWwgYWRkcmVzcyBmb3IgYmVpbmcgY2Fub25pY2FsLiAqLworc3RhdGljIGlubGluZSBi
b29sIGlzX2Nhbm9uaWNhbF9hZGRyZXNzKHhlbl92YWRkcl90IHZhZGRyKQoreworICAgIHJldHVy
biAoKGludDY0X3QpdmFkZHIgPj4gNDcpID09ICgoaW50NjRfdCl2YWRkciA+PiA2Myk7Cit9CgpJ
dCBzZWVtcyB0aGVyZSBpcyBubyBuZWVkIHRvIGNhc3QgdmFkZHIgdmFyaWFibGUuIEl0IGxvb2tz
IGxpa2UKc2hpZnRpbmcgdmFkZHIgc2lnbmVkIDY0LWJpdCB2YWx1ZSBieSA2MyBiaXRzIGludHJv
ZHVjZXMgdW5kZWZpbmVkCmJlaGF2aW9yLiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJlIHdoYXQg
aXMgdGhlIHJlYXNvbiBmb3IgdGhpcwpjYXN0aW5nPwoKVGhhbmtzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
