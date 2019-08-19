Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3726921C2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 12:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzfKc-0006j5-8Q; Mon, 19 Aug 2019 10:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vtjl=WP=amazon.de=prvs=12713047e=wipawel@srs-us1.protection.inumbo.net>)
 id 1hzfKZ-0006j0-Ok
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 10:56:07 +0000
X-Inumbo-ID: f18bef70-c26f-11e9-8bec-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f18bef70-c26f-11e9-8bec-12813bfff9fa;
 Mon, 19 Aug 2019 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566212166; x=1597748166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=xi/b7VsNyMB1ofZHMM0y7Gwg4UFGqWixsTO0Gfid5cI=;
 b=LlzGAcbaQlS99eDKEahliQGG+MH28Zpk0CZk5dBCgAleXe0X8dqDBhP4
 wLYJSE71uQo8AJY2Dp3IL15WZ3IV9g5MO8gFnBjS4lt+ZUP2PpHrosiy4
 0t4ameVA0ediP2P0GQg+nODcNCzKmrd033nrniRNp5AvpMisL5yQdBq83 I=;
X-IronPort-AV: E=Sophos;i="5.64,403,1559520000"; 
 d="scan'208,217";a="695095908"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Aug 2019 10:55:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E2F6A2861; Mon, 19 Aug 2019 10:55:54 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 19 Aug 2019 10:55:54 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 19 Aug 2019 10:55:53 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 19 Aug 2019 10:55:52 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part3 v2 3/3] create-diff-object: Strip
 all undefined entires of known size
Thread-Index: AQHVTegE+r4JLwWYmk2CwRCfIRe536b963kAgARyDAA=
Date: Mon, 19 Aug 2019 10:55:52 +0000
Message-ID: <67A6B56E-0BF5-4FDF-884E-B76C6208B247@amazon.com>
References: <20190416122241.28342-3-wipawel@amazon.de>
 <20190808125132.10484-1-wipawel@amazon.de>
 <9aa0bea9-8f39-f459-ee15-0bc961698507@citrix.com>
In-Reply-To: <9aa0bea9-8f39-f459-ee15-0bc961698507@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.237]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part3 v2 3/3]
 create-diff-object: Strip all undefined entires of known size
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============3525609750572175949=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3525609750572175949==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_67A6B56E0BF54FDF884EB76C6208B247amazoncom_"

--_000_67A6B56E0BF54FDF884EB76C6208B247amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 16. Aug 2019, at 17:02, Ross Lagerwall <ross.lagerwall@citrix.com<mailto=
:ross.lagerwall@citrix.com>> wrote:

On 8/8/19 1:51 PM, Pawel Wieczorkiewicz wrote:
The patched ELF object file contains all sections and symbols as
resulted from the compilation. However, certain symbols may not be
copied over to the resulting object file, due to being unchanged or
not included for other reasons.
In such situation the resulting object file has the entire sections
copied along (with all their entries unchanged), while some of the
corresponding symbols are not copied along at all.
This leads to having incorrect undefined (STN_UNDEF) entries in the
final hotpatch ELF file.
The newly added function livepatch_strip_undefined_elements() detects
and removes all undefined RELA entries as well as their corresponding
PROGBITS section entries.
Since the sections may contain elements of unknown size (sh.sh_entsize
=3D=3D 0), perform the strip only on sections with well defined entry
sizes.
After replacing the stripped rela list, it is assumed that the next
invocation of the kpatch_rebuild_rela_section_data() will adjust all
section header parameters according to the current state.

The code in this patch seems to be very similar (i.e. somewhat copy-and-pas=
ted) to kpatch_regenerate_special_section() which prunes the rela list and =
rebuilds the corresponding text section according to the predicate should_k=
eep_rela_group(). The intent of the function also seems to be the same (onl=
y keep elements that are needed).

In what situations does the existing function not do the right thing?

Can should_keep_rela_group() be updated instead?


Yes, the code is largely based on the kpatch_regenerate_special_section(). =
However, the livepatch_strip_undefined_elements() and kpatch_regenerate_spe=
cial_section() have different "granularity" and different scope.
1. Scope
- livepatch_strip_undefined_elements(): all RELA sections
- kpatch_regenerate_special_section(): special RELA sections

2. "granularity"
- livepatch_strip_undefined_elements(): all relas to be checked
- kpatch_regenerate_special_section(): all relas in a group are copied

I think it should be possible to create a common function with the base fun=
ctionality that could take most of the common code in and then be used from=
 within both of the functions.
