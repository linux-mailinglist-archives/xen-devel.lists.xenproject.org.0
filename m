Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E02F2E10F
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 17:29:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW0U5-00052i-38; Wed, 29 May 2019 15:27:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOWO=T5=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hW0U3-00052d-26
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 15:27:19 +0000
X-Inumbo-ID: 3cb64886-8226-11e9-a048-53f46676293d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cb64886-8226-11e9-a048-53f46676293d;
 Wed, 29 May 2019 15:27:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559143635; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ezyUL8QuOO4i1omsoFy3CWBxkXi8Em6/1H3WX1DqXUg=;
 b=bFakw7EkGz7+j4waH/xatXcqtaEbZ8Q09jfvE2cqSdn2Ji5nKY/MmJoi0w7muznOQQIOMc0C
 Yai7mdfel0EaX7l7McP8xTZDH2hU9vuT824tmg0KPNlrInDeU+oGqY00BmurhSi8Ryuuov/G
 gEfPt1dhWPV+XfB8EOrMuqR3r5A=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mxa.mailgun.org with ESMTP id 5ceea4d2.7f174f598070-smtp-out-n02;
 Wed, 29 May 2019 15:27:14 -0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y13so2422950lfh.9
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 08:27:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXFgudQQCBd9QdOrpYBQYYI2toYhK6+4jnvfgql7qMfrUWcRGVS
 jQMjSFENYceJALOwveOGacIDUuAqYCvg6kkpGa0=
X-Google-Smtp-Source: APXvYqwF9hmbIXSvdnYZaY+0PjjkVUSYV6zqxxolAuTHlvj5RHJ5lwy0AQzWqyoX8IvoHKLH/C1Ur6yH+WuwHTaZjbg=
X-Received: by 2002:a19:9e53:: with SMTP id h80mr6113098lfe.77.1559143632613; 
 Wed, 29 May 2019 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
In-Reply-To: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 29 May 2019 08:26:36 -0700
X-Gmail-Original-Message-ID: <CABfawhnBf-e1WOzCgJF_Cd-oVow4UqdZfTQUa4i5zxLMhjD+cw@mail.gmail.com>
Message-ID: <CABfawhnBf-e1WOzCgJF_Cd-oVow4UqdZfTQUa4i5zxLMhjD+cw@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBZnRlciBhIHNlcmllcyBvZiB0ZXN0cyBvbiAxIG9yIDQgVkNQVXMsIG15IGRvbWFpbiBlbmQg
dXAgaW4gMiBwb3NzaWJsZSBzdGF0ZXM6Cj4gLSBmcm96ZW46IHRoZSBtb3VzZSBkb2Vzbid0IG1v
dmU6IHNvIEkgd291bGQgZ3Vlc3MgdGhlIFZDUFUgYXJlIGJsb2NrZWQuCgpZb3UgcHJvYmFibHkg
aGF2ZSBldmVudHMgcGVuZGluZyBvbiB0aGUgcmluZyB0aGF0IHlvdSBkaWRuJ3QgcHJvY2Vzcy4K
QWZ0ZXIgeW91IHBhdXNlIHRoZSBkb21haW4gYW5kIHJlbW92ZSB0aGUgcmVnaXN0ZXJlZCBldmVu
c3QsCmJyZWFrcG9pbnRzLCBldGMuIHlvdSBoYXZlIHRvIGRvIGEgZmluYWwgbG9vcCBvbiB0aGUg
cmluZyB0byBwcm9jZXNzCmFueSBldmVudHMgdGhhdCBtYXkgaGF2ZSBiZWVuIHBsYWNlZCB0aGVy
ZSBiZXR3ZWVuIHRoZSBlbmQgb2YgeW91cgpsYXN0IGxvb3AgYW5kIGNhbGxpbmcgcGF1c2Ugb24g
dGhlIGRvbWFpbi4gTGliVk1JL0RSQUtWVUYgZG9lcyB0aGF0CmFscmVhZHkuCgpUYW1hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
