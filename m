Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9222516EA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWay-0006Gd-4n; Tue, 25 Aug 2020 10:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHAN=CD=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kAWaw-0006GY-JQ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:54:26 +0000
X-Inumbo-ID: 4a7804b5-347c-4817-8dee-8a3004b28b84
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a7804b5-347c-4817-8dee-8a3004b28b84;
 Tue, 25 Aug 2020 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598352865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=LDbPiJeF+8KXbukJtORCf6tqEi/eFnJw7/plDl/Z6Hg=;
 b=NmgbONYQduG4d/NhkqdEzeeQ6WhJ+lEHya7RxznD6lcQS4wo1pVxbKFJ
 AeAYDxL7KjMab32m0AnS3iIGmeWdO3cTu/RaIJli/6hrC+YYtfQ655MLR
 X4NQ6K5RkHrfJSBZ/B9lEOQQR3HGlB1LC7rFmcN6mW8+zsFRB4iBqnPXm g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vEFZNiF0fGLwEHVX1aGesohMK0j7nnECefPjZynj+FHbLWT5RzwP82UlBidLs5ETEGtmwziuea
 euY4MJcX3hl9pDX9wyPv8R0ncgjXjvuC4XWgJ/MI1rgwfaaGHkXwUHB5qNQPtRG10ngjxqgzD5
 IEV9qglS5DbBjDCIdhie1YlRWQE0PYs1iTwJ6U1QDQBggaswU7XE6/O+dNXD05KMog12VzKaA1
 lUVnbZiHqJynry3bFaIvnQ72VvGrRJ2oVBbr/Lqqcp99iVZMZnS9gJb9JqeKJ6jOpkPosJINyd
 JWs=
X-SBRS: 2.7
X-MesageID: 25536565
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208,217";a="25536565"
From: Christian Lindig <christian.lindig@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "xen-devel@dornerworks.com"
 <xen-devel@dornerworks.com>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Josh Whitehead
 <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, David Scott <dave@recoil.org>, "Shriram
 Rajagopalan" <rshriram@cs.ubc.ca>, Yang Hongyang <imhy.yang@gmail.com>, Edwin
 Torok <edvin.torok@citrix.com>
Subject: Re: [PATCH v3 00/38] tools: move most libraries into tools/libs
Thread-Topic: [PATCH v3 00/38] tools: move most libraries into tools/libs
Thread-Index: AQHWeTC9ZIXZmGtXBk+5TUZnzDYz3KlIqAiJ
Date: Tue, 25 Aug 2020 10:54:21 +0000
Message-ID: <1598352860986.67246@citrix.com>
References: <20200823093519.18386-1-jgross@suse.com>
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: multipart/alternative;
 boundary="_000_159835286098667246citrixcom_"
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_159835286098667246citrixcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I have no objections. For the OCaml part in particular I previously said th=
at I believe that it would benefit from either be maintained outside the tr=
ee (which requires a clean interface) or moving it to use Dune for its buil=
d (triggered by the current make build). Any cleanup that is helping here i=
s welcome.

--
Acked-by: Christian Lindig <christian.lindig@citrix.com>??


________________________________
From: Juergen Gross <jgross@suse.com>
Sent: 23 August 2020 10:34
To: xen-devel@lists.xenproject.org; xen-devel@dornerworks.com
Cc: Juergen Gross; Samuel Thibault; Ian Jackson; Wei Liu; George Dunlap; Ni=
ck Rosbrook; Andrew Cooper; Jan Beulich; Julien Grall; Stefano Stabellini; =
Anthony Perard; Marek Marczykowski-G=F3recki; Josh Whitehead; Stewart Hilde=
brand; Christian Lindig; David Scott; Shriram Rajagopalan; Yang Hongyang
Subject: [PATCH v3 00/38] tools: move most libraries into tools/libs

Move most remaining libraries under tools/libs, including libxenctrl
and libxl. This is resulting in a lot of cleanup work regarding
building libs and restructuring of the tools directory.

After this huge cleanup all dependencies between libraries are defined
in a single rather small file tools/libs/uselibs.mk, which is used to
create the needed make variables and to control the stubdom build
dependencies as well.

Another bonus of the rework is the automation of setting the versions
of unstable libraries. This removes the need to bump those versions
manually for each Xen release.

libfsimage is not moved by this series, as IMO there are some open
questions:
- should it really be unstable?
- is the support of adding external fs-support used in practice, i.e.
  shouldn't the fs-specific sub-libraries be just included into
  libfsimage instead of being loaded dynamically?

The complete series is available via:

git://xenbits.xen.org/people/jgross/xen.git libbuild-v3





--_000_159835286098667246citrixcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"font-family: Helvetica; font-size: 12px;"><br>
</div>
<div style=3D"font-family: Helvetica; font-size: 12px;">I have no objection=
s. For the OCaml part in particular I previously said that I believe that i=
t would benefit from either be maintained outside the tree (which requires =
a clean interface) or moving it to
 use Dune for its build (triggered by the current make build). Any cleanup =
that is helping here is welcome.<br>
</div>
<div style=3D"font-family: Helvetica; font-size: 12px;"><br>
</div>
<div style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); backgro=
und-color: rgb(255, 255, 255); font-family: Helvetica; font-size: 12px;">
--&nbsp;</div>
<div style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); backgro=
und-color: rgb(255, 255, 255); font-family: Helvetica; font-size: 12px;">
Acked-by: Christian Lindig &lt;christian.lindig@citrix.com&gt;&#8203;&#8203=
;<br>
</div>
<p><br>
</p>
<div style=3D"color: rgb(33, 33, 33);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Juergen Gross &lt;j=
gross@suse.com&gt;<br>
<b>Sent:</b> 23 August 2020 10:34<br>
<b>To:</b> xen-devel@lists.xenproject.org; xen-devel@dornerworks.com<br>
<b>Cc:</b> Juergen Gross; Samuel Thibault; Ian Jackson; Wei Liu; George Dun=
lap; Nick Rosbrook; Andrew Cooper; Jan Beulich; Julien Grall; Stefano Stabe=
llini; Anthony Perard; Marek Marczykowski-G=F3recki; Josh Whitehead; Stewar=
t Hildebrand; Christian Lindig; David
 Scott; Shriram Rajagopalan; Yang Hongyang<br>
<b>Subject:</b> [PATCH v3 00/38] tools: move most libraries into tools/libs=
</font>
<div>&nbsp;<br>
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Move most remaining libraries under tools/libs, in=
cluding libxenctrl<br>
and libxl. This is resulting in a lot of cleanup work regarding<br>
building libs and restructuring of the tools directory.<br>
<br>
After this huge cleanup all dependencies between libraries are defined<br>
in a single rather small file tools/libs/uselibs.mk, which is used to<br>
create the needed make variables and to control the stubdom build<br>
dependencies as well.<br>
<br>
Another bonus of the rework is the automation of setting the versions<br>
of unstable libraries. This removes the need to bump those versions<br>
manually for each Xen release.<br>
<br>
libfsimage is not moved by this series, as IMO there are some open<br>
questions:<br>
- should it really be unstable?<br>
- is the support of adding external fs-support used in practice, i.e.<br>
&nbsp; shouldn't the fs-specific sub-libraries be just included into<br>
&nbsp; libfsimage instead of being loaded dynamically?<br>
<br>
The complete series is available via:<br>
<br>
git://xenbits.xen.org/people/jgross/xen.git libbuild-v3<br>
<br>
<div style=3D"background-color: rgb(255, 255, 255); font-family: Helvetica;=
 font-size: 12px;">
<br>
</div>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_159835286098667246citrixcom_--

