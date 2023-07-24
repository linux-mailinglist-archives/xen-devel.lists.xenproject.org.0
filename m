Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9275EBF0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 08:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568425.887716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpOo-0002cm-5L; Mon, 24 Jul 2023 06:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568425.887716; Mon, 24 Jul 2023 06:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpOo-0002ad-0z; Mon, 24 Jul 2023 06:50:30 +0000
Received: by outflank-mailman (input) for mailman id 568425;
 Mon, 24 Jul 2023 06:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTwZ=DK=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1qNpOm-0002aX-Aj
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 06:50:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eab9bbf-29ee-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 08:50:26 +0200 (CEST)
Received: from AS9PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:20b:48a::16)
 by DB9PR08MB8412.eurprd08.prod.outlook.com (2603:10a6:10:3d4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 06:50:23 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::cf) by AS9PR04CA0142.outlook.office365.com
 (2603:10a6:20b:48a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 06:50:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.24 via Frontend Transport; Mon, 24 Jul 2023 06:50:23 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Mon, 24 Jul 2023 06:50:23 +0000
Received: from 43e550a262ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B74EBB81-2846-4C81-B082-763098EE1D35.1; 
 Mon, 24 Jul 2023 06:50:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43e550a262ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Jul 2023 06:50:17 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PAXPR08MB6414.eurprd08.prod.outlook.com (2603:10a6:102:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 06:50:14 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::3861:1ade:9356:9970]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::3861:1ade:9356:9970%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 06:50:14 +0000
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
X-Inumbo-ID: 5eab9bbf-29ee-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MWTvK4cXoXTqOD6z+TKn5FtkR+lyXrGPsYcVAk9icg=;
 b=RzxZMMLzAevTLm1Sk26aBQextVZlVB9tfTQi7uuD9qQskIPEDEndIpzXoPcKypXVVonHvW9ZfpkQr9TKGmaI/ZKceyrh4IU0DiKC932DQ77AikmXeQKJfZebzzCR6eJNzxDMId2FuGdP1VcyneDtO9AJDHQSbshiM7K1sYnUyqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93eab6fd8eca6c78
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9cU/4B6BQoN/Tw7qUo3PIGW/aAy0VpqPtnrDuTw47+2Bzyz8fppMMg34myBDZnHpO/2A5QA3XCM3lK5mCgP+vl1T+JYBhWqHJsq4I5xmKKwGEotxxG0dOXNC7VHg8Yv7dcws4IHEpkMmB+pTapEdmXiz8iIb+7PcL/9TxKS96hsmRdYMfnZ6eefMIIZCMdlwivXylkcsoULUYJHVvj8NiyO/i5q4e+b+1ivjetCryItR7DQAAhfQHhXNEB273kKpBvMoMijUHOwD2a1APXEb7s+quMQctZYI0H+ccXkBlfMa7e1EFhTHiRft9LY4iX9uBXMP3CLD6sZS5LG5ZPzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MWTvK4cXoXTqOD6z+TKn5FtkR+lyXrGPsYcVAk9icg=;
 b=BSbPP0/9dF5+yGtBZm4gkhuzqdRWkHRAhAZiC3GA8GFGESTGaPHWpyc3Sf6hue4tb6gePWiNKnkFosO4ZC2Q07bcmOnva9XYkCWdD7zwDPMzpaBwv9QlExiITyPmVsTX4zbSvBE4LeD0jgHNVMOdVPdmAsYnsAlLQT0qH27ThJsA0FzgkfU7vMgIV+et95HfBQrL0+57pta8U3HHUTpX3YbAI2Lo6CVGzeyQCqu70Zf7SEusJSlEkOcgDa9M7WSSIg1IaSyAEE/ZqQyvjlcHwk179q9KSM4xVRgohhQGiPh22Rw7A3GoGGS3fYWxcuCb97ek2WH0YegbXmnVzI3CFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MWTvK4cXoXTqOD6z+TKn5FtkR+lyXrGPsYcVAk9icg=;
 b=RzxZMMLzAevTLm1Sk26aBQextVZlVB9tfTQi7uuD9qQskIPEDEndIpzXoPcKypXVVonHvW9ZfpkQr9TKGmaI/ZKceyrh4IU0DiKC932DQ77AikmXeQKJfZebzzCR6eJNzxDMId2FuGdP1VcyneDtO9AJDHQSbshiM7K1sYnUyqQ=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 4/4] automation: Add smoke test for ppc64le
