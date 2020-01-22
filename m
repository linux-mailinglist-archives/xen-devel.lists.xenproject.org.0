Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F3145A73
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:59:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJIt-0005TB-59; Wed, 22 Jan 2020 16:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zGkp=3L=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iuJIr-0005T5-OA
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:56:29 +0000
X-Inumbo-ID: 1d3b29a4-3d38-11ea-8e9a-bc764e2007e4
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (unknown [66.163.184.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d3b29a4-3d38-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579712180; bh=HPfls3UcM1YrsLOv7L2KbEvBxHGLEPIcQwKSUfgj+oE=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=kd4IC1SYX1Qipc6B6ZeKHk05eHMqI0OYu+PUS6LsFaybV3hpl1is8jBvPm04YmLsmxxH8HpISYcdJJbnVaf+beaEb1wFA6fo7xDJyac34yZBDL/gMw75pnq1lTLKpXEvh8G3+Y2EeFY1ZD4psTWabTgCuo0v1y1UN9pO4lfqSshjpDExPq2iUy2lcFqSeEaDsaTMvfwhQUG/+uVwIVK/3cUn9Nnb6X10v0jFKz7ZL86pEzQts+OSZ+aibT/3svre1+aUGHSlnmUktUO/yln4vMJIL0j9jd7vc7i1KHciZ1WEniBNjRu1eVk3OkSaUQaF0akPXZ9WHcxx5hVYowFNDA==
X-YMail-OSG: mqF4JdUVM1ke.KGmx4AVIaWQ26aYFt5uD5YNHY_EsZQOqCPvDFI26kWsZo7DrLl
 H1RM7Uns9mRMcAhQcigRFGZvZJmW0WBwDP3D1492.826h9t5PJ08cyo5XdtstTI07_mlHi4Q70MB
 tCbY6.2MonXA6gn9OwFCmfGkAs.NwDYvVVHXvD2Wld.ZUI07z6evZQ1_T_aojgyQcOZlienbSRhK
 eCNpyVd8hD6LhUyunmSfiDZTlbPHc4oi6ZtzHpG_3PQ4d4W3yBy3vXRkwoyf99H1kIuxnezbFkF4
 U2ZB851JY0RfERgKrLCFDbsV.pEZOCQ_WrIOJUCeKbYkeEIebiitvLj7lSS.qJN1g73pqtP_B2BT
 o2MeS_Ia5eAdL0vCGIoc11DrZPbR68jHqpDNQ7p9Bz7P2VmNb6inBAd93x5x0AaJZt7tp.I2izeM
 4QvWT1JQC8Z.Ifx2mIN2Pip8O22pqxf4OL9urHkt18M3uTaAiP55HGOEuZBqqirQ09p7gFP80QcS
 kkoqn9DoeHMyRn52dgZDHykVhZXYTJuD_VU.92vZUfBcpbVpthYXuidyvjDVByijiXoxbzXinqXq
 f02q1AWFcgwfCL.iai7yNhJvQ3tnDKgo9twg5dx_tCbEyS80WQxnEKs0JQpvsZXtGgeMW.r16L8t
 LstQ0JIQpcEPl2Tk4hV3_Vdv62nAqQoq4KlLpqgDw1hI7ZpMIEbfxFh_rfL3x6Mj7hj0nCudnW25
 Twf1awdiXTzixyTEvgCnsmGb25NSjPEkj1B_iNVvYdxVzxSvUPrchPBhrtFQlxfotQq7u2.xBPTa
 DY_84Xvk7SufoDTy3x5KEKD5vIatqmI19s9ptzsBNtuOFjGe603xuB_wDifjag4j8VzhdIyzKMDl
 gLWEFWve97Efm5h85xIYL8O74DoqlQ.BsEXgySlHey2_GN5QvnDO7NF1pYlvoT0a8tp512rNd3.e
 jgyXHhkipWp.XKezjatq3Cog7ezSJwX9gm29sDDewICLjGPlaTcae1XUZIocg3XJiIptcjUtbnTD
 F1n0yEKIVTAhnNRx0ujhheztg4OD08dKGe1N_5_WzSIbtD.Nnr2WI37eBZRNJWPKBxMfOFCNrdvs
 O.Ib0eYrtax2b99yc5TNZfaBGr6iY_He9X3Y5VPJ_rpRDwh93awJftOocTLPrL5r2XnJWzKvROA0
 hxc4VGJllH3EKQob9N7SZNsLVRrRv1nPeRiI6MluCIFqLQwSAlG__TcBg_tLgzsegCVcAg_0jPkK
 cIswd4q7wxaR6ov122zETUFLLcZ9QDXmIKRdhj2R0YV_MpEebkztc8fWxOS.vZOTnxuhbPjTjYxK
 2GUP90DoC0CFcnrcn
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 22 Jan 2020 16:56:20 +0000
Date: Wed, 22 Jan 2020 16:56:15 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1699773700.2581218.1579712175340@mail.yahoo.com>
In-Reply-To: <20200122012713.GB2995@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15077 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
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

SGkgTWFyZWssCgpUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuIFRoZSBzZXJ2ZXIgbWFjaGluZSBJ
IGFtIHVzaW5nIGZvciB0aGlzIHNldHVwIGlzIGFuIHg4Nl82NCBJbnRlbCBYZW9uLiBGb3IgdGhl
IERvbTAsIEkgYW0gdXNpbmcgVWJ1bnR1IDE4LjA0IHJ1bm5pbmcgb24ga2VybmVsIHZlcnNpb24g
NS4wLjAtMzctZ2VuZXJpYy4gTXkgWGVuIHZlcnNpb24gaXMgNC45LjIuIAoKRm9yIHRoZSBIVk0g
ZHJpdmVyIGRvbWFpbiwgSSBhbSB1c2luZyBVYnVudHUgMTguMDQgcnVubmluZyBvbiBrZXJuZWwg
dmVyc2lvbiA1LjAuMC0yMy1nZW5lcmljLiBJIGFtIGRvaW5nIGEgTklDIFBDSSBwYXNzdGhyb3Vn
aCB0byB0aGlzIGRvbWFpbi4gVGhlIFhlbiBjb25maWcgZmlsZSBmb3IgdGhpcyBkb21haW4gbG9v
a3MgbGlrZSB0aGUgZm9sbG93aW5nLgoKYnVpbGRlciA9ICJodm0iCm5hbWUgPSAidWJ1bnR1LWRv
bWVudC1odm0iCm1lbW9yeSA9ICIyMDQ4IgpwY2kgPSBbICcwMTowMC4wLHBlcm1pc3NpdmU9MScg
XQp2Y3B1cyA9IDEKZGlzayA9IFsncGh5Oi9kZXYvdmcvdWJ1bnR1LWh2bSxoZGEsdyddCnZuYyA9
IDEKYm9vdD0iYyIKCkkgaGF2ZSBpbnN0YWxsZWQgeGVuLXRvb2xzIG9mIHZlcnNpb24gNC43IGlu
IHRoaXMgZHJpdmVyIGRvbWFpbiBzbyB0aGF0IHRoZSB2aWYtc2NpcnB0cyB3b3JrLiBUaGUgbmV0
d29yayBjb25maWd1cmF0aW9uIGhlcmUgbG9va3MgbGlrZSB0aGUgZm9sbG93aW5nIHdoZXJlIGVu
czVmMCBpcyB0aGUgaW50ZXJmYWNlIG5hbWUgZm9yIHRoZSBOSUMgSSBkaWQgcGFzc3Rocm91Z2gu
CgphdXRvIGxvCmlmYWNlIGxvIGluZXQgbG9vcGJhY2sKCmlmYWNlIGVuczVmMCBpbmV0IG1hbnVh
bAoKYXV0byB4ZW5icjEKaWZhY2UgeGVuYnIxIGluZXQgc3RhdGljCsKgwqDCoMKgwqDCoMKgIGJy
aWRnZV9wb3J0cyBlbnM1ZjAKwqDCoMKgwqDCoMKgwqAgYWRkcmVzcyAxOTIuMTY4LjEuMwrCoMKg
wqDCoMKgwqDCoCBuZXRtYXNrIDI1NS4yNTUuMjU1LjAKwqDCoMKgwqDCoMKgwqAgZ2F0ZXdheSAx
OTIuMTY4LjEuMQoKVGhlIFhlbiBjb25maWcgZmlsZSBjb250ZW50IGZvciB0aGUgRG9tVSBpcyBh
cyB0aGUgZm9sbG93aW5nLgoKbmFtZSA9ICJ1YnVudHVfb25fdWJ1bnR1Igpib290bG9hZGVyID0g
Ii91c3IvbGliL3hlbi00LjkvYmluL3B5Z3J1YiIKbWVtb3J5ID0gMTAyNAp2Y3B1cyA9IDEKdmlm
ID0gWyAnYmFja2VuZD11YnVudHUtZG9tbmV0LWh2bSxicmlkZ2U9eGVuYnIxJyBdCmRpc2sgPSBb
ICcvZGV2L3ZnL2x2X3ZtX3VidW50dV9ndWVzdCxyYXcseHZkYSxydycgXQoKV2hlbiBJIHRyeSB0
byBsYXVuY2ggdGhpcyBEb21VLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yLgoKbGlieGw6IGVy
cm9yOiBsaWJ4bF9uaWMuYzo2NTI6bGlieGxfX2RldmljZV9uaWNfc2V0X2RldmlkczogRG9tYWlu
IDMxOlVuYWJsZSB0byBzZXQgbmljIGRlZmF1bHRzIGZvciBuaWMgMC4KCkFyZSB0aGVzZSBjb25m
aWd1cmF0aW9ucyBiYXNpY2FsbHkgdmVyeSBkaWZmZXJlbnQgZm9yIHdoYXQgeW91IGRvIGZvciBR
dWJlcz8gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuCgpUaGFua3MsCk1laHJhYgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
