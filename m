Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7553338CA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 10:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95928.181138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvDU-0004Th-C0; Wed, 10 Mar 2021 09:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95928.181138; Wed, 10 Mar 2021 09:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvDU-0004TI-7w; Wed, 10 Mar 2021 09:33:20 +0000
Received: by outflank-mailman (input) for mailman id 95928;
 Wed, 10 Mar 2021 09:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc2E=II=roj.com=stefano.gurrieri@srs-us1.protection.inumbo.net>)
 id 1lJv9l-0003j9-Df
 for xen-devel@lists.xen.org; Wed, 10 Mar 2021 09:29:29 +0000
Received: from smsin.roj.com (unknown [89.96.160.179])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12689618-ef9b-462f-9d68-6c73f72775de;
 Wed, 10 Mar 2021 09:29:27 +0000 (UTC)
Received: from mail.roj.com ( [192.168.254.110])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by smsin.roj.com (Symantec Mail Security) with SMTP id B0.7A.21443.67198406;
 Wed, 10 Mar 2021 10:29:26 +0100 (CET)
Received: from ROJMAIL2016.ROJ.corp (10.139.1.110) by ROJMAIL2016.roj.corp
 (10.139.1.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 10 Mar
 2021 10:29:25 +0100
Received: from ROJMAIL2016.ROJ.corp ([fe80::ac45:1b07:6a6f:c237]) by
 ROJMAIL2016.roj.corp ([fe80::ac45:1b07:6a6f:c237%4]) with mapi id
 15.01.1713.009; Wed, 10 Mar 2021 10:29:25 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 12689618-ef9b-462f-9d68-6c73f72775de
X-AuditID: c0a80408-6231f700000053c3-bc-604891769b60
From: Gurrieri Stefano <Stefano.Gurrieri@roj.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: HOWTO enable Xen on my board based on STM32MP1
Thread-Topic: HOWTO enable Xen on my board based on STM32MP1
Thread-Index: AdcVj1dWrgn5iepWTpm9UYvkY91w1w==
Date: Wed, 10 Mar 2021 09:29:25 +0000
Message-ID: <1449aa784e6243ee9a8e33642dcb7693@roj.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.139.100.56]
Content-Type: multipart/alternative;
	boundary="_000_1449aa784e6243ee9a8e33642dcb7693rojcom_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsVyYMW/PN2yiR4JBu9aOCyWfFzM4sDocXT3
	b6YAxqgGRpvEvLz8ksSSVIWU1OJkWyWXzOLknMTM3NQiJYXMFFslIyWFgpzE5NTc1LwSW6XE
	goLUvBQlOy4FDGADVJaZp5Cal5yfkpmXbqvkGeyva2FhaqlrqGTnlp+Tk1+uUFqskJ+nEJlf
	GlKalGqlkFFSUpDwRSSjfz1PwWGJivvfl7I0MB4S7WLk5JAQMJG4uGwBaxcjF4eQwGQmiUP7
	frGDJIQEXjJKnPvGDZHYxSix/cE1xi5GDg42AUOJ/ed4QWpEBMwlti7ZwghiCwPZm85A9IoI
	2Eh82vWEFaRcREBPYv7tUpAwi4CqxJuJl5hBbF4BM4mfq/tZQWxGAVmJCbsXgY1hFhCXeDH9
	BDvEbQISS/acZ4awRSVePv7HCmErSnTe7WSCqI+TWLpmFQvETEGJkzOfsExgFJqFZNQsJGWz
	kJRBxHUkFuz+xAZha0ssW/iaGcY+c+AxE7L4Akb2VYy8xbnFmXl6RflZesn5uZsYwfHOwrGD
	cfPkr3qHGJk4GA8xSnAwK4nw+h13SxDiTUmsrEotyo8vKs1JLT7EaAEMhInMUtzJ+cCEk1cS
	b2xggMJREucNM4uNExJIB6aU7NTUgtQimFYmDk6pBiaOKVbnN6Wn6ZpJzNh+Rrb8gfQylpzK
	MN/GM5wpu3vmHm1oC4470CfCsEegedOLGUz7SnI91H0nzZX5Ns9vevwltaovRzp/Pfwf3J9c
	/fN3S/ZCGZ05+acdYif8uDGPz8rP4Vzol88NBU0embK+i5t4N847xX33irfRg5tMvNzL/Cx3
	2E6932H952Hvklvt7dJKN+yZ+HgOVUbt3VzvpHX24rcp39wk12dcZ9WeuOLzmsU6Js3fdcLO
	r+p/1N66Te312+3zKmVMuQ56Chxd9rnzXaoJ24VzGWdWX1yy+/2lsFMs0lu2/ingOJjQ4b74
	4dTo5adbUw/G/OqJ8gxn0zL4Mj1aL8k/cMaEmxlbgqqUWIozEg21mIuKEwEgrWLQgwMAAA==

