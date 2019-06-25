Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC2557E7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 21:40:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfrGr-0002Xz-KJ; Tue, 25 Jun 2019 19:38:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TDZb=UY=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hfrGq-0002Xu-FF
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 19:38:24 +0000
X-Inumbo-ID: cb59f863-9780-11e9-8980-bc764e045a96
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb59f863-9780-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 19:38:23 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e5so2924582iok.4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NhVI0DWSn2vnXKiOsw+IYMj/a1d6C9k5tWgzFDbIdo8=;
 b=u5/8fhmXnK4sZAg771oy2K0RygaMH0T7lzX2NG/CvTMyDM8VlARzZp8Iz5wfNA15Ed
 843IrrNZ906eED0ks5ZckQseLL7zJRUZaXb4JLaWfdmaT13jUK6UmDpfrboRYUyOebSF
 3SMXMZW5PsPeNas6vUq2tTNsNaSj8K3iX0G4iNSljh3ReTaOiP0zhtNjNsljbvJaRNuz
 Tkqa4gVGlVQFbKgUdgEhfOwIj5kJ2vLUTYZgXMv5onxjdQXg5NrFzq6tucltCqJ/n1sz
 Y90OyHnET12El7z8IZ+/JB0xzlqCuuByJakeu3EasvFYfYGfUWuR4ibXOpfMabCb+0bq
 8PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NhVI0DWSn2vnXKiOsw+IYMj/a1d6C9k5tWgzFDbIdo8=;
 b=a17sKMxk7IMvO4exKR6ejLY5HMUc05xKBt1OUMWs6H0yNRBP2yWfsfa1QFVggGwXgC
 f4EPjdLTnHiL3bc64/s+Q/h7EL+zKGPXSL5TJg3MRa4ZBH0FAdX2ukXFBzcbYBN+rbTN
 Zjm4zjzrsC/vjzpLAyeo/k2GkjRCTIdVKgTTsHiwCThzbJeEYkGr55b7hxLnMaiszGQe
 eHyz2z02mE6CwNvdFJT9B+54JMmocK+t+4xDlCQ7DR0yzEiH8Y6w+D/ekhABLzRkNIgu
 2kltudHqiSy9K9S04bVyxU/dUxyhRH+mLko3wUk0gMvLGDnwxY5q17f8jgb8X73PZ4TR
 CESg==
X-Gm-Message-State: APjAAAUsf0QLl0hJLMEmo6PD5Yn8h5UDHBCS3NCEuy24boU82JK/W7Id
 AMaRalBX34BamSVVth30oFo=
X-Google-Smtp-Source: APXvYqyAjk13ymv+jh85fD4gH0cHhJyaGNd7OoOWEdS+jYXBUiut+XMV4ikMSCJ3fyqYstonaYKGJA==
X-Received: by 2002:a02:22c6:: with SMTP id o189mr27557020jao.35.1561491503228; 
 Tue, 25 Jun 2019 12:38:23 -0700 (PDT)
Received: from [100.64.73.93] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id m7sm12342314iob.69.2019.06.25.12.38.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 12:38:22 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
Date: Tue, 25 Jun 2019 15:38:21 -0400
Message-Id: <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
 <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian Woods <brian.woods@amd.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdW4gMjUsIDIwMTksIGF0IDEyOjM2LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+IAo+IEhpIGFsbDoKPiBwbGVhc2UgYWRkIHlvdXIgYWdlbmRhIGl0ZW1z
LiBJIGhhZCBvbmx5IE9ORSBzZXJpZXMgd2hpY2ggd2FzIGhpZ2hsaWdodGVkIGFzIG5lZWRpbmcg
YXR0ZW50aW9uIGZyb20gb3RoZXJzLiBJcyB0aGlzIHNlcmlvdXNseSB0aGUgb25seSBvbmU/CgpQ
cm9wb3NlZCBhZ2VuZGEgaXRlbTogaW4gdGhlIGFic2VuY2Ugb2YgSmlyYSB0aWNrZXRzLCB3b3Vs
ZCBpdCBiZSB1c2VmdWwgdG8gaGF2ZSBhIGxpc3QgKGUuZy4gZ2VuZXJhdGVkIGJ5IGEgc2NyaXB0
KSB3aXRoIHRoZSBsaWZlY3ljbGUgc3RhdHVzIG9mIGFsbCBvdXRzdGFuZGluZyBwYXRjaCBzZXJp
ZXMsIGUuZy4KCk1FVEFEQVRBCgotIGJ1ZyBmaXggLyBpbXByb3ZlbWVudCAvIHJlZmFjdG9yIC8g
Y2xlYW51cCAvIG5ldyBmZWF0dXJlCi0gaW1wYWN0ZWQgWGVuIHN1YnN5c3RlbXMvY29tcG9uZW50
cy9mZWF0dXJlcwotIHRhcmdldGVkIHZlcnNpb24gb2YgWGVuCi0gY29udHJpYnV0aW5nIHBlcnNv
bi9vcmcKLSByZWxldmFuY2Ugb2YgcGF0Y2ggc2VyaWVzIHRvIHRoZSBnb2FscyBzZXQgYnkgUk0g
Zm9yIHRoZSBuZXh0IFhlbiByZWxlYXNlCi0gcmVsYXRlZCBwYXRjaCBzZXJpZXMgKHdpdGggYmVs
b3cgc3RhdHVzIGluZm8pCgpTVEFUVVM6CgotIHBhdGNoIHNlcmllcyB2ZXJzaW9uCi0gZGF0ZSBv
ZiBwYXRjaCBzZXJpZXMgdjEKLSBubyByZXNwb25zZXMgcmVjZWl2ZWQgKyBwaW5nIGNvdW50ICsg
ZGF5cyBzaW5jZSBzdWJtaXNzaW9uICsgZGF5cyBzaW5jZSBwaW5nCi0gcmV2aWV3ZWQgd2l0aCBv
YmplY3Rpb25zCi0gcmV2aWV3ZWQgd2l0aG91dCBvYmplY3Rpb25zLCBhd2FpdGluZyBhY2sKLSBh
Y2tlZCwgYXdhaXRpbmcgbWVyZ2UKCkZyb20gc3VjaCBhIHN1bW1hcnksIHBhdGNoIHNlcmllcyBj
b3VsZCBiZSBwcmlvcml0aXplZCBmb3IgcmV2aWV3L3RyaWFnZSBpbiB0aGUgY29tbXVuaXR5IGNh
bGwsIGJhc2VkIG9uIHVuaWZvcm0gY3JpdGVyaWEgYW5kIHByb2plY3Qtd2lkZSBjb250ZXh0LgoK
UmljaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
