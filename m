Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A564A88FCC
	for <lists+xen-devel@lfdr.de>; Sun, 11 Aug 2019 07:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwg5P-0003gX-5w; Sun, 11 Aug 2019 05:08:07 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.153])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <dridi.boukelmoune@gmail.com>) id 1hwVqx-0001lq-21
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 18:12:31 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-central-1.aws.symcld.net id A4/5D-29283-C090F4D5;
 Sat, 10 Aug 2019 18:12:28 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-25.tower-244.messagelabs.com: domain of gmail.com designates 
 209.85.208.52 as permitted sender) smtp.mailfrom=gmail.com; dkim=pass 
 (good signature) header.i=@gmail.com header.s=20161025; dmarc=pass 
 (p=none sp=quarantine adkim=r aspf=r) header.from=gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleJIrShJLcpLzFFi42K5GHrBRJeb0z/
 W4MoRK4t7U96zOzB6bO/bxR7AGMWamZeUX5HAmnGr6xxbQb9fxb+ejawNjOuduhi5OIQEpjNK
 /Oh4wgzisAg0sEq8+dUM5kgIzGGVeNz9k7GLkRPIKZNY/2kZUIIDyC6SmL+MAyZ8eFYjO4jNK
 yAocXLmExaIqacYJTbM3ADWyyngL9F/4i8TiM0mYCpx/U0bM4jNIqAqMXd3FwtEc4DE7f6nYL
 awgI3Emst/wWpEBHwlHh47BjaUWWAjo8SOE0fBipgFfCTmvf3PMoFRYBaS5bOQpCBsTYnW7b/
 ZIWwNiQV39jFC2NoSyxa+Zl7AyLqK0SKpKDM9oyQ3MTNH19DAQNfQ0FjXTNfESC+xSjdJL7VU
 Nzk1r6QoESipl1herFdcmZuck6KXl1qyiREY9CmFbFo7GBfOeqN3iFGSg0lJlHf7X99YIb6k/
 JTKjMTijPii0pzU4kOMMhwcShK829n9Y4UEi1LTUyvSMnOAEQiTluDgURLhnQGS5i0uSMwtzk
 yHSJ1i9OZYsnHeImaOs/9AZMevRUCy+cRiIPlx1RIg+R1ECrHk5eelSonz3gEZIQAyIqM0D24
 BLJFcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMe4YNaApPZl4J3B2vgE5kAjqR+4kvyIkl
 iQgpqQYmhprNXIuedE3tjXmRkS6gwlIs83OH4hn9mQYMRjYHf36orZpScEB4Pnt2wE3z519mX
 3OetT11kWr0Z1bWFesXJK4w+WwcqVPjbWgcWrvsQKBS071z8nMWfKmbon7c4f+r2jbPo4dci6
 7vOxlqefXvhKWxu0Icvqu9OpC18PHd3KLA8z8/5s854qSzSHfOGpHZAbXe3HEyqYaLv99u3nV
 pe/7tJtuaRRE301Y6Cz+ISszfzaPVnRBwve6+oq36Ts8HHuHTNnVXOApnbJlQ5XUk6FVqh7fi
 U4bZKYw3FlybO2+qUIyCPuO/nIREy8Rpmn+ljVQ8Z007H/Qua9Ebbv9i/eXi7pPmFS1bXDnt0
 LIZSizFGYmGWsxFxYkAF33Sip8DAAA=
X-Env-Sender: dridi.boukelmoune@gmail.com
X-Msg-Ref: server-25.tower-244.messagelabs.com!1565460747!195687!1
X-Originating-IP: [209.85.208.52]
X-SpamReason: No, hits=0.1 required=7.0 tests=newsletters: ,HTML_30_40,
 HTML_MESSAGE
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25871 invoked from network); 10 Aug 2019 18:12:27 -0000
Received: from mail-ed1-f52.google.com (HELO mail-ed1-f52.google.com)
 (209.85.208.52)
 by server-25.tower-244.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 10 Aug 2019 18:12:27 -0000
