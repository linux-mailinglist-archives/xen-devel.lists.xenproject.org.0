Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2290659CD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 17:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlaVZ-0000XW-NT; Thu, 11 Jul 2019 14:57:17 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.41])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <cardoe@cardoe.com>) id 1hlaVY-0000XR-5h
 for xen-devel@lists.xensource.com; Thu, 11 Jul 2019 14:57:16 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id C2/12-10039-B4E472D5;
 Thu, 11 Jul 2019 14:57:15 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-21.tower-264.messagelabs.com: domain of cardoe.com designates 
 209.85.166.67 as permitted sender) smtp.mailfrom=cardoe.com; dkim=pass 
 (good signature) header.i=@cardoe.com header.s=google; dmarc=none (no 
 record) header.from=cardoe.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRWlGSWpSXmKPExsVyMXSZs66Xn3q
 swe4j6hb3prxnd2D02N63iz2AMYo1My8pvyKBNeNn82vWghMiFRNX/WRuYHwv0MXIxSEkMI1R
 4tjFXmYQh0XgNbPE9J4tjCCOhMAdVompK66xdTFyAjlpEkfmLGKGsQ8tncgEYddIzJt2G6xGS
 EBB4veEQ0wQY/8wSvycshasQVjAUeLG9o9gU0UE1jFKfJi8DKyDWeAJk8SJ1cUQHeeZJG5s3M
 kKkmAT0JB48msGWBGvgK3E9MVNYHEWAVWJ6yvvAq3g4BAVSJXYOCECokRQ4uTMJywgNqeAv8T
 vgxvZIeabSczb/JAZwpaX2P52DpQtLnHryXymCYyis5C0z0LSMgtJyywkLQsYWVYxmicVZaZn
 lOQmZuboGhoY6BoaGukaWhrrWhjrJVbpJuqlluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgRGV
 UrBweAdjPdmvdE7xCjJwaQkyjuZTz1WiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvTl+gnGBRan
 pqRVpmDjDCYdISHDxKIryTfIDSvMUFibnFmekQqVOMlhxLNs5bxMxx+TqI7Pi1aBGzEEtefl6
 qlDivLsg8AZCGjNI8uHGwJHSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvO5C1PJl5JXBb
 XwEdxAR0kKqfGshBJYkIKakGJhe3rhk/r/3b0q/dNZ+dkYE7SvXXq8JzDy6oec5byzNl6ffrE
 peK1bl4ZQ8/Z5gezPu7y8O05c7kk9sfTO1x3alu0qvDcrx6k/OltDViD8XsrgfeFvuRYi73cI
 LiI+O5uizmLN3KsesFZ3Ey6s65wWAQuHi24HEjyTeSepVFUyJu8D1UuvZ2C5PF0ZmHLMpu3OI
 59z/lypxPjuvzjNan3zatjD40mZv9jIvGxmKrRerz9IsOcjfkalYFNnSy+nVaSjr7cOS0avfK
 eDAJpKTPnDHrlMsyq03rHn5xS4upsV3dUfL5JPvOorssPlfSXovUlae+m8sSxJf7/0AyS88EY
 cNAcZbPfLI83K/VIj4psRRnJBpqMRcVJwIA7yTUUL0DAAA=
X-Env-Sender: cardoe@cardoe.com
X-Msg-Ref: server-21.tower-264.messagelabs.com!1562857033!1140181!1
X-Originating-IP: [209.85.166.67]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24063 invoked from network); 11 Jul 2019 14:57:14 -0000
Received: from mail-io1-f67.google.com (HELO mail-io1-f67.google.com)
 (209.85.166.67)
 by server-21.tower-264.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 11 Jul 2019 14:57:14 -0000
Received: by mail-io1-f67.google.com with SMTP id o9so13237192iom.3
 for <xen-devel@lists.xensource.com>; Thu, 11 Jul 2019 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1zhPoe9BDGfqD0XsYLaBIbaSO5hkUhJ4cDhu4YqWK68=;
 b=c9lCC7UQn13YolHo2HRdqFe+5xEQDL0Ge2DOUuCzHY33Av3233jPzWg003Gon0dgWQ
 LYOX8aQk8Rm26taw6xq/iJ/Dga9afa9B7ixsp9sm48Ng17Zdgs5VSdHOCbTc+wwBIm3u
 r53zBJM57cRUGRSQh1qZTMh8kaLobv77IXpXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1zhPoe9BDGfqD0XsYLaBIbaSO5hkUhJ4cDhu4YqWK68=;
 b=KcYniU9IflOrgRqVsbSQijXwSpLydKrqHouy4kap9Zxj55Hpju4V4dnjr+F5B87W1U
 2XfrJEtDMYOXWBaBqustg60z7683gdfczasYNezHOLglOA1FEDYEp8LhBZAdSBzJaxp6
 d9zMcw83SFG5qS+lXuEFCsk8mpVevxuyrDA2HWRZgzgnIa7CqA7FdhgcD7CXC7VHB1Sb
 uYEI9uLsRifqm0sg0qFNdp7bvLsPMCn4yRvUROLs2wJiCxC6BED81RjUObyNHjd/H2az
 rRNZ8wVR9DDnVpBHeGQ8BN1FlY37xdQ8LsfXsZXvXY0FUGojO13khcIJvUKukal0FAMn
 8tsA==
