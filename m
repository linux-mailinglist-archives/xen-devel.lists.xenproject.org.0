Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDEAA84F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 18:19:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5uR9-0005Al-40; Thu, 05 Sep 2019 16:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sH3W=XA=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1i5uR7-0005Ag-G9
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 16:16:41 +0000
X-Inumbo-ID: 8b48faa0-cff8-11e9-b299-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b48faa0-cff8-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 16:16:40 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s21so6164545ioa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2019 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aZGJOSwJM5P1juFyD9/q9wz2nFEgfvRRjx3LPTH7Agw=;
 b=dlrSaE90mbbwCuel9zcSGbHaistdxyLoiOgT0Anpb4xCVI/I+n8G2Dndo5CZVgOllj
 OeBs3ZMVdoH1cdhq+cVJlpkGKXiwwBWbYjyKu7qpf16GCh8NiYp49Dak4dQewzvRMMRT
 jGZp4NQwlqMg6B4jSHhjPDpcqH5BpW+TlLlYSEblkJAujMJnGO13vQ4rZVlW+GtAqHlH
 YACdG6tpRCh4gUzBlZz7dXF6STvpxqrcZSIN2A4QPTnhQ/OtuguROTvN/iv2egn6zDmJ
 /GZSC8OCXMLPtqg0JNjHvK6+GA6zN5I+i8uA+J63oUkamezB6LaveNj//CX5dsN2hW3B
 STeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aZGJOSwJM5P1juFyD9/q9wz2nFEgfvRRjx3LPTH7Agw=;
 b=WTq8ynZsniS/2JPZ6FLwMvs5sjp5AR4bFbhzNVSI1d4cHf88hdwo6rERjGjRMor8ZG
 Cn4Xc0KkiXdu41oKDSRCOxy//8E71PyiUizsRlz/atpORZwpqm6Oj4iAYh9zZ6L5qsPl
 YWZeoVEKgwqdkU4SdBx7QnPf7hAQgGMr02Nv3d928rD3UkXOonrEQdxj+s6EuAPjnnVu
 WrPqZZSNpIue8TW1d7U82AmcdKJNgABxpSpeB0FryTvb6qsaL52nRatKPXbqLqa3h5Cv
 Y6IbkxKe70Ya+BfxoDaz0jy0fABR/K3FeBwtMzg2qgd4RhMAcm7I3MA1GR5lpEJIXElD
 q5hg==
X-Gm-Message-State: APjAAAUNtaIXA77oKC3taJhYVotH5r8vWyxczae94aW8Cnv4JxEqR735
 Qt5RsHW/RBAd8mmPzRsNHNU=
X-Google-Smtp-Source: APXvYqyou3D2tZN5ABk0ogtoHNqzX9biq/aQLs7pS+AGqGbjnVw+DawNqZqi1Fijsqkzkh9DNmbrWA==
X-Received: by 2002:a05:6602:186:: with SMTP id
 m6mr4959258ioo.162.1567700200421; 
 Thu, 05 Sep 2019 09:16:40 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id d1sm1861125iok.17.2019.09.05.09.16.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 09:16:39 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G102)
In-Reply-To: <0C0A0230-3254-4ADD-9E42-F72D985C2770@citrix.com>
Date: Thu, 5 Sep 2019 12:16:39 -0400
Message-Id: <58AC3130-A936-4B89-9F69-611B4080E8C8@gmail.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
 <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
 <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
 <0E76424D-57EB-4792-BA82-121E69506314@citrix.com>
 <1D4888CA-5C9F-4181-BF86-396CBEF4D548@gmail.com>
 <0C0A0230-3254-4ADD-9E42-F72D985C2770@citrix.com>
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
Content-Type: multipart/mixed; boundary="===============7769715309651124375=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7769715309651124375==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-49F39477-8CA0-488B-9B06-A1DC1AD8DFAC
Content-Transfer-Encoding: 7bit


--Apple-Mail-49F39477-8CA0-488B-9B06-A1DC1AD8DFAC
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Sep 5, 2019, at 12:12, Lars Kurth <lars.kurth@citrix.com> wrote:
> =20
> > We can defer the xenstoreless name service topic to the October monthly c=
all.
> >=20
> > For today's call, can we discuss the previously posted high-level design=
 for unification of the domB RFC with dom0less, as "domB mode" for=20
> > disaggregation of Xen's dom0?
> >=20
> > - domB mode for dom0less (July 2019):  https://lists.gt.net/xen/devel/55=
7782
> > - domB RFC (June 2018):  https://lists.gt.net/xen/devel/519367
> =20
> I had seen this too late. Apologies
> Lars

Since we did cover the xenstoreless name service today, we can cover "domB m=
ode for dom0less" in the October call.

Rich=

--Apple-Mail-49F39477-8CA0-488B-9B06-A1DC1AD8DFAC
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div dir="ltr"></div><div dir="ltr">On Sep 5, 2019, at 12:12, Lars Kurth &lt;<a href="mailto:lars.kurth@citrix.com">lars.kurth@citrix.com</a>&gt; wrote:</div><div dir="ltr"><span style="font-family: Calibri, sans-serif; font-size: 11pt;">&nbsp;</span></div><blockquote type="cite"><div dir="ltr"><div class="WordSection1">
<div>
<p class="MsoNormal">&gt; We can defer the xenstoreless name service topic to the October monthly call.<o:p></o:p></p>
</div>
<div>
<p class="MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
</div>
<div>
<p class="MsoNormal">&gt; For today's call, can we discuss the previously posted high-level design for unification of the domB RFC with dom0less, as "domB mode" for
<br>
&gt; disaggregation of Xen's dom0?<o:p></o:p></p>
</div>
<div>
<p class="MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
</div>
<div>
<p class="MsoNormal">&gt; - domB mode for dom0less (July 2019): &nbsp;<a href="https://lists.gt.net/xen/devel/557782">https://lists.gt.net/xen/devel/557782</a><o:p></o:p></p>
</div>
<div>
<div>
<p class="MsoNormal">&gt; - domB RFC (June 2018): &nbsp;<a href="https://lists.gt.net/xen/devel/519367">https://lists.gt.net/xen/devel/519367</a><o:p></o:p></p>
</div>
</div>
<div>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">I had seen this too late. Apologies<o:p></o:p></p>
<p class="MsoNormal">Lars<o:p></o:p></p>
</div>
</div>


</div></blockquote><br><div>Since we did cover the xenstoreless name service today, we can cover "domB mode for dom0less" in the October call.</div><div><br></div><div>Rich</div><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></body></html>
--Apple-Mail-49F39477-8CA0-488B-9B06-A1DC1AD8DFAC--


--===============7769715309651124375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7769715309651124375==--

