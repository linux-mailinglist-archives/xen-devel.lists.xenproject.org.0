Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42921699
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 11:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRZWJ-0000OD-KP; Fri, 17 May 2019 09:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRZWI-0000O8-Sj
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 09:51:18 +0000
X-Inumbo-ID: 4df6e48a-7889-11e9-9277-fb505162992a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4df6e48a-7889-11e9-9277-fb505162992a;
 Fri, 17 May 2019 09:51:13 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: GFEhNzWTW1Sl0zqpEpp5nxJKjKPbx9PfVx3Nr+E3sltZFn+fR5iJXFsQICLbs7dhaKkIHgUDps
 Of3OmVAnSVLTknUo4AmxmOqe3Vm/SDy0jDL6CsCcCnOJPZx8Ei7WqwiFtWUpt296Ip7DUzm8Tx
 JVYKRmTgVp+yJFPoj7cWaXcMBjbWxwkJX6qJrbYYpfePCUVpxThU/cS0JmKLNhIMPGrMqppBtj
 awH6QnxJQsZ5nVA3GKPbZxJf4oRPwKHbmf0tAa7bmPEupSGdMWNyYpRdey1o0pKCQJKsFKnvvD
 ByQ=
X-SBRS: 2.7
X-MesageID: 561446
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,479,1549947600"; 
   d="scan'208";a="561446"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23774.33770.670075.737104@mariner.uk.xensource.com>
