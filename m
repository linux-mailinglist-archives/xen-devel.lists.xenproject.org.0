Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83813AA67C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5t3Y-00051U-6M; Thu, 05 Sep 2019 14:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sH3W=XA=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1i5t3W-00051P-P9
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:48:14 +0000
X-Inumbo-ID: 2ff3cea2-cfec-11e9-a337-bc764e2007e4
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ff3cea2-cfec-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 14:48:13 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h144so5432617iof.7
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2019 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Y9gaSw+rk49b2391H14zvdlIES5uRYPikgiHlbywvUU=;
 b=TXyycZAVjrtmRhGJst4y+1RjAQuDKu0OtQwl18CobsE4nm9OkiKHOWWJc7RiXFYlt9
 wN20BKd+aA38No+BK4j/A5Ki5oOEoxULZ+/FUT/oJN03Xe37HhSAfGtfJzZdVt977lrt
 tZVN87GU8HwiY5EYhbmlPYJd4iUeD8B7dJvUgyxqa+AtpY5zHqqS2u8SXeOvcEyjTkqO
 DOLUGrA4hCJ2jbM5hQfjfxIUeRmVUyLCgjk9dleeCZYxwWlKJ/GHJs/uTVJpymYHMIJ3
 +PkfRcU+1uCS2XFQeLMJ0t2xGdjcRoGpuQDzXBQ1rq+OIoMv2Uz6vMio1pr2MVMW2tPT
 RbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Y9gaSw+rk49b2391H14zvdlIES5uRYPikgiHlbywvUU=;
 b=fm16L9oLGCNkP4ytE9Nc4/pgP2rBEBYBOjVUMm7F4z1bEGNT8XlZHCx1I8onNQ/eh7
 s7llqsH3W9IZhUW+cJ1D3w9c9GOaHkwpKWlRJ8uX9bLY6GhbigDPB2dcoXV9P0+33sgJ
 C/uC6t5/YpWx0CbjR7ER9MHZaSa2uwuDfA+LE3QGbXUs4b10F3MMi6dfMm4lBHWa8ZZ9
 MmH4+8uEzpg1ZeeVtWnGqz3fIkc33OyLkPMc60wZqmAOzR3WaM9pd/eJt0l6Sq2EyNfw
 +1nC8H5KdV25wfqvIUQ1b4ZMzRMhcUBVBArFI3MmNd3lmSIpjkWNokLzo7PCcRb7UOwY
 xycQ==
X-Gm-Message-State: APjAAAWN7yHXmgInNHP7M6BWy0oHlmcTbvJ+26itRu0/a0xN1HnaNzzU
 STfhWr/g87+Scx93+yYM7nU=
X-Google-Smtp-Source: APXvYqz+kBKvWBNxQsXfK+ucTjKwqdRFEy1GtOl5RgI0KGSnm4rqzcdMNtZGnKGdOH+xMj35oiavDA==
X-Received: by 2002:a02:65cd:: with SMTP id u196mr4561290jab.3.1567694893127; 
 Thu, 05 Sep 2019 07:48:13 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id f19sm1581492ion.67.2019.09.05.07.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 07:48:12 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G102)
In-Reply-To: <0E76424D-57EB-4792-BA82-121E69506314@citrix.com>
Date: Thu, 5 Sep 2019 10:48:11 -0400
Message-Id: <1D4888CA-5C9F-4181-BF86-396CBEF4D548@gmail.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
 <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
 <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
 <0E76424D-57EB-4792-BA82-121E69506314@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 BrianWoods <brian.woods@amd.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas KLengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2486337094752104234=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2486337094752104234==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-99E3A59B-8149-4211-BAA8-51AB3FBBD30C
Content-Transfer-Encoding: 7bit


