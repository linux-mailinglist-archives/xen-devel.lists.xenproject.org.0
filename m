Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3647726A6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578467.905983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0fu-00054I-KU; Mon, 07 Aug 2023 13:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578467.905983; Mon, 07 Aug 2023 13:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0fu-00051R-Hh; Mon, 07 Aug 2023 13:53:34 +0000
Received: by outflank-mailman (input) for mailman id 578467;
 Mon, 07 Aug 2023 13:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNd=DY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qT0ft-00051L-7x
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:53:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5b2f8a-3529-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:53:30 +0200 (CEST)
Received: from AM6P191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::44)
 by DB3PR08MB9058.eurprd08.prod.outlook.com (2603:10a6:10:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Mon, 7 Aug
 2023 13:53:28 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ab) by AM6P191CA0067.outlook.office365.com
 (2603:10a6:209:7f::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 13:53:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.15 via Frontend Transport; Mon, 7 Aug 2023 13:53:27 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Mon, 07 Aug 2023 13:53:26 +0000
Received: from 35c2b4c0cdd9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3D2EBF2-C9E4-4D35-B701-216097463F2E.1; 
 Mon, 07 Aug 2023 13:52:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35c2b4c0cdd9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Aug 2023 13:52:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6336.eurprd08.prod.outlook.com (2603:10a6:102:158::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:52:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:52:55 +0000
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
X-Inumbo-ID: ca5b2f8a-3529-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptWFYO0ZIsWUELtRyAPn9T7YAWUQGbKkLItJePrUfLU=;
 b=x1yW/1Kvq48a66mD4RDXob2giZ6vYVcF/4ah+C9fOEb16t9VHuHb3KAWu63z4EIdSE64RxSb46YCzAeL3YAdbK/5yFbC3/kOflaGkt6pT93UMZ126vK9d1JBsEt239pp1VHsydLFCHYCvN5a0etRdKHs5aV6F8ih9cRyIO8ElnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 488fbd9322a799b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHETnV7kTTLzkR1hIkqlq34v5njh8U7kbVDA7dcWJdETE9jLbjUVDDltOGkjWunYdRRuamOUZPY1aOuU6vXxmoru2Az7FD4kOb/r43g8H9uycVgXm8NbCciMJAp65sdL5intj5M82V5m241qM8+h0D3fgGM7Jj949E/LaCus2C2G+NEXUDvZdzc6tD3CiAKfJ7wmv5vsdyb1AR/w30BBbEkHGWVRTdxiM8rtpWm2b/L6LyUmuMXbjcqIOsfsat3oLEkj6g5ddoOpVnvFvq95QbwZEgwArLMEYtsQHmKCnqNjDHzta3dUBFXoXua87jbodB3Bt9XIs7zCUsjqbE5fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptWFYO0ZIsWUELtRyAPn9T7YAWUQGbKkLItJePrUfLU=;
 b=M1MzhZFAoGcnyAziExBu6p0F5UvdR0lOZaU+zxRlEOyhhg8VkgD+zW/HsOKMriuK/6dY9Df3neNAD2keGcikwuwu7iF2RUfb2Qq5s7ZNYVop6GH11AaB3QT1S8tGUJb11x7EnPz5NG5eHzSHdneRN1zmaD1A8mYbHsNs8o8R0RI0P/K2Dv2bqh554QfHzEmVrOFS4Af4EMCy1FgGW7t2YK4QpdsqGYLxPJ0yXe3koRugPNkXpE7/IUtR7RbIMGR2/yUCcveS5QnazWVHTXTuOCKsA1S8GYP6paScylTuKxIRf14vjpYEfdLTa1MYqYH8od2jppJkPAuEf0kanp3/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptWFYO0ZIsWUELtRyAPn9T7YAWUQGbKkLItJePrUfLU=;
 b=x1yW/1Kvq48a66mD4RDXob2giZ6vYVcF/4ah+C9fOEb16t9VHuHb3KAWu63z4EIdSE64RxSb46YCzAeL3YAdbK/5yFbC3/kOflaGkt6pT93UMZ126vK9d1JBsEt239pp1VHsydLFCHYCvN5a0etRdKHs5aV6F8ih9cRyIO8ElnI=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Drop opt_pku entirely
Thread-Topic: [PATCH] x86: Drop opt_pku entirely
Thread-Index: AQHZo59KU7pYKh8tuU6jUNQk0iLChq+U30GAgEo9oACAAAO9gIAAAwEAgAAAjXg=
Date: Mon, 7 Aug 2023 13:52:55 +0000
Message-ID:
 <AS8PR08MB7991C0D40E5CB6C8FA7600D0920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
 <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
 <6a22f4d7-e0f6-67f5-ba44-af0a07523c4e@citrix.com>
 <04e7a7a4-8926-9e5b-c872-caba8d43d563@suse.com>
 <3a0223c9-53b9-7cab-6ea3-dd5a6e02119d@citrix.com>
In-Reply-To: <3a0223c9-53b9-7cab-6ea3-dd5a6e02119d@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6336:EE_|AM7EUR03FT047:EE_|DB3PR08MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a813dac-3e37-4f5d-51e7-08db974dacea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FvkCx/CQGYWQ3P9II0lKGOhTkI/WVvAqK88+1Y71rPVYE0v9bt5I0E5R191LuPqZfbx/gfdrioywiWqFKSbNrjZtQyYP8hN1OXIV+urmW6H1w4zI5Lp48+ULQorgF5I0gHNJt3Ko48OyEMLhyPOjprxNlpjq8ho8DSFrFz44WnctFNpWKVGcGsvEeeZF1B8/dXkPm5Lkh39bSQQqQIyzUEPfNDwM9t2UA1IhwhElt4lLz4xps10Oy4sVpHDcyp8BmWaIFSrJEXYLPCvClZAuP4QHNlkNl+IpvIj6uT3iLbH/SjL6l1vM0IygeHwX67gF+tXsM9QElwG/WkD+gYsLmzrS8/3RJwRA6t5mTK4BwSNH0iCLwxB8EVyhxyv2Emj9Ut2VJGFu2LzuLOUnCWAdQZPKQxG+R2li3pZlhgx3e3CpBefK4UnVLMtMsExk7ph+emGU5l7c92RkbwQKrswYNiWcfGDp1BFaii9oWMHGGf4/e18s3dTQIeuxdltX8MNigklND4xY65FGG8ae/jRMS/Ow+PS/DY+P+8oO+qqgmsNFSBhzfOTzbo8mhKcUxhqELnIsQN/o9PhUXA13rejdgEUDbHhOclncF8C3Uted+qzT84F+3d1ZM506/W0O12Dv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(1800799003)(186006)(451199021)(52536014)(38070700005)(41300700001)(26005)(2906002)(5660300002)(8676002)(4744005)(8936002)(55016003)(122000001)(86362001)(316002)(33656002)(6506007)(7696005)(76116006)(54906003)(110136005)(38100700002)(66556008)(64756008)(66446008)(66476007)(71200400001)(66946007)(478600001)(9686003)(4326008);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7991C0D40E5CB6C8FA7600D0920CAAS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	408b2086-bf12-40e3-29fd-08db974d99db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sg5u0IrHIJxcVEr9WzWMxJrZPukkzBwuTOnTdy8cyYBxa984XBOai7cdb+1VcSxdjjSxxmD3yAhTuEzzMUtwpWATPjVZQhD5e0df21B9WamT4IpyQrg5FiV9CGvOATf/+8Jgjk+GP6lZO5pxE4TYwemVIT2ooPdDyeXIZ6ad3iBV3NMkZukzgbkvhbGcAXZ1sxvOD3KhQDlpzJuCqW4bm4H0LpO/IUxp5SA0by5wiY6pWf/nHlT9xmDFPYYMD/ScILmQo2Q4xD081borZmDHX42alVZmXhurfwqT7yeO7/zJvb/dBQ4ZIbXOS4fDzGHDup2QZhvWfjJNWca4LMuSbSWJiy3rJSbPi6C5K2UVIGeq9WGl7rz0GFQcO3GZdvrZUdBiiOjTeH9bLsR6X25tfwZEvmQZ1IAQWj1uYRtZroebpOuiUmBLIvs9Gd02fPzv1sNbRFBREFBTukgEjNGazqqWBAFni2TXrybZyltdODvBs1PSy7Ehix+nzI6EdkodxfieGk6KfGEn7QMtztFRwn0CzAOe4EQW9BB8k84HADxZv5v5drF8XpmNyEvR3amkhZM+tatctrbPYGXsZu3ciwYj7bRoHFwLpGLWbYaO4P8V3lZvreEqhMrM14NguMYQj/H/H97CHAxCymifeoW3Orlp1QSONnLYtNDQR4WwMxbBNr/sF7zWJ1MuPe7fvsfretNQojqeakN2JrQ0iNu35cbmJO2wE/p+YJv0MgywB8H/DcqyXNBcWn1ZPpYr06OE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39850400004)(1800799003)(451199021)(186006)(82310400008)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(26005)(47076005)(8676002)(6506007)(316002)(36860700001)(70206006)(2906002)(4326008)(5660300002)(70586007)(8936002)(41300700001)(52536014)(9686003)(7696005)(110136005)(478600001)(40480700001)(55016003)(54906003)(356005)(81166007)(33656002)(86362001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:53:27.1745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a813dac-3e37-4f5d-51e7-08db974dacea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9058

--_000_AS8PR08MB7991C0D40E5CB6C8FA7600D0920CAAS8PR08MB7991eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Re: [PATCH] x86: Drop opt_pku entirely

Hi Andrew and Jan,

Sorry for the possible format issue.

>>  At which
>> point I'm fine with no adjustment to cpuid=3D doc. And then also
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Thanks.  I'll tweak.

Acked-by: Henry Wang <Henry.Wang@arm.com> #CHANGELOG

Kind regards,
Henry

> ~Andrew

--_000_AS8PR08MB7991C0D40E5CB6C8FA7600D0920CAAS8PR08MB7991eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div dir=3D"ltr"><span style=3D"font-family: Calibri, sans-serif; font-size=
: inherit;">&gt; Re: [PATCH] x86: Drop opt_pku entirely</span><br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
r>
</font></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif">Hi=
 Andrew and Jan,</font></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
r>
</font></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif">So=
rry for the possible format issue.</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
&gt;&gt;&nbsp; At which<br>
&gt;&gt; point I'm fine with no adjustment to cpuid=3D doc. And then also<b=
r>
&gt;&gt; Acked-by: Jan Beulich &lt;jbeulich@suse.com&gt;<br>
&gt;<br>
&gt; Thanks.&nbsp; I'll tweak.<br>
<br>
Acked-by: Henry Wang &lt;Henry.Wang@arm.com&gt; #CHANGELOG</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">Kind regards,</div>
<div class=3D"PlainText">Henry<br>
<br>
&gt; ~Andrew<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AS8PR08MB7991C0D40E5CB6C8FA7600D0920CAAS8PR08MB7991eurp_--

