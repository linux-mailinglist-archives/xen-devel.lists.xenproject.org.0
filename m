Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50915055B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:36:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZzo-0003Tn-9D; Mon, 03 Feb 2020 11:34:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyZzm-0003Th-K7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:34:26 +0000
X-Inumbo-ID: 212229b0-4679-11ea-8e50-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 212229b0-4679-11ea-8e50-12813bfff9fa;
 Mon, 03 Feb 2020 11:34:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68135ACD0;
 Mon,  3 Feb 2020 11:34:24 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
 <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
Date: Mon, 3 Feb 2020 12:34:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMjoyMSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwMyBGZWJydWFyeSAyMDIwIDExOjA2Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+Cj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgWGVuIERldmVs
b3BtZW50IExpc3QgPHhlbi0KPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBNaWNoYWVs
IEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaQo+PiBMaXUgPGxpdXdlQG1pY3Jv
c29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsKPj4g
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCj4+Cj4+IE9u
IDAzLjAyLjIwMjAgMTE6MzksIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pj4+IFNlbnQ6
IDMxIEphbnVhcnkgMjAyMCAxNzo1Nwo+Pj4+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+Pj4+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+OyBNaWNoYWVsIEtlbGxleQo+Pj4+IDxtaWtlbGxleUBtaWNyb3Nv
ZnQuY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUKPj4+PiA8d2xA
eGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIK
Pj4+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9o
eXBlcnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCj4+Pj4KPj4+PiAoTm90ZSB0byBzZWxmKQo+Pj4+
Cj4+Pj4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAwMCwgV2VpIExpdSB3
cm90ZToKPj4+PiBbLi4uXQo+Pj4+PiArc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lk
KHZvaWQpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgaWQ7Cj4+Pj4+
ICsKPj4+Pgo+Pj4+ICAgICAgICBpZC5yYXcgPSAwOwo+Pj4KPj4+IE9yIGp1c3QgdXNlIGEgQzk5
IGluaXRpYWxpemVyIHRvIHNldCB0aGluZ3MgdXAuIEEgYml0IG5lYXRlciBJTU8uCj4+Cj4+IElm
IHlvdSBtZWFuIHRoaXMgZm9yIC4uLgo+Pgo+Pj4+PiArICAgIGlkLnZlbmRvciA9IEhWX1hFTl9W
RU5ET1JfSUQ7Cj4+Pj4+ICsgICAgaWQubWFqb3IgPSB4ZW5fbWFqb3JfdmVyc2lvbigpOwo+Pj4+
PiArICAgIGlkLm1pbm9yID0geGVuX21pbm9yX3ZlcnNpb24oKTsKPj4KPj4gLi4uIHRoZXNlIHRo
cmVlIGZpZWxkcywgdGhlbiB0aGlzIHdvbid0IHdvcmsgd2l0aCByYXRoZXIgb2xkIGdjYwo+PiB3
ZSBzdGlsbCBwZXJtaXQgdG8gYmUgdXNlZC4gVXNpbmcgeyAucmF3ID0gMCB9IHdvdWxkIHdvcmsg
YWZhaWN0Lgo+Pgo+IAo+IE5vdCBldmVuIHsgLnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQgfSA/
CgpObywgYmVjYXVzZSBvZiBpdCBiZWluZyBwYXJ0IG9mIGFuIHVubmFtZWQgKHN0cnVjdCkgbWVt
YmVyIG9mCnRoZSB1bmlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
