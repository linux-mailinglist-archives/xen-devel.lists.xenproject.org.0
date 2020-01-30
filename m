Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789A14DF54
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:42:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCqd-0008TD-DD; Thu, 30 Jan 2020 16:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsuP=3T=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1ixCqb-0008T4-Tb
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:39:17 +0000
X-Inumbo-ID: 0e060538-437f-11ea-8ab9-12813bfff9fa
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (unknown [66.163.184.201])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e060538-437f-11ea-8ab9-12813bfff9fa;
 Thu, 30 Jan 2020 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1580402356; bh=XOFqwQ+27iS3uDIvHgGOzgAS8xkORplGJLuO/DxMn9c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=MwOVS6aTvTbwqMn9i41YUDC3JvLUyZ56uybBzTmXHCuxRxuWN+dpM0uKZThz10IAo+UUizVLB+lXYK9CBOuLlZTIDorGYy8Tl9IeBDF67A0yWI9cMfWFRa8fBrtT4P5KvHMGY3aIbWXeDD475T08TEyN3sIohuTGHA2Vk7Ab6r9phaB1ehVU8AhoBfblaWPaF9lYpgqvKah0q8QC7EdInIkk62naa7O1691tk7+AzKz+gQjFrio3sa61sV7g6IfEJJ+EMDgVd7oR9JZbwXTrHhg/ipr6w4uuFOv8CmXdYyJ6/8gxY33LsIlQYiIZsmg+5Nw+qrIFUj/dCKwOgkeoww==
X-YMail-OSG: ZbHJwt0VM1nymIRhmIDX5t48.a7o3_0w8qss9zxyp.QlPFv1r7.QdSFoXT6JGlb
 17FwJHikfV0rDHFWnzgDQ9rGtvJFTdanQPBRE80TQ25Y3g8fOy9n62VTJ3.4fcjaCJq7R_RiO5Pe
 Pj4lb.bJxwo.HEg.qq7MEI05uFHDxkQFTgaRI8rg1nWyg9vsYMoIAB8cpQP4f12QDs2uWWkmMTB9
 KElBKT.6cx.bP_gDnWpojJfNk7mjg6kbtlYFMPS8YuXLhGqke9XfpLI8u5GnOsrzAb4_n7YARTXn
 SLDcj7pxxGML_lpqbgpyZDfDddTcemGD5DzQj_FHzmwn9jMcB0RbFHPCXLo3FohyXy4ItM1lMOzS
 WsZJASWQFy02uMrbW0W27ZWgkklOo5GO7zXU3z__cpsfhdk5jj0RNjzrxSW3xhqL1HHohgTLskbG
 IYB3Q5SKumVm.pn1Q4Sjr5pYLBwAG.J79HiglwB1az8gY_qEuRzsEZW.vafmLmOuznRm_RvuMmXh
 swyWSfmgcla1Bl7ioJ4WnViJS4V1fsbdeFs7lr_784D.VBTE9Q0yqLDIYxG8SDlumwcjg8sv.2na
 e4QX45Swl3v8hGQ4fQPU6UeB089jtHrxxlWWWmWXnwlWDWFzhDHOeVv1Wf..Y2goXtywtMcCuCm0
 jVEsKUAGWaPTdbe8xVg3dQWRdCgrcalR9Vo_oCBkeEIHuXoXO3kQVTfkNyW8y0yWp6uXwkpgV8oj
 8g8YRjAc.t84z5sKE21WZ.DdoDcokrumsdbSjIZ.mk9zC8u7D1WjmMvCjWskRYLkjDS3uMg55WAT
 QNfw6oHhsMephl70xI2Fmrri3rqM8V.pQtFsvI71Fv_eSTd62WbitIE9flTEE0Vp5LLFSCYjFi42
 RrNxsn_eS4xMn9_yGmYa13iXp3xxWD5OQ.plSAnGwn0EbRCCMLIyQzB4T.7Mv5Hezc_R87v_UHRr
 pQ0_.C_2.8uJYo_rSrcwjxGfuLM4ckItKvYsW4TqjRdY5ix3kAsaX_gpyw60JbAplHpSilmSMSAP
 uexbFsAHgWJol_ObAXr4CJX_2iRNbD6jll3f6rp2qLunJbSOAUl.EQlbBeKBPTlrxLcDqfWF6q_v
 1CoZ4dRfwomNXCqqixLT6OjWvy9mHpRTZ16mhk3vs07LRWs6qjuHVuHMJMdRvGR99IMJPLiViYsI
 g8bDvoViJ2yfgDpbmH7dYTa0WOsEVNPWceVbbw6MnV7WX8.xwj_hA2rnaKvUfw75SlqR26ga4Kph
 FMXJsxC9u8dUt9.dbeK8OSba0A0biv1Guy479yiUGZ68_rD7_POFMcI_WKX77wr7l5iHbdnWNOw2
 SoDijES5FMxz8s3jVnaq7i8wQ5cIdWWROjYBeqfI-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Thu, 30 Jan 2020 16:39:16 +0000
