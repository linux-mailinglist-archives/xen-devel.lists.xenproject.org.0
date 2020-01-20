Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EA143148
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 19:11:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itbTB-0007Gh-F5; Mon, 20 Jan 2020 18:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/GeN=3J=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1itbT9-0007Gc-Ti
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 18:08:11 +0000
X-Inumbo-ID: cc49b738-3baf-11ea-9fd7-bc764e2007e4
Received: from sonic303-22.consmr.mail.ne1.yahoo.com (unknown [66.163.188.148])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc49b738-3baf-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579543681; bh=Xp0v7Bhd+n2FjfxvgVsiTPaAZGO2l55cIi16hPq34wA=;
 h=Date:From:To:Cc:Subject:References:From:Subject;
 b=oYlc0OqIIi9+ReZLvf02ihD25oIsMCrrmuhjkbBi+uZqXoH8LmiZpGs8iX5OzqP7gOoY8oFuIZMquntuVwrV0GBSmd7OHb3Fvps2l3Ifs9AmQC/UMG2+SJCRumK76crZBFY4A0mSC1bfAcSfjcBuSdLa3YIQjBa1STbosZn/+RVoeTGZ3TE7y+uLq/1nxtATTZqrE7kZMSsnHHzqiPOOaUr6KqOVMurZRO79IphoDC9jGzFL868W4iekwX2jq+P0PO54fTH/PK9zPUoLB7JksD58uQdBj2L4xxfbBXWuzDDUpwDwuJav5ozaNa2/fA4jsz1F4DpWhsbk/yUhxf2kTA==
X-YMail-OSG: butHyr0VM1nZP0NRDeSrtLOm0oViIWCgmpt2RBWE2SPltFdHiWdCnaZJvCRK7mA
 _OHG8aTnfBgJESJ.oWSgUUGjKIewucOx_fgkpaG35frURsA3qAQpigOBDcDy4fXLM6w9x8tIJ6hP
 y65ABwAEwznzJwRoLfxiCvXMC1PntsHxWKp1wJmdRHivE6ZHxvvlaDXovPJCOFapqLxwlLw_jK8G
 YO_b30yRF98aHGw__sLiXdY8NGxka7cS7cdJ5W5yIPvwjoDTLx5HM6.YWAlfq0Zv5MKs.5no.Qv2
 Q3Q3LZr55DvdD.BD59ZpxGRTh_mVO2Zyb8cNNszs71_nGz2Q8YuuYIKYBA5jo0mFsDxnYu8Y_i4t
 QY9TB9C5zTurpbdJ_zvifQuMO4ZMV_m_TPMn45HuoQjmIyTsJ4NlUt1gYW2ISAxOa5d.UbBmHn7_
 s3LqQminYw2_Kfo5E9mWRx2RjGF31n1.g2_Pi97capgd.UxhaKAH0EQtuqxHCEEibUOEP3nZF9Je
 p7rfM9tyUlaujwDyYP6z.3_edx7f3GYbSH6Utn7yZN1qOZhCwkc1DoWEVuWGZvh7H.wBvdMsHzi3
 nL7CJ1pegkrWw84Oft24pr696aGPYvx60QWyMysnOgZ0J9nRORAX8TC.iCgdoV6tFqSNF2TYGXdB
 IIc41rNxMy.4lDfMzWP7oxvbvckeyBGB1GjQ_haTZbhdnHOxxT_YRSbkK8U.nU1R2g4XgqCUIlCs
 ngu2tzXuHdP6FjIzBRsCZmGiWRiF2mfgscgBgnguAkKGf02rbEj1raAmjX97GgKiBg5l9nZ4FrBD
 hSk0Hwe6ZAXO_tBGEc7_F78ZLfppBDRg5CsHXIKgBA.uRTGQTbj3MAHBYVeMShsmRzgWdu0WmkSL
 p_Yz_sxTfbULJVFUcwWCQOop8RGysI3c4.AkZ6RR2SOaK970TqGcNpZ74k92zaAHYIxVQgUU1Gr_
 DIbGG89aFrjG7INJZQR7.0uPa.HphtpnVk8K8zcfnouk7pVa6rgMK7JW9nkZgt9AHs.qBb.NHHg7
 KsJkVnLx6MdQM0eMjBxKR.TxUkZFdRp5lzPpSyWN3bs0P3sqlzhV66tprd0L3M6qsG_tRpIHjdI_
 LEG6gMRyQ1aGEbg7DpDDfEpvix5_IjCb7LWMOHFXp0t88ATvQNCENKI4Wf6CgNk9u72yL9m87xJ7
 BhzcLTCAO32X1h1hEpbeZdwFYAueti0vku3yLJwFK89BOAhq5op_nKWle3xYN6Zi54t15YMQGmY8
 bT2F5iCML2cYhxuC2Hrq0HmvzKzEVZPAIPxQJrZJaycCEHyT2xZaiFuW3RkltTT.kXNV3XfDyT28
 Pzcc16g7JBhUYtHv6SmV9o_LEuw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Mon, 20 Jan 2020 18:08:01 +0000
Date: Mon, 20 Jan 2020 18:07:57 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1284035258.1445298.1579543677315@mail.yahoo.com>
MIME-Version: 1.0
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15077 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: [Xen-devel] HVM Driver Domain
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
Cc: "rnikola@vt.edu" <rnikola@vt.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSSB3YXMgZG9pbmcgc29tZSBleHBlcmltZW50cyBvbiB0aGUgWGVuIG5ldHdvcmsg
RHJpdmVyIERvbWFpbiB1c2luZyBVYnVudHUgMTguMDQuwqAgSSB3YXMgYWJsZSB0byBzZWUgdGhl
IGRyaXZlciBkb21haW4gd29ya3MgZmluZSB3aGVuIEkgcnVuIGl0IGluIFBWIG1vZGUuIEhvd2V2
ZXIsIEkgd2Fzbid0IGFibGUgdG8gbWFrZSB0aGUgZHJpdmVyIGRvbWFpbiB3b3JrIHdoZW4gSSBy
dW4gaXQgaW4gSFZNIG1vZGUuIEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBJIHdhbnQg
bXkgRG9tVSB0byB1c2UgSFZNIGRyaXZlciBkb21haW4gZm9yIG5ldHdvcmsgYmFja2VuZC4KCmxp
YnhsOiBlcnJvcjogbGlieGxfbmljLmM6NjUyOmxpYnhsX19kZXZpY2VfbmljX3NldF9kZXZpZHM6
IERvbWFpbiAyNTpVbmFibGUgdG8gc2V0IG5pYyBkZWZhdWx0cyBmb3IgbmljIDAKCk90aGVyIHRo
YW4gdGhpcywgSSBkaWRuJ3QgZ2V0IGFueSBsb2cgbWVzc2FnZXMgZnJvbSBkbWVzZywgeGwgZG1l
c2cgY29tbWFuZHMsIGFuZCBmaWxlcyBmcm9tIC92YXIvbG9nL3hlbi8gZGlyZWN0b3J5IHJlZ2Fy
ZGluZyB0aGlzIGZhaWx1cmUuIFRoZXJlZm9yZSwgSSB3YXMgd29uZGVyaW5nIGlmIGl0IGlzIGV2
ZW4gcG9zc2libGUgdG8gY3JlYXRlIGFuIEhWTSBEcml2ZXIgRG9tYWluLiBQbGVhc2UgbGV0IG1l
IGtub3cgd2hhdCB5b3UgdGhpbmsuCgpUaGFua3MsCk1laHJhYgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
