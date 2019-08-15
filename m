Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE098F36E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 20:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyKTf-0003QV-EC; Thu, 15 Aug 2019 18:27:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TgGS=WL=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hyKTd-0003QE-5s
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 18:27:57 +0000
X-Inumbo-ID: 65bef448-bf8a-11e9-813a-bc764e2007e4
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65bef448-bf8a-11e9-813a-bc764e2007e4;
 Thu, 15 Aug 2019 18:27:54 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id s21so1063993ioa.1;
 Thu, 15 Aug 2019 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gs/2mT7DakaqmO8hZYHEOKxQtZJe/6V7jId2tA+iWIs=;
 b=nCcQEPN3GljSlfYaMzY5Yakfv4ARxaMOoFZzPVicHb3DxRSDXlP2BQnad2nz+ADN8r
 4xClR6WKE7Wnihiz+5xnSzMZMCtWCKJ0DmFA7UwaFwYjJLK3dGoLuUWMBP8YyS38NTyB
 5mSE1wgKqbh0qf/4csyQBwhbWAlJDLTvrUwvnMfnvYAsE9DYxyH9a+eVPhzufs3tWQMK
 LDbb2yS113MwgCfkMmLHfiH9XjhpxD/v2Be0aEBq4abPPpOvMZhHZabGB6erORmP6D3x
 m98W447GoRnB1UpxeSXBFLzuTa0OEbXvHytfYJPwoErxXr/s9OzSTldQXzxH2uM1EiOv
 ghCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gs/2mT7DakaqmO8hZYHEOKxQtZJe/6V7jId2tA+iWIs=;
 b=GPSs7HB8plPVjwN9W1WEVP9LYj77hqiib9/P4D3d4YzLA0gj/kNnkTp0dV5KL06d/0
 x60W6FWod5bfMYdsu8N3TnrR+e8gjaxMWpihcsyvBtof6n4+kT8qV8bL4p/Kj8mt1ShJ
 0HMg6bh5B5inrOScXeUY+cE/pCwfA8jlWZgFHb+u/LUu1JA3/HX8ZyEv9pfsAnMWJwpL
 ozp7BIeJ0y1XfjihNNqoFP7S2wbsR/JfrMcTB1voEOozPq5Cu1QvtMSpYjdGdaDOYk1m
 8jilN2UrljAq1JkIkuH7JsNSlfoNOhTKiK7PEQVMFsBhsBLg6QCdQVaLa7n1T0gFAFUj
 8/kA==
X-Gm-Message-State: APjAAAUqjQlcpovgH271pt+n7U+nybUMEIZOmX5PI3RVvi833bQXlXZT
 Pr9/zzsRszRPrGUdsYmaujhWCzVm
X-Google-Smtp-Source: APXvYqxVe63zi4kbChud2fYh9w5/XbaFSN6LsctMGNpnvrmJxLdoAKcSap0+xme4r5pS7CebftoWgQ==
X-Received: by 2002:a02:5246:: with SMTP id d67mr6690432jab.58.1565893673870; 
 Thu, 15 Aug 2019 11:27:53 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id l26sm4128290ioj.24.2019.08.15.11.27.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 11:27:53 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <E85126B0-E13C-4DBE-AB85-5C1DF3836B42@citrix.com>
Date: Thu, 15 Aug 2019 14:27:52 -0400
Message-Id: <3963D85D-BCF6-49CC-A04E-00A03E6D6C9F@gmail.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <E85126B0-E13C-4DBE-AB85-5C1DF3836B42@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7718694343442987506=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7718694343442987506==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-58E3AB2A-FA10-45E0-B7AA-C670D5132CB0
Content-Transfer-Encoding: 7bit


--Apple-Mail-58E3AB2A-FA10-45E0-B7AA-C670D5132CB0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Aug 15, 2019, at 14:01, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> Hi Rich,
> =20
> thanks for the feedback. I am going to
> =20
> =EF=BB=BFOn 15/08/2019, 18:23, "Rich Persaud" <persaur@gmail.com> wrote:
> =20
>     > On Aug 9, 2019, at 13:48, Lars Kurth <lars.kurth@citrix.com> wrote:
>     >
>     > Hi all,
>   =20
>     Hi Lars,
>   =20
>     >
>     > Following the discussion we had at the Developer Summit (see https:/=
/wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvem=
ents_-_Communication.2C_Code_of_Conduct.2C_etc. for notes) I put together a d=
raft for the Code of Conduct which can be found here as well as inlined belo=
w
>     > https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfP=
JT5KY61WXJM/edit?usp=3Dsharing
>     >
>     > It is based on the LF Events CoC as we agreed on (the diff is attach=
ed). I took the scope and enforcement sections from https://www.contributor-=
covenant.org/version/1/4/code-of-conduct.html and simplified it rather than i=
nventing something new.
>   =20
>     Is there precedent for applying a legal contract (Code of Conduct) tha=
t was designed for physical space (conference event) to an online context?  =
 Is there an existing Code of Conduct that was legally designed for a simila=
r, online open-source community context, e.g. operating system or hypervisor=
 or other systems-level software dev?
> =20
> If you look at https://www.contributor-covenant.org/version/1/4/code-of-co=
nduct.html or many other examples, what we ended up with is almost identical=
. The same is true for most other CoCs which are used as =E2=80=9Cgold stand=
ard=E2=80=9D.

Thanks for the pointer, that's exactly what I was hoping to find.  Here is s=
ome text from Contributor Covenant:

"Instances of abusive, harassing, or otherwise unacceptable behavior may be r=
eported by contacting the project team at [INSERT EMAIL ADDRESS]. All compla=
ints will be reviewed and investigated and will result in a response that is=
 deemed necessary and appropriate to the circumstances. The project team is o=