Date: Thu, 30 Jan 2020 16:38:54 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <869544230.355153.1580402334277@mail.yahoo.com>
In-Reply-To: <20200130090138.GA4679@Air-de-Roger>
References: <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
 <299023995.1231830.1580157801838@mail.yahoo.com>
 <20200128101257.GJ57924@desktop-tdan49n.eng.citrite.net>
 <39893674.1202836.1580337787157@mail.yahoo.com>
 <20200130090138.GA4679@Air-de-Roger>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15113 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAneGwgZGV2ZCcgc2hvdWxkIGFkZCB0aGUgYmFja2VuZCBpbnRlcmZhY2VzICh2aWZYLlkpIHRv
IHRoZSBicmlkZ2UgaWYgcHJvcGVybHkgY29uZmlndXJlZCwgYXMgaXQgc2hvdWxkIGJlIGNhbGxp
bmcgdGhlIGhvdHBsdWcgc2NyaXB0cyB0byBkbyB0aGF0LgoKWWVzLCBydW5uaW5nICcgeGwgZGV2
ZCcgaW4gdGhlIGRyaXZlciBkb21haW4gYmVmb3JlIGxhdW5jaGluZyB0aGUgRG9tVSwgc29sdmVk
IHRoZSBicmlkZ2UgaXNzdWUuIFRoYW5rcyBhIGxvdC4KClNvLCBmb3IgdGhlIHBlb3BsZSB3aG8g
ZW5kIHVwIHJlYWRpbmcgdGhpcyB0aHJlYWQsIHRoZSBmb2xsb3dpbmcgaXMgYSBsZXNzb24gSSBo
YXZlIGxlYXJuZWQuIAoKV2UgbmVlZCAneGwgZGV2ZCcgcnVubmluZyBmb3IgdGhlIGJyaWRnZSB0
byB3b3JrLCBhbmQgdG8gZ2V0IHRoZSAneGwnIHByb2dyYW0gaW4gdGhlIGRyaXZlciBkb21haW4s
IGRlcGVuZGluZyBvbiB0aGUgZGlzdHJvIGJlaW5nIHVzZWQsIHdlIG1heSBuZWVkIHRvIGluc3Rh
bGwgeGVuLXV0aWxzIG9yIG90aGVyIHBhY2thZ2VzLsKgIEhvd2V2ZXIsIGFsb25nIHdpdGggdGhl
IHhsLCB0aGVzZSBwYWNrYWdlcyBtYXkgZW5kIHVwIGluc3RhbGxpbmcgWGVuIGh5cGVydmlzb3Ig
YW5kIHVwZGF0ZSB0aGUgZ3J1YiBhY2NvcmRpbmdseS4gQXMgYSByZXN1bHQsIHRoZXJlIGlzIGEg
Y2hhbmNlIHRoYXQsIGluIHRoZSBuZXh0IGJvb3QsIHRoZSBPUyB3aWxsIGJvb3QgaW50byB0aGUg
aHlwZXJ2aXNvciBtb2RlLiBJbiB0aGlzIGNhc2UsIHRoZSBkcml2ZXIgZG9tYWluIHdvbid0IHdv
cmsuIFRoZXJlZm9yZSwgYmUgY2FyZWZ1bCBub3QgdG8gcnVuIHRoZSBkaXZlciBkb21haW4gaW4g
RG9tMCBtb2RlLiBDaGFuZ2UgdGhlIGRlZmF1bHQgYm9vdCB0byB0aGUgcmVndWxhciBMaW51eCBv
ciBkZWxldGUgdGhlIFhlbiBpbWFnZSBmcm9tIC9ib290LCBhbmQgdXBkYXRlIHRoZSBncnViLiBB
ZnRlciBCb290aW5nIHRoZSByZWd1bGFyIExpbnV4LCBtYWtlIHN1cmUgdGhlIGJyaWRnZSBpcyBz
ZXQgdXAgY29ycmVjdGx5LCBhbmTCoCAneGwgZGV2ZCcgaXMgcnVubmluZyB0byBoYXZlIHRoZSBu
ZXR3b3JrIGRyaXZlciBkb21haW4gd29ya2luZy4KClJlZ2FyZHMsCk1laHJhYgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
