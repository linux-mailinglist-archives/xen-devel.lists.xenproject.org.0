Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBC1473E9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 23:39:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iul5h-0005Vb-EQ; Thu, 23 Jan 2020 22:36:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IItY=3M=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iul5g-0005VW-Sv
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 22:36:44 +0000
X-Inumbo-ID: d0362056-3e30-11ea-8e9a-bc764e2007e4
Received: from sonic314-21.consmr.mail.ne1.yahoo.com (unknown [66.163.189.147])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0362056-3e30-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579818995; bh=n/249qGGINMv915ZFon9ymZ59qUk0hG+XJZDSpw3Cio=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=tlju4+tk32hNtczNNMl4GxJO58teaea5hYf6trEIJ9VA+0VW8sUbZ2zINSJfLEibOx08XHKySbkLaRD0y9SPlUnqsUxfovut73dOQ7FZidwp27aRrBGH19WeQVWZUNeG9ZYhiVp7EjzMijgleDIOMq0yRGuPEt79jviXRTWmY5wFjlFRPLbtO1bI57se9xckPHuPjzWOI3iPwS4Mn0b/Vk26VLuV33hwWfP9Bo4WPDi5N5vFA3AU8kwdBJKi2CiJRxERHF9uUVQJ/74rsX9OQzLLBslM+WK9nu27Jt+JedjjvkRFFYa4lg9VijI/vzgNr2Ow/UGuisg4sgp/0543IQ==
X-YMail-OSG: 3chMezAVM1l3wT2h2o0eECMq8AuyxOyW3LbS2uc7Zwp5fmLYcK_rH62FrdvKt7Y
 jPuAsNUsbgAs0kOBZ9TPk9JterdN1KzCV5.dsuthis5q9z9gOIRBxnmGsvOU1lkyhMCxyGhvLm8G
 kmcTi.Hy8LooACIj9SzQBnSQEOTeHxrf6vVVJwogNilcc6VT6rT26.cGdZUQLJtbD7io8AiyR2kr
 erGkGERI5WXF.2LAGB8PxlB3RmEPSUoULzHjqoWJC61FCLVOEyPmj9wqCTx97yXreN8ZX2ZWIjR6
 9QZRXzPW5NDauY7_uakunH7jx7IK2Ih_rYBfmfgmKy0BoR4xCO91r9xajd.C_mwju9RQq6_rmfPc
 gpySldhuEQfrSQuq9mF94fmyq67N2P7oOWqPqr6CrCcQWHccWuAZumuyzV5xZ6a4muMqbync8HLE
 5k0m_wj4iZKDnWzjNupEw6hgLStp0GBuHKQ2SrlsoKx7AOHxEcpALJJUv9hHdHwCTFU3cBHhiBD9
 vivOHI1SZsxYNMZgITcn7I5t9yxhoIVGsWCE4pIS_LdS9qtWcA941b6PjkWIxKOo9igECFvUyFgS
 BxxXtHXsBFZKdKsUmlMAsXgoAkimhky5k6v_Q3soeTVGQlETkMIXvynoNvEzRVvPYv_iwx4tZfCB
 db1fTwukUzIx2S34xisAe100voUCbJwcSXM1jLYIODcJcwjwQCj4yYDDWaZGFmJABRFhJTssxP84
 DXGaulQ6hjUFzD8EvXlDNHJ8seIcmFN6yJZXD1I0IcAIpEtZCtRbGJcAz14ZQ7NlMedmCxa7S4MJ
 tUqFiExq7q9Uu3NuBNSurSJaoVAccDT0H9OkSmMOo1XEGCpWcuCzLAws1KH8IEPZS86OlULg36we
 0QXWrIJ0r73xa1IBsVFPnyJrqP4cXBVIhSLufRZ4OWnWQA.yWU7MM3tDcjKWNWQ9E1AV6yQzlr.w
 No3TNXjTOZ2Sh.WRT.AIZxrE07ijzP2qlIQZrii5LAS7EFblfwUUvKZrum66haYw2U5mc_BTG1m.
 lcLVgVze1bXETZxSzcnmz3KONwILh6hQ2QO3MpFNa9sodmsJskX81kVSrJi2wldSAABIcXNHmLSv
 acV4Q2t6fI7Z5sRa.KlABSrcnjjQ9Dctymkv1Wr1UyesELnB1L03YdXADTkGWz2FNkqGczdR8yoI
 k9OBQGuzISe.Elm2AexF.aoy.zSwq4OhllO793pW_WjbMfNy12QiKAYRPKgHRs9CUlcNsFqF3IGc
 __4DV5RrMMa0s95ucXmfNDXIuu8FGey_P4vczgn1ZzjuDlkT.SCFeHNmZE8I84jPTzYWBzlEMMJB
 kQ6PN9ll3eG8vejzRNhtv.fgfzHFoVnqSoXS6cg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Thu, 23 Jan 2020 22:36:35 +0000