bligated to maintain confidentiality with regard to the reporter of an incid=
ent. Further details of specific enforcement policies may be posted separate=
ly.
Project maintainers who do not follow or enforce the Code of Conduct in good=
 faith may face temporary or permanent repercussions as determined by other m=
embers of the project=E2=80=99s leadership."

This is different from the proposed CoC, because:

  (a) repercussions are not specified, i.e. they can be contextual
  (b) there is a confidentiality provision
  (c) decisions are made by open-source project leadership, not a separate "=
CoC team" with TBD members, electoral process and governance=20

Can Xen Project adopt Contributor Covenant directly?  It has a large base of=
 adopters, including Intel and Google projects, so we would benefit from ups=
tream improvements as the CoC is tested in the real world:  https://www.cont=
ributor-covenant.org/adopters

Rich

--Apple-Mail-58E3AB2A-FA10-45E0-B7AA-C670D5132CB0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On A=
ug 15, 2019, at 14:01, Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.co=
m">lars.kurth@citrix.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:-webkit-standard;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1558200443;
	mso-list-type:hybrid;
	mso-list-template-ids:386465514 67698711 67698713 67698715 67698703=
 67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	color:windowtext;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>


<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi Rich,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">thanks for the feedback. I am going to <o:p></o:p>=
</p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt"><o:p>&nbsp;</o:p></p>=

<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">=EF=BB=BFOn 15/08/201=
9, 18:23, "Rich Persaud" &lt;<a href=3D"mailto:persaur@gmail.com">persaur@gm=
ail.com</a>&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt"><o:p>&nbsp;</o:p></p>=

<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; &g=
t; On Aug 9, 2019, at 13:48, Lars Kurth &lt;<a href=3D"mailto:lars.kurth@cit=
rix.com">lars.kurth@citrix.com</a>&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; &g=
t; <o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;&gt; Hi all,<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; <o=
:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;Hi Lars,<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; <o=
:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;&gt; Following the discussion we had at the Developer Summit (see <a href=
=3D"https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.=
2F_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc">https://wiki.xenp=
roject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvements_-_Com=
munication.2C_Code_of_Conduct.2C_etc</a>. for notes)
 I put together a draft for the Code of Conduct which can be found here as w=
ell as inlined below<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; &g=
t; <a href=3D"https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2G=
PVCcfPJT5KY61WXJM/edit?usp=3Dsharing">https://docs.google.com/document/d/1Nn=
WdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY61WXJM/edit?usp=3Dsharing</a>
<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;&gt; It is based on the LF Events CoC as we agreed on (the diff is attach=
ed). I took the scope and enforcement sections from <a href=3D"https://www.c=
ontributor-covenant.org/version/1/4/code-of-conduct.html">https://www.contri=
butor-covenant.org/version/1/4/code-of-conduct.html</a> and simplified
 it rather than inventing something new.<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp; <o=
:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:36.0pt">&nbsp;&nbsp;&nbsp;&nb=
sp;Is there precedent for applying a legal contract (Code of Conduct) that w=
as designed for physical space (conference event) to an online context?&nbsp=
;&nbsp; Is there an existing Code of Conduct that was legally designed
 for a similar, online open-source community context, e.g. operating system o=
r hypervisor or other systems-level software dev?<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">If you look at </span>=
<a href=3D"https://www.contributor-covenant.org/version/1/4/code-of-conduct.=
html">https://www.contributor-covenant.org/version/1/4/code-of-conduct.html<=
/a> or many other examples, what we ended up with is almost identical. The s=
ame is true for most other CoCs which are used
 as =E2=80=9Cgold standard=E2=80=9D.</p></div></div></blockquote><div><br></=
div><div>Thanks for the pointer, that's exactly what I was hoping to find. &=
nbsp;Here is some text from Contributor Covenant:</div><div><div><br></div><=
div>"Instances of abusive, harassing, or otherwise unacceptable behavior may=
 be reported by contacting the project team at [INSERT EMAIL ADDRESS]. All c=
omplaints will be reviewed and investigated and will result in a response th=
at is deemed necessary and appropriate to the circumstances. The project tea=
m is obligated to maintain confidentiality with regard to the reporter of an=
 incident. Further details of specific enforcement policies may be posted se=
parately.</div><div>Project maintainers who do not follow or enforce the Cod=
e of Conduct in good faith may face temporary or permanent repercussions as d=
etermined by other members of the project=E2=80=99s leadership."</div><div><=
br></div><div>This is different from the proposed CoC, because:</div><div><b=
r></div><div>&nbsp; (a) repercussions are not specified, i.e. they can be co=
ntextual</div><div>&nbsp; (b) there is a confidentiality provision</div><div=
>&nbsp; (c) decisions are made by open-source project leadership, not a sepa=
rate "CoC team" with TBD members, electoral process and governance&nbsp;</di=
v><div><br></div><div>Can Xen Project adopt Contributor Covenant directly? &=
nbsp;It has a large base of adopters, including Intel and Google projects, s=
o we would benefit from upstream improvements as the CoC is tested in the re=
al world: &nbsp;<a href=3D"https://www.contributor-covenant.org/adopters">ht=
tps://www.contributor-covenant.org/adopters</a></div><div><br></div><div>Ric=
h</div></div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"WordSe=
ction1">
</div>


</div></blockquote></body></html>=

--Apple-Mail-58E3AB2A-FA10-45E0-B7AA-C670D5132CB0--


--===============7718694343442987506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7718694343442987506==--