--Apple-Mail-99E3A59B-8149-4211-BAA8-51AB3FBBD30C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Sep 5, 2019, at 04:36, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> =EF=BB=BFOn 05/09/2019, 09:33, "Juergen Gross" <jgross@suse.com> wrote:
>=20
>>    On 05.09.19 10:14, Andrew Cooper wrote:
>>> On 05/09/2019 08:49, Lars Kurth wrote:
>>>> On 05/09/2019, 08:41, "Rich Persaud" <persaur@gmail.com> wrote:
>>>>=20
>>>> On Sep 5, 2019, at 03:19, Jan Beulich <jbeulich@suse.com> wrote:
>>>>=20
>>>> Forgive me asking, but why is this put up as an agenda item here?
>>>> IMO this is the kind of thing where you would send a proposal and
>>>> request feedback by email first, and put it up as an agenda item
>>>> here only if it got stalled there. (Apologies if I've overlooked
>>>> such a stalled thread.)
>>>=20
>>>     If Xen community call topics are limited to escalations of xen-devel=
 threads, then a new thread can be created for this topic. Xen community cal=
ls have also provided real-time, interactive feedback on candidate proposals=
, along with guidance on areas which need documentation before a formal prop=
osal is made to xen-devel.   Such agenda items are typically covered after a=
ll series and priority topics have been addressed.
>>>=20
>>> I don't mind having items such these on the agenda and to be fair have a=
dded similar items onto the agenda in the past.
>>> Clearly, they are forward looking [like an RFC], for which reason I tend=
 to add them to the end of an agenda if there is a busy schedule
>>>=20
>>> Personally, on this specific item, it is not really clear what the quest=
ions are.  In other words: is this about UUIDS/domain ids only, or is there s=
omething else.
>>=20
>> Requiring something to be blocked on xen-devel before we discuss it on
>> the call is monumentally short sighted, and off-putting for contributors.=

>>=20
>> In this case, it is very definitely not the first time this problem has
>> been raised, as it is an XSA shaped elephant in the room.  Its no secret
>> that id wraps cause problems, and while our security policy doesn't
>> comment on the matter, it also doesn't say "warning - stuff *will* break
>> in weird, wonderful, and security-relevant ways when domid's wrap".
>>=20
>> The order of the agenda is important, and I don't think this should be
>> at the top, but even if we only end up with 2 minutes to discuss it,
>> then so be it.  (2 minutes of talking can still be far more valuable
>> than a weeks worth of emailing.)
>>=20
>> What is not acceptable is suggesting that it should be veto'd simply
>> because it is perceived to be a very fresh idea/query.
>=20
>    I still think it would help if a short high level design would be poste=
d
>    on xen-devel first.
>=20
> I think that is a valid point and I agree. In the past when we had similar=

> discussions often the outcome was not that clear and due to the nature of
> the calls the discussions were also not well reflected in the notes.
>=20
> So, there is an argument, that discussions typically are more productive w=
hen
> there is the possibility for some preparation or an e-mail thread to refer=
 to.

We can defer the xenstoreless name service topic to the October monthly call=
.

For today's call, can we discuss the previously posted high-level design for=
 unification of the domB RFC with dom0less, as "domB mode" for disaggregatio=
n of Xen's dom0?

- domB mode for dom0less (July 2019):  https://lists.gt.net/xen/devel/557782=

- domB RFC (June 2018):  https://lists.gt.net/xen/devel/519367

Rich=

--Apple-Mail-99E3A59B-8149-4211-BAA8-51AB3FBBD30C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On Sep 5, 2019, at 04:36, Lar=
s Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.com">lars.kurth@citrix.com</=
a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote type=3D"cite"><div=
 dir=3D"ltr"><span>=EF=BB=BFOn 05/09/2019, 09:33, "Juergen Gross" &lt;<a hre=
f=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wrote:</span><br><span>=
</span><br><span> &nbsp;&nbsp;&nbsp;On 05.09.19 10:14, Andrew Cooper wrote:<=
/span><br><blockquote type=3D"cite"><span>On 05/09/2019 08:49, Lars Kurth wr=
ote:</span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>On 05/09/2019, 08:41, "Rich Persaud" &lt;<a href=3D"mailto:persaur=
@gmail.com">persaur@gmail.com</a>&gt; wrote:</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>On Sep 5, 2019, at 03:19, Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:</span><b=
r></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>Forgive me asking, but why is this put up as a=
n agenda item here?</span><br></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>IMO this is the kind of thing where you would send a proposal and</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>request feedback by email fi=
rst, and put it up as an agenda item</span><br></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>here only if it got stalled there. (Apologies if I've over=
looked</span><br></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>such a stall=
ed thread.)</span><br></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&=
nbsp;&nbsp;If Xen community call topics are limited to escalations of xen-de=
vel threads, then a new thread can be created for this topic. Xen community c=
alls have also provided real-time, interactive feedback on candidate proposa=
ls, along with guidance on areas which need documentation before a formal pr=
oposal is made to xen-devel. &nbsp;&nbsp;Such agenda items are typically cov=
ered after all series and priority topics have been addressed.</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>I don't mind having items such these on the agenda a=
nd to be fair have added similar items onto the agenda in the past.</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>Clearly, they are forward looking [like an RFC], for which reason I=
 tend to add them to the end of an agenda if there is a busy schedule</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>Personally, on this specific item, it is not r=