X-Gm-Message-State: APjAAAV8ZLR4038k/YDi02ixb4vSb6rc7XsQr97wI8mlHb01CilCm6/8
 /jPuUMsmZnTlHUcVJBEXbmY=
X-Google-Smtp-Source: APXvYqzCYzhYT5zt0jS6ixPXFGj2LgC/fY77jLy4shUOcc8DZdmvdV8IdVmv2oElKfq9DbRuJssRLQ==
X-Received: by 2002:a02:8814:: with SMTP id r20mr5243324jai.115.1562857033278; 
 Thu, 11 Jul 2019 07:57:13 -0700 (PDT)
Received: from doug-macbook.local ([172.98.100.66])
 by smtp.gmail.com with ESMTPSA id j14sm5830161ioa.78.2019.07.11.07.57.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 07:57:12 -0700 (PDT)
To: Adam Williamson <adamwill@fedoraproject.org>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Lars Kurth <lars.kurth.xen@gmail.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <e0145933-8563-8a45-40a6-7f192c7b9d80@cardoe.com>
Date: Thu, 11 Jul 2019 09:57:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDcvOC8xOSAxMToxMSBBTSwgQWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFR1ZSwgMjAx
OS0wNS0yMSBhdCAxMToxNCAtMDcwMCwgQWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+Pj4+Pj4gIlRo
ZSByZWxlYXNlIG11c3QgYm9vdCBzdWNjZXNzZnVsbHkgYXMgWGVuIERvbVUgd2l0aCByZWxlYXNl
cyBwcm92aWRpbmcKPj4+Pj4+IGEgZnVuY3Rpb25hbCwgc3VwcG9ydGVkIFhlbiBEb20wIGFuZCB3
aWRlbHkgdXNlZCBjbG91ZCBwcm92aWRlcnMKPj4+Pj4+IHV0aWxpemluZyBYZW4uIgo+Pj4+Pj4K
Pj4+Pj4+IGFuZCBjaGFuZ2UgdGhlICdtaWxlc3RvbmUnIGZvciB0aGUgdGVzdCBjYXNlIC0KPj4+
Pj4+IGh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9RQTpUZXN0Y2FzZV9Cb290X01ldGhv
ZHNfWGVuX1BhcmFfVmlydCAtCj4+Pj4+PiBmcm9tIEZpbmFsIHRvIE9wdGlvbmFsLgo+Pj4+Pj4K
Pj4+Pj4+IFRob3VnaHRzPyBDb21tZW50cz8gVGhhbmtzIQo+Pj4+PiBJIHdvdWxkIHByZWZlciBm
b3IgaXQgdG8gcmVtYWluIGFzIGl0IGlzLgo+Pj4+IFRoaXMgaXMgb25seSBwcmFjdGljYWwgaWYg
aXQncyBnb2luZyB0byBiZSB0ZXN0ZWQsIGFuZCB0ZXN0ZWQgcmVndWxhcmx5Cj4+Pj4gLSBub3Qg
Km9ubHkqIG9uIHRoZSBmaW5hbCByZWxlYXNlIGNhbmRpZGF0ZSwgcmlnaHQgYmVmb3JlIHdlIHNp
Z24gb2ZmCj4+Pj4gb24gdGhlIHJlbGVhc2UuIEl0IG5lZWRzIHRvIGJlIHRlc3RlZCByZWd1bGFy
bHkgdGhyb3VnaG91dCB0aGUgcmVsZWFzZQo+Pj4+IGN5Y2xlLCBvbiB0aGUgY29tcG9zZXMgdGhh
dCBhcmUgIm5vbWluYXRlZCBmb3IgdGVzdGluZyIuCj4+PiBXb3VsZCB0aGUgcHJvcG9zYWwgYWJv
dmUgd29yayBmb3IgeW91PyBJIHRoaW5rIGl0IHNhdGlzZmllcyB3aGF0IHlvdSBhcmUKPj4+IGxv
b2tpbmcgZm9yLiBXZSB3b3VsZCBhbHNvIGhhdmUgc29tZW9uZSB3aG8gbW9uaXRvcnMgdGhlc2Ug
dGVzdCByZXN1bHRzCj4+PiBwcm8tYWN0aXZlbHkuCj4+IEluIHRoZW9yeSwgeWVhaCwgYnV0IGdp
dmVuIHRoZSBoaXN0b3J5IGhlcmUgSSdtIHNvbWV3aGF0IHNjZXB0aWNhbC4gSSdkCj4+IGFsc28g
c2F5IHdlIHN0aWxsIGhhdmVuJ3QgcmVhbGx5IGdvdCBhIGNvbnZpbmNpbmcgY2FzZSBmb3Igd2h5
IHdlCj4+IHNob3VsZCBjb250aW51ZSB0byBibG9jayB0aGUgcmVsZWFzZSAoYXQgbGVhc3QgaW4g
dGhlb3J5KSBvbiBGZWRvcmEKPj4gd29ya2luZyBpbiBYZW4gd2hlbiB3ZSBkb24ndCBibG9jayBv
biBhbnkgb3RoZXIgdmlydCBzdGFjayBhcGFydCBmcm9tCj4+IG91ciAnb2ZmaWNpYWwnIG9uZSwg
YW5kIHdlIGRvbid0IGJsb2NrIG9uIGFsbCBzb3J0cyBvZiBvdGhlciBzdHVmZiB3ZSdkCj4+ICJs
aWtlIHRvIGhhdmUgd29ya2luZyIgZWl0aGVyLiBSZWdhcmRsZXNzIG9mIHRoZSB0ZXN0aW5nIGlz
c3VlcywgSSdkCj4+IGxpa2UgdG8gc2VlIHRoYXQgdG9vIGlmIHdlJ3JlIGdvaW5nIHRvIGtlZXAg
YmxvY2tpbmcgb24gWGVuLi4uCj4gU28sIHRoaXMgZGllZCBoZXJlLiBBcyB0aGluZ3Mgc3RhbmQ6
IEkgcHJvcG9zZWQgcmVtb3ZpbmcgdGhlIFhlbgo+IGNyaXRlcmlvbiwgTGFycyBvcHBvc2VkLCB3
ZSBkaXNjdXNzZWQgdGhlIHRlc3Rpbmcgc2l0dWF0aW9uIGEgYml0LCBhbmQKPiBJIHNhaWQgb3Zl
cmFsbCBJJ20gc3RpbGwgaW5jbGluZWQgdG8gcmVtb3ZlIHRoZSBjcml0ZXJpb24gYmVjYXVzZQo+
IHRoZXJlJ3Mgbm8gY2xlYXIganVzdGlmaWNhdGlvbiBmb3IgaXQgZm9yIEZlZG9yYSBhbnkgbW9y
ZS4gWGVuIHdvcmtpbmcKPiAob3IgcmF0aGVyLCBGZWRvcmEgd29ya2luZyBvbiBYZW4pIGlzIGp1
c3Qgbm90IGEga2V5IHJlcXVpcmVtZW50IGZvcgo+IEZlZG9yYSBhdCBwcmVzZW50LCBBRkFJQ1Mu
Cj4KPiBJdCdzIHdvcnRoIG5vdGluZyB0aGF0IGF0IGxlYXN0IHBhcnQgb2YgdGhlIGp1c3RpZmlj
YXRpb24gZm9yIHRoZQo+IGNyaXRlcmlvbiBpbiB0aGUgZmlyc3QgcGxhY2Ugd2FzIHRoYXQgQW1h
em9uIHdhcyB1c2luZyBYZW4gZm9yIEVDMiwgYnV0Cj4gdGhhdCBpcyBubyBsb25nZXIgdGhlIGNh
c2UsIG1vc3QgaWYgbm90IGFsbCBFQzIgaW5zdGFuY2UgdHlwZXMgbm8KPiBsb25nZXIgdXNlIFhl
bi4gQW5vdGhlciBjb25zaWRlcmF0aW9uIGlzIHRoYXQgdGhlcmUgd2FzIGEgdGltZSB3aGVuIEtW
TQo+IHdhcyBzdGlsbCBwcmV0dHkgbmV3IHN0dWZmIGFuZCBWaXJ0dWFsQm94IHdhcyBub3QgYXMg
cG9wdWxhciBhcyBpdCBpcwo+IG5vdywgYW5kIFhlbiB3YXMgc3RpbGwgd2lkZWx5IHVzZWQgZm9y
IGdlbmVyYWwgaG9iYnlpc3QgdmlydHVhbGl6YXRpb24KPiBwdXJwb3NlczsgSSBkb24ndCBiZWxp
ZXZlIHRoYXQncyByZWFsbHkgdGhlIGNhc2UgYW55IG1vcmUuCgoKU28gSSdsbCBqdXN0IHBvaW50
IG91dCB0aGlzIGlzIGZhbHNlLiBBbWF6b24gdmVyeSBtdWNoIHVzZXMgWGVuIHN0aWxsIAphbmQg
aXMgaW52ZXN0aW5nIGluIFhlbiBzdGlsbC4gSW4gZmFjdCBJJ20gd3JpdGluZyB0aGlzIGVtYWls
IGZyb20gdGhlIApYZW5TdW1taXQgd2hlcmUgQW1hem9uIGlzIGN1cnJlbnRseSBkaXNjdXNzaW5n
IHRoZWlyIGZ1dHVyZSBkZXZlbG9wbWVudCAKZWZmb3J0cyBmb3IgdGhlIFhlbiBQcm9qZWN0LgoK
LS0KCkRvdWcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
