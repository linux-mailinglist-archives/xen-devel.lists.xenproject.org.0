Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF99020D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybjC-000583-IG; Fri, 16 Aug 2019 12:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8cMr=WM=amazon.de=prvs=124e25053=wipawel@srs-us1.protection.inumbo.net>)
 id 1hybjB-00057o-AH
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:53:09 +0000
X-Inumbo-ID: cba89135-c024-11e9-8bb5-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cba89135-c024-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565959988; x=1597495988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=o6FE1s0JugvV5roPd5yLINaX8igdmDH21L97RuL0CCM=;
 b=XpO60RSceAYjPM13WFFdBYQTMmNQGKu/BHNNrHo8BFyl+hqq3ytv1zSC
 1Ddai2sGXIRbrjiVffdyrNpWbkN0ut9ySpdB+y5DWVzUDy4fm877+ySYa
 qC1y6CJxbaT7bOqf3GukkN1uxX5OVqgqcHG6eeSFKHi5+SX9GfQkVnEiD I=;
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; 
 d="scan'208,217";a="694429535"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Aug 2019 12:53:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 31AD1A27C9; Fri, 16 Aug 2019 12:53:01 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:52:51 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:52:50 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Fri, 16 Aug 2019 12:52:50 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Wei Liu <wl@xen.org>
Thread-Topic: [livepatch: independ. modules 3/3] python: Add XC binding for
 Xen build ID
Thread-Index: AQHU9FQkQLRkvrIaZk67aUP+VzvJmqb8s0UAgAHFuoCAAAFcgA==
Date: Fri, 16 Aug 2019 12:52:50 +0000
Message-ID: <8563251D-3913-4521-944E-9CA2561049FB@amazon.com>
References: <20190416125832.32881-3-wipawel@amazon.de>
 <20190815094400.126289-1-wipawel@amazon.de>
 <20190816124757.fkhtymt2grnaobcp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20190816124757.fkhtymt2grnaobcp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch: independ. modules 3/3] python: Add XC
 binding for Xen build ID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4164249035990371772=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4164249035990371772==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8563251D39134521944E9CA2561049FBamazoncom_"

--_000_8563251D39134521944E9CA2561049FBamazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 16. Aug 2019, at 14:47, Wei Liu <wl@xen.org<mailto:wl@xen.org>> wrote:

On Thu, Aug 15, 2019 at 09:44:00AM +0000, Pawel Wieczorkiewicz wrote:
Extend the list of xc() object methods with additional one to display
Xen's buildid. The implementation follows the libxl implementation
(e.g. max buildid size assumption being XC_PAGE_SIZE).

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de<mailto:wipawel@amazo=
n.de>>
Reviewed-by: Martin Mazein <amazein@amazon.de<mailto:amazein@amazon.de>>
Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com<mailto:andraprs@ama=
zon.com>>
Reviewed-by: Norbert Manthey <nmanthey@amazon.de<mailto:nmanthey@amazon.de>>

I'm a bit confused by the tag in the subject line. Which series does
this patch belong to?

Wei.

Thanks for taking a look.

This is the series: https://marc.info/?t=3D155541982300002&r=3D1&w=3D4

Best Regards,
Pawel Wieczorkiewicz



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_8563251D39134521944E9CA2561049FBamazoncom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <901642844BAC44448F5A8FACC476166D@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 16. Aug 2019, at 14:47, Wei Liu &lt;<a href=3D"mailto:wl=
@xen.org" class=3D"">wl@xen.org</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">On Thu, Aug 15, 2019 at 09:44:00AM &#43;0000, Pawel Wieczor=
kiewicz wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Extend the list of xc() object methods=
 with additional one to display<br class=3D"">
Xen's buildid. The implementation follows the libxl implementation<br class=
=3D"">
(e.g. max buildid size assumption being XC_PAGE_SIZE).<br class=3D"">
<br class=3D"">
Signed-off-by: Pawel Wieczorkiewicz &lt;<a href=3D"mailto:wipawel@amazon.de=
" class=3D"">wipawel@amazon.de</a>&gt;<br class=3D"">
Reviewed-by: Martin Mazein &lt;<a href=3D"mailto:amazein@amazon.de" class=
=3D"">amazein@amazon.de</a>&gt;<br class=3D"">
Reviewed-by: Andra-Irina Paraschiv &lt;<a href=3D"mailto:andraprs@amazon.co=
m" class=3D"">andraprs@amazon.com</a>&gt;<br class=3D"">
Reviewed-by: Norbert Manthey &lt;<a href=3D"mailto:nmanthey@amazon.de" clas=
s=3D"">nmanthey@amazon.de</a>&gt;<br class=3D"">
</blockquote>
<br class=3D"">
I'm a bit confused by the tag in the subject line. Which series does<br cla=
ss=3D"">
this patch belong to?<br class=3D"">
<br class=3D"">
Wei.<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">Thanks for taking a look.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">This is the series:&nbsp;<a href=3D"https://marc.info/?t=3D=
155541982300002&amp;r=3D1&amp;w=3D4" class=3D"">https://marc.info/?t=3D1555=
41982300002&amp;r=3D1&amp;w=3D4</a></div>
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

--_000_8563251D39134521944E9CA2561049FBamazoncom_--



--===============4164249035990371772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4164249035990371772==--