--_000_1449aa784e6243ee9a8e33642dcb7693rojcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm working on the platform STM32MP1 based on cortex-A7 dual core. This is a=
n armv7-A that has the "Hardware virtualization support".
My current Linux BSP is built using Yocto Project... but now, I'm asking how=
 to enable XEN on my platform? Is there a procedure to follow to try to expe=
riment?

Thanks a lot!
Greetings,
Stefano

Follow us on YouTube: https://www.youtube.com/channel/UC9nTKjeq8UdxExKnCNXDP=
mA

Prima di stampare, pensa all'ambiente ** Think about the environment before=
 printing


ROJ S.r.l. - Biella - Italy  (www.roj.com) 
Tel: +39.015.8480111   Fax: +39.015.405815/8480209

This e-mail and any files transmitted with it is confidential and intended o=
nly for the stated addressee(s). Any unauthorised disclosure, use or dissemi=
nation, either whole or partial, by person or entities other than the addres=
see(s) is prohibited. Please notify the sender immediately by e-mail if you=
 have received this e-mail by mistake and delete this e-mail from your syste=
m. 
Please note that any views or opinions presented in this e-mail are solely t=
hose of the author and are not necessarily endorsed by the company. Although=
 the company has taken reasonable precautions to ensure no viruses are prese=
nt in this e-mail, the company cannot accept responsibility for any loss or=
 damage arising from the use of this e-mail or attachments. 


--_000_1449aa784e6243ee9a8e33642dcb7693rojcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micro=
soft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xm=
lns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://w=
ww.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.StileMessaggioDiPostaElettronica17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m working on the platform STM32MP1 based on c=
ortex-A7 dual core. This is an armv7-A that has the &#8220;Hardware virtuali=
zation support&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal">My current Linux BSP is built using Yocto Project&#82=
30; but now, I&#8217;m asking how to enable XEN on my platform? Is there a p=
rocedure to follow to try to experiment?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks a lot!<o:p></o:p></p>
<p class=3D"MsoNormal">Greetings,<o:p></o:p></p>
<p class=3D"MsoNormal">Stefano<o:p></o:p></p>
</div>
<!-- --><br/>
Follow us on <a href=3D"https://www.youtube.com/channel/UC9nTKjeq8UdxExKnCNX=
DPmA">YouTube</a>
<br/><br/>
<span style=3D'font-size:10.0pt; font-family:Verdana;color:green'>
Prima di stampare, pensa all'ambiente ** Think about the environment before=
 printing
<br><hr color=3D"black" size=3D"1">
<span style=3D"font-family: arial; font-size: 8pt; color: #000000; align: le=
ft">
	ROJ S.r.l. - Biella - Italy  (www.roj.com)<br/>
	Tel: +39.015.8480111   Fax: +39.015.405815/8480209
<br/><br/>
This e-mail and any files transmitted with it is confidential and intended o=
nly for the stated addressee(s). Any unauthorised disclosure, use or dissemi=
nation, either whole or partial, 
by person or entities other than the addressee(s) is prohibited. Please noti=
fy the sender immediately by e-mail if you have received this e-mail by mist=
ake and delete this e-mail from your system. 
Please note that any views or opinions presented in this e-mail are solely t=
hose of the author and are not necessarily endorsed by the company. Although=
 the company has taken reasonable 
precautions to ensure no viruses are present in this e-mail, the company can=
not accept responsibility for any loss or damage arising from the use of thi=
s e-mail or attachments. 
</span>
<hr color=3D"black" size=3D"1">
</body>
</html>

--_000_1449aa784e6243ee9a8e33642dcb7693rojcom_--

