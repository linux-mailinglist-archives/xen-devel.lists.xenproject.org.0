Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D266E026
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479509.743404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmmi-0001zg-Cm; Tue, 17 Jan 2023 14:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479509.743404; Tue, 17 Jan 2023 14:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmmi-0001wp-9o; Tue, 17 Jan 2023 14:17:56 +0000
Received: by outflank-mailman (input) for mailman id 479509;
 Tue, 17 Jan 2023 14:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f95U=5O=zf.com=youssef.elmesdadi@srs-se1.protection.inumbo.net>)
 id 1pHmmh-0001wj-J4
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:17:55 +0000
Received: from de-smtp-delivery-114.mimecast.com
 (de-smtp-delivery-114.mimecast.com [194.104.109.114])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb457df5-9671-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 15:17:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-2c0gRrfxNTGPpfvLnMQOQg-1; Tue, 17 Jan 2023 15:17:49 +0100
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::22) by AS8PR08MB8369.eurprd08.prod.outlook.com
 (2603:10a6:20b:56c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 14:17:45 +0000
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7]) by AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7%2]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 14:17:44 +0000
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
X-Inumbo-ID: bb457df5-9671-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zf.com; s=mczfcom20220728;
	t=1673965073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=WI+xmRfVT/ikgkE1BrdEaoyfHX7oprp9wJar+Qx5TGM=;
	b=sVhGoXFBe7z+FGIYcMr6yTRMhBuP9HRlF30Ju+j87ZBEhVC7V/RMPvrztUMAvZTgBTOp81
	ASlUcv85z1j96emkKoJqyuWRbZEj2r+KPVfWssBfiiGlV1/5WrlAnqJDE5dybbWB/bZ7G0
	hwio5mD/8SjND5FuMSdLPLoHTcdfxGQ=
X-MC-Unique: 2c0gRrfxNTGPpfvLnMQOQg-1
From: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
To: "psujkov@gmail.com" <psujkov@gmail.com>, "dario.faggioli@citrix.com"
	<dario.faggioli@citrix.com>, "ben.sanda@dornerworks.com"
	<ben.sanda@dornerworks.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xentrace and Xenalyze on ARM S32G3
