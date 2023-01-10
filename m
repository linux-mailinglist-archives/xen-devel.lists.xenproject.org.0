Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803A664325
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 15:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474724.736026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFFUJ-0007iY-2o; Tue, 10 Jan 2023 14:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474724.736026; Tue, 10 Jan 2023 14:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFFUI-0007g1-Vn; Tue, 10 Jan 2023 14:20:26 +0000
Received: by outflank-mailman (input) for mailman id 474724;
 Tue, 10 Jan 2023 14:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrXS=5H=zf.com=youssef.elmesdadi@srs-se1.protection.inumbo.net>)
 id 1pFFUH-0007ff-Bg
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 14:20:25 +0000
Received: from de-smtp-delivery-114.mimecast.com
 (de-smtp-delivery-114.mimecast.com [194.104.109.114])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb86f9b9-90f1-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 15:20:23 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-ae_4dJ7pNuSO1jSvk4bUKQ-1; Tue, 10 Jan 2023 15:20:20 +0100
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::22) by PA4PR08MB6047.eurprd08.prod.outlook.com
 (2603:10a6:102:e3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 14:20:18 +0000
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7]) by AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7%2]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:20:18 +0000
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
X-Inumbo-ID: eb86f9b9-90f1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zf.com; s=mczfcom20220728;
	t=1673360423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=/cGjmQeA5LXT2I8FikypkzEeMiaptjZePldsNjHLTvk=;
	b=ZI9gtnFDc+uInj7CBMdSYF4Zz8dxD9nEsiU+UHjoZ+XbQlvJE8tebgZxWvcxeGVf5+im82
	EstPNq0Z3ar6VQ9yBYHk8H90yh8CBL1WLYZK3/6DNiYQYvN3ce1zJsVwb+Czj+/79g0baE
	Rs6WS4xmdY1aofkrhsTSNqwzSfNsQUE=
