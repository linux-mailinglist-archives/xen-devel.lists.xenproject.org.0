Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF137EFA8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 10:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTGj-0004v7-Cy; Fri, 02 Aug 2019 08:50:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YkxM=V6=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1htTGh-0004v2-9A
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 08:50:31 +0000
X-Inumbo-ID: 94598517-b502-11e9-8980-bc764e045a96
Received: from mail-lf1-f41.google.com (unknown [209.85.167.41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94598517-b502-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 08:50:30 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b29so45143098lfq.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 01:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV1BMll1rO57YkgC5BU6EmsGD+SDDU93bUa1kSkUa/g=;
 b=aaIAU1id9+mepI4BdZOsel2G0taC1dyNK4258VbDCZnD0orK9yQDypBEErQ1D3qzng
 8wwoobyWBGO0YYgARnsr8hx7ZGlzjGF+d5cgU8SNZbuRzeiiuep3oWK9nhF0q6xv1XBJ
 aNfGLQbGVKAvmNLWoE0pCP5e7jnAIRgPrUsQ46q24ZspEogZQ0OBD/S3AMJyNbkk4BzE
 Aai/QNjhen1AI2EI0MLAxIih5da0yXOlkwHKhy+n4MheOOOIC90Au4lvXgJyxqSuJ6FI
 PUt4ERl1QASllqifh36569CrdsDw9jWjmpUF29iBfzojH/RAbZW8JawniZqRUVS6wEAg
 hLrg==
X-Gm-Message-State: APjAAAXnEqEMSla9w+RvoLYB9o9RnlDtE4AezLg6NpTEzg7z0aizY+Vk
 0Y93tv6mZwZZBhV/WOznQNxdn62GDFI=
X-Google-Smtp-Source: APXvYqw4CP+GaZOm2t9m6vjjgFmlY1gfJQN3U8UTL64n5FeFvIeZyuA9rJfnGanEv1KSi+p9vEaTww==
X-Received: by 2002:ac2:4644:: with SMTP id s4mr27315644lfo.158.1564735828813; 
 Fri, 02 Aug 2019 01:50:28 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id u18sm12590948lfe.65.2019.08.02.01.50.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 01:50:28 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id y17so47538166ljk.10
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 01:50:27 -0700 (PDT)
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr30921596lja.238.1564735827445; 
 Fri, 02 Aug 2019 01:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190801160048.11031-1-jgross@suse.com>
 <ca66f2cf-1258-9125-9f7d-3968c9a61cd2@citrix.com>
In-Reply-To: <ca66f2cf-1258-9125-9f7d-3968c9a61cd2@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Fri, 2 Aug 2019 09:50:11 +0100
X-Gmail-Original-Message-ID: <CAK9nU=qzBczsD59v9EKRJxCjrd+fnU-x4+QxRP3CFfYD-fFmAA@mail.gmail.com>
Message-ID: <CAK9nU=qzBczsD59v9EKRJxCjrd+fnU-x4+QxRP3CFfYD-fFmAA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: Juergen Gross <jgross@suse.com>, luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, puwen@hygon.cn,
 marmarek@invisiblethingslab.com, Dario Faggioli <dfaggioli@suse.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr_Babchuk@epam.com,
 chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxIEF1ZyAyMDE5IGF0IDE3OjQ4LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDAxLzA4LzIwMTkgMTc6MDAsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4gPiA9PSBIeXBlcnZpc29yID09Cj4gPgo+ID4gKiAgSW1wcm92ZW1lbnRzIHRv
IGRvbWFpbiBjcmVhdGlvbiAodjIpCj4gPiAgIC0gIEFuZHJldyBDb29wZXIKPgo+IFRoaXMgc2hv
dWxkIHByb2JhYmx5IGJlIGRyb3BwZWQuICBJdHMgbm90IGdvaW5nIHRvIGdldCBhIGxvb2sgaW4g
aW4gdGhlCj4gZm9yc2VlYWJsZSBmdXR1cmUsIGFuZCBpcyBpbiB0aGUgcG9zaXRpb24gb2YgZ2Fp
bmluZyBpbmNyZW1lbnRhbAo+IGltcHJvdmVtZW50cyBhbnl3YXkuCj4KPiA+ICogIFN3aXRjaCB0
byB1c2UgZG9taGVhcCBwYWdlIGZvciBwYWdlIHRhYmxlIChSRkMgdjEpCj4gPiAgIC0gIFdlaSBM
aXUKPgo+IEkgZXhwZWN0IHRoaXMgaXMgdW5saWtlbHkgdG8gZ2V0IGZ1cnRoZXIgYXR0ZW50aW9u
Pwo+CgpOb3QgaW4gdGhlIG5lYXIgZnV0dXJlLiBTb3JyeS4KCldlaS4KCj4gfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