Date: Fri, 17 May 2019 10:50:34 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <0ebf5b95-9175-b45c-3c41-a703115d55f6@citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <23773.36109.688404.996152@mariner.uk.xensource.com>
 <0ebf5b95-9175-b45c-3c41-a703115d55f6@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.11.2
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcHJlcGFyYXRpb25zIGZvciA0
LjExLjIiKToKPiBPbiAxNi8wNS8yMDE5IDE3OjE3LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEFu
ZHJldyBDb29wZXIgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIHByZXBhcmF0aW9ucyBmb3IgNC4x
MS4yIik6Cj4gPj4gMTI5MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24ndCByZS1vcGVuIGEgeGVu
Y3RybCBoYW5kbGUgZm9yIGV2ZXJ5Cj4gPj4gZG9tYWluIGludHJvZHVjdGlvbiIKPiA+IENhbiB5
b3UganVzdGlmeSBob3cgdGhpcyBpcyBhIGJ1Z2ZpeCA/ICBJdCBkb2Vzbid0IHNlZW0gbGlrZSBi
YWNrcG9ydAo+ID4gbWF0ZXJpYWwgdG8gbWUuCj4gCj4gSXQgd2FzIGZvdW5kIGZyb20gc3RyYWNl
ICh3aGlsZSBpbnZlc3RpZ2F0aW5nIGFuIHVucmVsYXRlZCBpc3N1ZSksIGJ1dAo+IGdpdmVuIGhv
dyBtYW55IGlzc3VlcyB3ZSd2ZSBoYWQgaW4gdGhlIHBhc3Qgd2l0aCB7byx9eGVuc3RvcmVkIGV4
Y2VlZGluZwo+IGl0cyBGRCBsaW1pdCwgSSdkIHN0aWxsIHB1dCBpdCBpbiB0aGUgY2F0ZWdvcnkg
b2YgYnVnZml4Lgo+IAo+IEl0IGJhbGxvb25zIHRoZSB3b3JzdC1jYXNlIEZEIHJlcXVpcmVtZW50
cyBieSBhcyBtYW55IGNvbmN1cnJlbnQgZG9tYWluCj4gc3RhcnRzIGFzIHRoZSByZXN0IG9mIGRv
bTAgY2FuIG1hbmFnZS4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgo+ID4+IDdiMjBh
ODY1YmMxMCAidG9vbHMvb2NhbWw6IFJlbGVhc2UgdGhlIGdsb2JhbCBsb2NrIGJlZm9yZSBpbnZv
a2luZyBibG9jawo+ID4+IHN5c2NhbGxzIgo+ID4gVGhpcyAqcmVhbGx5KiBkb2Vzbid0IGxvb2sg
bGlrZSBhIGJ1Z2ZpeCwgbGV0IGFsb25lIGEgYmFja3BvcnQKPiA+IGNhbmRpZGF0ZSAhICBSZW1v
dmluZyBhIGxvY2sgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMgIQo+IAo+IE9mIGNvdXJzZSBpdHMg
YSBiYWNrcG9ydCBjYW5kaWRhdGUsIGFuZCBpdCBpcyBhIGJ1Z2ZpeCBldmVuIGlmIG1vc3Qgb2YK
PiB0aGUgdGltZSBpdCBpcyBvbmx5IG9ic2VydmVkIGFzIGEgcGVyZiBpbXByb3ZlbWVudC4KPiAK
PiBUaGUgT2NhbWwgRkZJIHNheXMgInRob3Ugc2hhbHQgbm90IG1ha2UgYSBzeXNjYWxsIGhvbGRp
bmcgdGhpcyBsb2NrIiwKPiBiZWNhdXNlIHdoaWxlIHRoYXQgbG9jayBpcyBoZWxkLCBldmVyeXRo
aW5nIGlzIHNpbmdsZSB0aHJlYWRlZC4KClRoYXQgd2Fzbid0IG1lbnRpb25lZCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UsIHNvIEkgYXNzdW1lZCB0aGF0IHRoZQpyZWFzb24gd2FzIHRoZSB1c3VhbCBv
bmUgZm9yIHJlbW92aW5nIGxvY2tzLCBuYW1lbHkgc2ltcGx5IHRvIGluY3JlYXNlCmNwdSBjb25j
dXJyZW5jeS4KClNvIHRoZXNlIGFyZSBidWdmaXhlcywgYnV0IHRoZXkncmUgbm90IHBhcnRpY3Vs
YXJseSBsb3cgcmlzayBiYXNlZApqdXN0IG9uIHRoZSBjb2RlLiAgSG93IGxvbmcgaGFzIFhTIGJl
ZW4gcnVubmluZyB0aGVzZSBwYXRjaGVzID8gIFRoZQphbnN3ZXIgdG8gdGhhdCBtYXkgZ2l2ZSBt
ZSBzb21lIGNvbmZpZGVuY2UgdGhhdCBmb3IgdXNlcnMgb2YgWGVuCnN0YWJsZSBicmFuY2hlcywg
dGhlIHBvc3NpYmxlIHJld2FyZCBvZiBmaXhpbmcgYSBteXN0ZXJpb3VzIGJhZApiZWhhdmlvdXIg
aXMgYmV0dGVyIHRvIHRha2UgdGhlIHJpc2sgb2YgdGhlc2UgcGF0Y2hlcyBoYXZpbmcgYnVncy4K
Cj4gPj4gYzM5M2I2NGRjZWU2ICJ0b29scy9saWJ4YzogRml4IGlzc3VlcyB3aXRoIGxpYnhjIGFu
ZCBYZW4gaGF2aW5nCj4gPj4gZGlmZmVyZW50IGZlYXR1cmVzZXQgbGVuZ3RocyIKPiA+IFRoZSBj
b21wYXRpYmlsaXR5IGltcGxpY2F0aW9ucyBoZXJlIGFyZSBub3QgY2xlYXJseSBzcGVsbGVkIG91
dCBpbiB0aGUKPiA+IGNvbW1pdCBtZXNzYWdlLiAgQUZBSUNULCBhZnRlciB0aGlzIGNvbW1pdCwg
dGhlIGVmZmVjdCBpczoKPiA+ICAgLSBuZXcgdG9vbHMgd2lsbCB3b3JrIHdpdGggb2xkIGh5cGVy
dmlzb3IKPiA+ICAgLSBvbGQgdG9vbHMgd2lsbCBub3QgbmVjZXNzYXJpbG95IHdvcmsgd2l0aCBv
bGQgaHlwZXJ2aXNvcgo+ID4gSSBhc3N1bWUgdGhhdCB3ZSBhcmUgdGFsa2luZyBoZXJlIGFib3V0
IG9sZCBhbmQgbmV3IGNvZGUgd2l0aCB0aGUgc2FtZQo+ID4gWGVuIHZlcnNpb24sIGVnIGFzIGEg
cmVzdWx0IG9mIGEgc2VjdXJpdHkgZml4Lgo+ID4KPiA+IFRoZSBwcmV2aW91cyBiZWhhdmlvdXIs
IGllLCB3aGF0IGhhcHBlbnMgd2l0aG91dCB0aGlzIHBhdGNoLCBpcyBub3QKPiA+IGVudGlyZWx5
IGNsZWFyIHRvIG1lLgo+IAo+IFRoaXMgd2FzIGFuIHVuaW50ZW5kZWQgY29uc2VxdWVuY2Ugb2Yg
WFNBLTI1MyAoU3BlY3RyZS9NZWx0ZG93bikgd2hlcmUKPiB0aGUgbGVuZ3RoIG9mIHRoZSBmZWF0
dXJlc2V0IGRpZCBpbmNyZWFzZSBpbiBhIHNlY3VyaXR5IGZpeC4KCkNyaXBlcy4KCk9LLCBzbyB0
aGF0IGlzIGRlZmluaXRlbHkgd2FudGVkLiAgSXQgYXBwbGllcyBjbGVhbmx5IGJhY2sgdG8gNC44
LCBzbwpJIGhhdmUgZG9uZSB0aGF0LiAgSSBndWVzcyBpdCBuZWVkcyB0byBiZSBhcHBsaWVkIHRv
IDQuNyB0b28gPyAgSSBnZXQKY29uZmxpY3RzLiAgV291bGQgeW91IGNhcmUgdG8gdHJ5IHRvIGZp
eCB0aGF0IHVwIG9yIHNoYWxsIEkgPwoKPiA+PiA4Mjg1NWFiYTViZjkgInRvb2xzL2xpYnhjOiBG
aXggZXJyb3IgaGFuZGxpbmcgaW4gZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKCkiCj4gPiBUaGlzIG1p
Z2h0IGJyZWFrIHNvbWUgY2FsbGVycywgbWlnaHRuJ3QgaXQgPyAgV2hhdCBjYWxsZXJzID8gIE9y
IGlzCj4gPiB0aGVyZSBhbiBhcmd1bWVudCB0aGF0IHRoZXJlIGFyZW4ndCBjYWxsZXJzIHdoaWNo
IHdpbGwgYmUgYnJva2VuID8KPiAKPiBUaGlzIHdhcyBmcm9tIHRoZSBzYW1lIGJpdCBvZiBkZWJ1
Z2dpbmcgYXMgYWJvdmUsIGFuZCBJU1RSIGNhdXNlZCBzb21lCj4gZXJyb3IgbWVzc2FnZXMgaW4g
aGlnaGVyIGNhbGxlcnMgdG8gcHJpbnQganVuayBpbnN0ZWFkIG9mIHRoZSByZWFsIGVycm9yLgoK
UmlnaHQuICBJIGNhbiBzZWUgdGhhdCB0aGF0IGlzIGFubm95aW5nLiAgQnV0IGdpdmVuIHRoYXQg
dGhlIGV4aXN0aW5nCmJlaGF2aW91ciBpcyBpbmNvbnNpc3RlbnQsIGl0IGlzIHBvc3NpYmxlIHRo
YXQgKm90aGVyKiBjYWxsZXJzCnNvbWV3aGVyZSBhcmUgcmVseWluZyBvbiB0aGUgb3RoZXIgYmVo
YXZpb3VyIGFuZCB0aGV5IG1heSBldmVuIGNoZWNrCmVycm5vIHZhbHVlcyBvciBzb21ldGhpbmcu
ICBJT1cgeW91IGFyZSBjaGFuZ2luZyB0aGUgQVBJIG9mIHRoaXMKZnVuY3Rpb24gZnJvbSAib21n
IHdoYXQgaGFwcGVucyBkZXBlbmRzIG9uIHdoYXQgZXJyb3IgaXQgZXZlbiB3YXMiIHRvCnNvbWV0
aGluZyBzYW5lIGFuZCB1bmlmb3JtLgoKVGhhdCBpcyBzdGlsbCBhbiBBUEkgY2hhbmdlIHRob3Vn
aCwgYW5kIG1heWJlIG5vdCBzZW5zaWJsZSB0bwpiYWNrcG9ydCwgaWYgdGhlIG9ubHkgYmVuZWZp
dCBpcyBpbXByb3ZlZCBlcnJvciBtZXNzYWdlcy4gIEl0IHNlZW1zIHRvCm1lIHRoaXMgd291bGQg
ZGVwZW5kIG9uIGhvdyBsaWtlbHkgaXQgaXMgdGhhdCB0aGVyZSBhcmUgYW55IGNhbGxlcnMKdGhh
dCB3b3VsZCBiZSBicm9rZW4gYnkgdGhlIGNoYW5nZSBhbmQgaW4gd2hhdCBzaXR1YXRpb25zIHRo
YXQgd291bGQKYnJlYWsuCgpUaGFua3MgZm9yIHRoZSBpbmZvLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
