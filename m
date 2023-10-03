Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A847B5E15
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 02:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611853.951473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT8X-00084f-KQ; Tue, 03 Oct 2023 00:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611853.951473; Tue, 03 Oct 2023 00:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT8X-00081v-HA; Tue, 03 Oct 2023 00:19:41 +0000
Received: by outflank-mailman (input) for mailman id 611853;
 Tue, 03 Oct 2023 00:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+eH=FR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qnT8W-00081p-Jv
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 00:19:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89d383f7-6182-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 02:19:38 +0200 (CEST)
Received: from DUZPR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::26) by GV2PR08MB9424.eurprd08.prod.outlook.com
 (2603:10a6:150:dd::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 3 Oct
 2023 00:19:24 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::8e) by DUZPR01CA0177.outlook.office365.com
 (2603:10a6:10:4b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 3 Oct 2023 00:19:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.20 via Frontend Transport; Tue, 3 Oct 2023 00:19:23 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Tue, 03 Oct 2023 00:19:23 +0000
Received: from af9a1b450e07.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49E6E527-891A-439F-AC4D-D8AA158D3FE3.1; 
 Tue, 03 Oct 2023 00:19:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af9a1b450e07.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Oct 2023 00:19:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 00:19:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 00:19:14 +0000
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
X-Inumbo-ID: 89d383f7-6182-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FO/xE6Oe4lQD2FY/5uOsd/64FQYP4ZqEH2mpc3CEjEA=;
 b=zIoj3zt5tES+iqziH68OwtJ/9FyYmQNSaXVDeORuDWI0dQLjEqJLDcdBFK/GITzlEJwO93kQ7rHAymKdAQYpOxGVA0VstPQnX6pUulCYS5hOUXqL1wYykY2vHIwEiT6V2PGRtRcghHNWd9kqta0A4JLfcLBbkBZDLS9S+TGV8/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e32b18d3acd73d33
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWFizVrqlPuf4uT3DbN0dNsZGWhXlsIxwMbOdtiWfEHPrUCicrs6MIYxbyVr1aX3pNYcX7LXbW/NtsDv2ejLYS+zAm4gUjOlySqoduXrSq7m0T1l/xyyd4MFbRxozyGr/tZiLY7m55s4eI1jTuqn8j7KfRcPEArT6BB0vp/nYDCVrXP3QIWVfZnMywLLOTFs92eL2xvJ0kz0FQI8VGGzZffDG05fN4Tai/0r+c5ClmD9LfvpNAza2lhSAMm7FocC0d/qdxkD7BbnJDkcTES0MPMu2n1O69Y0nDQRgZd7RBTqYCFcyzOfeVy8iBDyKNYU2tZSW+pPDosS/WojzVoaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FO/xE6Oe4lQD2FY/5uOsd/64FQYP4ZqEH2mpc3CEjEA=;
 b=WD2Fj0UOK2cmX0tsmORxy6hNXRUQquYcbuf447VUDEkOH6jsWcoi245IiPYKzo1IjXd4JA5FL+cciLEWQNGfFwnzVa5urrumWkKkCRWT2SZJkKR9YqTr/ckzRlZwpVd5mZ+Xr1sIopWVQ9INJxoco8kPu/U8aG+trK1T/8J8wPcC1YoewEmjHeNUKfc2Hcdq3M6UARCBOrmXYK3VDlqsWq/TShWwrb/CX+gQfhq28sX9uaBRz+c8M8UcYKdp5Jh/NWPJytvUy23FisEYS3znsyK14SiFhlVUFuvjB7PQ/G9bpCcXpbJh7M4IzX9iKhm7Q9+Xi9X5yGmavO33wMC2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FO/xE6Oe4lQD2FY/5uOsd/64FQYP4ZqEH2mpc3CEjEA=;
 b=zIoj3zt5tES+iqziH68OwtJ/9FyYmQNSaXVDeORuDWI0dQLjEqJLDcdBFK/GITzlEJwO93kQ7rHAymKdAQYpOxGVA0VstPQnX6pUulCYS5hOUXqL1wYykY2vHIwEiT6V2PGRtRcghHNWd9kqta0A4JLfcLBbkBZDLS9S+TGV8/U=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Thread-Topic: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Thread-Index: AQHZ9Ta/NlvugOvKeE2dpjYrdI/xh7A3GhEAgAAZ7QA=
Date: Tue, 3 Oct 2023 00:19:14 +0000
Message-ID: <3D657AA0-676B-4681-B980-26BCCC98B092@arm.com>
References:
 <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6065:EE_|DBAEUR03FT003:EE_|GV2PR08MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 954c8583-9c98-4721-26c4-08dbc3a66543
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PXmbphLeVjBJowWLofYKIrh1eMTvPduQPPq2DnDj/T9r86DQqDqCc4ke/R8KbzdVWMN3zHe3KtO24pKpPpFDoIw8zGtpkwchYpUM3FbuvjP0RwNLHw86JIsDL54IFky1ID3dW2leiRTNKYNcNmPObtPjy44Y0P6lTS0rymMv1PQOgsPASZMea6/hwB/TTVeCQRHUotvqos0ubeXgKBGr4ZxyCwWEj9/mvFSKJJXV4i2FfOxPh3iu5pmYigXMbaMemLpPnXSbRzij6g6IYin+7PtgiGbA8s8UAhd7h/cRjZdIF8VdA39CEfm8TmOomj6YiXQyvgk4fOYadMaadAfx0ouALQBppRZXgvCTtF6n9xBNIG9+0ufH3EVEdAAKRKELYwaBz1wxXVVm02+AsCwqHW6bQCv90vVw/k/moiiEUp7WRH1YtSuEwGACKrO+O9qpLC4OcahBEV/4HJLmTGv0kVyWAwfXUn29Aw9TDLIsU+DWYSN7Vo78G2qXehZ6GtFU9yT7mJDuVXFWw2+fKZhYeN7iTfwl3caQAqZaJw6usc5J29UlzbvbxXuMmxMVy6FdNBwWFiy1YsFzHOSa9XmBGvx4VCBpNhKhXDJ0c3xd9bY9i3qXrhW9/g0gy8f6lzIh5oEka5xbFSqISEZlkbBCSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6486002)(71200400001)(478600001)(6506007)(53546011)(91956017)(6512007)(2616005)(26005)(36756003)(2906002)(4744005)(33656002)(64756008)(54906003)(66446008)(86362001)(76116006)(66946007)(66556008)(66476007)(41300700001)(316002)(6916009)(5660300002)(38070700005)(38100700002)(122000001)(8936002)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <221DCC3E99FB7849B067517B642AAF19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47f7755d-22d0-4b52-36fc-08dbc3a65fb1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GZOHS9ZF9ckt/OD2gs5/AgMTyO0mPTZgC5wxMZ0UtLT7SZDKu5BbpTWacaOE3A8uuIcDgDdX/KUY0d4pod9OdOC3dPR68XpbOqG7Wg+1X3x+g04dezn2TN6C0szlwOdD9QAxZUqy+jGcRi47tYhGEMAwLlrfBrEUXDa2WGPlP8DBdEpybWqT7ucfzoNnyC004F51K3cMMsdcA9pvScdhqIW6+vVS6FACw/548yKTBiP4Ub6Zr3n7X6zRtIRubiwQQcqtSQbfomEtUnjjvmC/ccdOEHoEIbu7/zyPgW3UKX7U+CerTbT27qlJiSgvAtJllIbEp1+RyU0hCh/vyefOuN1ul7uzn2YupeFHuCrnBruVsL6DscH4ZSecb2ZZVOjZveTlRyK2ThyXO4vuOwFzL2+D15+sjYEost3QIZbouCLKJ5TGkQs1IHSHWCzjoSRtH34npykWSQ0etlTkiLNdPhH7OvdU1cgQCKUDl+K6lVbMM88fO2ZBaj8WF5eupWLokYd3Lk9dRFkoS31TnjjXQhYxOiskGWrmLNjpgrpCtap/jYU67GvaNxEoCAr2nx3mY3NhXM0cASLgm6RD1BVHJy6D0L7Wi0TyfR+bluo1w/qaNqyVA0pEWH3Q1auSSAtUJji/ZjqswnNigBJxkij2PbpS+kYvUrMB3UyG3aSxsAbA7CfuBv1zqK6XEtoh9Se/D9cT5ZZBMm+tnzuBhrBRv3zV2c9XBaJ0NjwNUApgIFEo+vE1e6phHmJ3Y9yygl+Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(6486002)(53546011)(6506007)(6512007)(336012)(26005)(2616005)(36756003)(478600001)(316002)(47076005)(70206006)(81166007)(82740400003)(356005)(36860700001)(70586007)(54906003)(8936002)(8676002)(6862004)(4326008)(41300700001)(5660300002)(33656002)(40480700001)(4744005)(2906002)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 00:19:23.3944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 954c8583-9c98-4721-26c4-08dbc3a66543
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9424

Hi,

> On Oct 3, 2023, at 06:46, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 2 Oct 2023, Federico Serafini wrote:
>> Make function declaration and definition consistent.
>> No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


