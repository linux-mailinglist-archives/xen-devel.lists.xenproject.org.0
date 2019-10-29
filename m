Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A95E887B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 13:42:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPQnN-0007Ap-IH; Tue, 29 Oct 2019 12:40:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jy4k=YW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iPQnM-0007Ak-M7
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 12:40:20 +0000
X-Inumbo-ID: 43de2868-fa49-11e9-9511-12813bfff9fa
Received: from mail-lf1-f68.google.com (unknown [209.85.167.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43de2868-fa49-11e9-9511-12813bfff9fa;
 Tue, 29 Oct 2019 12:40:19 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f4so4404147lfk.7
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PVMX+ZEHzg565+6F3eEu9ohn0bK787mVGOz3HLe08yw=;
 b=bpMC/w4t8s7SLyDHtZA6XvX8WUwUJnrmB8iBIGAJYCP+oOsWqn7vqM19lKOTF+Opun
 TIKOxQRdhAe0IdLlvQNMxrHgi3zb9er4c/n3j1aEEX9G5LHIeTDp9jpRNs9EZBx6qGDv
 9RYCe+xJNhJ7PSKaQE4ldxgiBvxMkJ9qBXSJdII3xHVDCNcZOUcjG6uYMy06haie/Rvs
 /S1L5Ffnj/SURNOH+CMO49fM8NqfeDnHmWjv6e6BqIDWOgd+ZLLnpzUdoyiax/f7/XDw
 lFoZqoJfOV5gkFlNjoEVwiEiFm+EaA87lzC35sl00Rlzp5HImacx8p3n3r6FDPMqzRKa
 lkLg==
X-Gm-Message-State: APjAAAWE+s0iCHaeYQwFg/3wjxQxwbBXYoOSxWZCUQgmDcDOvOq8+fd8
 ATsvTYuNJczdedVUs4oTLTzPza1+VZo=
X-Google-Smtp-Source: APXvYqwgUs4+XHVO1ucIYm7rW+cmjB3bIWPzzPwxlUiN1pgC/rzvKAvGHQzNZQ+1m3AHIIBRJbgwBw==
X-Received: by 2002:a19:520b:: with SMTP id m11mr2317760lfb.77.1572352818560; 
 Tue, 29 Oct 2019 05:40:18 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id d19sm7681843lfc.12.2019.10.29.05.40.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 05:40:18 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id j5so4030994lfh.10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:40:18 -0700 (PDT)
X-Received: by 2002:a19:cbd2:: with SMTP id b201mr2295025lfg.192.1572352818093; 
 Tue, 29 Oct 2019 05:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191024130154.19145-1-wl@xen.org>
In-Reply-To: <20191024130154.19145-1-wl@xen.org>
From: Wei Liu <wl@xen.org>
Date: Tue, 29 Oct 2019 12:40:02 +0000
X-Gmail-Original-Message-ID: <CAK9nU=oQaDdacWgxCBXG=PdJy9F7Vehrn9uGrDgpGyVYHHZJ0w@mail.gmail.com>
Message-ID: <CAK9nU=oQaDdacWgxCBXG=PdJy9F7Vehrn9uGrDgpGyVYHHZJ0w@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH v2 for-4.13] CONTRIBUTING: drop blktap2 and
 add tools/libs
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
Cc: Juergen Gross <jgross@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNCBPY3QgMjAxOSBhdCAxNDowMSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBCbGt0YXAyIGlzIGdvbmUgYW5kIHRvb2xzL2xpYnMgaXMgbWlzc2luZyBpbiB0aGUgZG9j
dW1lbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IFJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tCgpBbnkgY29tbWVudCBvbiB0aGlzPyBJZiBu
b3QgSSB0YWtlIGl0IGFzICJubyBvYmplY3Rpb24iLi4uCgpXZWkuCgo+IC0tLQo+ICBDT05UUklC
VVRJTkcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORwo+IGluZGV4
IDQ3ZjUzZTlhNDkuLjZlYzE0NmJhZjAgMTAwNjQ0Cj4gLS0tIGEvQ09OVFJJQlVUSU5HCj4gKysr
IGIvQ09OVFJJQlVUSU5HCj4gQEAgLTEzLDcgKzEzLDcgQEAgTW9zdCBvZiB0aGUgWGVuIFByb2pl
Y3QgY29kZSBpcyBsaWNlbnNlZCB1bmRlciBHUEx2MiwgYnV0IGEgbnVtYmVyIG9mCj4gIGRpcmVj
dG9yaWVzIGFyZSBwcmltYXJpbHkgbGljZW5zZWQgdW5kZXIgZGlmZmVyZW50IGxpY2Vuc2VzLgo+
Cj4gIE1vc3Qgbm90YWJseToKPiAtIC0gdG9vbHMvYmxrdGFwMiAgICAgIDogQlNELU1vZGlmaWVk
Cj4gKyAtIHRvb2xzL2xpYnMgICAgICAgICA6IExHUEwgdjIuMQo+ICAgLSB0b29scy9saWJ4YyAg
ICAgICAgOiBMR1BMIHYyLjEKPiAgIC0gdG9vbHMvbGlieGwgICAgICAgIDogTEdQTCB2Mi4xCj4g
ICAtIHRvb2xzL3hsICAgICAgICAgICA6IExHUEwgdjIuMQo+IC0tCj4gMi4yMC4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