eally clear what the questions are. &nbsp;In other words: is this about UUID=
S/domain ids only, or is there something else.</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote t=
ype=3D"cite"><span>Requiring something to be blocked on xen-devel before we d=
iscuss it on</span><br></blockquote><blockquote type=3D"cite"><span>the call=
 is monumentally short sighted, and off-putting for contributors.</span><br>=
</blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockq=
uote type=3D"cite"><span>In this case, it is very definitely not the first t=
ime this problem has</span><br></blockquote><blockquote type=3D"cite"><span>=
been raised, as it is an XSA shaped elephant in the room. &nbsp;Its no secre=
t</span><br></blockquote><blockquote type=3D"cite"><span>that id wraps cause=
 problems, and while our security policy doesn't</span><br></blockquote><blo=
ckquote type=3D"cite"><span>comment on the matter, it also doesn't say "warn=
ing - stuff *will* break</span><br></blockquote><blockquote type=3D"cite"><s=
pan>in weird, wonderful, and security-relevant ways when domid's wrap".</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>The order of the agenda is important, and I d=
on't think this should be</span><br></blockquote><blockquote type=3D"cite"><=
span>at the top, but even if we only end up with 2 minutes to discuss it,</s=
pan><br></blockquote><blockquote type=3D"cite"><span>then so be it. &nbsp;(2=
 minutes of talking can still be far more valuable</span><br></blockquote><b=
lockquote type=3D"cite"><span>than a weeks worth of emailing.)</span><br></b=
lockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquot=
e type=3D"cite"><span>What is not acceptable is suggesting that it should be=
 veto'd simply</span><br></blockquote><blockquote type=3D"cite"><span>becaus=
e it is perceived to be a very fresh idea/query.</span><br></blockquote><spa=
n></span><br><span> &nbsp;&nbsp;&nbsp;I still think it would help if a short=
 high level design would be posted</span><br><span> &nbsp;&nbsp;&nbsp;on xen=
-devel first.</span><br><span></span><br><span>I think that is a valid point=
 and I agree. In the past when we had similar</span><br><span>discussions of=
ten the outcome was not that clear and due to the nature of</span><br><span>=
the calls the discussions were also not well reflected in the notes.</span><=
br><span></span><br><span>So, there is an argument, that discussions typical=
ly are more productive when</span><br><span>there is the possibility for som=
e preparation or an e-mail thread to refer to.</span><br></div></blockquote>=
<br><div>We can defer the xenstoreless name service topic to the October mon=
thly call.</div><div><br></div><div>For today's call, can we discuss the pre=
viously posted high-level design for unification of the domB RFC with dom0le=
ss, as "domB mode" for disaggregation of Xen's dom0?</div><div><br></div><di=
v>- domB mode for dom0less (July 2019): &nbsp;<a href=3D"https://lists.gt.ne=
t/xen/devel/557782">https://lists.gt.net/xen/devel/557782</a></div><div><div=
><span style=3D"background-color: rgba(255, 255, 255, 0);">- domB RFC (June 2=
018): &nbsp;<a href=3D"https://lists.gt.net/xen/devel/519367">https://lists.=
gt.net/xen/devel/519367</a></span></div></div><div><br></div><div>Rich</div>=
</div></body></html>=

--Apple-Mail-99E3A59B-8149-4211-BAA8-51AB3FBBD30C--


--===============2486337094752104234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2486337094752104234==--