Thread-Topic: Xentrace and Xenalyze on ARM S32G3
Thread-Index: AdkqfUPTEGGUes6ITFy0mgmDyuKtLw==
Date: Tue, 17 Jan 2023 14:17:44 +0000
Message-ID: <AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Enabled=true;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SetDate=2023-01-17T14:17:43Z;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Method=Privileged;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Name=Internal sub2 (no
 marking);
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SiteId=eb70b763-b6d7-4486-8555-8831709a784e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ActionId=72c8d641-f9cd-4380-aa13-147d61a2fa7c;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR0802MB2578:EE_|AS8PR08MB8369:EE_
x-ms-office365-filtering-correlation-id: 621c35cd-60d2-4eff-8131-08daf8959a3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: OidaqOiOiagOAIUPxA48H697b8XH6z10GtfqjvPZhoOin9WZy0TkdwzcZR5vpGj6oiyPAMEYjXvRsQGMh9n4sMKwlmc+AyenrckKpZJGLVZAeHzMOFNTac7tqBhHvvLeBhJ+ag9AUHEXGPw/AvYFgOf6c49b/jl0FQVSjECAVBmlFM9gWtEXI93tiQGCWgQ03gRSjdcC6WVORVmJagnv0d5lQsKfbD8XwYYtbyMcF+v74f8CLgs+RGxD5CUK7CX+9E/yztPA8OD3/iCJ+/OohBFcCCeTtSMfJjRQWBkqjaTW7JN77zj5MHxd5RgDetio4bmPE4vJW1ht68fI5HlnCBwkfYwnlgHWITWkrAqHPP7YSJS2cFYJLLMKGzVgRZ5UQCOv8wKuaYIEwSo0gSULbHk432QDF7kA/X9feMHcmU3IYrHz4eRWFkwJkjCai6VZDqyWIzI0idYVN9qT7RpCait9CBBcDVBVXI3R0vK2UwxaVG8PgUcdwbws4ECccuwO3rfU/2PN0xM/CCDH1p58buAYnnepA7i5Ctb+i7067GTvN3Asrv2zqWwKEcSfyrrh534x49SZms409uinvv9SSinko8LVkjbL1Cv9kX06YiDi6XxLctvvHwQLsQlKTZijvWZ8uZtZ61GRqWGpwzzUuRr9wiohiSxRPygB4wTOIYC3Pqbfq5WAmX71ukIs0bqlaCIpuzE2MlhLXbSZF6ca6tTKQz/nx9hu1FMMcbFUhsY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0802MB2578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199015)(71200400001)(6506007)(7696005)(186003)(478600001)(9686003)(26005)(33656002)(66556008)(76116006)(122000001)(66446008)(19627235002)(4326008)(110136005)(66476007)(64756008)(8676002)(316002)(83380400001)(41300700001)(52536014)(5660300002)(8936002)(2906002)(55016003)(86362001)(66946007)(4744005)(38070700005)(38100700002)(82960400001)(36394005);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GcOseDVF7sfm3R1bUoS0FiCCj/9yiN/HNykfOchGL7ZxsIBvsXMLrcowuY6g?=
 =?us-ascii?Q?kXSFKT3wLdqoIrTumvJSW3Nmr5I6lyVvgCwRQenZAFn9fuCtOFaXKK6gAMUz?=
 =?us-ascii?Q?ocnsXc0UmGdf5nK35idBM7RmYfG536fXV7MAE9OBmLOp0TzZ/CiJU8uRZwKe?=
 =?us-ascii?Q?IpPnDQ23X7zMM8TWOK7TiWQbUsUDDDgjfCWFlGrglO+7WhL4nmsv/ptUJenU?=
 =?us-ascii?Q?kL6Bgr9ZoFeebRrtIrrAAikYUvnMH8Kss92BS4KgyagVBVmetz4o4tejMlS9?=
 =?us-ascii?Q?XaDRxuKrCTR03XZ7EEeGyuEAWfChSq1ykvPdCO6LUJ8syX0U+ZVPTOxJMcls?=
 =?us-ascii?Q?y5wGKVjnMUIn0WiPimoI0Cn50exqg5ksN2hONYZBOdJkfd59Re6cT8JP2rul?=
 =?us-ascii?Q?ISMdRA3zVNW1O/LZ307zf3sWM05AE2QKdRPFRW7uZQeWJRjG6i4UD/xjKFHu?=
 =?us-ascii?Q?W48IrBhKGPNpvhNWCFFj6k2VolNdRZEnVdAtq3zQTnOmDJyoZbPA4xSzjuUa?=
 =?us-ascii?Q?LmFKohRxRu2gqywvb2soolkUeaTYy8Hsxw+xYh4e3kqEH/Xv01BmefAtqwjA?=
 =?us-ascii?Q?eaX8tVv0xLFgYGxkDvRIBPvgE/nU71j09ffGvQPtff3Bbt072avkoy3se9R/?=
 =?us-ascii?Q?dw33Sd5++EJim5s6oAIV2/ZaCAPaIkkIH8vND1AGLlEQtO0bBDcU1+aB81TC?=
 =?us-ascii?Q?ksAfVHcx/FW5W3ZBAy6s7CAWb09e9TeQ/GMeJFlz5TtzMmU642aeuZrAv7Pe?=
 =?us-ascii?Q?1tliTlEkpbPjeecSE+Ll0gSwCdAfwGLH3ryLAoX2KnLiEbBw6sgpAGC6CNvp?=
 =?us-ascii?Q?g9ATfT2aG5OvxolaUKNHZYBY57SUQUL2wlxaIS+kEuNlft/TSXj4c+2t/2sv?=
 =?us-ascii?Q?35ZDvtl59vbdnlEqu0/oy2xmLm8hCdM3h0oFToSwRjCSb7jApcBxakDKK6xc?=
 =?us-ascii?Q?59MdvzfMSZzy0EBfpxiXOn9vno0meiZE8iRRPOOouUjuUKH2ll8pWqzaCexJ?=
 =?us-ascii?Q?GWkM8XYNj8Gvtm+8b2eHfdlpC+daTwSpo7ld2ni5DEbV5gspsUh2IOI/D2ZJ?=
 =?us-ascii?Q?uDAG81WzGozAxuEbN0XxrzpHecf1ZjwNEN6Y/hYw5yQMuYRq0mQawIWQkaPs?=
 =?us-ascii?Q?ICN/bqogyt9RtcJPttZLxn/W7X3ve+g+ZRWGtYgT8ubBk5y4nKP6n0UMhwm1?=
 =?us-ascii?Q?Lj+hxjYFge73JSDjsD2s3T/YdY9H5Ikx8iVPp77yZH+3gWQBdF7Spvv42AtP?=
 =?us-ascii?Q?484yFKy4+CHHM/8MKExkiStBm9V2gPcDIYaTQH7o5ATRzjBIe7Q83m04aM0t?=
 =?us-ascii?Q?Dhhm9ds6Q4GLHcNSNXbtarFfXUa8uAa5uMaaPd5ei3Wb9SALcV1i/ryZN7S6?=
 =?us-ascii?Q?XXb6fk+Eddp5llK6lWeauVNkp7ijFgpah1PyeZ5wv2gVUb766Rwh09mFMeRF?=
 =?us-ascii?Q?+bliPSoDqgYfXyeYNomZ9lTuM2MgvLHuN3i0Hej8kcTcz+oxaNj11ejZZSci?=
 =?us-ascii?Q?+gdWf/DzGGFVlZ5ILtTBpTRjcqntZY+Vqab4JrgJyOAVTMeN/kU9R7poryhL?=
 =?us-ascii?Q?nfEG97xaxEMuMkZ6Rl0A2Na9w30B1valx/1b+y0rfNiIlO9jgHeaanh+17mv?=
 =?us-ascii?Q?Aw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: h42hIyRj4U63e03iKl63Vt4QCdspRfWTm6NQI35yVLZpQ+SR/nhY5QjNCMPhCxvDB83R0VkLkDHAjVf4fYkuyPIKK6ya0lHbemdx4NmncT88ycCLkvTIRUbStAxDI1O9s4Zl69rsXG3raKPzByM8w7KedhFWtGUbEqGv9vR046kZq1WaLlwwEmFIKEs9JBNvXIVH9G8G9A1LbE7hOIG3qtvu20GWv7u4RcGs0lfufzxHk90FcDFa/N9R3Mf7jc1oguG2Pq7YMga/KR5FWrKzMeqAz1h3MHmgvrb3tjvqpSD8PVhOcV23gRU00BY0/qqXiMCK/63oDWzwRqcOmzv7lL/DBGbkvPfVBOBlVXs19EP4NrGW65Q/p9tx8avXy5t/L7zodpLb/hu8D2oqKWO3fJhNEIxfoYTg/F7oy7vjNHqwndLRjB7Ge4EsAeURysO82Uy8rlkTYSV+aXM3YYbNI9x4J0L3dbiUJIt8cL5y296cY/vTHr8pKh1b/3GfAw27f0ONnbB0czwnlwIeRlv+HCjh0uGRJCGlVoKvPkSbZlgjrJgtdRUFHoNtdcHx6tfei9J90URsa/JbXy0kIvI2qbw2aMNgs+BGfL452zU/Cg3KKP/WC2N+oRhGlkEfMwNzZP7mkDMvBEDzwIguK3TzNgcPgYk8gKCiXf96mw2msWR7Z8tyc4sd8friq0+B6OBV7NphHXJXczJh2M/H1Nz36hfpP2H4PP0VUeUeSXKgE2YomrI5wrnA1MtsZUH5iXzjkUw/oF6SBEx0L9sigab9pba9V8Unh8hCRVg65S8uwAZHpTqjpzM3pyP42Gx1SOFShZacjVdcOuz0rh2VxamvlT3mZ1uW8DzluaKatLQ6y2iNAnmQNFzV/fvuY3mqihS8
