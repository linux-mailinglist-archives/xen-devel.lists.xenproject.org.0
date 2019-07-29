Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6580791F6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:21:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9IW-0004If-Fs; Mon, 29 Jul 2019 17:18:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vhx=V2=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hs9IU-0004Ia-Nl
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:18:54 +0000
X-Inumbo-ID: f06f860c-b224-11e9-8980-bc764e045a96
Received: from mail-yw1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f06f860c-b224-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 17:18:53 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id i138so22886245ywg.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=nk68wtEpF/zTDxx5voq2zNs0DJnWtukaMUHtNp3j6OA=;
 b=VLZit1ZUrAuwMecOQ0KuZYFe3g/a3RNElsuzVCh2WMLQMLuzO1j46cczCqE/fEJ8rD
 t+ZnhyuuSnXyQwMFgJog0fcoCSCfpjAWmwsAH/K3bRZGkuxfI1GrsHNcl6GpZrJYcSSM
 OWWyBaFTifNbBOCL1cHDPglVwjeaerudUVQ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nk68wtEpF/zTDxx5voq2zNs0DJnWtukaMUHtNp3j6OA=;
 b=WWlWPNych2RXanGVkPl+aKY24mkEi6h8iNCLJMciUMGoNq3iCyOM1+yCWWFHm4DoBx
 yf6AfZ1uKBTBHLxz7nsU4ukGLoCaT/YSYZtI3XPXqv1R2Xsn0r0Aqf61XLZur04Nf4zf
 Pyhaftn4TaAR+HghqCvAaWMYgbRlqE6UaA4DwLuuLU85Lo35Hc369/yIzgXGlYtVWFC9
 5atsJM6LclG6mMDF1rf9styjZQUPoxvqNfiCk1p00ZPvVEkJrUpf9aUwOCF3W7I2pB6C
 yXWy3yxSlYN1tLupRTYsss9SKCCS2ElwrJfJvM4q3ablK0IQjtckubW23e3U9wki9mkk
 qI4g==
X-Gm-Message-State: APjAAAXNRj2W7+laSNxnO+hVN1WGKGqqKbMZFoQnkJnB0IqvLTocMVIY
 dayGjq+5y6RU2SVwstdVncm7RGFl
X-Google-Smtp-Source: APXvYqxWbqHk6VDpCQa+VLtgpaGkfgWIbp4/reCo59yxGFdqMahq1leooGOD+g813Z71CWlmiSl8jw==
X-Received: by 2002:a81:6d07:: with SMTP id i7mr70406662ywc.112.1564420732916; 
 Mon, 29 Jul 2019 10:18:52 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:6008:4bd3:3aa3:cc44])
 by smtp.gmail.com with ESMTPSA id k22sm14492444ywh.5.2019.07.29.10.18.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 10:18:52 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <156413540514.22784.14073005924861814163.stgit@Palanthas>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <65d9c6bf-3eec-59d0-a070-8142f34d9e15@cardoe.com>
Date: Mon, 29 Jul 2019 12:18:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156413540514.22784.14073005924861814163.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ci: install C++ in opensuse-leap CI
 container
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8yNi8xOSA1OjAzIEFNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKCj4gVGhlIG9wZW5TVVNF
IExlYXAgY29udGFpbmVyIGltYWdlLCBidWlsdCBhZnRlcgo+IG9wZW5zdXNlLWxlYXAuZG9ja2Vy
ZmlsZSB3YXMgbWlzc2luZyB0aGUgZ2NjLWMrKywKPiB3aGljaCBpcyBuZWNlc3NhcnksIGUuZy4s
IGZvciBidWlsZGluZyBPVk1GLgo+Cj4gQWRkIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8g
RmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiAtLS0KPiBDYzogRG91ZyBHb2xkc3RlaW4g
PGNhcmRvZUBjYXJkb2UuY29tPgo+IC0tLQoKCkFja2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+CgpXaWxsIHlvdSBiZSBwdXNoaW5nIHRoZSByZWJ1aWx0IGNvbnRhaW5l
ciBvciBkbyB5b3UgbmVlZCBtZSB0byBkbyB0aGF0PwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