Received: by mail-ed1-f52.google.com with SMTP id k21so99331304edq.3
 for <xen-devel@lists.xensource.com>; Sat, 10 Aug 2019 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQWki+9xOgYG9xOT63AzYlulD72bLoVUOF0ZZZFzl2I=;
 b=hLYj10g6fwMlHT//XxgXjM5Uy9w2NjDAnXVljhgREh7VTPN5vMZGlILfpwGyU4ZeLc
 UD+L/YVyY2YX+Rii+ByGAgUbI9+G3RnpHPSNoFxe0YCbQwVogbQvEpjgNpdBRPs5THr0
 +fJqOa6sy/n/WzHW1S2KFpjrlgEpzEdJEt37r5E/WYOHWSSJLXzIut1y9Urtw19NZK3P
 Yxw6dlPJd3Hvpmz0c9KkNVDLobOruVGQOvccNkT9SpTa56sj/R3VCA7k27GRP1JsOcSk
 V7Vy9u29H3vf8khz6EZHduHPmZtIqMjfxL9BLMBpoAMLoRWlt9YPsw8F5ki6HESW9Y+E
 lHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQWki+9xOgYG9xOT63AzYlulD72bLoVUOF0ZZZFzl2I=;
 b=JH4S1aFpXFRQio+5zAvepbjOb6znFB3UXm105HIL/STchmtBJHt3avVdbIou9tNZd4
 HGE6fWpXkI68tnhybRgz+eKhpeN2qnmuYgyXjf25VP/HafIsfSIm0J/Ebeyl+jk7goYf
 fYTRMXJv2ws99RJbYpkCleydk21/3W0rFqrL8L3QV6CUl+AcKKekS9J0T8vq+/4TKxXp
 2Ur6mrY0he8lYKcTFv+qULF8tmMXF+q5EiQ1ubGzYtXMquV1HFh5rMkCwlJxGUNpEbEZ
 KbbezTOvM9yrT+RZaeNSahbtTOyJ2aRukN0s5gq4RVfhC79ZFfnleQsv/lxUE/aEiF4Q
 kIHA==
X-Gm-Message-State: APjAAAVhakWYMDs0b8ImwhRBKwVRL2ZIedVAsHZdLiL1mT7EogRVg0xX
 uyl1MVDAy6Euq0lWKlKBz+h1qFw8YgK4uLx0yXc=
X-Google-Smtp-Source: APXvYqz/3R4/Y4vDlBYFZJwL00XwIRFeWlaoJLajqi7MpeUdox9p8PebYXvqaJI5Fm2bf2MD7k/y2YsDOmo6ivhDYkA=
X-Received: by 2002:a50:b3d0:: with SMTP id t16mr28573526edd.158.1565460747456; 
 Sat, 10 Aug 2019 11:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
 <20190810140135.GA22251@udb72c6a76a7559.ant.amazon.com>
 <649ecd21246e958320bd217fe846d0424b8c2801.camel@fedoraproject.org>
In-Reply-To: <649ecd21246e958320bd217fe846d0424b8c2801.camel@fedoraproject.org>
From: Dridi Boukelmoune <dridi.boukelmoune@gmail.com>
Date: Sat, 10 Aug 2019 20:12:15 +0200
Message-ID: <CAJYncsj+DkiQFPS_mXry9BCqVKtBNQrV7xk7txihZceZ7mdP2A@mail.gmail.com>
To: Development discussions related to Fedora <devel@lists.fedoraproject.org>
X-Mailman-Approved-At: Sun, 11 Aug 2019 05:08:05 +0000
Subject: Re: [Xen-devel] Xen / EC2 release criteria proposal
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
Cc: coreos@lists.fedoraproject.org, Matt Wilson <msw@amzn.com>,
 test@lists.fedoraproject.org, xen-devel@lists.xensource.com,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>
Content-Type: multipart/mixed; boundary="===============9011922012728478830=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9011922012728478830==
Content-Type: multipart/alternative; boundary="000000000000c31828058fc73b6d"

--000000000000c31828058fc73b6d
Content-Type: text/plain; charset="UTF-8"

Sorry for the top posting, "smart" phone...

What about Qubes OS? Isn't their dom0 using xen, based on Fedora?

Do they use Xen as packaged by Fedora? If not, couldn't they contribute
whatever they do that Fedora doesn't here?

It might be worth getting in touch with them. They look like a significant
Xen user, on Fedora.

Dridi

On Sat, Aug 10, 2019, 17:33 Adam Williamson <adamwill@fedoraproject.org>
wrote:

> On Sat, 2019-08-10 at 17:01 +0300, Matt Wilson wrote:
> > On Fri, Aug 09, 2019 at 05:56:11PM -0700, Adam Williamson wrote:
> > [...]
> > > So it seems like this would also be a good opportunity to revisit and
> > > nail down more specifically exactly what our cloud requirements are.
> > > bcotton suggested  that we require two sample instance types to be
> > > tested, c5.large (KVM) and t3.large (Xen). (I've also mailed Thomas
> > > Cameron, ex-of Red Hat, now of Amazon, for his opinion, as it seemed
> > > like it might be worthwhile - he's promised to get back to me).
> > >
> > > So, for now, let me propose this as a trial balloon: we rewrite the
> > > above criterion to say:
> > >
> > > "Release-blocking cloud disk images must be published to Amazon EC2 as
> > > AMIs, and these must boot successfully and meet other relevant release
> > > criteria on c5.large and t3.large instance types."
> >
> > Hi Adam,
> >
> > Thanks for bringing this up. It's good to revisit things from time to
> > time as the world changes.
>
> Thanks for the feedback, Matt!
>
> > Of the two instances that you propose, neither runs on Xen. The T2
> > instances run on Xen, but T3 uses the KVM-based Nitro hypervisor.
>
> That'll teach me to trust Ben...;)
>
> > To ensure that a Linux based AMI functions across all of the devices
> > and operating modes of EC2, you need to cover:
> >
> > x86 platforms
> > -------------
> > * Xen domU with only PV interfaces (e.g., M3 instances)
> > * Xen domU with Intel 82599 virtual functions for Enhanced Networking
> >   (e.g., C3 instances running in a VPC)
> > * Xen domU with Enhanced Networking Adapter (e.g., R4 instances)
> > * Xen domU with NVMe local instance storage (e.g., virtualized I3
> >   instances)
> > * Xen domU with more than 32 vCPUs (e.g., c4.8xlarge)
> > * Xen domU with four NUMA nodes (e.g., x1.32xlarge)
> > * Xen domU with maximum RAM available in EC2 (x1e.32xlarge)
> > * KVM guest with consistent performance (e.g., c5.large)
> > * KVM guest with burstable performance (e.g., t3.large)
> > * KVM guest with local NVMe storage (e.g., c5d.large)
> > * KVM guest with 100 Gbps networking and Elastic Fabric Adapter
> >   (c5n.18xlarge)
> > * KVM guest on AMD processors (e.g., m5a.large)
> > * KVM guest on AMD processors with maximum NUMA nodes (e.g.,
> >   m5a.24xlarge)
> > * Bare metal Broadwell (i3.metal)
> > * Bare metal Skylake (m5.metal)
> > * Bare metal Cascade Lake (c5.metal)
> >
> > Arm platforms
> > -------------
> > * KVM guest on Arm with 1 CPU cluster (a1.xlarge)
> > * KVM guest on Arm with 2 CPU clusters (a1.2xlarge)
> > * KVM guest on Arm with 4 CPU clusters (a1.4xlarge)
> >
> > Not all of these are going to cause an image to fail to boot up to the
> > point where a customer can SSH in. But a good number of these have
> > caused early boot problems in the past (e.g., >32 vCPUs on PVHVM Xen).
>
> Thanks a lot for the list, it's very helpful. It's also very long,
> though. :P Still, we can certainly use it as a base.
> --
> Adam Williamson
> Fedora QA Community Monkey
> IRC: adamw | Twitter: AdamW_Fedora | identi.ca: adamwfedora
> http://www.happyassassin.net
> _______________________________________________
> devel mailing list -- devel@lists.fedoraproject.org
> To unsubscribe send an email to devel-leave@lists.fedoraproject.org
> Fedora Code of Conduct:
> https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> List Archives:
> https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org
>

--000000000000c31828058fc73b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sorry for the top posting, &quot;smart&quot; phone...<div=
 dir=3D"auto"><br></div><div dir=3D"auto">What about Qubes OS? Isn&#39;t th=
eir dom0 using xen, based on Fedora?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Do they use Xen as packaged by Fedora? If not, couldn&#39;t th=
ey contribute whatever they do that Fedora doesn&#39;t here?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It might be worth getting in touch wi=
th them. They look like a significant Xen user, on Fedora.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Dridi</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 10, 2019, 17:33 A=
dam Williamson &lt;<a href=3D"mailto:adamwill@fedoraproject.org">adamwill@f=
edoraproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Sat, 2019-08-10 at 17:01 +0300, Matt Wilson wrote:<br>
&gt; On Fri, Aug 09, 2019 at 05:56:11PM -0700, Adam Williamson wrote:<br>
&gt; [...]<br>
&gt; &gt; So it seems like this would also be a good opportunity to revisit=
 and<br>
&gt; &gt; nail down more specifically exactly what our cloud requirements a=
re.<br>
&gt; &gt; bcotton suggested=C2=A0 that we require two sample instance types=
 to be<br>
&gt; &gt; tested, c5.large (KVM) and t3.large (Xen). (I&#39;ve also mailed =
Thomas<br>
&gt; &gt; Cameron, ex-of Red Hat, now of Amazon, for his opinion, as it see=
med<br>
&gt; &gt; like it might be worthwhile - he&#39;s promised to get back to me=
).<br>
&gt; &gt; <br>
&gt; &gt; So, for now, let me propose this as a trial balloon: we rewrite t=
he<br>
&gt; &gt; above criterion to say:<br>
&gt; &gt; <br>
&gt; &gt; &quot;Release-blocking cloud disk images must be published to Ama=
zon EC2 as<br>
&gt; &gt; AMIs, and these must boot successfully and meet other relevant re=
lease<br>
&gt; &gt; criteria on c5.large and t3.large instance types.&quot;<br>
&gt; <br>
&gt; Hi Adam,<br>
&gt; <br>
&gt; Thanks for bringing this up. It&#39;s good to revisit things from time=
 to<br>
&gt; time as the world changes.<br>
<br>
Thanks for the feedback, Matt!<br>
<br>
&gt; Of the two instances that you propose, neither runs on Xen. The T2<br>
&gt; instances run on Xen, but T3 uses the KVM-based Nitro hypervisor.<br>
<br>
That&#39;ll teach me to trust Ben...;)<br>
<br>
&gt; To ensure that a Linux based AMI functions across all of the devices<b=
r>
&gt; and operating modes of EC2, you need to cover:<br>
&gt; <br>
&gt; x86 platforms<br>
&gt; -------------<br>
&gt; * Xen domU with only PV interfaces (e.g., M3 instances)<br>
&gt; * Xen domU with Intel 82599 virtual functions for Enhanced Networking<=
br>
&gt;=C2=A0 =C2=A0(e.g., C3 instances running in a VPC)<br>
&gt; * Xen domU with Enhanced Networking Adapter (e.g., R4 instances)<br>
&gt; * Xen domU with NVMe local instance storage (e.g., virtualized I3<br>
&gt;=C2=A0 =C2=A0instances)<br>
&gt; * Xen domU with more than 32 vCPUs (e.g., c4.8xlarge)<br>
&gt; * Xen domU with four NUMA nodes (e.g., x1.32xlarge)<br>
&gt; * Xen domU with maximum RAM available in EC2 (x1e.32xlarge)<br>
&gt; * KVM guest with consistent performance (e.g., c5.large)<br>
&gt; * KVM guest with burstable performance (e.g., t3.large)<br>
&gt; * KVM guest with local NVMe storage (e.g., c5d.large)<br>
&gt; * KVM guest with 100 Gbps networking and Elastic Fabric Adapter<br>
&gt;=C2=A0 =C2=A0(c5n.18xlarge)<br>
&gt; * KVM guest on AMD processors (e.g., m5a.large)<br>
&gt; * KVM guest on AMD processors with maximum NUMA nodes (e.g.,<br>
&gt;=C2=A0 =C2=A0m5a.24xlarge)<br>
&gt; * Bare metal Broadwell (i3.metal)<br>
&gt; * Bare metal Skylake (m5.metal)<br>
&gt; * Bare metal Cascade Lake (c5.metal)<br>
&gt; <br>
&gt; Arm platforms<br>
&gt; -------------<br>
&gt; * KVM guest on Arm with 1 CPU cluster (a1.xlarge)<br>
&gt; * KVM guest on Arm with 2 CPU clusters (a1.2xlarge)<br>
&gt; * KVM guest on Arm with 4 CPU clusters (a1.4xlarge)<br>
&gt; <br>
&gt; Not all of these are going to cause an image to fail to boot up to the=
<br>
&gt; point where a customer can SSH in. But a good number of these have<br>
&gt; caused early boot problems in the past (e.g., &gt;32 vCPUs on PVHVM Xe=
n).<br>
<br>
Thanks a lot for the list, it&#39;s very helpful. It&#39;s also very long,<=
br>
though. :P Still, we can certainly use it as a base.<br>
-- <br>
Adam Williamson<br>
Fedora QA Community Monkey<br>
IRC: adamw | Twitter: AdamW_Fedora | <a href=3D"http://identi.ca" rel=3D"no=
referrer noreferrer" target=3D"_blank">identi.ca</a>: adamwfedora<br>
<a href=3D"http://www.happyassassin.net" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">http://www.happyassassin.net</a><br>
_______________________________________________<br>
devel mailing list -- <a href=3D"mailto:devel@lists.fedoraproject.org" targ=
et=3D"_blank" rel=3D"noreferrer">devel@lists.fedoraproject.org</a><br>
To unsubscribe send an email to <a href=3D"mailto:devel-leave@lists.fedorap=
roject.org" target=3D"_blank" rel=3D"noreferrer">devel-leave@lists.fedorapr=
oject.org</a><br>
Fedora Code of Conduct: <a href=3D"https://docs.fedoraproject.org/en-US/pro=
ject/code-of-conduct/" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://docs.fedoraproject.org/en-US/project/code-of-conduct/</a><br>
List Guidelines: <a href=3D"https://fedoraproject.org/wiki/Mailing_list_gui=
delines" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fedoraproj=
ect.org/wiki/Mailing_list_guidelines</a><br>
List Archives: <a href=3D"https://lists.fedoraproject.org/archives/list/dev=
el@lists.fedoraproject.org" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.or=
g</a><br>
</blockquote></div>

--000000000000c31828058fc73b6d--


--===============9011922012728478830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9011922012728478830==--

