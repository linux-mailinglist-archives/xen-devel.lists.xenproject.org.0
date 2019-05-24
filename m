Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79B297C2
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 14:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU8qT-0008LO-21; Fri, 24 May 2019 11:58:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZTx3=TY=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hU8qS-0008LJ-5H
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 11:58:44 +0000
X-Inumbo-ID: 466e72f4-7e1b-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 466e72f4-7e1b-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 11:58:42 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: /iRR+2sAi4oCpOOkct+chiNZN8qFsFeEm2AEJVtqMNQPQe9xHUH48i7aal+ZehlnZ1sL56xsoL
 v+u5nQPF6cpgCp01BziUnXxwDE7XtbZDhota/ErU1bBJQ+QUAPmmhrdmSHiiH4N5nog3o8YG/H
 KFkchL1ABWhSGNR4gLyFCJj4OANtStcs/Z+jwH677PLYyrfj/y6Jca2Lqdln93Y3A5LJ4qXQp+
 y1ntOpPhs3XCgwfTTYdIjynVBT8i0cnUGCPBBkuF+yX0c3EGRRjH/WgqGc5g58DCnI/PVihjab
 nKc=
X-SBRS: 2.7
X-MesageID: 875742
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="875742"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH v2] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVEdEvqxX2trhj2kiji7rFuWGD2qZ6AWeA//+k04A=
Date: Fri, 24 May 2019 11:58:23 +0000
Message-ID: <B2B42330-1886-478B-8F29-B9D6FA1B010E@citrix.com>
References: <04e56f911ff972acb4a0135da043f65b714a44ee.1558661458.git.lars.kurth@citrix.com>
 <5CE7D47B0200007800231FF6@prv1-mh.provo.novell.com>
In-Reply-To: <5CE7D47B0200007800231FF6@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <50B0F7CC1903E54EB8E21FF9E1B4C09B@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI0LzA1LzIwMTksIDA1OjI0LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjQuMDUuMTkgYXQgMDM6MzYsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gLS0tIC9kZXYvbnVsbA0KICAgID4gKysrIGIvVFJB
Q0tJTkcuRklMRVMNCiAgICA+IEBAIC0wLDAgKzEsNTAgQEANCiAgICA+ICsjIFRoaXMgZmlsZSBj
b250YWlucyBpbmZvcm1hdGlvbiBhYm91dCBzb3VyY2UgZmlsZXMgdGhhdCBoYXZlIGJlZW4NCiAg
ICA+ICsjIGNvcGllZCBmcm9tIG90aGVyIHNvdXJjZXMgYW5kIG5lZWQgdG8gYmUgdHJhY2tlZA0K
ICAgID4gKyMNCiAgICA+ICsjIFRoZSBmaWxlIG1heSBjb250YWluIGxpbmVzIHN0YXJ0aW5nIHdp
dGggLi4uDQogICAgPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KICAgID4gKyMgdmVyc2lvbjogb2YgZmlsZSBmb3JtYXQNCiAgICA+ICsjIHJlcG86IHJl
cG9zaXRvcnkgZGVmaW5pdGlvbg0KICAgID4gKyMgZmlsZTogYSBtYXBwaW5nIHRvIHRyYWNrIGZp
bGVzDQogICAgPiArIw0KICAgID4gKyMgTm90ZSB0aGF0IHJlcG86IGVudHJpZXMgbXVzdCBjb21l
ICpiZWZvcmUqIGZpbGU6IGVudHJpZXMNCiAgICA+ICsjDQogICAgPiArIyBSZXBvc2l0b3J5IERl
ZmluaXRpb25zIGFyZSBvZiB0aGUgZm9sbG93aW5nIGZvcm1hdA0KICAgID4gKyMgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAgICA+ICsjIHJlcG86
IG5hbWUtb2Ytc291cmNlLXJlcG8gZ2l0fHN2biBodHRwcy11cmwtb2Ytc291cmNlLXJlcG8NCiAg
ICA+ICsjDQogICAgPiArIyBuYW1lLW9mLXNvdXJjZS1yZXBvOg0KICAgID4gKyMgICBOYW1lIG9m
IHNvdXJjZSByZXBvc2l0b3J5LiBUaGUgbmFtZSB3aWxsIGJlIHVzZWQgYXMgcmVmZXJlbmNlIGlu
IGZpbGU6DQogICAgPiArIyAgIHN0YXRlbWVudHMNCiAgICANCiAgICBNYXkgSSBzdWdnZXN0IGFu
b3RoZXIgZm9ybWF0dGluZyBjaGFuZ2UsIGFzIHRoZSBjb2xvbiB1c2VzIG5vdw0KICAgIGhhdmUg
ZGlmZmVyZW50IG1lYW5pbmc6DQogICAgDQogICAgIyByZXBvOiA8bmFtZS1vZi1zb3VyY2UtcmVw
bz4gPHR5cGUtb2Ytc291cmNlLXJlcG8+IDx1cmwtb2Ytc291cmNlLXJlcG8+DQogICAgIw0KICAg
ICMgPG5hbWUtb2Ytc291cmNlLXJlcG8+DQogICAgIyAgIE5hbWUgb2Ygc291cmNlIHJlcG9zaXRv
cnkuIFRoZSBuYW1lIHdpbGwgYmUgdXNlZCBhcyByZWZlcmVuY2UgaW4gZmlsZToNCiAgICAjICAg
c3RhdGVtZW50cw0KICAgIA0KICAgID4gKyMgZ2l0fHN2bjoNCiAgICA+ICsjICAgVHlwZSBvZnNv
dXJjZSByZXBvc2l0b3J5DQogICAgDQogICAgTml0OiBNaXNzaW5nIGJsYW5rLg0KICAgIA0KICAg
ID4gKyMgaHR0cHMtdXJsLW9mLXNvdXJjZS1yZXBvOg0KICAgID4gKyMgICBVUkwgb2Ygc291cmNl
IHJlcG9zaXRvcnkNCiAgICANCiAgICBXaHkgaHR0cHM/IEFueSBmb3JtIG9mIFVSTCBzaG91bGQg
YmUgZmluZSBoZXJlLg0KICAgIA0KU3VyZS4gSSB0aGluayBJYW4gc3VnZ2VzdGVkIG9yaWdpbmFs
bHkuDQoNCiAgICA+ICsjIEZvciBleGFtcGxlOg0KICAgID4gKyMgICByZXBvOiBsaW51eC10b3J2
YWxkcyBnaXQgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0IA0KICAgIA0KICAgIERpZG4ndCB3ZSBhZ3JlZSBvbiBleGFtcGxl
cyBtb3ZpbmcgaW50byB0aGUgY29tbWl0IG1lc3NhZ2UsDQogICAgb3IgdGhlIHBvc3QtY29tbWl0
LW1lc3NhZ2UgYXJlYSwgYXMgdGhleSdsbCBiZWNvbWUgcmVkdW5kYW50DQogICAgKGFuZCBldmVu
dHVhbGx5IHN0YWxlKSBvbmNlIHdlIGdhaW4gYWN0dWFsIGNvbnRlbnQgaGVyZT8NCiAgICANCkFo
IHllcywgSSBoYWQgZm9yZ290dGVuIGFib3V0IHRoaXMNCg0KTGFycyAgICANCiAgICANCiAgICAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
