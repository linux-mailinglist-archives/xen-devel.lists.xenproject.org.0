Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FE143485
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:43:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgfC-0002T4-GG; Mon, 20 Jan 2020 23:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itgfB-0002Sy-H1
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:40:57 +0000
X-Inumbo-ID: 4de47ea8-3bde-11ea-8e9a-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de47ea8-3bde-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 23:40:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so634331lfp.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gx13fhUAdVvNOjpw34eZJMJ/ahf85YqTI2wSZnKV+/8=;
 b=lCC3T/MJmaXXnKLwBnOrwDiW5kWtEFKSUGR+ZN1gX/r+J1htVkZKLi9eEJPqFIVM1Q
 JBlCqSGwykB/o2bC6HU+/de+iycEQJKgCgsSecNXtAqzlul8iCfr8neXj7YlAvYvsHGL
 vqnt59tkoZYUEfwPROEwaZJ/dPqVsIBqN4wOBa60w1Sefvh5OF9A/7lXJxpczvsJGRi9
 yFhctUsJ/19nl/N7kaeTHuHD7mv3IfegbrEI0Tn14z30XiQjEmfK0tY4TfLhq58mqKgl
 xHY5igx/EFDUsCJ+Q4b86pRAcwb4TvQug/Wfu5YcdN8Fp5MPEahOK419+czBTy5kExlK
 73yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gx13fhUAdVvNOjpw34eZJMJ/ahf85YqTI2wSZnKV+/8=;
 b=ThVr2PSx+0+1UJ6l4ICzceP2Jt7iQpFe6ElutYreVoBBilxkYqTqP43Rw9kta88AlP
 z/I8M2mky92zsI5VmALStJcTaPHMhRm7K1PXC11Tv9brMvHalSdP7XtrdLrv/+2M9kTE
 49Z7Az1DAndpD6vpnL8Ikp4dTdRBEc3hHFGjZoIjqEymqtbsRcstmlZ04LdoQws7Fo0V
 7sRk5Y96DBP9ZZppVe6LOT6QkeQSSS31nGAHnW3ya+glCKDRE9HC+jWLJNYvejIU5h/z
 syAm5aPumr+Xu9oE2mZtIjlMJe/cnGUFytdJBvU94kQtiI64xEFMeRmeeLJRkB555y5f
 UW7A==
X-Gm-Message-State: APjAAAVbAV6NizqFv2lxfe0Hu3MEYmCZaoGmSHovSfZIGFNANqN6sbod
 CyL7BkvmT65ZM9VbQjr898ql9SHoTigU3bHiogM=
X-Google-Smtp-Source: APXvYqyAugSsciLrbj1EluLt5Bs0WCRRKWN7AQQq88RAH4vzEWCRZ1he9DmhvttlWIXK9jdidjrJSjv50RWC2ku5D4c=
X-Received: by 2002:ac2:44a3:: with SMTP id c3mr953168lfm.1.1579563656055;
 Mon, 20 Jan 2020 15:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-4-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-4-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:40:43 -0500
Message-ID: <CAEBZRSexwpdjmDqPBN_+Mno-yO=7Kq6xD6hJG5ereRYhDBjbPQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 4/8] golang/xenlight: Errors are negative
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBDb21taXQgODcxZTUxZDJkNCBjaGFuZ2VkIHRoZSBzaWduIG9uIHRoZSB4ZW5saWdodCBlcnJv
ciB0eXBlcyAobWFraW5nCj4gdGhlIHZhbHVlcyBuZWdhdGl2ZSwgc2FtZSBhcyB0aGUgQy1nZW5l
cmF0ZWQgY29uc3RhbnRzKSwgYnV0IGZhaWxlZCB0bwo+IGZsaXAgdGhlIHNpZ24gaW4gdGhlIEVy
cm9yKCkgc3RyaW5nIGZ1bmN0aW9uLiAgVGhlIHJlc3VsdCBpcyB0aGF0Cj4gRXJyb3JOb25zcGVj
aWZpYy5TdHJpbmcoKSBwcmludHMgImxpYnhsIGVycm9yOiAxIiByYXRoZXIgdGhhbiB0aGUKPiBo
dW1hbi1yZWFkYWJsZSBlcnJvciBtZXNzYWdlLgo+Cj4gR2V0IHJpZCBvZiB0aGUgd2hvbGUgaXNz
dWUgYnkgbWFraW5nIGxpYnhsRXJyb3JzIGEgbWFwLCBhbmQgbWFwcGluZwo+IGFjdHVhbCBlcnJv
ciB2YWx1ZXMgdG8gc3RyaW5nLCBmYWxsaW5nIGJhY2sgdG8gcHJpbnRpbmcgdGhlIGFjdHVhbAo+
IHZhbHVlIG9mIHRoZSBFcnJvciB0eXBlIGlmIGl0J3Mgbm90IHByZXNlbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