However, I did not want to touch existing functionality and I am afraid the=
 changes may result in a pretty convoluted code.

If you think it is still worth it, I can give it a shot.

Thanks,
--
Ross Lagerwall


Best Regards,
Pawel Wieczorkiewicz



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_67A6B56E0BF54FDF884EB76C6208B247amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <59F31C7F3F774F4BA6667FB0186FDB87@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 16. Aug 2019, at 17:02, Ross Lagerwall &lt;<a href=3D"ma=
ilto:ross.lagerwall@citrix.com" class=3D"">ross.lagerwall@citrix.com</a>&gt=
; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">On
 8/8/19 1:51 PM, Pawel Wieczorkiewicz wrote:</span><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
The patched ELF object file contains all sections and symbols as<br class=
=3D"">
resulted from the compilation. However, certain symbols may not be<br class=
=3D"">
copied over to the resulting object file, due to being unchanged or<br clas=
s=3D"">
not included for other reasons.<br class=3D"">
In such situation the resulting object file has the entire sections<br clas=
s=3D"">
copied along (with all their entries unchanged), while some of the<br class=
=3D"">
corresponding symbols are not copied along at all.<br class=3D"">
This leads to having incorrect undefined (STN_UNDEF) entries in the<br clas=
s=3D"">
final hotpatch ELF file.<br class=3D"">
The newly added function livepatch_strip_undefined_elements() detects<br cl=
ass=3D"">
and removes all undefined RELA entries as well as their corresponding<br cl=
ass=3D"">
PROGBITS section entries.<br class=3D"">
Since the sections may contain elements of unknown size (sh.sh_entsize<br c=
lass=3D"">
=3D=3D 0), perform the strip only on sections with well defined entry<br cl=
ass=3D"">
sizes.<br class=3D"">
After replacing the stripped rela list, it is assumed that the next<br clas=
s=3D"">
invocation of the kpatch_rebuild_rela_section_data() will adjust all<br cla=
ss=3D"">
section header parameters according to the current state.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">The
 code in this patch seems to be very similar (i.e. somewhat copy-and-pasted=
) to kpatch_regenerate_special_section() which prunes the rela list and reb=
uilds the corresponding text section according to the predicate should_keep=
_rela_group(). The intent of the
 function also seems to be the same (only keep elements that are needed).</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">In
 what situations does the existing function not do the right thing?</span><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Can
 should_keep_rela_group() be updated instead?</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Yes, the code is largely based on the&nbsp;<span style=3D"caret-color:=
 rgb(0, 0, 0);" class=3D"">kpatch_regenerate_special_section(). However, th=
e&nbsp;livepatch_strip_undefined_elements() and&nbsp;</span><span style=3D"=
caret-color: rgb(0, 0, 0);" class=3D"">kpatch_regenerate_special_section()
 have different &quot;granularity&quot; and different scope.</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">1. Scope</span><=
/div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">- livepatch_stri=
p_undefined_elements(): all RELA sections</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">-&nbsp;</span><s=
pan style=3D"caret-color: rgb(0, 0, 0);" class=3D"">kpatch_regenerate_speci=
al_section(): special RELA sections</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br class=3D"">
</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">2. &quot;granula=
rity&quot;</span></div>
<div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">- livepatch_stri=
p_undefined_elements(): all relas to be checked</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">-&nbsp;</span><s=
pan style=3D"caret-color: rgb(0, 0, 0);" class=3D"">kpatch_regenerate_speci=
al_section(): all relas in a group are copied</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br class=3D"">
</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">I think it shoul=
d be possible to create a common function with the base functionality that =
could take most of the common code in and then be used from within both of =
the functions.</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">However, I did n=
ot want to touch existing functionality and I am afraid the changes may res=
ult in a pretty&nbsp;convoluted&nbsp;code.</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br class=3D"">
</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">If you think it =
is still worth it, I can give it a shot.</span></div>
<div><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br class=3D"">
</span></div>
</div>
<blockquote type=3D"cite" class=3D"">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Helvetica; font-size: 12px; font-style: normal; font-variant=
-caps: normal; font-weight: normal; letter-spacing: normal; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Ross
 Lagerwall</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Best Regards=
,<br class=3D"">
Pawel Wieczorkiewicz</div>
</div>
</div>
</div>
<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_67A6B56E0BF54FDF884EB76C6208B247amazoncom_--



--===============3525609750572175949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3525609750572175949==--