Thread-Topic: [PATCH v5 4/4] automation: Add smoke test for ppc64le
Thread-Index: AQHZu/VFj0fTwFpDzE2sBWfiN/Fdba/JAe4A
Date: Mon, 24 Jul 2023 06:50:13 +0000
Message-ID: <b0a9d83b-42de-c2cc-bbb1-642ba95af31d@arm.com>
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <ade2e58251c506e4576424082623d9b232a435f9.1689958538.git.sanastasio@raptorengineering.com>
In-Reply-To:
 <ade2e58251c506e4576424082623d9b232a435f9.1689958538.git.sanastasio@raptorengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
x-ms-exchange-imapappendstamp: AS8PR08MB8369.eurprd08.prod.outlook.com
 (15.20.6609.010)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PAXPR08MB6414:EE_|AM7EUR03FT010:EE_|DB9PR08MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbd1d24-70b0-4653-d425-08db8c124146
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hkXBfziRQXPYPdgfm/GY2FkjoCJyPWdwxuZ4bvoAT3dATccIeja6PQFOQAvfl2a41TUVfp20sEJ0pGyAt+CDKTjvcvpPDRmCsTEvJdDo3NLw2FcpVHcc70XEMv5jTU0mEzYmx6zG55VOMG3163EjStcnOTVFGpGCRFjEgQ6tUlC44SM8OFFPeNG3C1e3NQDMMXobO8alar0MOD2NH+HD+E1vTJrKhqoHF138nkNyoZm8ubBbJGVHULxOusRlskpkzhVsQP4IMC1ONPLRDlwQ2enyJuD6Am2zGmD05Qp3mG9xh0Pau5cSUcW1C2/15FWzQysaBNOFbNtBnQh1Ii0Wx8ll5aH/PzRzdx/qrYd8z2G2W1TwDXLk9NJy3qiFXS3deAgxNNCbWrzHk9RUA9JLSOqRYgyr4KNeZuOxvE6N0nWxwjw2s/jp96VnY7JprE88UJMzkcvCjIlbxb0r7uj6uI7ZOME2e0eQPoylq5O/IJtB/SgvjiKvXw/u46g0/E2uM/DeBLBokHP4srFlieBKNJBSIhyc/TNaqjyRKGqix9i1Ccsp2JoGp2Tx9gMJo+Jhk6zqYvL1NWgJ1dtnKBn1noIrndHyZmznToD5RTRXfFIfdyCC0BtslUC9+KvWTkxK5/MO2IMhgFv6tItyUZsDbvgPIm0Bl4PCQAVG+EdD7l5QVRf/+ZBcKwAb/0QRy4eb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(38070700005)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(6916009)(316002)(478600001)(38100700002)(6486002)(6512007)(41300700001)(71200400001)(31686004)(36756003)(8676002)(8936002)(6506007)(53546011)(186003)(26005)(5660300002)(44832011)(31696002)(86362001)(2616005)(4744005)(2906002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_b0a9d83b42dec2ccbbb1642ba95af31darmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a183a51-327a-462f-e40b-08db8c123b7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fk4QaIo736S+MwsaSRQgXSK6qxUa/oZ+mjAXIo0pTNcM7u6/cXOii1lPyPcASg3ICA8cGaq0xWsWZPjnxcUs/ofs4mkaMnwfNp+NFxijSWU+lTk3j41ZtL40/D+vXVmp31OwAZCDBbtYr9gvDXnlD6DsQ0fjAPkqeKRwQTpZEJP2J4AVOQgDaDoRKfmBOkh56I6BMHvJ9mUwuTEkBujrAfh2n1+8ONLSZSCLVdI9R9iNoGnwjkm6w1eHZ7z4/bXv3B3azwpOG9tpXIUN1lKPsAbNPdEanuF3I5T0V8d1dyTqx6HGIyay3Ywf+hp51fINx0coywpskEtoXZB0fP/5HVZGqH44syUriUgAzVvcWRbrZQpO0KwryUKZI/i5iP/0O7bO/tE5wgKlEWpfR7lrkrYGjfKCfuj0GK8bd0VB3milmVSf+u1IXttk1YSSODC4/7WBmcJE7MyP/HmKUMz+dPWmd08mkTOtrpR2c2bR2Z26wdck2VK1HEm4T47im0WIK3hJhW1xHEjMQkO9YQnSXKRzI7NXGR8MyH5AtQ/qpFXp1pp1bi2jpSKGq8MxDq+72EYn/AzvIUj0KhCif3nR1iZtSzAEUoIYpzr3+uNzZoAqXU91H1A9vw+AzrNZgO0w/BwMlIghxE3YINC9cNFvzqcgZayiK7bnt1+7jd7gkhZOOCH3KoKqw7avSgr30aXHa/StwBI1hINmDUs2xBjsYIOA+Cvo2bsIWMH9cnLo6GYTLdTOB4LDAte7LPXHaMq7LNnIMHXkfw4/C5F8/iAYRw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(31686004)(8936002)(5660300002)(8676002)(41300700001)(316002)(2906002)(70206006)(70586007)(40460700003)(36860700001)(26005)(53546011)(6506007)(40480700001)(47076005)(31696002)(6512007)(86362001)(6916009)(478600001)(6486002)(82740400003)(2616005)(81166007)(356005)(36756003)(336012)(186003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 06:50:23.4893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbd1d24-70b0-4653-d425-08db8c124146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8412

--_000_b0a9d83b42dec2ccbbb1642ba95af31darmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 2023/7/22 01:02, Shawn Anastasio wrote:

Add an initial smoke test that boots xen on a ppc64/pseries machine and

checks for a magic string. Based on the riscv smoke test.



Eventually the powernv9 (POWER9 bare metal) machine type will want to be

tested as well, but for now we only boot on pseries.



Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com><mailto:sa=
nastasio@raptorengineering.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org><mailto:sstabellini=
@kernel.org>
Reviewed-by: Jiamei Xie <jiamei.xie@arm.com<mailto:jiamei.xie@arm.com>>

--_000_b0a9d83b42dec2ccbbb1642ba95af31darmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <D0CAC34CF9C1904E85268135F7AB6B73@arm.com>
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Roboto Mono";
	panose-1:0 0 0 9 0 0 0 0 0 0;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Consolas",serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 2023/7/22 01:02, Shawn Anastasio wrote:<o:p></o:p=
></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>Add an initial smoke test that boots xen on a ppc64/pseries machine an=
d</pre>
<pre>checks for a magic string. Based on the riscv smoke test.</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Eventually the powernv9 (POWER9 bare metal) machine type will want to =
be</pre>
<pre>tested as well, but for now we only boot on pseries.</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Signed-off-by: Shawn Anastasio <a href=3D"mailto:sanastasio@raptorengi=
neering.com">&lt;sanastasio@raptorengineering.com&gt;</a></pre>
<pre>Reviewed-by: Stefano Stabellini <a href=3D"mailto:sstabellini@kernel.o=
rg">&lt;sstabellini@kernel.org&gt;</a></pre>
</blockquote>
<p class=3D"MsoNormal">Reviewed-by: <span style=3D"font-family:&quot;Roboto=
 Mono&quot;;color:#212121">
Jiamei Xie &lt;</span><a href=3D"mailto:jiamei.xie@arm.com" target=3D"_blan=
k"><span style=3D"font-family:&quot;Roboto Mono&quot;;border:none windowtex=
t 1.0pt;padding:0cm">jiamei.xie@arm.com</span></a><span style=3D"font-famil=
y:&quot;Roboto Mono&quot;;color:#212121">&gt;</span>
<o:p></o:p></p>
</div>
</body>
</html>

--_000_b0a9d83b42dec2ccbbb1642ba95af31darmcom_--