Date: Thu, 23 Jan 2020 22:36:34 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <972998214.522226.1579818994322@mail.yahoo.com>
In-Reply-To: <20200122195831.GB1314@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
MIME-Version: 1.0
X-Mailer: WebService/1.1.14873 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpJIHdhc24ndCBhYmxlIHRvIG1ha2UgdGhlIEhWTSBkcml2ZXIgZG9tYWluIHdvcmsgZXZlbiB3
aXRoIHRoZSBsYXRlc3QgWGVuIHZlcnNpb24gd2hpY2ggaXMgNC4xNC4gSSBzZWUgdGhlICd4ZW5k
cml2ZXJkb21haW4nIGV4ZWN1dGFibGUgaW4gdGhlIC9ldGMvaW5pdC5kLyBkaXJlY3RvcnksIGJ1
dCBpdCBkb2Vzbid0IHNlZW0gdG8gYmUgcnVubmluZyBpbiB0aGUgYmFja2dyb3VuZC4gCgpPbiB0
aGUgb3RoZXIgaGFuZCwgSSBzZWUgdGhlIG9mZmljaWFsICJRdWJlcyBPUyBBcmNoaXRlY3R1cmUi
IGRvY3VtZW50IChodHRwczovL3d3dy5xdWJlcy1vcy5vcmcvYXR0YWNobWVudC93aWtpL1F1YmVz
QXJjaGl0ZWN0dXJlL2FyY2gtc3BlYy0wLjMucGRmKSBkZWZpbmVzIHRoZSBkcml2ZXIgZG9tYWlu
IGFzIHRoZSBmb2xsb3dpbmcuCgoiQSBkcml2ZXIgZG9tYWluIGlzIGFuIHVucHJpdmlsZWdlZCBQ
Vi1kb21haW4gdGhhdCBoYXMgYmVlbiBzZWN1cmVseSBncmFudGVkIGFjY2VzcyB0byBjZXJ0YWlu
IFBDSSBkZXZpY2UgKGUuZy4gdGhlIG5ldHdvcmsgY2FyZCBvciBkaXNrIGNvbnRyb2xsZXIpIHVz
aW5nIEludGVsIFZULWQuIiAtIFBhZ2UgMTIKCk1vcmVvdmVyLCBzZWN0aW9uIDYuMSByZWFkcyAi
VGhlIG5ldHdvcmsgZG9tYWluIGlzIGdyYW50ZWQgZGlyZWN0IGFjY2VzcyB0byB0aGUgbmV0d29y
a2luZyBoYXJkd2FyZSwgZS5nLiB0aGUgV2lGaSBvciBldGhlcm5ldCBjYXJkLiBCZXNpZGVzLCBp
dCBpcyBhIHJlZ3VsYXIgdW5wcml2aWxlZ2VkIFBWIGRvbWFpbi4iCgpNYXliZSB5b3UgZ3V5cyBs
YXRlciBtb3ZlZCB0byB0aGUgSFZNIGRyaXZlciBkb21haW4gZnJvbSBQVi4gV291bGQgeW91IHBs
ZWFzZSBzaGFyZSB0aGUgWGVuIGNvbmZpZyB5b3UgdXNlIGZvciB0aGUgbmV0d29yayBkcml2ZXIg
ZG9tYWluPwoKVGhhbmtzLApNZWhyYWIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
