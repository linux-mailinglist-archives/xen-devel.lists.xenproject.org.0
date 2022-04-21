Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D150A0A4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310178.526891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlF-00072T-G1; Thu, 21 Apr 2022 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310178.526891; Thu, 21 Apr 2022 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlF-0006x7-91; Thu, 21 Apr 2022 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 310178;
 Thu, 21 Apr 2022 13:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw+u=U7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nhWlE-0006Vx-8I
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eb837ff-c176-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 15:22:14 +0200 (CEST)
Received: from DB7PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:36::25)
 by AM9PR08MB6660.eurprd08.prod.outlook.com (2603:10a6:20b:305::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:22:12 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::23) by DB7PR05CA0012.outlook.office365.com
 (2603:10a6:10:36::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 13:22:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 13:22:11 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Thu, 21 Apr 2022 13:22:11 +0000
Received: from f13710f363c3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D0B353B-7510-4289-AC7F-1F70D4A7C287.1; 
 Thu, 21 Apr 2022 13:22:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f13710f363c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 13:22:00 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by HE1PR08MB2858.eurprd08.prod.outlook.com
 (2603:10a6:7:33::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 13:21:38 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 13:21:38 +0000
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
X-Inumbo-ID: 0eb837ff-c176-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAs366f38BlkOobXmdIdYladZKcRxVm8Lk0kmXz5/hc=;
 b=VnWVBK5YeZz4mJujjr1swFAixeI+jatZ05ong4sjYRUDnrYTyAuVR+GLDaIX3mmBZgrPqkgxR4P5KBbNUedEPkuwq9OzCtbYMzRNSVROY973I5eabgwAb6YY12BXmLuXCATSeD67SEBy6TZDGGXO4AZWykrOx/v8hlycHE8bTYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a48196827fd3baf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibtDdJOBOwX+RJDyniu3P9z6MMvvXpk/9KDEqtbgWf8tgOqxUnTyNrufxrq5R9nas4rxxx3zScMviNidVYpLPOv/lSzw9xWIOtVFoH6QOfsphWUO22pYpHpn6OW58kjX8UvSjVAKL0lbxoGtBgpTTK4QZKUJTZNUCjkE8ZshvCt9nnPW2emTCogL7vH33sbETkd+Uw4nq2NAX4QMp6SCjtJD7tAWcCEcJyXAaZCGlu8TkxyaJzKtMPt7X02KMiT7LKACvzmL9froLB3UdPL0AYFbb3Z42P9JgHFEeBv4vKeoWcR6xExd/ZdH1c//L3fFHHsDXNdzouelJXNRb5D5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAs366f38BlkOobXmdIdYladZKcRxVm8Lk0kmXz5/hc=;
 b=X0Ncpv5eQ1xma4EvYnnIWjWX4F6YVBz78/0ocXrhPWDKViIpH/CEAtazuGysv7z6ffMrt/uqc9KkiUhhP/K2BWScDo3q5VEX9+O9jC5mGFqk6aL0qWRiea0SjUcEZLzlmwE5utgXCh4n1PHywoiFzhY63V5s8WjCKCha78lLJ8noYZBPj98+Xhac9LT4qMvMcbZsW8yG3J1fcW2+ZoHGuo0WxSTYuSDSRK5UT3XsUwQrbhoGvMwO4UY6UsG1NwxmUYXsN2YicKDZ6Ov9pdi9p/+CAtd8N3Zwj5+tcGFrmPzP4LzpIU0WMvj4cvvBEoDkhJ/oT4WdHn5CMszoLXK0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAs366f38BlkOobXmdIdYladZKcRxVm8Lk0kmXz5/hc=;
 b=VnWVBK5YeZz4mJujjr1swFAixeI+jatZ05ong4sjYRUDnrYTyAuVR+GLDaIX3mmBZgrPqkgxR4P5KBbNUedEPkuwq9OzCtbYMzRNSVROY973I5eabgwAb6YY12BXmLuXCATSeD67SEBy6TZDGGXO4AZWykrOx/v8hlycHE8bTYQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, ", Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need help to debug Arm SMMU issue seen on guests with passthrough
 devices
Thread-Topic: Need help to debug Arm SMMU issue seen on guests with
 passthrough devices
Thread-Index: AQHYVXCysDCtUSKEqUams17wmJg+Jqz6WpOA
Date: Thu, 21 Apr 2022 13:21:38 +0000
Message-ID: <98FE5BFF-4201-49F1-9F17-42E26FBE3FAF@arm.com>
References: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
In-Reply-To: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 92da8dda-5b07-477c-84ee-08da2399f1be
x-ms-traffictypediagnostic:
	HE1PR08MB2858:EE_|DB5EUR03FT061:EE_|AM9PR08MB6660:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB666037EA5E65326D1E6C4986FCF49@AM9PR08MB6660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sWgQKUjiGV4usW9kgS5gbc4qff3Q+xPtjPEJ+/UHGcKF2T6ydaJBa1p30ro4imWv9SopOO321PlMAMucTmA5XtqcQrlHA3ONfF/BmHeHUOsimM/7YL9Cl+bG2Fs37QIB4obvRm6I5RYZ23t9jP0AqOF/rDJcrssu5PNA1l4zZ5ih0xSigYwci3eDW10qzY+hU9AKsLRkVyuQP29c7HH1MAHGwlF7UjVQkY786i0dEWN75qCMDbQOG2WG+9fUPtcsn3I/VaVr0kvN9wp/+eGYZYZqmMV0ahiRs/Qf2Qdf+E+n1mHzIs4Rzmz/7WJFxNnheBASZd1KSe3MfN2JBlJcqHonxSoxgbxUipl1EQsbquts0+b1awfRpzh/oQD/zKoQDPtnfAeel2G/IFxf18R4JwST43447FYx0D4ofKL23VRvrJdUppaiRX7rdP+O0jMiPycK79FhwXq4rSZb4JoduvxRWR2aTBQNZvvxFHukB8XqmF5iNSxoRCMHiqx8tC2HRi3VqNaUz5f2+ZZDyafwV5aXvWX0rRdtqokTVDYAjfMGYLCBNOurvr8kFYJRXYAOguQY9elPWkx61EaAhKJ3YBT4ZYJ1m8uxMddfIBh6fC8Z7VhE4ioCojmifJB67PRQ39ewkFc6CWIrmSHbLkcsSTc3ZlYuijrJDmZ+3DxFfQv6mHvywO47k7uGDx5s67ZevUuLgP5J211V2fQYanuC8Vxoou0O0CurhZ4I2uiAU/8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(36756003)(38070700005)(4326008)(38100700002)(66476007)(508600001)(186003)(8676002)(64756008)(86362001)(66556008)(122000001)(316002)(5660300002)(99936003)(8936002)(76116006)(6486002)(91956017)(66946007)(66446008)(6916009)(71200400001)(53546011)(83380400001)(33656002)(6512007)(2906002)(26005)(54906003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/mixed;
	boundary="_004_98FE5BFF420149F19F1742E26FBE3FAFarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2858
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd5601c8-e523-4fd9-f3cf-08da2399ddb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jAuBlyx5y8Fz4hv8Ng5dVnr/tCA7U2rwT+fabXtZJ8suOq6DEdKr2u/tAHgCgL/FAieKPk9c5Z7o55QKOiG19sDuESc2Sp33I+xkngymujYAbNK+Gr/DvVTX+TxVgAXDhnFw62YDz+wp7PPKkF2LUaiMpf3TRabH3BV0sSIAwqlaS1fQr8nZ6qAacoEwpBfZ80s3V2rYNLo8W+vius4cVAx8eTtjsGNcEp487uu4Of8XqGg19ah8tZsaWvAKfi9inC4bZ4NAn8UBldMnb73iy/e2KPHr43n47SnuGM8Iv8dPas1+qW1aIzmqzalcEbtpMZqgf5iPYDa3ui60znz99P6d1BOuyOQ7TtB4SBCOboGaz3XZSwDLnKT1fOmffa/MLojeGrC2pHMwCCa9mPjNFLDGHSkhDnnOF3qFfwWl47SQyhR41x71jhE+jkQXxwCAna54UiontcdYisgPcD641/PLWB6VTDSFbQG4QYQ3H5lBAibUtc7Fiv6zJ6QFwx3+dOrqfIOf++V8qwOVaD7ULGHQP1u87jEzITEI7+FC3lSyGtXlrPXCF7WZtQOgjL6yoDa51MFoU7/7JeqnRsWW900gCCRjVZArBgRuBPpryI16FkBe52B8dNLQ97va71YYCQEBtIaKkCTCy+d16QlKLaLl0Bp8ZXEk+O7k+V5ZUbIFIFEajqXRPDjfKHP0fl8b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(336012)(47076005)(53546011)(99936003)(2616005)(36860700001)(6512007)(26005)(86362001)(45080400002)(82310400005)(81166007)(2906002)(235185007)(40460700003)(5660300002)(8936002)(6486002)(36756003)(33656002)(508600001)(83380400001)(186003)(6862004)(8676002)(4326008)(54906003)(6506007)(70206006)(70586007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:22:11.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92da8dda-5b07-477c-84ee-08da2399f1be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6660

--_004_98FE5BFF420149F19F1742E26FBE3FAFarmcom_
Content-Type: multipart/alternative;
	boundary="_000_98FE5BFF420149F19F1742E26FBE3FAFarmcom_"

--_000_98FE5BFF420149F19F1742E26FBE3FAFarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ayan,

> On 21 Apr 2022, at 12:12 pm, Ayan Kumar Halder <ayan.kumar.halder@xilinx.=
com> wrote:
>
> Hi Arm/SMMU experts,
>
> Scenario :- I am trying to assign a device (eg mmc) to a guest which uses=
 smmu. I start the guest using "xl create -c ...". It works fine for the fi=
rst time. I am able to access the device.
>
> Now, when I destroy the guest and create again, I see this issue

Did you observe any other Xen error while deassigning and assigning the dev=
ice ?
>
> (XEN) smmu: /axi/smmu@fd800000:         GFSR 0x00000002, GFSYNR0 0x000000=
00, GFSYNR1 0x00000871, GFSYNR2 0x00000000
>
> 0x871 is the stream id used by mmc.
>
> We are using SMMU-500. So from the Arm SMMU v2 specs, it is "Unidentified=
 stream fault" for stream id "0x871".

Yes, you are right above error means that Unidentified stream fault. That m=
eans SMMU hardware is not set up for streamId 0x0000087
I just try to go through the SMMU code and observe that this issue may be r=
elated to iommu group but I am not maybe I am wrong.
I just created the patch that is not tested. Please try to apply the patch =
and test it once.



Regards,
Rahul


--_000_98FE5BFF420149F19F1742E26FBE3FAFarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <3E8C096859DBE743B060FF943AAB2E35@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Ayan,<br>
<br>
&gt; On 21 Apr 2022, at 12:12 pm, Ayan Kumar Halder &lt;ayan.kumar.halder@x=
ilinx.com&gt; wrote:<br>
&gt; <br>
&gt; Hi Arm/SMMU experts,<br>
&gt; <br>
&gt; Scenario :- I am trying to assign a device (eg mmc) to a guest which u=
ses smmu. I start the guest using &quot;xl create -c ...&quot;. It works fi=
ne for the first time. I am able to access the device.<br>
&gt; <br>
&gt; Now, when I destroy the guest and create again, I see this issue<br>
<br>
Did you observe any other Xen error while deassigning and assigning the dev=
ice ?<br>
&gt; <br>
&gt; (XEN) smmu: /axi/smmu@fd800000:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFSR 0x00000002, GFSYNR0 0x00000000, GFSYNR1 0x00000871, GFSYNR2 =
0x00000000<br>
&gt; <br>
&gt; 0x871 is the stream id used by mmc.<br>
&gt; <br>
&gt; We are using SMMU-500. So from the Arm SMMU v2 specs, it is &quot;Unid=
entified stream fault&quot; for stream id &quot;0x871&quot;.<br>
<br>
Yes, you are right above error means that Unidentified stream fault. That m=
eans SMMU hardware is not set up for streamId 0x0000087<br>
I just try to go through the SMMU code and observe that this issue may be r=
elated to iommu group but I am not maybe I am wrong.<br>
I just created the patch that is not tested. Please try to apply the patch =
and test it once.<br>
<br>
</div>
</span></font></div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
Regards,<br>
Rahul<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_98FE5BFF420149F19F1742E26FBE3FAFarmcom_--

--_004_98FE5BFF420149F19F1742E26FBE3FAFarmcom_
Content-Type: application/octet-stream;
	name="0001-xen-arm-smmuv1-remove-iommu-group-when-deassign.patch"
Content-Description:
 0001-xen-arm-smmuv1-remove-iommu-group-when-deassign.patch
Content-Disposition: attachment;
	filename="0001-xen-arm-smmuv1-remove-iommu-group-when-deassign.patch";
	size=943; creation-date="Thu, 21 Apr 2022 13:21:37 GMT";
	modification-date="Thu, 21 Apr 2022 13:21:37 GMT"
Content-ID: <4A426946194A5C44BA5ADB74CF76019E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBiMGYyYzM4ZDU4NTZhOGMxOWNkMDRmNzBkM2JkOGI4Y2QyMjU2YmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8YjBmMmMzOGQ1ODU2YThjMTljZDA0ZjcwZDNiZDhi
OGNkMjI1NmJiZC4xNjUwNTQ2MjI4LmdpdC5yYWh1bC5zaW5naEBhcm0uY29tPgpGcm9tOiBSYWh1
bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4KRGF0ZTogVGh1LCAyMSBBcHIgMjAyMiAxMzo0
MjoyMCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi9hcm06IHNtbXV2MTogcmVtb3ZlIGlvbW11
IGdyb3VwIHdoZW4gZGVhc3NpZ24KClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5z
aW5naEBhcm0uY29tPgpDaGFuZ2UtSWQ6IEk5NDFjNTU0MWMyNGRmNDk2YmQzMTQzZjFjNzVmMTM2
NmFmNWQ4Y2E0Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYwppbmRleCBjOWRmYzRjYWEwLi4zODMxNDgwZWQ3IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9zbW11LmMKQEAgLTE2OTAsNiArMTY5MCw4IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X2RldGFj
aF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
aWYgKGNmZykKIAkJYXJtX3NtbXVfbWFzdGVyX2ZyZWVfc21lcyhjZmcpOwogCisJaW9tbXVfZ3Jv
dXBfcHV0KGRldl9pb21tdV9ncm91cChkZXYpKTsKKwlkZXZfaW9tbXVfZ3JvdXAoZGV2KSA9IE5V
TEw7CiB9CiAKICNpZiAwIC8qCi0tIAoyLjI1LjEKCg==

--_004_98FE5BFF420149F19F1742E26FBE3FAFarmcom_--