X-OriginatorOrg: zf.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2578.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621c35cd-60d2-4eff-8131-08daf8959a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 14:17:44.7858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb70b763-b6d7-4486-8555-8831709a784e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ev/SbTFgUGrDJt3qXFDK0p84rt+PBlvUVd9YELTyQr9yG2FJptRlnKw3hGlN1lx5oCCYdlbM1txjK7oUWvAvt40PYSH+/VcvMQdYxQ+3bxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8369
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zf.com
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69AM5PR0802MB2578_"

--_000_AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69AM5PR0802MB2578_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello everyone,

My name is Youssef, I am an electrical Eng. student and right now I'm worki=
ng on my thesis using Xen hypervisor on an S32G3 microprocessor (ARM archit=
ecture). After building my Yocto-Image using the Linux-BSP of the microproc=
essor, I noticed that Xentrace and Xenalyze are not working because they ar=
e not compatible with ARM architecture. I have found on Xen.markmail.org th=
at you have already done this, I tried to understand the changes that Mr. b=
en and Paul did, but I could not understand them. I wish you can help me wi=
th that by sending me the repo.

If you have any more information that could help me to enable Xenalyze and =
Xentrace, I would appreciate it.

The Xen version I am using is Xen 1.14. ( this was downloaded automatically=
 by giving this in the local.conf file DISTRO_FEATURES_append +=3D "xen" ).

Thank you so much In Advance.

Cheers
Youssef



--_000_AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69AM5PR0802MB2578_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-language:EN-US;}
span.E-MailFormatvorlage17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-language:EN-US;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello everyone,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My name is Youssef, I am an ele=
ctrical Eng. student and right now I&#8217;m working on my thesis using Xen=
 hypervisor on an S32G3 microprocessor (ARM architecture). After building m=
y Yocto-Image using the Linux-BSP of the microprocessor,
 I noticed that Xentrace and Xenalyze are not working because they are not =
compatible with ARM architecture. I have found on Xen.markmail.org that you=
 have already done this, I tried to understand the changes that Mr. ben and=
 Paul did, but I could not understand
 them. I wish you can help me with that by sending me the repo.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If you have any more informatio=
n that could help me to enable Xenalyze and Xentrace, I would appreciate it=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The Xen version I am using is X=
en 1.14. ( this was downloaded automatically by giving this in the local.co=
nf file DISTRO_FEATURES_append +=3D &quot;xen&quot; ).<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you so much In Advance.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cheers <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Youssef<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69AM5PR0802MB2578_--