X-MC-Unique: ae_4dJ7pNuSO1jSvk4bUKQ-1
From: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Topic: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Index: Adkk/qg7kRGuW6KDReaFxxX6SSJ/1g==
Date: Tue, 10 Jan 2023 14:20:18 +0000
Message-ID: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Enabled=true;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SetDate=2023-01-10T14:20:17Z;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Method=Privileged;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Name=Internal sub2 (no
 marking);
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SiteId=eb70b763-b6d7-4486-8555-8831709a784e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ActionId=eeca7847-45f1-4c89-8855-4db1e219313e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR0802MB2578:EE_|PA4PR08MB6047:EE_
x-ms-office365-filtering-correlation-id: 3b6818af-14ca-44af-c33f-08daf315cd30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: XozK9bbrrn0qoH9EPF6QWM3hGHTVJqsoSh3MWK2ZpFukXThZ1zC8wRmU/n4I6xGel4jr+OiSYKdRfqQ5uqNFaQHBpHtm1OP135/PmflG83xYd7WsyqwSviYOVYi+AgLc5QqymMtU7keD482WPN6kgftvKE34PEjicEDRTUly5cNh/eLNqqwbzm5D/NX/093T7W2mepXSaMtk2HiJC/52BywCAxmJQ7W3PHTjmMoj34k2PqHj30BaQz2j5rENcD5fPy1lyhADhLm+G38kLgdDW7ZeN+cTdqTwcKfL8ti6J7D4+IAPRWNoMwzIvD+sjPgoOHuUY7ZT8EKYBOloX4tk6pfAI/7JYRf1xGhDS+bbM3h6zkbQtNzebZ/wWIW/rtrBr1eq9yNJQMRjLInbx5C/SXfZ7uU9j7eu5O0vOw1NY+0XHNmsFEQDEBEx0eQyTv95aUwoJmhSu7tPgCyF9gf0I2KdBH0MgkgeJeExIKoyfA86XgXdOvfr+uCIs7M4tmCEMWLcNlu0+v5ThQQ2E1PNQM51PVTrKQmJdsLy+2kLWuLjAITeo/BeGWOKp69BGM5YYDeXj+wFDS/5/Jfg6r/e33oh6sfk0LE3eQssr5mFd2NDmrfKC870l3nqMQwo/cFVTpgvvweCc64pePifAxxD+q4NOJT4Vxy2NlyyN9CjQt0iUMp6Fgo7P1xD+M/c7q4o+8qjj7S0eY7P5HQQtEluiQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0802MB2578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(71200400001)(86362001)(6916009)(316002)(8936002)(52536014)(2906002)(38100700002)(478600001)(82960400001)(19627235002)(66556008)(66476007)(66446008)(7696005)(64756008)(26005)(76116006)(66946007)(41300700001)(186003)(9686003)(8676002)(33656002)(6506007)(38070700005)(122000001)(55016003)(83380400001)(5660300002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wz0MOUEKUg3eF8xUCfV5oZOCIDuVDpQEXspbJFGwkbl2/V2Z2kmMF5jOkLIE?=
 =?us-ascii?Q?OAaZXAZtZio9gcwOWgtQW+tsCYRkzbo5AnyQ4XUm0ClSbP0yrshiwn4DcOM/?=
 =?us-ascii?Q?i2CjiAToaTu36fX3QHlG9UJZBjM1zegzoDaxpplLH3mleaydj5Dy6WShnFl0?=
 =?us-ascii?Q?uG9yHRPNj8c63IdhdiwbbiAxY3WWErHCLsfNInSU5EfNx5eef1vKUSqDSnNy?=
 =?us-ascii?Q?UXiNFf4IxHiOZihxXVVv1rTcM9YnQiYrm3ALof0TF+MJflPGXRd3pnygt09H?=
 =?us-ascii?Q?dt1iDUowMEcYBWz1HfMSrrg+qoGsJgnvW3GXmr4T8C9GBPbJ2POYsWC4ylCL?=
 =?us-ascii?Q?luW8qUhEbSbCz76ccIlWLlOYQcSye4cUv4ZOwjNjhaIq/F4Y8e/Ljd/javKE?=
 =?us-ascii?Q?OhbAoX+TR2j6h0wub2JJc1LKCmsZZOEwCY9P5e7W7cRT8jeeR3kKS/8V34Lt?=
 =?us-ascii?Q?iY67BfuhE5w8v0FH5SGObo6GF+5rsUOSYWX2a4nek7lM8K2pbfNdWmVhGCca?=
 =?us-ascii?Q?t/njdpqX48lyTiggTFMhpZJdvQJ7HrajLSxNF0QeKovNrzfXR4CiNxt/avIX?=
 =?us-ascii?Q?dxUpmrBiKIkzBdwrMvN6cHP3/HlIG6DV+k8BXKp1yIWuUyE2Flfx8Q3quXcs?=
 =?us-ascii?Q?n/0PLtxnX93iZRd1r8AOIJtLqiOchsEcu/uMlQBRo/QVNTASIFPKVENUGQq/?=
 =?us-ascii?Q?i6mWMEcs25qxH1C6vnZGb5W1SM9afXpwkn0hYMVNguOxKnQCKAstKVW/jxHC?=
 =?us-ascii?Q?DoYV2qqLpx6hiGHIrBPPMdW/mqGDD4vCrgs6SfTbGUhQjXiO3xDplxFDcjE5?=
 =?us-ascii?Q?VE/u3NPu8+av8S9UtxIkOJCaKCts/2zvirDjJ0vK2noc4+KFAzXyaV2Ou8Ls?=
 =?us-ascii?Q?F2uq0UklNfo9HRZCv6w502esmLC1s8wQTsp0hqHKakmzuuxuWsQIlWTsRclV?=
 =?us-ascii?Q?xyovW7rUlovxvmYBFeEK+XSyaNPWxFlgKREZelM+BO5cxNH7qzd1hKFTJ4by?=
 =?us-ascii?Q?E7ukfZzFJMEyQSXE72PB6po1T5aE3frQ29QEHyaZ7uYy1XWZVhffNhAf5JEa?=
 =?us-ascii?Q?bNcfZnfXcI8TUBt/kJRjPV62wrV83TpbTzz9/YhXgx157TF4XuhefnNCj679?=
 =?us-ascii?Q?8JpgL0nvBj++WDw+tvpUIuIM15Vl1kYwinDhkM8ypWjfu1q16mLDQdu67pLF?=
 =?us-ascii?Q?JFevruxtt0TUBhkWJa90yxDyQ/AGLhor85JIHzKxbu3X/QLe4YiFRNIQc0zm?=
 =?us-ascii?Q?Ie51Ma+qqjm2PEytOh5M0T48kqsxz4Tu8X6rBnC1CVvfAze8DoZzyL5ZlJBF?=
 =?us-ascii?Q?HkVTucjHlVGkl5PDTPa01WclfSULpbaddJLISipMeNdU8Lu4VRs3d6NGZ06l?=
 =?us-ascii?Q?vCE9smrqexuABEgAIGUOUNKVafavBXsbzbUCIDY6v2/hUu3MDNZFvUyEd41S?=
 =?us-ascii?Q?dJGD93sW9a3GM+pt7zYDyUM/1k+TFA8KkTS7Wm8GMtOsrWTZSUIAX8Q09v4+?=
 =?us-ascii?Q?oZl0Kj2toIGHIFooqTtO/9RcndhZ2CFu0SxXwqCFklNHv8Bf/R+cIEDF0p0S?=
 =?us-ascii?Q?XcmyCFAb2HMWNHNg527ZPEpy4iC/bu4kb1f1PAyV?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VXmaIekqeDtV+ii4zkHKR0cjZAFYivVT3QqZi+xD6M2dd8B36cKWbh9gGhP/voyRsmXN/aTf7E0aTQRdl1IElVXlgoBfeAaxoXwxki1GMGgWa3u8W2jVRe9ksBJJklzVaxkCnIaBLOtPTCWxumLK01b7y+5F0KJUVkyN/q3dGLBcalooDWHx5Gy7VMU3JNl+eLS24jyuEtRW8I5JGtWkB7IGpr3brsynhaUn1zVTG6JZpJBw5bGEfIF7qUsClec9hJ9MaZFDv2Vi5dAzfFnf/NwEOoMEp6iTZw0GWgTU6a9GEl5yrhmTs6UmRnjCdRpiQERdy4jXorLzHlaj0aQqxDiDiRqiES1N8C8XPrNyGMtGJb+NtWHd216unGJrP3YSXVI97F4HL7RdXZW46+vm09pZHYQgeyDIqMP8NKs3Qlgp6jdsnUcprfXL5cxDu5NVCx0WLql2hV+K6FsqoKdFWLmRKrs5kQaK02tJfukPRZHbuu6sSGbw9Uf6Fjk4cGovwHvaKKZ1qojlmuZHYnoN9qa0wFwgFwO1wwQv8rD87UrXb7bMhuoGDzTYqT3o9OFc0yoLeu+xYTqN+vXgDrU9odQUkNYyi5RmtjAyRJtwjSpisgz7Ocrxc2e10FkiX4mV4tJBgSnnSje+POzGG5cCMD1RLMAxSrrSsi8RVlg2S/mds99Knk6Mp9T2dmtAF/x27kbA4EuttsyJGya0pUt3H+js6Nmd4sQoLdAY/ZRyloTsS2q6CEuAvBb0agVeUgu8XZQUJ9RQslAK3D2M1intGA==
X-OriginatorOrg: zf.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2578.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6818af-14ca-44af-c33f-08daf315cd30
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 14:20:18.8109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb70b763-b6d7-4486-8555-8831709a784e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoUccbDIVHxkqpltGYfAZqaHsSbYy3SYNlLPlL29wEMg1jxySax1PI0Bza+tzJhSMMkT24ISK4SSWasbMxb+McshRAnPioBK9pjLbI7sEbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6047
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zf.com
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0802MB25781717167B5BFC980BF2A49DFF9AM5PR0802MB2578_"

--_000_AM5PR0802MB25781717167B5BFC980BF2A49DFF9AM5PR0802MB2578_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

>> Hello,

>>
I'm trying to measure the performance of Xen on the S32G3 microprocessor, u=
nfortunately, after following the BSP-Linux to install Xen, I found that Xe=
ntrace is not available or not compatible with ARM architecture. I have see=
n some studies on  Xilinx, and how they made Xentrace compatible with ARM, =
but I have no resources or access to get that and make it work on my Board.=
 If there is any help I would appreciate it and thanks in advance.

>> I have some extra questions, and it will be helpful to share your ideas =
with me,


  *   Is it possible to run a native application ( C-code) on the virtual m=
achine, turn on a LED,  have access to the GPIO, or send some messages usin=
g Can-Interface?
  *   My Board has no Ethernet, and no Extern SD Card, is there any method =
I can use to build a kernel for an operating system with my laptop, and tra=
nsfer it to the board?
  *   Any suggestions in detail to measure the interrupt latency, Xen Overh=
ead, and switch context (time to switch from one VM to another, that's what=
 I wanted to measure with Xenalyze)

>> Best regards
>> Youssef El Mesdadi


--_000_AM5PR0802MB25781717167B5BFC980BF2A49DFF9AM5PR0802MB2578_
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
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:0cm;
=09margin-left:36.0pt;
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
/* List Definitions */
@list l0
=09{mso-list-id:1371146029;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-1672710734 -479298432 67567619 67567621 67567617 =
67567619 67567621 67567617 67567619 67567621;}
@list l0:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Symbol;
=09mso-fareast-font-family:Calibri;
=09mso-bidi-font-family:"Times New Roman";}
@list l0:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:"Courier New";}
@list l0:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Wingdings;}
@list l0:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l0:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:"Courier New";}
@list l0:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Wingdings;}
@list l0:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l0:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:"Courier New";}
@list l0:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-18.0pt;
=09font-family:Wingdings;}
ol
=09{margin-bottom:0cm;}
ul
=09{margin-bottom:0cm;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt; Hello,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;m trying to measure the=
 performance of Xen on the S32G3 microprocessor, unfortunately, after follo=
wing the BSP-Linux to install Xen, I found that Xentrace is not available o=
r not compatible with ARM architecture. I
 have seen some studies on &nbsp;Xilinx, and how they made Xentrace compati=
ble with ARM, but I have no resources or access to get that and make it wor=
k on my Board. If there is any help I would appreciate it and thanks in adv=
ance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt; I have some extra ques=
tions, and it will be helpful to share your ideas with me,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1"><span lang=3D"EN-US">Is it possible to run a native application ( C-c=
ode) on the virtual machine, turn on a LED, &nbsp;have access to the GPIO, =
or send some messages using Can-Interface?<o:p></o:p></span></li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1"><sp=
an lang=3D"EN-US">My Board has no Ethernet, and no Extern SD Card, is there=
 any method I can use to build a kernel for an operating system with my lap=
top, and transfer it to the board?<o:p></o:p></span></li><li class=3D"MsoLi=
stParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1"><span lang=
=3D"EN-US">Any suggestions in detail to measure the interrupt latency, Xen =
Overhead, and switch context (time to switch from one VM to another, that&#=
8217;s what I wanted to measure
 with Xenalyze)<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt; Best regards <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt; Youssef El Mesdadi<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM5PR0802MB25781717167B5BFC980BF2A49DFF9AM5PR0802MB2578_--


